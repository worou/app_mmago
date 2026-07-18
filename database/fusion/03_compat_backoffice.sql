-- =====================================================================
-- Couche de compatibilite pour l'API back-office (PHP/PDO)
-- ---------------------------------------------------------------------
-- A lancer APRES 01_merge_databases.sql :
--   mysql -u root --default-character-set=utf8mb4 mamago < 03_compat_backoffice.sql
--
-- Apres la fusion, le referentiel canonique est celui du site vitrine :
-- `countries` / `cities` / `services`, en colonnes anglaises, avec des
-- libelles bilingues stockes en JSON {"fr":...,"en":...}.
--
-- L'API back-office, elle, parle francais : `pays.nom_pays`,
-- `villes.nom_ville`, `services.nom_service`. Plutot que de reecrire les
-- ~300 references reparties dans 19 fichiers, on expose le referentiel
-- canonique sous ses anciens noms. L'adaptation vit dans la base, ce qui
-- couvre A LA FOIS le SQL brut des controleurs et la passerelle `Model` —
-- un shim ecrit en PHP n'aurait attrape que le second.
--
-- Consequence voulue : le contrat de l'API back-office ne bouge pas, donc
-- son front continue de fonctionner tel quel.
-- =====================================================================

USE mamago;

-- ---------------------------------------------------------------------
-- 1. Rendre `cities` insertable au travers de la vue `villes`
--    La colonne `services` est NOT NULL sans valeur par defaut : une
--    insertion via la vue (qui ne la mentionne pas) echouerait. Une ville
--    creee depuis le back-office demarre donc sans service actif cote
--    vitrine — c'est le comportement voulu, on ne devine pas l'offre.
-- ---------------------------------------------------------------------

ALTER TABLE cities
    MODIFY services LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
    NOT NULL DEFAULT '[]' CHECK (json_valid(services));

-- ---------------------------------------------------------------------
-- 2. Vue `pays` -> `countries`
--    La tuile « Et plus encore » (is_placeholder) n'est pas un pays :
--    elle est masquee au back-office, qui ne doit jamais la compter ni
--    lui rattacher de donnees.
-- ---------------------------------------------------------------------

CREATE OR REPLACE VIEW pays AS
SELECT c.id,
       JSON_UNQUOTE(JSON_EXTRACT(c.name, '$.fr')) AS nom_pays,
       c.code                                     AS code_iso,
       c.devise,
       c.ca_global,
       c.created_at,
       c.updated_at
  FROM countries c
 WHERE c.is_placeholder = 0;

-- ---------------------------------------------------------------------
-- 3. Vue `villes` -> `cities`
--    Uniquement des renommages de colonnes : la vue reste modifiable,
--    donc le CRUD /villes du back-office fonctionne sans retouche.
-- ---------------------------------------------------------------------

CREATE OR REPLACE VIEW villes AS
SELECT ci.id,
       ci.country_id AS pays_id,
       ci.name       AS nom_ville,
       ci.created_at,
       ci.updated_at
  FROM cities ci;

-- ---------------------------------------------------------------------
-- 4. `services` : colonnes generees
--    Le nom `services` est deja pris par la table canonique (Laravel en
--    depend), on ne peut donc pas creer de vue homonyme. On ajoute a la
--    place des colonnes calculees qui exposent les libelles attendus par
--    le back-office. Elles sont en lecture seule : les ecritures sur
--    /services passent par un controleur dedie.
-- ---------------------------------------------------------------------

ALTER TABLE services
    ADD COLUMN nom_service VARCHAR(150)
        AS (JSON_UNQUOTE(JSON_EXTRACT(title, '$.fr'))) VIRTUAL,
    ADD COLUMN actif TINYINT(1)
        AS (is_active) VIRTUAL;
