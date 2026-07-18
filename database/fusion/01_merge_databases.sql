-- =====================================================================
-- MamaGo — Fusion des bases `mamago` (back-office) et `mamago_landing`
-- ---------------------------------------------------------------------
-- Cible      : base `mamago` (base unique apres fusion)
-- Source     : base `mamago_landing` (conservee intacte comme filet)
-- SGBD       : MariaDB 10.4+ / MySQL 8
--
-- Principe : le schema du site vitrine est CANONIQUE pour les trois
-- tables communes (countries / cities / services), parce que les noms
-- bilingues JSON {"fr":...,"en":...} ne sont pas reconstructibles depuis
-- les chaines non accentuees du back-office ("Cote d'Ivoire", "Bouake").
-- Le back-office apporte en echange devise, ca_global, la France, et le
-- caractere operationnel des services.
--
-- Rejouabilite : ce script s'execute UNE fois sur l'etat pre-fusion.
-- La table temoin `_fusion_applied` (creee en tete, sans IF NOT EXISTS)
-- fait echouer immediatement toute seconde execution, avant la moindre
-- ecriture. Pour rejouer : restaurer les dumps de _backup_fusion/ puis
-- relancer.
-- =====================================================================

USE mamago;

-- Garde-fou : echoue si la fusion a deja ete appliquee.
CREATE TABLE _fusion_applied (
    id          TINYINT PRIMARY KEY,
    applique_le DATETIME NOT NULL
) ENGINE=InnoDB;
INSERT INTO _fusion_applied (id, applique_le) VALUES (1, NOW());

SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------------------------------------------------------
-- 0. NORMALISATION DU COLLATIONNEMENT
--    Le back-office a ete cree en utf8mb4_general_ci, Laravel utilise
--    utf8mb4_unicode_ci. Sans harmonisation, tout rapprochement de
--    chaines entre les deux moities de la base echoue avec
--    « Illegal mix of collations ». On aligne le back-office sur le
--    collationnement de Laravel, qui devient celui de la base fusionnee.
-- ---------------------------------------------------------------------

ALTER DATABASE mamago CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE clients                CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE connexions             CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE courses                CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE demandes_comptes       CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE droits_acces           CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE livreurs               CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE paiements              CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE pays                   CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE rapports               CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE role_droit_acces       CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE roles                  CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE services               CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE stats_ca_ville_service CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE utilisateur_pays       CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE utilisateur_ville      CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE utilisateurs           CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE villes                 CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ---------------------------------------------------------------------
-- 1. TABLES DU SITE VITRINE SANS CONFLIT DE NOM
--    Copiees telles quelles depuis `mamago_landing`.
-- ---------------------------------------------------------------------

CREATE TABLE cache                 LIKE mamago_landing.cache;
CREATE TABLE cache_locks           LIKE mamago_landing.cache_locks;
CREATE TABLE failed_jobs           LIKE mamago_landing.failed_jobs;
CREATE TABLE guarantees            LIKE mamago_landing.guarantees;
CREATE TABLE job_batches           LIKE mamago_landing.job_batches;
CREATE TABLE job_offers            LIKE mamago_landing.job_offers;
CREATE TABLE jobs                  LIKE mamago_landing.jobs;
CREATE TABLE leads                 LIKE mamago_landing.leads;
CREATE TABLE migrations            LIKE mamago_landing.migrations;
CREATE TABLE password_reset_tokens LIKE mamago_landing.password_reset_tokens;
CREATE TABLE posts                 LIKE mamago_landing.posts;
CREATE TABLE sessions              LIKE mamago_landing.sessions;
CREATE TABLE stats                 LIKE mamago_landing.stats;
CREATE TABLE team_members          LIKE mamago_landing.team_members;
CREATE TABLE users                 LIKE mamago_landing.users;
CREATE TABLE `values`              LIKE mamago_landing.`values`;

