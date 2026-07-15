# Déploiement sur hébergement mutualisé (sans root)

Pour un hébergement **sans accès root** (panneau type cPanel/Plesk, SSH en
utilisateur), avec une base **déjà créée** et administrée via **phpMyAdmin**.

- Front React (build de prod déjà livré) → `http://180.149.198.241/`
- API PHP → `http://180.149.198.241/api`  (même origine, pas de CORS)
- Base : `wmanager` (importée via phpMyAdmin)

> **PHP 8.0+ requis** (l'API utilise `match`, `str_starts_with`, arguments
> nommés…). Si le panneau propose plusieurs versions, choisir **8.0 ou plus**.

## Étape 1 — Importer la base via phpMyAdmin

1. Télécharger le dump :
   `https://raw.githubusercontent.com/worou/Dashboard_mamago/main/deploy/wmanager_seed.sql`
2. Ouvrir **phpMyAdmin** (https://phpmyadmin.kemostore.fr) et sélectionner la
   base **`wmanager`** à gauche.
3. Onglet **Importer** → **Choisir un fichier** → `wmanager_seed.sql` → **Exécuter**.

Le fichier contient le schéma **et** les données de démo (avec mots de passe
déjà hachés). Il ne contient pas de `CREATE DATABASE` : tout s'importe dans la
base sélectionnée.

## Étape 2 — Déposer les fichiers

En SSH (utilisateur, **sans** `sudo`) :

```bash
git clone https://github.com/worou/Dashboard_mamago.git ~/mamago-src
bash ~/mamago-src/deploy/setup-mutualise.sh /home/nicodem/var/www/mamago/wmanager
```

Le script demande **l'hôte MySQL** et le **mot de passe** de l'utilisateur
`wmanager` (rien n'est écrit dans git), puis :

- copie le build du front à la racine du dossier,
- copie l'API dans `.../wmanager/api` (sans le dossier `database`),
- génère `api/.env` (APP_ENV=production, base `wmanager`, `base_path=/api`, secret JWT aléatoire),
- pose les `.htaccess` (repli SPA + base `/api`).

> **Hôte MySQL** : la valeur à saisir est celle indiquée par ton hébergeur
> (souvent `localhost`, parfois un hôte dédié comme `mysqlXX.kemostore.fr`).
> phpMyAdmin l'affiche généralement sur sa page d'accueil (« Serveur : … »).

### Pas de git sur le serveur ?

Cloner le dépôt **en local**, puis envoyer par SFTP le contenu de
`frontend/dist/` (à la racine du dossier web) et le dossier `api/` (dans
`api/`, sans `api/database/`). Créer ensuite `api/.env` à la main (voir `api/.env.example`,
le modèle généré par le script) et adapter `RewriteBase /api/` dans
`api/.htaccess`.

## Étape 3 — Vérifier

- `http://180.149.198.241/api/health` → `{"success":true,"data":{"status":"ok",...}}`
- `http://180.149.198.241/` → écran de connexion.

Se connecter (mot de passe `password`) :

| Compte | Rôle |
|--------|------|
| `admin@mamago.com` | SuperAdmin |
| `ci.admin@mamago.com` | Admin Pays (Côte d'Ivoire) |
| `commercial@mamago.com` | Commercial (portefeuille : Dakar) |

## Sécurité — à faire

- **Changer le mot de passe MySQL** partagé pendant la mise en place.
- **Changer le mot de passe SSH**, passer à une **clé SSH**.
- **Changer les mots de passe de démo** une fois connecté.
- `api/.env` contient les identifiants de la base : le script le met en
  `chmod 600`. Ne pas l'exposer.

## Dépannage

| Symptôme | Cause probable |
|----------|----------------|
| **500** sur tout `/api` | PHP < 8.0, ou identifiants MySQL faux dans `api/.env`. Voir les logs d'erreur du panneau. |
| **403 Forbidden** | Dossier web root non lisible, ou `.htaccess` interdit (AllowOverride). |
| **Page blanche / 404** sur `/interface/ci` au rechargement | `mod_rewrite` inactif ou `.htaccess` racine absent. |
| API : *Connexion base impossible* | Mauvais **hôte** MySQL, ou l'utilisateur `wmanager` n'a pas les droits sur la base. |
| Login → 401 alors que le mot de passe est bon | En-tête `Authorization` filtrée : vérifier que `api/.htaccess` est bien pris en compte. |
