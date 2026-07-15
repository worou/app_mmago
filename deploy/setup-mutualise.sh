#!/usr/bin/env bash
# =====================================================================
# MamaGo — mise en place sur hebergement MUTUALISE (sans root).
#
# Assemble le web root a partir du build de prod deja livre :
#   <docroot>/            index.html + assets  (front React)
#   <docroot>/.htaccess   repli SPA vers index.html
#   <docroot>/api/        API PHP (config.php genere pour la base wmanager)
#
# Ne fait AUCUNE installation de paquet, ne touche pas a Apache.
# La base (schema + donnees) s'importe separement via phpMyAdmin
# (fichier deploy/wmanager_seed.sql).
#
# Usage (en tant qu'utilisateur, PAS root) :
#   git clone https://github.com/worou/Dashboard_mamago.git ~/mamago-src
#   bash ~/mamago-src/deploy/setup-mutualise.sh [DOCROOT] [URL]
#
# Defauts : DOCROOT=/home/nicodem/var/www/mamago/wmanager
#           URL=http://180.149.198.241
# =====================================================================
set -euo pipefail

SRC="$(cd "$(dirname "$0")/.." && pwd)"
DOCROOT="${1:-/home/nicodem/var/www/mamago/wmanager}"
SERVER_URL="${2:-http://180.149.198.241}"

DB_NAME="wmanager"
DB_USER="wmanager"

echo "==> MamaGo — deploiement mutualise"
echo "    Source  : $SRC"
echo "    Docroot : $DOCROOT"
echo "    URL     : $SERVER_URL"
echo

# --- Infos base de donnees (jamais stockees dans git) ----------------
read -rp "Hote MySQL (ex: localhost, ou mysql.kemostore.fr) : " DB_HOST
DB_HOST="${DB_HOST:-localhost}"
read -rp "Port MySQL [3306] : " DB_PORT
DB_PORT="${DB_PORT:-3306}"
read -rsp "Mot de passe MySQL de l'utilisateur '$DB_USER' : " DB_PASS
echo

# --- Mise a jour du code ---------------------------------------------
if [ -d "$SRC/.git" ]; then
  echo "==> Mise a jour du depot..."
  git -C "$SRC" pull -q || echo "   (pull ignore)"
fi

if [ ! -f "$SRC/frontend/dist/index.html" ]; then
  echo "!! Build du front introuvable ($SRC/frontend/dist). Abandon." >&2
  exit 1
fi

# --- Assemblage du web root ------------------------------------------
echo "==> Assemblage du web root..."
mkdir -p "$DOCROOT"

# Front : on remplace l'ancien build
rm -f  "$DOCROOT/index.html"
rm -rf "$DOCROOT/assets"
cp -r "$SRC/frontend/dist/." "$DOCROOT/"

# API : on recopie (sans le dossier database, jamais expose sur le web)
rm -rf "$DOCROOT/api"
cp -r "$SRC/api" "$DOCROOT/api"
rm -rf "$DOCROOT/api/database"

# .htaccess de l'API : base sur /api
sed -i 's#RewriteBase /mamago/api/#RewriteBase /api/#' "$DOCROOT/api/.htaccess"

# --- config.php de l'API (genere, hors git) --------------------------
echo "==> Ecriture de api/config.php..."
esc() { local s="$1"; s="${s//\\/\\\\}"; s="${s//\'/\\\'}"; printf '%s' "$s"; }
JWT="$(openssl rand -hex 32 2>/dev/null || head -c 32 /dev/urandom | od -An -tx1 | tr -d ' \n')"

{
  printf '%s\n' '<?php'
  printf '%s\n' '// Genere par setup-mutualise.sh — NE PAS committer.'
  printf '%s\n' 'return ['
  printf '%s\n' "    'db' => ["
  printf "        'host'     => '%s',\n" "$(esc "$DB_HOST")"
  printf "        'port'     => %s,\n"   "$DB_PORT"
  printf "        'database' => '%s',\n" "$DB_NAME"
  printf "        'username' => '%s',\n" "$DB_USER"
  printf "        'password' => '%s',\n" "$(esc "$DB_PASS")"
  printf '%s\n' "        'charset'  => 'utf8mb4',"
  printf '%s\n' "    ],"
  printf "    'base_path'            => '/api',\n"
  printf "    'cors_allowed_origins' => '*',\n"
  printf "    'jwt_secret'           => '%s',\n" "$JWT"
  printf "    'jwt_ttl'              => 28800,\n"
  printf '%s\n' '];'
} > "$DOCROOT/api/config.php"
chmod 600 "$DOCROOT/api/config.php"

# --- .htaccess racine : repli SPA ------------------------------------
cat > "$DOCROOT/.htaccess" <<'HT'
# Front React (SPA). L'API sous /api est geree par son propre .htaccess.
RewriteEngine On
RewriteBase /

# Ne pas reecrire les requetes vers l'API
RewriteRule ^api(/|$) - [L]

# Servir directement les fichiers et dossiers existants (assets, ...)
RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]

# Toute autre URL -> index.html (routes React : /interface/ci, /stats/1, ...)
RewriteRule ^ index.html [L]
HT

# --- Fin --------------------------------------------------------------
cat <<DONE

=====================================================================
 Fichiers en place dans : $DOCROOT

 IL RESTE UNE ETAPE : importer la base de donnees.
   1. Ouvrir phpMyAdmin, choisir la base « $DB_NAME ».
   2. Onglet « Importer » -> envoyer le fichier :
        deploy/wmanager_seed.sql
      (telechargeable : https://raw.githubusercontent.com/worou/Dashboard_mamago/main/deploy/wmanager_seed.sql)

 Ensuite, ouvrir : $SERVER_URL/
   Comptes (mot de passe : password) :
     admin@mamago.com        SuperAdmin
     ci.admin@mamago.com     Admin Pays (Cote d'Ivoire)
     commercial@mamago.com   Commercial (portefeuille : Dakar)

 Verifs utiles :
   - $SERVER_URL/api/health    doit repondre {"success":true,...}
   - PHP 8.0+ requis (a selectionner dans le panneau si besoin)
   - Changer les mots de passe de demo une fois connecte.
=====================================================================
DONE