INSERT INTO cache                 SELECT * FROM mamago_landing.cache;
INSERT INTO cache_locks           SELECT * FROM mamago_landing.cache_locks;
INSERT INTO failed_jobs           SELECT * FROM mamago_landing.failed_jobs;
INSERT INTO guarantees            SELECT * FROM mamago_landing.guarantees;
INSERT INTO job_batches           SELECT * FROM mamago_landing.job_batches;
INSERT INTO job_offers            SELECT * FROM mamago_landing.job_offers;
INSERT INTO jobs                  SELECT * FROM mamago_landing.jobs;
INSERT INTO leads                 SELECT * FROM mamago_landing.leads;
INSERT INTO migrations            SELECT * FROM mamago_landing.migrations;
INSERT INTO password_reset_tokens SELECT * FROM mamago_landing.password_reset_tokens;
INSERT INTO posts                 SELECT * FROM mamago_landing.posts;
INSERT INTO sessions              SELECT * FROM mamago_landing.sessions;
INSERT INTO stats                 SELECT * FROM mamago_landing.stats;
INSERT INTO team_members          SELECT * FROM mamago_landing.team_members;
INSERT INTO users                 SELECT * FROM mamago_landing.users;
INSERT INTO `values`              SELECT * FROM mamago_landing.`values`;

-- ---------------------------------------------------------------------
-- 2. TABLES DE CORRESPONDANCE (ancien id back-office -> nouvel id)
--    Explicites et verifiables : les volumes sont petits (3 pays,
--    7 villes, 3 services) et chaque ligne a ete controlee sur les
--    donnees reelles.
-- ---------------------------------------------------------------------

