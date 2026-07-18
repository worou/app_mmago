# MamaGo — plateforme unifiée

Fusion des deux projets MamaGo : le **site vitrine** public et le **back-office**
« Manager par pays », désormais une seule application React et une seule base
de données.

```
app/
├── mamago/                 Back-office (héritage)
│   ├── api/                API PHP 8 / PDO — sert /admin
│   └── swagger/            Documentation OpenAPI de l'API PHP
├── mamagoApp/
│   ├── backend/            API Laravel — sert le site vitrine
│   └── frontend/           APPLICATION UNIQUE (vitrine + back-office)
│       └── src/admin/      Le back-office, monté sous /admin
├── database/fusion/        Scripts de fusion des bases (à lire avant tout)
└── _backup_fusion/         Sauvegardes des deux bases d'avant la fusion
```

## Ce que « fusionné » veut dire ici

| Axe | Avant | Après |
|-----|-------|-------|
| Base de données | `mamago` + `mamago_landing` | **`mamago` seule** |
| Référentiel | `pays`/`villes`/`services` **et** `countries`/`cities`/`services` | **tables communes** `countries` / `cities` / `services` |
| Front | 2 applications React (ports 5173 et 5180) | **1 application** (port 5180) |
| Back | 2 API | 2 API (choix assumé — voir plus bas) |

Le référentiel est réellement **réconcilié**, pas juste cohabitant : les 3 pays
du back-office et les 10 du site vitrine sont désormais les **mêmes lignes**.
La Côte d'Ivoire est une seule entité, qui porte à la fois son chiffre
d'affaires (back-office) et son nom bilingue (vitrine).

## Démarrage

Trois services. MySQL/MariaDB doit tourner (panneau XAMPP).

```bash
# 1. API du back-office (PHP 8, port 8081)
cd mamago
C:\xampp\php\php.exe -S 127.0.0.1:8081 -t api api/index.php

# 2. API du site vitrine (Laravel, port 8000) — exige PHP 8.2+
cd mamagoApp/backend
C:\php83\php.exe artisan serve

# 3. Application unique (port 5180)
cd mamagoApp/frontend
npm install && npm run dev
```

- Site vitrine : <http://localhost:5180/> (FR) et `/en` (EN)
- Back-office : <http://localhost:5180/admin> — `admin@mamago.com` / `password`

## La base fusionnée

Tout est décrit et rejouable dans `database/fusion/` :

| Script | Rôle |
|--------|------|
| `01_merge_databases.sql` | La fusion elle-même : copie du site vitrine, réconciliation du référentiel, remappage des clés étrangères, recalcul du CA |
| `02_verify.sql` | Contrôles d'intégrité (CA, volumes, orphelins, collation) |
| `03_compat_backoffice.sql` | Couche de compatibilité pour l'API PHP (voir ci-dessous) |

> ⚠️ `01` refuse de s'exécuter deux fois (table témoin `_fusion_applied`).
> Pour rejouer : restaurer `_backup_fusion/mamago_*_clean.sql`, puis relancer.

### Le référentiel canonique est celui du site vitrine

Les noms sont stockés en JSON bilingue (`{"fr":…,"en":…}`). C'est le sens de
lecture imposé : ces traductions **ne sont pas reconstructibles** depuis les
libellés non accentués du back-office (`Cote d'Ivoire`, `Bouake`). L'inverse
l'était — d'où ce choix.

Le back-office a apporté en échange : la **devise**, le **chiffre d'affaires**,
la **France** (absente du vitrine) et le caractère **opérationnel** des services.

### Correspondance des services

Les deux bases avaient une table `services` de même nom et de sens différent.
Les 700 courses ont été remappées ainsi :

| Back-office | → | Site vitrine | Porte des courses |
|-------------|---|--------------|-------------------|
| VTC | → | `transport` | oui (229) |
| Livraison repas | → | `restauration` | oui (235) |
| Livraison colis | → | `livraison` | oui (236) |
| — | | `shopping`, `paiement`, `paiement-2`, `plus-de-services` | non (cartes vitrine) |

