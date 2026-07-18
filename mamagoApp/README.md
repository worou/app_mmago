# MamaGo — Site vitrine

Site MamaGo construit à partir de la maquette : front **React (Vite + TypeScript + React Router)**, API **Laravel**, base **MySQL/MariaDB**.

Tout le contenu (services, pays, villes, articles, offres d'emploi, équipe, valeurs) vient de la base via l'API — rien n'est codé en dur dans le front. Les formulaires « Télécharger l'app » et « Contact » enregistrent des leads.

## Pages

| Route                | Contenu                                                        |
| -------------------- | -------------------------------------------------------------- |
| `/`                  | La landing page reprenant la maquette                          |
| `/a-propos`          | Histoire, chiffres, frise chronologique, valeurs, équipe        |
| `/services`          | Les 7 services détaillés, avec arguments par service            |
| `/pays`              | 9 pays et 23 villes, avec les services actifs par ville         |
| `/carrieres`         | Avantages, valeurs, postes ouverts filtrables par département   |
| `/carrieres/:slug`   | Offre détaillée : mission, missions, profil, candidature        |
| `/blog`              | Articles, filtrables par catégorie, avec article à la une       |
| `/blog/:slug`        | Article complet + articles liés                                 |
| `/contact`           | Formulaire, canaux de contact, bureaux                          |

```
mamagoApp/
├── backend/     Laravel 13 — API + migrations + seeders
├── frontend/    React 19 + Vite 8 + TypeScript
└── WhatsApp Image ... .jpeg   la maquette de référence
```

## Prérequis — important

XAMPP fournit **PHP 8.0**, mais Laravel exige **PHP 8.2+**. Un PHP 8.3 autonome a donc été installé dans `C:\php83` (il ne remplace pas celui de XAMPP). Toutes les commandes `php`/`artisan` doivent l'utiliser :

```bash
C:\php83\php.exe artisan ...
```

MySQL/MariaDB est celui de XAMPP — démarrez-le depuis le panneau de contrôle XAMPP.

## Base de données

La base s'appelle **`mamago_landing`**, et non `mamago`.

> ⚠️ `mamago` appartient à l'application existante `C:\xampp\htdocs\mamago` (clients, courses, paiements…). Ce projet n'y touche pas.

```bash
C:\xampp\mysql\bin\mysql.exe -u root -e "CREATE DATABASE IF NOT EXISTS mamago_landing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
```

## Démarrage (depuis un clone GitHub)

Le dépôt ne contient **pas** `vendor/`, `node_modules/`, ni les fichiers `.env`
(ils sont ignorés) — il faut donc les installer/créer après le clone.

**1. API (port 8000)**

```bash
cd backend

# Dépendances (Composer requis ; sur cette machine : C:\php83\php.exe ..\composer.phar install)
composer install

# Configuration
cp .env.example .env
php artisan key:generate           # génère APP_KEY

# Base : créez d'abord la base MySQL, puis
php artisan migrate --seed
php artisan serve                  # http://127.0.0.1:8000
```

Créer la base (une fois) :

```sql
CREATE DATABASE mamago_landing CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

**2. Front (port 5180)**

```bash
cd frontend
cp .env.example .env               # VITE_API_URL pointe déjà sur l'API locale
npm install
npm run dev                        # http://localhost:5180
```

Ouvrez **http://localhost:5180**.

> Sur la machine d'origine, PHP 8.3 est dans `C:\php83` (XAMPP fournit 8.0, trop
> ancien pour Laravel). Remplacez `php` / `composer` par `C:\php83\php.exe` et
> `C:\php83\php.exe ..\composer.phar` en conséquence.

Le port **5180** est fixé (`strictPort`) car **5173 est déjà utilisé** par le front de l'app `htdocs/mamago`. Si vous changez ce port, mettez à jour `FRONTEND_URL` dans `backend/.env` — sinon le CORS bloquera les appels API.

## API

Base : `http://127.0.0.1:8000/api`

| Méthode | Route               | Rôle                                                  |
| ------- | ------------------- | ----------------------------------------------------- |
| GET     | `/content`          | Tout le contenu de la landing en une requête          |
| GET     | `/services`         | Les 7 cartes de services                              |
| GET     | `/countries`        | Les 10 pays (dont la tuile « Et plus encore »)        |
| GET     | `/stats`            | +5M, 10+, 100%, 24/7                                  |
| GET     | `/guarantees`       | Les 4 garanties du bas de page                        |
| GET     | `/coverage`         | Pays + villes + services actifs par ville             |
| GET     | `/about`            | Valeurs, équipe, chiffres, frise chronologique        |
| GET     | `/posts`            | Articles + liste des catégories                       |
| GET     | `/posts/{slug}`     | Article complet + articles liés                       |
| GET     | `/job-offers`       | Offres + départements + valeurs                       |
| GET     | `/job-offers/{slug}`| Offre détaillée                                        |
| POST    | `/leads`            | Enregistre un lead (limité à 10 req/min)              |

`POST /leads` renvoie `201`, ou `422` avec les messages d'erreur par champ (en français), affichés directement dans le formulaire. Un slug inconnu renvoie `404`, que le front rend en page « introuvable ».

Le CORS n'autorise que l'origine du front (`FRONTEND_URL`), pas `*`.

## Modifier le contenu

Tout le texte est dans deux fichiers :

- `backend/database/seeders/LandingSeeder.php` — services, pays, chiffres, garanties
- `backend/database/seeders/PagesSeeder.php` — articles, offres d'emploi, équipe, valeurs, villes

Après modification :

```bash
cd backend
C:\php83\php.exe artisan db:seed --class=PagesSeeder
```

Les entrées sont mises à jour sur leur clé naturelle (`slug`, `name`, `key`) — on peut donc reseeder sans créer de doublons ni perdre les leads.

> ⚠️ N'utilisez **jamais** `migrate:fresh` : ça effacerait les leads enregistrés. `migrate` seul suffit, les migrations sont additives.

## Traduction (FR / EN)

Le site est **entièrement bilingue**. Le français est la langue par défaut (à la racine), l'anglais est sous le préfixe `/en`. Le sélecteur de la barre de navigation bascule sans quitter la page courante.

**Interface** (nav, boutons, formulaires, titres) : dans `frontend/src/i18n/strings.ts`, un objet `fr` et un objet `en`.

**Contenu en base** : les champs traduisibles sont stockés en JSON `{"fr": …, "en": …}`. Le modèle les résout via le trait `HasTranslations` selon la langue de la requête, choisie par le middleware `SetLocale` (paramètre `?locale=` ou en-tête `Accept-Language`). Aucune requête JSON en base — la résolution se fait en PHP, ce qui est nécessaire sur MariaDB.

**Messages de validation et de succès** : dans `backend/lang/{fr,en}/`. Une erreur de formulaire remonte donc dans la bonne langue.

Pour ajouter une traduction à un contenu, éditez la valeur `['fr' => …, 'en' => …]` dans le seeder concerné, puis `artisan db:seed`. Les champs non traduits (noms de villes, noms de personnes, « +5M », « 24/7 ») restent en clair, c'est voulu.

> Ajouter une 3ᵉ langue : ajoutez-la à `LOCALES` (`config.ts`), à `SetLocale::SUPPORTED`, un bloc dans `strings.ts`, un dossier `lang/xx/`, et la clé dans chaque entrée de seeder.

## Images

Les images de contenu vivent dans `frontend/src/assets/content/` et sont référencées depuis la base par simple nom de fichier (`blog-gabon.jpg`, `team-1.jpg`…).

**Si le fichier n'existe pas, la page affiche un dégradé de la marque** — rien ne casse. C'est l'état actuel : le site est complet et cohérent sans photos.

Pour ajouter une image, déposez-la dans `frontend/src/assets/content/` sous le nom attendu par le seeder. Noms utilisés :

| Fichier                   | Où                          |
| ------------------------- | --------------------------- |
| `blog-<slug-court>.jpg`   | Couverture d'article        |
| `team-1.jpg` … `team-6.jpg` | Portraits de l'équipe     |
| `service-<slug>.jpg`      | Illustration par service    |
| `about-office.jpg`        | Page À propos               |
| `careers-team.jpg`        | Page Carrières              |

Le champ `cover` / `photo` dans le seeder détermine le nom attendu.

## Points à connaître

- **La 6ᵉ carte de services duplique la 5ᵉ** (« Paiement » deux fois, même texte) : c'est ce que montre la maquette, reproduit tel quel plutôt qu'inventé. Corrigez l'entrée `paiement-2` dans `LandingSeeder.php` — la grille s'adapte au nombre de cartes.
- **Les 5 photos** de `frontend/src/assets/hero/` sont **découpées dans le JPEG de la maquette** : ce sont des placeholders basse résolution, à remplacer par les originaux.
- Les drapeaux sont des SVG dessinés à la main (`Flag.tsx`) : Windows n'affiche pas les emojis drapeaux.
- Pas d'authentification : rien dans la maquette n'en demande.