CREATE TABLE _map_pays (
    ancien_id BIGINT UNSIGNED PRIMARY KEY,
    nouvel_id BIGINT UNSIGNED NOT NULL,
    libelle   VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- CI et SN existent des deux cotes (rapprochement par code ISO).
-- La France n'existe que cote back-office -> nouvel id 11
-- (10 est deja pris par la tuile « Et plus encore »).
INSERT INTO _map_pays (ancien_id, nouvel_id, libelle) VALUES
    (1,  1, 'Cote d''Ivoire -> countries.CI'),
    (2,  2, 'Senegal -> countries.SN'),
    (3, 11, 'France -> countries.FR (creee)');

CREATE TABLE _map_ville (
    ancien_id BIGINT UNSIGNED PRIMARY KEY,
    nouvel_id BIGINT UNSIGNED NOT NULL,
    libelle   VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Rapprochement sur le nom desaccentue : Bouake=Bouake, Thies=Thies.
-- Paris et Lyon n'existent que cote back-office -> ids 24 et 25.
INSERT INTO _map_ville (ancien_id, nouvel_id, libelle) VALUES
    (1,  1, 'Abidjan -> cities.Abidjan'),
    (2,  2, 'Bouake -> cities.Bouake (accentue)'),
    (3,  3, 'Yamoussoukro -> cities.Yamoussoukro'),
    (4,  5, 'Dakar -> cities.Dakar'),
    (5,  6, 'Thies -> cities.Thies (accentue)'),
    (6, 24, 'Paris -> cities.Paris (creee)'),
    (7, 25, 'Lyon -> cities.Lyon (creee)');

CREATE TABLE _map_service (
    ancien_id BIGINT UNSIGNED PRIMARY KEY,
    nouvel_id BIGINT UNSIGNED NOT NULL,
    libelle   VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Correspondance metier validee :
--   VTC             -> transport    (services.id 1)
--   Livraison repas -> restauration (services.id 4)
--   Livraison colis -> livraison    (services.id 2)
INSERT INTO _map_service (ancien_id, nouvel_id, libelle) VALUES
    (1, 1, 'VTC -> transport'),
    (2, 4, 'Livraison repas -> restauration'),
    (3, 2, 'Livraison colis -> livraison');

-- ---------------------------------------------------------------------
-- 3. PAYS : `pays` + `countries` -> `countries`
-- ---------------------------------------------------------------------

CREATE TABLE countries LIKE mamago_landing.countries;
INSERT INTO countries SELECT * FROM mamago_landing.countries;

-- Apports du back-office : devise et chiffre d'affaires cumule.
ALTER TABLE countries
    ADD COLUMN devise    VARCHAR(10)   NOT NULL DEFAULT 'XOF' AFTER code,
    ADD COLUMN ca_global DECIMAL(14,2) NOT NULL DEFAULT 0.00  AFTER devise;

UPDATE countries c
   JOIN pays p ON p.code_iso = c.code
   SET c.devise    = p.devise,
       c.ca_global = p.ca_global;

-- La France : absente du site vitrine, presente au back-office. Elle y
-- exerce une activite reelle (197 courses), elle a donc sa place parmi les
-- pays affiches. Elle prend la position de la tuile « Et plus encore »,
-- qui est repoussee en fin de liste : ce n'est pas un pays, elle doit
-- rester le dernier element de la bande.
INSERT INTO countries (id, name, code, devise, ca_global, is_placeholder, position, is_active, created_at, updated_at)
SELECT 11, '{"fr":"France","en":"France"}', 'FR', p.devise, p.ca_global, 0, 9, 1, p.created_at, p.updated_at
  FROM pays p WHERE p.code_iso = 'FR';

UPDATE countries SET position = 10 WHERE is_placeholder = 1;

-- ---------------------------------------------------------------------
-- 4. VILLES : `villes` + `cities` -> `cities`
-- ---------------------------------------------------------------------

CREATE TABLE cities LIKE mamago_landing.cities;
INSERT INTO cities SELECT * FROM mamago_landing.cities;

-- Paris et Lyon, rattachees a la France (id 11). Services actifs
-- deduits des courses reellement enregistrees pour ces villes.
INSERT INTO cities (id, country_id, name, is_capital, services, position, created_at, updated_at)
SELECT 24, 11, 'Paris', 1, '["transport","livraison","restauration"]', 0, v.created_at, v.updated_at
  FROM villes v WHERE v.id = 6;
INSERT INTO cities (id, country_id, name, is_capital, services, position, created_at, updated_at)
SELECT 25, 11, 'Lyon', 0, '["transport","livraison"]', 1, v.created_at, v.updated_at
  FROM villes v WHERE v.id = 7;

-- ---------------------------------------------------------------------
-- 5. SERVICES : `services` (metier) + `services` (vitrine) -> `services`
--    Le schema vitrine l'emporte ; un drapeau `is_operational` distingue
--    les services qui portent reellement des courses des cartes
--    purement marketing.
-- ---------------------------------------------------------------------

CREATE TABLE services_unifie LIKE mamago_landing.services;
INSERT INTO services_unifie SELECT * FROM mamago_landing.services;

ALTER TABLE services_unifie
    ADD COLUMN is_operational TINYINT(1) NOT NULL DEFAULT 0 AFTER is_active,
    ADD COLUMN description_metier VARCHAR(255) NULL AFTER is_operational;

-- Les 3 services qui portent des courses heritent du libelle metier.
UPDATE services_unifie s
   JOIN _map_service m ON m.nouvel_id = s.id
   JOIN services a     ON a.id = m.ancien_id
   SET s.is_operational     = 1,
       s.description_metier = a.description;

-- L'ancienne table metier disparait au profit de la table unifiee.
DROP TABLE services;
RENAME TABLE services_unifie TO services;

-- ---------------------------------------------------------------------
-- 6. REMAPPAGE DES CLES ETRANGERES DU BACK-OFFICE
--    Toute colonne pointant vers pays / villes / services est reecrite
--    via les tables de correspondance.
-- ---------------------------------------------------------------------

-- Tables sans contrainte d'unicite sur ces colonnes : mise a jour directe.
-- (MySQL ne met a jour chaque ligne qu'une fois par instruction, il n'y a
-- donc pas de risque de remappage en cascade 4->5->6.)
UPDATE clients          c JOIN _map_ville   m ON m.ancien_id = c.ville_id   SET c.ville_id   = m.nouvel_id;
UPDATE livreurs         l JOIN _map_ville   m ON m.ancien_id = l.ville_id   SET l.ville_id   = m.nouvel_id;
UPDATE courses          c JOIN _map_ville   m ON m.ancien_id = c.ville_id   SET c.ville_id   = m.nouvel_id;
UPDATE demandes_comptes d JOIN _map_ville   m ON m.ancien_id = d.ville_id   SET d.ville_id   = m.nouvel_id;
UPDATE courses          c JOIN _map_service m ON m.ancien_id = c.service_id SET c.service_id = m.nouvel_id;

-- Tables PORTANT UNE CONTRAINTE D'UNICITE sur ces colonnes.
--
-- Un remappage direct echoue : la correspondance des villes deplace 4->5
-- alors que la ville 5 existe encore, ce qui viole transitoirement
-- uq_stats_ville_service_periode (« Duplicate entry 5-1-2026-04-01 »).
-- On decale donc d'abord les identifiants hors de la plage utilisee, puis
-- on les ramene sur leur cible. Les deux correspondances etant injectives,
-- l'unicite est preservee a chaque etape intermediaire.
UPDATE stats_ca_ville_service SET ville_id = ville_id + 1000, service_id = service_id + 1000;
UPDATE stats_ca_ville_service s JOIN _map_ville   m ON m.ancien_id = s.ville_id   - 1000 SET s.ville_id   = m.nouvel_id;
UPDATE stats_ca_ville_service s JOIN _map_service m ON m.ancien_id = s.service_id - 1000 SET s.service_id = m.nouvel_id;

UPDATE utilisateur_ville SET ville_id = ville_id + 1000;
UPDATE utilisateur_ville u JOIN _map_ville m ON m.ancien_id = u.ville_id - 1000 SET u.ville_id = m.nouvel_id;

-- -> pays / countries
UPDATE utilisateur_pays u JOIN _map_pays m ON m.ancien_id = u.pays_id SET u.pays_id = m.nouvel_id;
UPDATE demandes_comptes d JOIN _map_pays m ON m.ancien_id = d.pays_id SET d.pays_id = m.nouvel_id;
UPDATE rapports         r JOIN _map_pays m ON m.ancien_id = r.pays_id SET r.pays_id = m.nouvel_id;

-- Les anciennes tables de referentiel n'ont plus de raison d'etre.
DROP TABLE villes;
DROP TABLE pays;

-- ---------------------------------------------------------------------
-- 7. CONTRAINTES D'INTEGRITE SUR LES NOUVELLES CIBLES
--    CREATE TABLE ... LIKE ne recopie pas les cles etrangeres : on les
--    redeclare ici, y compris celles du back-office.
-- ---------------------------------------------------------------------

ALTER TABLE cities
    ADD CONSTRAINT fk_cities_country FOREIGN KEY (country_id)
        REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Anciennes contraintes du back-office (elles pointaient vers pays/villes
-- /services, tables supprimees : MariaDB les a invalidees).
ALTER TABLE clients  DROP FOREIGN KEY fk_clients_ville;
ALTER TABLE livreurs DROP FOREIGN KEY fk_livreurs_ville;
ALTER TABLE courses  DROP FOREIGN KEY fk_courses_ville;
ALTER TABLE courses  DROP FOREIGN KEY fk_courses_service;
ALTER TABLE stats_ca_ville_service DROP FOREIGN KEY fk_stats_ville;
ALTER TABLE stats_ca_ville_service DROP FOREIGN KEY fk_stats_service;
ALTER TABLE utilisateur_ville DROP FOREIGN KEY fk_uv_ville;
ALTER TABLE utilisateur_pays  DROP FOREIGN KEY fk_up_pays;
ALTER TABLE demandes_comptes  DROP FOREIGN KEY fk_dc_pays;
ALTER TABLE demandes_comptes  DROP FOREIGN KEY fk_dc_ville;
ALTER TABLE rapports          DROP FOREIGN KEY fk_rapports_pays;

ALTER TABLE clients
    ADD CONSTRAINT fk_clients_ville FOREIGN KEY (ville_id)
        REFERENCES cities(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE livreurs
    ADD CONSTRAINT fk_livreurs_ville FOREIGN KEY (ville_id)
        REFERENCES cities(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE courses
    ADD CONSTRAINT fk_courses_ville FOREIGN KEY (ville_id)
        REFERENCES cities(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    ADD CONSTRAINT fk_courses_service FOREIGN KEY (service_id)
        REFERENCES services(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE stats_ca_ville_service
    ADD CONSTRAINT fk_stats_ville FOREIGN KEY (ville_id)
        REFERENCES cities(id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT fk_stats_service FOREIGN KEY (service_id)
        REFERENCES services(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE utilisateur_ville
    ADD CONSTRAINT fk_uv_ville FOREIGN KEY (ville_id)
        REFERENCES cities(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE utilisateur_pays
    ADD CONSTRAINT fk_up_pays FOREIGN KEY (pays_id)
        REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE demandes_comptes
    ADD CONSTRAINT fk_dc_pays FOREIGN KEY (pays_id)
        REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT fk_dc_ville FOREIGN KEY (ville_id)
        REFERENCES cities(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE rapports
    ADD CONSTRAINT fk_rapports_pays FOREIGN KEY (pays_id)
        REFERENCES countries(id) ON DELETE RESTRICT ON UPDATE CASCADE;

SET FOREIGN_KEY_CHECKS = 1;

-- ---------------------------------------------------------------------
-- 8. RECALCUL DU CHIFFRE D'AFFAIRES
--    Source de verite : courses.montant des courses `terminee`.
--    Voir README — tous les endpoints doivent se reconcilier dessus.
-- ---------------------------------------------------------------------

UPDATE countries c
   SET c.ca_global = COALESCE((
       SELECT SUM(co.montant)
         FROM courses co
         JOIN cities ci ON ci.id = co.ville_id
        WHERE ci.country_id = c.id
          AND co.statut = 'terminee'
   ), 0.00);