La colonne **`is_operational`** distingue les deux natures. Une course ne peut
être rattachée qu'à un service opérationnel — l'API la refuse sinon (422).

### Couche de compatibilité (`03_compat_backoffice.sql`)

L'API PHP parle français (`pays.nom_pays`, `villes.nom_ville`) ; le référentiel
canonique parle anglais. Plutôt que de réécrire ~300 références dans 19
fichiers, la base expose le référentiel sous ses anciens noms :

- **vue `pays`** → `countries` (masque la tuile « Et plus encore »)
- **vue `villes`** → `cities` — *modifiable* : le CRUD `/villes` fonctionne tel quel
- **colonnes générées** `services.nom_service` / `services.actif`

L'adaptation vit dans la base, ce qui couvre **à la fois** le SQL brut des
contrôleurs et la passerelle `Model` — un shim PHP n'aurait attrapé que le
second. Conséquence voulue : **le contrat de l'API n'a pas bougé**, donc le
front du back-office a été porté sans toucher à ses requêtes.

Les écritures que les vues ne peuvent pas servir (`nom_pays` est une expression
JSON) sont traitées dans `PaysController` et `ServicesController`, qui écrivent
directement dans `countries` / `services` et ne remplacent que la clé `fr` —
une traduction anglaise saisie côté vitrine survit à une modification faite au
back-office.

## L'application unique

Le back-office vit dans `mamagoApp/frontend/src/admin/`, monté sous `/admin` :

- **un seul routeur** — le back-office n'apporte plus son `BrowserRouter`
- **hors de l'arbre localisé** : pas de `/en/admin/...`, le back-office n'est pas traduit
- **contextes imbriqués** : `Theme`/`Auth`/`Toast` n'enveloppent que `/admin`
- **styles cloisonnés** sous `.mg-admin` — sans quoi `--muted`, `--shadow` et
  `--surface`, définis par les deux feuilles, écraseraient ceux de la vitrine
- **navigation préfixée** via `src/admin/lib/routes.js` : les écrans continuent
  de raisonner en chemins absolus (`/pays`), le préfixe n'est écrit qu'à un endroit

Le back-office reste en **JSX non typé** (repris tel quel, `allowJs` sans
`checkJs`) : le convertir en TypeScript aurait mêlé une réécriture à une fusion.

> La route interne `/admin/:paysId` a été renommée **`/admin/espace/:paysId`**
> pour ne pas se dédoubler avec le préfixe de montage.

### Deux API, une application

C'est un choix assumé : le front vitrine parle à Laravel, le back-office à
l'API PHP. D'où deux variables d'environnement distinctes :

```env
VITE_API_URL=http://127.0.0.1:8000/api        # Laravel — site vitrine
VITE_ADMIN_API_URL=http://127.0.0.1:8081      # PHP — back-office
```

## Points à connaître

- **Supprimer un pays depuis le back-office supprime ses villes vitrine**
  (`countries → cities` en cascade). Les pays qui portent des clients ou des
  courses sont protégés (`RESTRICT`, renvoie 409) ; un pays purement vitrine,
  lui, part avec ses villes.
- Une **ville créée au back-office** démarre sans service actif côté vitrine
  (`cities.services = '[]'`) : on ne devine pas l'offre commerciale.
- La base entière est en `utf8mb4_unicode_ci` ; le back-office était en
  `general_ci`, converti par `01`. Sans cette harmonisation, tout
  rapprochement de chaînes entre les deux moitiés échoue.
- `mamago_landing` **existe toujours**, intacte : c'est le filet de secours.
  Ne la supprimez qu'une fois la fusion validée en conditions réelles.
- Ne lancez **jamais** `migrate:fresh` côté Laravel : la table `migrations` a
  été reprise, les migrations sont vues comme appliquées, et un `fresh`
  détruirait aussi les tables du back-office.
