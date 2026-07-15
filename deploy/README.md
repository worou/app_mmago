# Déploiement de MamaGo (serveur Ubuntu/Debian)

Déploie l'application sur un VPS **vierge**, servie sur l'IP publique :

- **Front React** (build statique) → `http://<IP>/`
- **API PHP** → `http://<IP>/api`

Front et API sur la **même origine** : aucun problème de CORS.

## Prérequis

- Un serveur Ubuntu 22.04+/Debian 12+ avec accès **root** (ou `sudo`).
- Le port **80** ouvert (et **22** pour le SSH).

## Déploiement en 3 commandes

Connecté en SSH sur le serveur :

```bash
# 1. git (souvent absent sur un serveur vierge)
sudo apt-get update && sudo apt-get install -y git

# 2. Récupérer le projet
git clone https://github.com/worou/Dashboard_mamago.git ~/mamago

# 3. Lancer le déploiement (IP publique en argument)
sudo bash ~/mamago/deploy/deploy.sh 180.149.198.241
```

### Choisir le dossier de déploiement

Par défaut l'app est déployée dans `/var/www/mamago`. Pour un autre dossier,
le passer en **2ᵉ argument** :

```bash
sudo bash ~/mamago/deploy/deploy.sh 180.149.198.241 /home/nicodem/var/www/mamago/wmanager
```

> Si le dossier est sous `/home/...`, le script ajoute automatiquement la
> permission de **traversée** (`o+x`) sur chaque dossier parent, sans quoi
> Apache renverrait **403 Forbidden**. C'est une traversée seule : le contenu
> du home n'est pas exposé en listing.

Le script installe Apache, PHP 8 et MariaDB, clone le code dans
`/var/www/mamago`, crée la base + charge le schéma et les données de démo,
configure l'API (`base_path = /api`, identifiants MySQL générés, secret JWT
aléatoire), puis publie le VirtualHost Apache.

**Le front est livré déjà construit** (`frontend/dist/`, généré pour l'IP
`180.149.198.241`) : le serveur n'a donc **pas besoin de Node**. Si tu passes
une **IP différente** au script, il détecte que le build ne correspond pas,
installe Node 20 et reconstruit automatiquement pour la bonne cible.

À la fin, il affiche l'URL, l'état de l'API et les comptes de démo.

## Après le déploiement

Ouvrir **`http://180.149.198.241/`** et se connecter :

| Compte | Rôle |
|--------|------|
| `admin@mamago.com` / `password` | SuperAdmin |
| `ci.admin@mamago.com` / `password` | Admin Pays (Côte d'Ivoire) |
| `commercial@mamago.com` / `password` | Commercial (portefeuille : Dakar) |

### Sécurité — à faire

- **Changer les mots de passe de démo** (ou les supprimer et créer les vôtres).
- **Changer le mot de passe SSH** partagé pendant la mise en place, et passer
  à une **clé SSH**.
- Le mot de passe MySQL généré se trouve dans `/var/www/mamago/api/config.php`
  (ce fichier est régénéré à chaque exécution du script).
- Si un **nom de domaine** pointe vers le serveur, activer HTTPS :
  ```bash
  sudo apt-get install -y certbot python3-certbot-apache
  sudo certbot --apache -d mon-domaine.tld
  ```
  Puis rebuild le front avec `VITE_API_URL=https://mon-domaine.tld/api`.

## Mettre à jour l'application

Après une modif du **front**, reconstruis le build de prod (sur ta machine de
dev) et commite-le, pour qu'il soit livré au serveur :

```bash
cd frontend && npm run build         # met à jour frontend/dist
git add frontend/dist && git commit -m "build prod" && git push
```

Puis, sur le serveur :

```bash
sudo bash ~/mamago/deploy/deploy.sh 180.149.198.241
```

> ⚠️ Ré-exécuter le script **réinitialise la base** (schéma + données de démo).
> Si l'application contient déjà des données réelles, faites une sauvegarde
> avant (`mysqldump mamago > sauvegarde.sql`) — ou adaptez le script pour ne
> pas relancer `schema.sql` / `seed.php`.

## Dépannage

- **Page blanche / 404 sur les liens profonds** : vérifier que `mod_rewrite`
  est actif (`sudo a2enmod rewrite && sudo systemctl reload apache2`) et que le
  build a bien produit `/var/www/mamago/frontend/dist`.
- **Erreur 500 sur `/api`** : consulter `sudo tail -f /var/log/apache2/mamago_error.log`.
- **API injoignable** : `curl http://localhost/api/health` doit répondre
  `{"success":true,...}`.
