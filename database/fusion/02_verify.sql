-- =====================================================================
-- Verification de la fusion — a lancer apres 01_merge_databases.sql
--   mysql -u root --default-character-set=utf8mb4 mamago < 02_verify.sql
--
-- Valeurs de reference relevees AVANT la fusion :
--   CA        : CI 1211492.00 | SN 869851.00 | FR 4758.01
--   Volumes   : 73 clients, 32 livreurs, 700 courses, 528 paiements,
--               99 lignes de stats, 5 rattachements utilisateur/pays
--   Services  : VTC 229 | Livraison repas 235 | Livraison colis 236
-- =====================================================================

SELECT '--- CA par pays : ca_global doit egaler ca_calcule ---' AS controle;
SELECT c.id, c.code, JSON_UNQUOTE(JSON_EXTRACT(c.name, '$.fr')) AS nom,
       c.devise, c.ca_global,
       ROUND(SUM(CASE WHEN co.statut = 'terminee' THEN co.montant ELSE 0 END), 2) AS ca_calcule,
       COUNT(co.id) AS nb_courses
  FROM countries c
  JOIN cities  ci ON ci.country_id = c.id
  JOIN courses co ON co.ville_id   = ci.id
 GROUP BY c.id ORDER BY c.id;

SELECT '--- Volumes : doivent etre identiques a l avant-fusion ---' AS controle;
SELECT (SELECT COUNT(*) FROM clients)                clients,
       (SELECT COUNT(*) FROM livreurs)               livreurs,
       (SELECT COUNT(*) FROM courses)                courses,
       (SELECT COUNT(*) FROM paiements)              paiements,
       (SELECT COUNT(*) FROM stats_ca_ville_service) stats,
       (SELECT COUNT(*) FROM utilisateur_pays)       utilisateur_pays;

SELECT '--- Courses par service : 229 / 236 / 235 sur les 3 operationnels ---' AS controle;
SELECT s.id, s.slug, s.is_operational, COUNT(c.id) AS nb_courses
  FROM services s LEFT JOIN courses c ON c.service_id = s.id
 GROUP BY s.id ORDER BY s.id;

SELECT '--- Orphelins : toutes les colonnes doivent valoir 0 ---' AS controle;
SELECT
  (SELECT COUNT(*) FROM clients  x LEFT JOIN cities   t ON t.id = x.ville_id   WHERE t.id IS NULL) clients_orph,
  (SELECT COUNT(*) FROM livreurs x LEFT JOIN cities   t ON t.id = x.ville_id   WHERE t.id IS NULL) livreurs_orph,
  (SELECT COUNT(*) FROM courses  x LEFT JOIN cities   t ON t.id = x.ville_id   WHERE t.id IS NULL) courses_ville_orph,
  (SELECT COUNT(*) FROM courses  x LEFT JOIN services t ON t.id = x.service_id WHERE t.id IS NULL) courses_service_orph,
  (SELECT COUNT(*) FROM stats_ca_ville_service x LEFT JOIN cities   t ON t.id = x.ville_id   WHERE t.id IS NULL) stats_ville_orph,
  (SELECT COUNT(*) FROM stats_ca_ville_service x LEFT JOIN services t ON t.id = x.service_id WHERE t.id IS NULL) stats_service_orph,
  (SELECT COUNT(*) FROM utilisateur_pays  x LEFT JOIN countries t ON t.id = x.pays_id  WHERE t.id IS NULL) utilisateur_pays_orph,
  (SELECT COUNT(*) FROM utilisateur_ville x LEFT JOIN cities    t ON t.id = x.ville_id WHERE t.id IS NULL) utilisateur_ville_orph,
  (SELECT COUNT(*) FROM demandes_comptes  x LEFT JOIN countries t ON t.id = x.pays_id  WHERE t.id IS NULL) demandes_pays_orph,
  (SELECT COUNT(*) FROM cities x LEFT JOIN countries t ON t.id = x.country_id WHERE t.id IS NULL) cities_orph;

SELECT '--- Referentiel fusionne : 11 pays / 25 villes / 7 services ---' AS controle;
SELECT (SELECT COUNT(*) FROM countries)    pays,
       (SELECT COUNT(*) FROM cities)       villes,
       (SELECT COUNT(*) FROM services)     services,
       (SELECT COUNT(*) FROM posts)        articles,
       (SELECT COUNT(*) FROM job_offers)   offres_emploi,
       (SELECT COUNT(*) FROM team_members) equipe;

SELECT '--- Collationnement : une seule valeur attendue (utf8mb4_unicode_ci) ---' AS controle;
SELECT table_collation, COUNT(*) AS nb_tables
  FROM information_schema.tables
 WHERE table_schema = 'mamago' AND table_type = 'BASE TABLE'
 GROUP BY table_collation;
