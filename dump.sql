-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mamago
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `mamago`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mamago` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `mamago`;

--
-- Table structure for table `_fusion_applied`
--

DROP TABLE IF EXISTS `_fusion_applied`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_fusion_applied` (
  `id` tinyint(4) NOT NULL,
  `applique_le` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_fusion_applied`
--

LOCK TABLES `_fusion_applied` WRITE;
/*!40000 ALTER TABLE `_fusion_applied` DISABLE KEYS */;
INSERT INTO `_fusion_applied` VALUES (1,'2026-07-18 19:02:32');
/*!40000 ALTER TABLE `_fusion_applied` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_map_pays`
--

DROP TABLE IF EXISTS `_map_pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_map_pays` (
  `ancien_id` bigint(20) unsigned NOT NULL,
  `nouvel_id` bigint(20) unsigned NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`ancien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_map_pays`
--

LOCK TABLES `_map_pays` WRITE;
/*!40000 ALTER TABLE `_map_pays` DISABLE KEYS */;
INSERT INTO `_map_pays` VALUES (1,1,'Cote d\'Ivoire -> countries.CI'),(2,2,'Senegal -> countries.SN'),(3,11,'France -> countries.FR (creee)');
/*!40000 ALTER TABLE `_map_pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_map_service`
--

DROP TABLE IF EXISTS `_map_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_map_service` (
  `ancien_id` bigint(20) unsigned NOT NULL,
  `nouvel_id` bigint(20) unsigned NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`ancien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_map_service`
--

LOCK TABLES `_map_service` WRITE;
/*!40000 ALTER TABLE `_map_service` DISABLE KEYS */;
INSERT INTO `_map_service` VALUES (1,1,'VTC -> transport'),(2,4,'Livraison repas -> restauration'),(3,2,'Livraison colis -> livraison');
/*!40000 ALTER TABLE `_map_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_map_ville`
--

DROP TABLE IF EXISTS `_map_ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_map_ville` (
  `ancien_id` bigint(20) unsigned NOT NULL,
  `nouvel_id` bigint(20) unsigned NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`ancien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_map_ville`
--

LOCK TABLES `_map_ville` WRITE;
/*!40000 ALTER TABLE `_map_ville` DISABLE KEYS */;
INSERT INTO `_map_ville` VALUES (1,1,'Abidjan -> cities.Abidjan'),(2,2,'Bouake -> cities.Bouake (accentue)'),(3,3,'Yamoussoukro -> cities.Yamoussoukro'),(4,5,'Dakar -> cities.Dakar'),(5,6,'Thies -> cities.Thies (accentue)'),(6,24,'Paris -> cities.Paris (creee)'),(7,25,'Lyon -> cities.Lyon (creee)');
/*!40000 ALTER TABLE `_map_ville` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('mamago-cache-5c785c036466adea360111aa28563bfd556b5fba','i:1;',1784407135),('mamago-cache-5c785c036466adea360111aa28563bfd556b5fba:timer','i:1784407135;',1784407135);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_capital` tinyint(1) NOT NULL DEFAULT 0,
  `services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]' CHECK (json_valid(`services`)),
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_position_index` (`country_id`,`position`),
  CONSTRAINT `fk_cities_country` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,1,'Abidjan',1,'[\"transport\",\"livraison\",\"shopping\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(2,1,'Bouaké',0,'[\"transport\",\"livraison\",\"paiement\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(3,1,'Yamoussoukro',0,'[\"transport\",\"livraison\"]',2,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(4,1,'San-Pédro',0,'[\"transport\",\"livraison\"]',3,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(5,2,'Dakar',1,'[\"transport\",\"livraison\",\"shopping\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(6,2,'Thiès',0,'[\"transport\",\"livraison\",\"paiement\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(7,2,'Saint-Louis',0,'[\"transport\",\"livraison\"]',2,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(8,3,'Douala',0,'[\"transport\",\"livraison\",\"shopping\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(9,3,'Yaoundé',1,'[\"transport\",\"livraison\",\"restauration\",\"paiement\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(10,3,'Bafoussam',0,'[\"transport\",\"livraison\"]',2,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(11,4,'Bamako',1,'[\"transport\",\"livraison\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(12,4,'Sikasso',0,'[\"transport\",\"livraison\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(13,5,'Ouagadougou',1,'[\"transport\",\"livraison\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(14,5,'Bobo-Dioulasso',0,'[\"transport\",\"livraison\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(15,6,'Cotonou',0,'[\"transport\",\"livraison\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(16,6,'Porto-Novo',1,'[\"transport\",\"livraison\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(17,7,'Libreville',1,'[\"transport\",\"livraison\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(18,7,'Port-Gentil',0,'[\"transport\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(19,8,'Lomé',1,'[\"transport\",\"livraison\",\"restauration\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(20,8,'Sokodé',0,'[\"transport\",\"livraison\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(21,9,'Kinshasa',1,'[\"transport\",\"livraison\",\"shopping\",\"paiement\"]',0,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(22,9,'Lubumbashi',0,'[\"transport\",\"livraison\",\"paiement\"]',1,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(23,9,'Goma',0,'[\"transport\",\"livraison\"]',2,'2026-07-17 10:28:12','2026-07-17 10:28:12'),(24,11,'Paris',1,'[\"transport\",\"livraison\",\"restauration\"]',0,'2026-07-15 13:51:12','2026-07-15 13:51:12'),(25,11,'Lyon',0,'[\"transport\",\"livraison\"]',1,'2026-07-15 13:51:12','2026-07-15 13:51:12');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ville_id` bigint(20) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `date_inscription` date NOT NULL,
  `statut` enum('nouveau','actif','inactif') NOT NULL DEFAULT 'nouveau',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_clients_email` (`email`),
  UNIQUE KEY `uq_clients_telephone` (`telephone`),
  KEY `idx_clients_ville` (`ville_id`),
  KEY `idx_clients_statut` (`statut`),
  CONSTRAINT `fk_clients_ville` FOREIGN KEY (`ville_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,1,'Martin','Clarisse','client6a5790509bbf8@mail.test','0796570813','2026-04-24','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(2,1,'Camara','Paul','client6a5790509c5fc@mail.test','0722541928','2026-03-06','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(3,1,'Coulibaly','Kofi','client6a5790509cfc9@mail.test','0724140822','2026-05-15','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(4,1,'Sarr','Jean','client6a5790509e121@mail.test','0755434848','2026-02-03','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(5,1,'Fofana','Aya','client6a5790509e749@mail.test','0733983688','2026-04-05','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(6,1,'Camara','Sophie','client6a5790509ec9d@mail.test','0781805495','2026-04-22','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(7,1,'Dupont','Julie','client6a5790509f332@mail.test','0772494206','2026-04-26','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(8,1,'Sow','Aya','client6a5790509faab@mail.test','0788473819','2026-03-27','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(9,1,'Coulibaly','Aya','client6a579050a0036@mail.test','0758630884','2026-06-12','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(10,1,'Traore','Fatou','client6a579050a0738@mail.test','0742284144','2026-05-10','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(11,1,'Kouassi','Jean','client6a579050a117b@mail.test','0762634714','2026-01-30','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(12,1,'Ndiaye','Ousmane','client6a579050a1b89@mail.test','0758655676','2026-02-01','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(13,2,'Diallo','Awa','client6a579050a216c@mail.test','0727127136','2026-06-22','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(14,2,'Ba','Adama','client6a579050a2855@mail.test','0791543868','2026-06-23','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(15,2,'Diop','Nadege','client6a579050a2e21@mail.test','0754645534','2026-06-29','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(16,2,'Coulibaly','Lea','client6a579050a3310@mail.test','0781151662','2026-06-21','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(17,2,'Traore','Sekou','client6a579050a391e@mail.test','0788508159','2026-04-09','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(18,2,'Ndiaye','Aya','client6a579050a3f34@mail.test','0721790776','2026-03-28','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(19,2,'Bamba','Paul','client6a579050a462f@mail.test','0759503109','2026-02-15','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(20,2,'Traore','Paul','client6a579050a4f86@mail.test','0713333110','2026-03-21','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(21,2,'Sarr','Marie','client6a579050a5640@mail.test','0776602709','2026-02-28','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(22,2,'Fofana','Paul','client6a579050a5fe0@mail.test','0737171086','2026-06-14','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(23,2,'Sarr','Aminata','client6a579050a66f5@mail.test','0738090697','2026-01-24','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(24,2,'Yeo','Aya','client6a579050a6e41@mail.test','0794879231','2026-06-20','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(25,3,'Kouassi','Jean','client6a579050a7a0f@mail.test','0711701310','2026-06-30','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(26,3,'Martin','Sophie','client6a579050a837b@mail.test','0721497178','2026-07-11','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(27,3,'Fofana','Julie','client6a579050a8ceb@mail.test','0774536735','2026-07-07','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(28,3,'Ba','Nadege','client6a579050a94ca@mail.test','0734082819','2026-02-10','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(29,3,'Ouattara','Marie','client6a579050a9fdd@mail.test','0763061113','2026-03-12','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(30,3,'Gueye','Paul','client6a579050aa7a5@mail.test','0744013641','2026-06-14','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(31,3,'Toure','Jean','client6a579050aae97@mail.test','0789158997','2026-06-12','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(32,3,'Sarr','Ousmane','client6a579050ab544@mail.test','0743969970','2026-03-10','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(33,3,'Cisse','Fatou','client6a579050abc11@mail.test','0734042925','2026-02-03','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(34,3,'Diop','Paul','client6a579050ac3a5@mail.test','0776828589','2026-06-28','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(35,3,'Ouattara','Aya','client6a579050acb09@mail.test','0718849496','2026-03-18','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(36,5,'Ndiaye','Ibrahim','client6a579050ad232@mail.test','0759709571','2026-07-01','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(37,5,'Ouattara','Sekou','client6a579050adcb1@mail.test','0728115217','2026-03-02','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(38,5,'Ba','Yao','client6a579050aea39@mail.test','0756365936','2026-02-21','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(39,5,'Ouattara','Aya','client6a579050af51a@mail.test','0726707515','2026-01-21','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(40,5,'Ouattara','Awa','client6a579050b005d@mail.test','0784516267','2026-01-29','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(41,5,'Diop','Yao','client6a579050b07c2@mail.test','0784514668','2026-03-08','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(42,5,'Dupont','Sekou','client6a579050b10ce@mail.test','0773927762','2026-02-24','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(43,5,'Sow','Paul','client6a579050b18a2@mail.test','0792729417','2026-06-18','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(44,6,'Sarr','Awa','client6a579050b248a@mail.test','0772977938','2026-01-25','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(45,6,'Dupont','Kader','client6a579050b2a48@mail.test','0769238157','2026-02-06','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(46,6,'Diallo','Fatou','client6a579050b3106@mail.test','0781657294','2026-04-18','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(47,6,'Fofana','Ibrahim','client6a579050b38fa@mail.test','0719440819','2026-07-12','nouveau','2026-07-15 15:51:12','2026-07-15 15:51:12'),(48,6,'Sow','Sekou','client6a579050b435e@mail.test','0738024502','2026-01-26','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(49,6,'Traore','Kader','client6a579050b4a8b@mail.test','0714832298','2026-05-12','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(50,6,'Fofana','Aminata','client6a579050b53c2@mail.test','0710201194','2026-06-07','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(51,6,'Yeo','Fatou','client6a579050b5a96@mail.test','0729220605','2026-05-18','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(52,6,'Traore','Kofi','client6a579050b68e6@mail.test','0792753246','2026-05-30','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(53,24,'Diop','Nadege','client6a579050b7074@mail.test','0733352556','2026-05-31','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(54,24,'Bamba','Paul','client6a579050b784f@mail.test','0724613974','2026-06-10','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(55,24,'Ba','Kofi','client6a579050b7e04@mail.test','0770460743','2026-04-17','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(56,24,'Cisse','Paul','client6a579050b85d8@mail.test','0789161717','2026-03-26','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(57,24,'Martin','Fatou','client6a579050b8c66@mail.test','0733661165','2026-05-19','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(58,24,'Gueye','Nadege','client6a579050b9197@mail.test','0725938622','2026-02-28','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(59,24,'Coulibaly','Aya','client6a579050b966d@mail.test','0784574484','2026-04-25','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(60,24,'Traore','Adama','client6a579050ba15f@mail.test','0788800850','2026-05-07','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(61,24,'Dupont','Adama','client6a579050ba7ad@mail.test','0739375352','2026-06-23','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(62,25,'Gueye','Moussa','client6a579050bb00c@mail.test','0738620002','2026-06-20','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(63,25,'Sow','Adama','client6a579050bb651@mail.test','0797149304','2026-01-29','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(64,25,'Yeo','Ibrahim','client6a579050bbd0d@mail.test','0751902751','2026-02-04','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(65,25,'Martin','Moussa','client6a579050bc265@mail.test','0743782029','2026-03-11','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(66,25,'Bamba','Adama','client6a579050bc8f7@mail.test','0766771950','2026-05-20','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(67,25,'Kone','Aya','client6a579050bcf8e@mail.test','0767450338','2026-04-09','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(68,25,'Ouattara','Julie','client6a579050bd7c9@mail.test','0769313709','2026-02-02','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(69,25,'Gueye','Paul','client6a579050bdecc@mail.test','0723699794','2026-06-06','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(70,25,'Ba','Clarisse','client6a579050be704@mail.test','0733688046','2026-03-19','inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(71,25,'Kouassi','Ousmane','client6a579050bef1e@mail.test','0733265277','2026-03-04','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(72,25,'Toure','Awa','client6a579050bf7c7@mail.test','0792788131','2026-02-03','actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(73,25,'Fofana','Aminata','client6a579050bfe3e@mail.test','0764908905','2026-06-24','actif','2026-07-15 15:51:12','2026-07-15 15:51:12');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connexions`
--

DROP TABLE IF EXISTS `connexions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connexions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `date_connexion` datetime NOT NULL,
  `adresse_ip` varchar(45) NOT NULL,
  `duree_secondes` int(10) unsigned DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_connexions_utilisateur` (`utilisateur_id`),
  KEY `idx_connexions_date` (`date_connexion`),
  CONSTRAINT `fk_connexions_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connexions`
--

LOCK TABLES `connexions` WRITE;
/*!40000 ALTER TABLE `connexions` DISABLE KEYS */;
INSERT INTO `connexions` VALUES (1,1,'2026-07-05 17:51:15','192.168.1.13',3209,'modif_profil','2026-07-05 17:51:15'),(2,1,'2026-06-29 01:51:15','192.168.1.190',1327,'export_rapport','2026-06-29 01:51:15'),(3,1,'2026-07-06 10:51:15','192.168.1.191',799,'consultation_stats','2026-07-06 10:51:15'),(4,1,'2026-06-18 05:51:15','192.168.1.22',2434,'connexion','2026-06-18 05:51:15'),(5,1,'2026-07-06 20:51:15','192.168.1.203',1363,'connexion','2026-07-06 20:51:15'),(6,2,'2026-07-09 12:51:15','192.168.1.167',373,'export_rapport','2026-07-09 12:51:15'),(7,2,'2026-07-04 23:51:15','192.168.1.8',3089,'connexion','2026-07-04 23:51:15'),(8,2,'2026-07-07 03:51:15','192.168.1.75',3456,'export_rapport','2026-07-07 03:51:15'),(9,2,'2026-06-29 14:51:15','192.168.1.247',740,'export_rapport','2026-06-29 14:51:15'),(10,2,'2026-07-03 01:51:15','192.168.1.252',3353,'export_rapport','2026-07-03 01:51:15'),(11,3,'2026-07-08 01:51:15','192.168.1.134',3284,'export_rapport','2026-07-08 01:51:15'),(12,3,'2026-06-26 10:51:15','192.168.1.4',1543,'export_rapport','2026-06-26 10:51:15'),(13,3,'2026-07-11 04:51:15','192.168.1.9',767,'connexion','2026-07-11 04:51:15'),(14,3,'2026-06-27 09:51:15','192.168.1.128',772,'connexion','2026-06-27 09:51:15'),(15,3,'2026-06-22 13:51:15','192.168.1.23',2112,'consultation_stats','2026-06-22 13:51:15'),(16,1,'2026-07-15 23:44:06','::1',NULL,'connexion','2026-07-15 23:44:06'),(17,1,'2026-07-16 17:32:15','::1',NULL,'connexion','2026-07-16 17:32:15'),(18,1,'2026-07-17 10:41:50','::1',NULL,'connexion','2026-07-17 10:41:50'),(19,1,'2026-07-17 10:52:14','::1',NULL,'connexion','2026-07-17 10:52:14'),(20,1,'2026-07-17 11:16:32','::1',NULL,'connexion','2026-07-17 11:16:32'),(21,1,'2026-07-18 19:41:48','127.0.0.1',NULL,'connexion','2026-07-18 19:41:48'),(22,1,'2026-07-18 21:46:21','127.0.0.1',NULL,'connexion','2026-07-18 21:46:21'),(23,1,'2026-07-18 22:09:40','127.0.0.1',NULL,'connexion','2026-07-18 22:09:40'),(24,1,'2026-07-18 22:13:10','127.0.0.1',NULL,'connexion','2026-07-18 22:13:10'),(25,1,'2026-07-19 02:27:11','127.0.0.1',NULL,'connexion','2026-07-19 02:27:11'),(26,1,'2026-07-19 16:25:42','127.0.0.1',NULL,'connexion','2026-07-19 16:25:42'),(27,1,'2026-07-19 16:45:51','127.0.0.1',NULL,'connexion','2026-07-19 16:45:51');
/*!40000 ALTER TABLE `connexions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `code` varchar(2) DEFAULT NULL,
  `devise` varchar(10) NOT NULL DEFAULT 'XOF',
  `ca_global` decimal(14,2) NOT NULL DEFAULT 0.00,
  `is_placeholder` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `countries_is_active_position_index` (`is_active`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'cote-divoire','{\"fr\":\"C\\u00f4te d\'Ivoire\",\"en\":\"Ivory Coast\"}','CI','XOF',1211492.00,0,0,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(2,'senegal','{\"fr\":\"S\\u00e9n\\u00e9gal\",\"en\":\"Senegal\"}','SN','XOF',869851.00,0,1,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(3,'cameroun','{\"fr\":\"Cameroun\",\"en\":\"Cameroon\"}','CM','XOF',0.00,0,2,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(4,'mali','{\"fr\":\"Mali\",\"en\":\"Mali\"}','ML','XOF',0.00,0,3,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(5,'burkina-faso','{\"fr\":\"Burkina Faso\",\"en\":\"Burkina Faso\"}','BF','XOF',0.00,0,4,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(6,'benin','{\"fr\":\"B\\u00e9nin\",\"en\":\"Benin\"}','BJ','XOF',0.00,0,5,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(7,'gabon','{\"fr\":\"Gabon\",\"en\":\"Gabon\"}','GA','XOF',0.00,0,6,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(8,'togo','{\"fr\":\"Togo\",\"en\":\"Togo\"}','TG','XOF',0.00,0,7,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(9,'rdc','{\"fr\":\"RDC\",\"en\":\"DRC\"}','CD','XOF',0.00,0,8,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(10,'et-plus-encore','{\"fr\":\"Et plus encore\",\"en\":\"And more\"}',NULL,'XOF',0.00,1,10,1,'2026-07-17 09:22:53','2026-07-17 11:28:28'),(11,NULL,'{\"fr\":\"France\",\"en\":\"France\"}','FR','EUR',4758.01,0,9,1,'2026-07-15 13:51:12','2026-07-15 13:51:12');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `livreur_id` bigint(20) unsigned DEFAULT NULL,
  `ville_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `date_course` datetime NOT NULL,
  `montant` decimal(10,2) NOT NULL DEFAULT 0.00,
  `duree_minutes` int(10) unsigned DEFAULT NULL,
  `statut` enum('en_attente','en_cours','terminee','annulee') NOT NULL DEFAULT 'en_attente',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_courses_client` (`client_id`),
  KEY `idx_courses_livreur` (`livreur_id`),
  KEY `idx_courses_ville` (`ville_id`),
  KEY `idx_courses_service` (`service_id`),
  KEY `idx_courses_date` (`date_course`),
  KEY `idx_courses_statut` (`statut`),
  CONSTRAINT `fk_courses_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_courses_livreur` FOREIGN KEY (`livreur_id`) REFERENCES `livreurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_courses_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_courses_ville` FOREIGN KEY (`ville_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,52,20,6,2,'2026-04-09 15:14:00',14031.00,27,'annulee','2026-04-09 15:14:00','2026-04-09 15:14:00'),(2,71,30,25,1,'2026-05-28 14:43:00',12.54,73,'annulee','2026-05-28 14:43:00','2026-05-28 14:43:00'),(3,34,12,3,4,'2026-05-23 17:13:00',4419.00,8,'terminee','2026-05-23 17:13:00','2026-05-23 17:13:00'),(4,11,NULL,1,1,'2026-04-17 15:09:00',1567.00,28,'terminee','2026-04-17 15:09:00','2026-04-17 15:09:00'),(5,36,14,5,1,'2026-06-20 16:12:00',3957.00,55,'terminee','2026-06-20 16:12:00','2026-06-20 16:12:00'),(6,61,23,24,4,'2026-04-08 18:01:00',14.27,71,'terminee','2026-04-08 18:01:00','2026-04-08 18:01:00'),(7,37,14,5,4,'2026-05-29 20:20:00',3080.00,17,'annulee','2026-05-29 20:20:00','2026-05-29 20:20:00'),(8,7,3,1,2,'2026-06-09 18:03:00',13598.00,17,'terminee','2026-06-09 18:03:00','2026-06-09 18:03:00'),(9,7,3,1,1,'2026-07-15 13:45:00',1609.00,11,'terminee','2026-07-15 13:45:00','2026-07-15 13:45:00'),(10,29,9,3,4,'2026-04-04 18:50:00',2611.00,21,'terminee','2026-04-04 18:50:00','2026-04-04 18:50:00'),(11,57,NULL,24,4,'2026-06-01 08:51:00',20.67,68,'en_cours','2026-06-01 08:51:00','2026-06-01 08:51:00'),(12,4,2,1,2,'2026-04-18 18:52:00',5223.00,51,'terminee','2026-04-18 18:52:00','2026-04-18 18:52:00'),(13,43,14,5,2,'2026-07-09 14:27:00',10871.00,46,'terminee','2026-07-09 14:27:00','2026-07-09 14:27:00'),(14,37,NULL,5,1,'2026-06-11 16:47:00',5701.00,13,'terminee','2026-06-11 16:47:00','2026-06-11 16:47:00'),(15,40,16,5,1,'2026-04-20 14:03:00',4631.00,14,'terminee','2026-04-20 14:03:00','2026-04-20 14:03:00'),(16,42,16,5,2,'2026-06-16 10:45:00',7242.00,43,'terminee','2026-06-16 10:45:00','2026-06-16 10:45:00'),(17,40,15,5,2,'2026-04-01 20:11:00',7761.00,11,'annulee','2026-04-01 20:11:00','2026-04-01 20:11:00'),(18,65,29,25,2,'2026-03-31 10:38:00',78.13,68,'terminee','2026-03-31 10:38:00','2026-03-31 10:38:00'),(19,61,NULL,24,4,'2026-04-17 07:29:00',16.11,71,'annulee','2026-04-17 07:29:00','2026-04-17 07:29:00'),(20,49,NULL,6,2,'2026-06-24 12:13:00',7587.00,17,'terminee','2026-06-24 12:13:00','2026-06-24 12:13:00'),(21,25,NULL,3,4,'2026-04-12 06:42:00',5540.00,23,'terminee','2026-04-12 06:42:00','2026-04-12 06:42:00'),(22,45,20,6,2,'2026-05-08 14:27:00',10627.00,62,'terminee','2026-05-08 14:27:00','2026-05-08 14:27:00'),(23,10,1,1,2,'2026-07-12 22:54:00',6566.00,39,'terminee','2026-07-12 22:54:00','2026-07-12 22:54:00'),(24,45,17,6,4,'2026-04-04 15:09:00',3718.00,28,'terminee','2026-04-04 15:09:00','2026-04-04 15:09:00'),(25,39,16,5,4,'2026-04-30 08:33:00',1571.00,38,'terminee','2026-04-30 08:33:00','2026-04-30 08:33:00'),(26,28,9,3,4,'2026-03-27 12:30:00',2939.00,10,'annulee','2026-03-27 12:30:00','2026-03-27 12:30:00'),(27,6,NULL,1,2,'2026-04-11 18:37:00',2454.00,55,'en_cours','2026-04-11 18:37:00','2026-04-11 18:37:00'),(28,43,14,5,1,'2026-04-21 13:05:00',6157.00,40,'terminee','2026-04-21 13:05:00','2026-04-21 13:05:00'),(29,39,NULL,5,1,'2026-05-11 06:45:00',1863.00,43,'annulee','2026-05-11 06:45:00','2026-05-11 06:45:00'),(30,26,10,3,4,'2026-06-12 20:47:00',4629.00,35,'terminee','2026-06-12 20:47:00','2026-06-12 20:47:00'),(31,39,15,5,2,'2026-04-10 06:30:00',12735.00,61,'annulee','2026-04-10 06:30:00','2026-04-10 06:30:00'),(32,3,3,1,1,'2026-06-19 20:43:00',2422.00,46,'terminee','2026-06-19 20:43:00','2026-06-19 20:43:00'),(33,3,2,1,2,'2026-06-14 21:55:00',14529.00,10,'terminee','2026-06-14 21:55:00','2026-06-14 21:55:00'),(34,61,26,24,4,'2026-05-28 09:46:00',11.56,57,'terminee','2026-05-28 09:46:00','2026-05-28 09:46:00'),(35,56,NULL,24,2,'2026-06-17 20:13:00',81.26,27,'en_cours','2026-06-17 20:13:00','2026-06-17 20:13:00'),(36,45,19,6,2,'2026-07-12 07:08:00',2733.00,36,'terminee','2026-07-12 07:08:00','2026-07-12 07:08:00'),(37,67,29,25,2,'2026-06-19 13:20:00',63.25,65,'terminee','2026-06-19 13:20:00','2026-06-19 13:20:00'),(38,9,1,1,4,'2026-04-11 23:18:00',2593.00,9,'terminee','2026-04-11 23:18:00','2026-04-11 23:18:00'),(39,32,11,3,1,'2026-06-10 22:09:00',3261.00,24,'terminee','2026-06-10 22:09:00','2026-06-10 22:09:00'),(40,9,2,1,2,'2026-05-03 11:54:00',3323.00,10,'terminee','2026-05-03 11:54:00','2026-05-03 11:54:00'),(41,12,2,1,1,'2026-07-13 20:53:00',3278.00,32,'terminee','2026-07-13 20:53:00','2026-07-13 20:53:00'),(42,47,NULL,6,2,'2026-04-16 09:53:00',3752.00,30,'en_cours','2026-04-16 09:53:00','2026-04-16 09:53:00'),(43,16,5,2,4,'2026-05-31 22:34:00',2997.00,11,'terminee','2026-05-31 22:34:00','2026-05-31 22:34:00'),(44,70,29,25,1,'2026-04-15 23:56:00',20.80,8,'terminee','2026-04-15 23:56:00','2026-04-15 23:56:00'),(45,36,13,5,2,'2026-05-22 09:21:00',9467.00,37,'terminee','2026-05-22 09:21:00','2026-05-22 09:21:00'),(46,56,24,24,1,'2026-07-05 14:46:00',26.81,65,'terminee','2026-07-05 14:46:00','2026-07-05 14:46:00'),(47,7,NULL,1,2,'2026-04-15 10:55:00',10375.00,74,'en_cours','2026-04-15 10:55:00','2026-04-15 10:55:00'),(48,22,4,2,4,'2026-06-05 21:47:00',1643.00,67,'annulee','2026-06-05 21:47:00','2026-06-05 21:47:00'),(49,70,28,25,2,'2026-06-12 23:51:00',26.40,52,'terminee','2026-06-12 23:51:00','2026-06-12 23:51:00'),(50,6,1,1,4,'2026-04-06 22:45:00',1649.00,13,'terminee','2026-04-06 22:45:00','2026-04-06 22:45:00'),(51,59,26,24,1,'2026-05-25 09:39:00',40.72,70,'terminee','2026-05-25 09:39:00','2026-05-25 09:39:00'),(52,55,25,24,2,'2026-04-29 16:17:00',31.07,35,'terminee','2026-04-29 16:17:00','2026-04-29 16:17:00'),(53,24,7,2,4,'2026-07-12 22:05:00',5170.00,42,'annulee','2026-07-12 22:05:00','2026-07-12 22:05:00'),(54,47,NULL,6,4,'2026-06-11 06:50:00',5768.00,51,'en_cours','2026-06-11 06:50:00','2026-06-11 06:50:00'),(55,13,6,2,4,'2026-03-19 14:18:00',3488.00,56,'terminee','2026-03-19 14:18:00','2026-03-19 14:18:00'),(56,55,NULL,24,2,'2026-03-30 07:30:00',56.94,20,'en_cours','2026-03-30 07:30:00','2026-03-30 07:30:00'),(57,31,NULL,3,2,'2026-03-26 23:48:00',9115.00,57,'en_cours','2026-03-26 23:48:00','2026-03-26 23:48:00'),(58,24,6,2,2,'2026-06-02 19:46:00',14895.00,61,'terminee','2026-06-02 19:46:00','2026-06-02 19:46:00'),(59,53,27,24,2,'2026-06-25 08:39:00',88.23,41,'terminee','2026-06-25 08:39:00','2026-06-25 08:39:00'),(60,65,NULL,25,1,'2026-06-17 16:35:00',30.90,21,'terminee','2026-06-17 16:35:00','2026-06-17 16:35:00'),(61,8,NULL,1,4,'2026-06-04 13:23:00',3475.00,73,'en_cours','2026-06-04 13:23:00','2026-06-04 13:23:00'),(62,49,22,6,1,'2026-05-17 10:58:00',2728.00,60,'terminee','2026-05-17 10:58:00','2026-05-17 10:58:00'),(63,51,NULL,6,2,'2026-06-09 14:37:00',3811.00,53,'terminee','2026-06-09 14:37:00','2026-06-09 14:37:00'),(64,20,8,2,2,'2026-03-26 12:15:00',2321.00,71,'terminee','2026-03-26 12:15:00','2026-03-26 12:15:00'),(65,44,NULL,6,2,'2026-05-21 16:18:00',6403.00,64,'terminee','2026-05-21 16:18:00','2026-05-21 16:18:00'),(66,40,16,5,2,'2026-06-14 10:51:00',13853.00,65,'terminee','2026-06-14 10:51:00','2026-06-14 10:51:00'),(67,43,13,5,4,'2026-05-21 09:09:00',2083.00,39,'terminee','2026-05-21 09:09:00','2026-05-21 09:09:00'),(68,32,9,3,1,'2026-05-27 22:16:00',5358.00,61,'terminee','2026-05-27 22:16:00','2026-05-27 22:16:00'),(69,21,5,2,2,'2026-06-25 08:30:00',13272.00,11,'terminee','2026-06-25 08:30:00','2026-06-25 08:30:00'),(70,23,4,2,4,'2026-06-17 13:23:00',2419.00,37,'terminee','2026-06-17 13:23:00','2026-06-17 13:23:00'),(71,6,2,1,2,'2026-04-27 11:58:00',14813.00,45,'annulee','2026-04-27 11:58:00','2026-04-27 11:58:00'),(72,13,6,2,1,'2026-05-27 10:56:00',3245.00,68,'terminee','2026-05-27 10:56:00','2026-05-27 10:56:00'),(73,73,30,25,2,'2026-05-26 09:47:00',45.55,52,'terminee','2026-05-26 09:47:00','2026-05-26 09:47:00'),(74,5,NULL,1,2,'2026-06-27 16:40:00',2295.00,12,'terminee','2026-06-27 16:40:00','2026-06-27 16:40:00'),(75,38,13,5,1,'2026-05-15 08:43:00',2597.00,69,'terminee','2026-05-15 08:43:00','2026-05-15 08:43:00'),(76,72,30,25,4,'2026-05-27 21:21:00',29.28,28,'terminee','2026-05-27 21:21:00','2026-05-27 21:21:00'),(77,63,30,25,4,'2026-06-09 08:19:00',23.54,11,'terminee','2026-06-09 08:19:00','2026-06-09 08:19:00'),(78,18,4,2,2,'2026-06-27 17:14:00',13395.00,44,'terminee','2026-06-27 17:14:00','2026-06-27 17:14:00'),(79,65,28,25,2,'2026-04-18 08:37:00',76.55,68,'terminee','2026-04-18 08:37:00','2026-04-18 08:37:00'),(80,31,10,3,1,'2026-05-10 16:20:00',2141.00,40,'terminee','2026-05-10 16:20:00','2026-05-10 16:20:00'),(81,14,7,2,2,'2026-06-19 08:15:00',14150.00,30,'annulee','2026-06-19 08:15:00','2026-06-19 08:15:00'),(82,39,NULL,5,2,'2026-06-04 15:43:00',13732.00,52,'annulee','2026-06-04 15:43:00','2026-06-04 15:43:00'),(83,70,30,25,4,'2026-03-23 22:29:00',17.68,54,'terminee','2026-03-23 22:29:00','2026-03-23 22:29:00'),(84,57,26,24,1,'2026-06-10 14:03:00',30.39,37,'terminee','2026-06-10 14:03:00','2026-06-10 14:03:00'),(85,53,23,24,4,'2026-04-23 18:27:00',12.55,53,'terminee','2026-04-23 18:27:00','2026-04-23 18:27:00'),(86,13,4,2,2,'2026-04-16 13:39:00',8137.00,67,'terminee','2026-04-16 13:39:00','2026-04-16 13:39:00'),(87,13,NULL,2,4,'2026-06-19 06:07:00',2787.00,51,'en_cours','2026-06-19 06:07:00','2026-06-19 06:07:00'),(88,43,NULL,5,2,'2026-03-27 12:24:00',12038.00,13,'terminee','2026-03-27 12:24:00','2026-03-27 12:24:00'),(89,72,NULL,25,4,'2026-04-06 14:32:00',26.87,65,'en_cours','2026-04-06 14:32:00','2026-04-06 14:32:00'),(90,8,2,1,2,'2026-06-15 11:49:00',8398.00,62,'terminee','2026-06-15 11:49:00','2026-06-15 11:49:00'),(91,12,NULL,1,4,'2026-05-04 06:13:00',4058.00,70,'terminee','2026-05-04 06:13:00','2026-05-04 06:13:00'),(92,33,11,3,1,'2026-04-15 17:46:00',4814.00,53,'terminee','2026-04-15 17:46:00','2026-04-15 17:46:00'),(93,36,16,5,4,'2026-06-06 07:42:00',2534.00,63,'terminee','2026-06-06 07:42:00','2026-06-06 07:42:00'),(94,42,15,5,1,'2026-07-12 19:17:00',4659.00,33,'terminee','2026-07-12 19:17:00','2026-07-12 19:17:00'),(95,50,21,6,1,'2026-04-11 08:11:00',7364.00,9,'terminee','2026-04-11 08:11:00','2026-04-11 08:11:00'),(96,57,NULL,24,4,'2026-03-26 19:47:00',12.69,75,'en_cours','2026-03-26 19:47:00','2026-03-26 19:47:00'),(97,63,NULL,25,4,'2026-07-15 11:31:00',9.42,23,'terminee','2026-07-15 11:31:00','2026-07-15 11:31:00'),(98,29,NULL,3,2,'2026-06-11 23:39:00',4020.00,61,'terminee','2026-06-11 23:39:00','2026-06-11 23:39:00'),(99,4,2,1,2,'2026-06-04 19:57:00',9433.00,66,'terminee','2026-06-04 19:57:00','2026-06-04 19:57:00'),(100,23,7,2,2,'2026-05-19 07:38:00',6319.00,8,'terminee','2026-05-19 07:38:00','2026-05-19 07:38:00'),(101,70,32,25,1,'2026-06-08 16:40:00',26.36,43,'terminee','2026-06-08 16:40:00','2026-06-08 16:40:00'),(102,17,NULL,2,4,'2026-04-30 12:56:00',2883.00,58,'en_cours','2026-04-30 12:56:00','2026-04-30 12:56:00'),(103,7,3,1,4,'2026-06-13 11:12:00',1273.00,33,'terminee','2026-06-13 11:12:00','2026-06-13 11:12:00'),(104,56,25,24,2,'2026-06-18 06:50:00',46.60,71,'terminee','2026-06-18 06:50:00','2026-06-18 06:50:00'),(105,40,NULL,5,4,'2026-07-04 15:38:00',2786.00,41,'en_cours','2026-07-04 15:38:00','2026-07-04 15:38:00'),(106,11,3,1,2,'2026-05-19 09:08:00',9993.00,39,'terminee','2026-05-19 09:08:00','2026-05-19 09:08:00'),(107,50,NULL,6,4,'2026-03-19 19:54:00',4889.00,35,'terminee','2026-03-19 19:54:00','2026-03-19 19:54:00'),(108,56,NULL,24,4,'2026-07-10 18:52:00',33.78,35,'en_cours','2026-07-10 18:52:00','2026-07-10 18:52:00'),(109,52,18,6,4,'2026-03-27 13:17:00',2784.00,31,'terminee','2026-03-27 13:17:00','2026-03-27 13:17:00'),(110,2,NULL,1,2,'2026-03-22 09:58:00',2178.00,60,'terminee','2026-03-22 09:58:00','2026-03-22 09:58:00'),(111,65,30,25,2,'2026-05-15 23:23:00',12.99,41,'terminee','2026-05-15 23:23:00','2026-05-15 23:23:00'),(112,9,1,1,2,'2026-07-15 16:13:00',10629.00,21,'terminee','2026-07-15 16:13:00','2026-07-15 16:13:00'),(113,56,24,24,1,'2026-04-16 06:22:00',26.76,42,'terminee','2026-04-16 06:22:00','2026-04-16 06:22:00'),(114,66,28,25,1,'2026-04-14 08:52:00',39.73,42,'terminee','2026-04-14 08:52:00','2026-04-14 08:52:00'),(115,63,28,25,4,'2026-05-15 07:46:00',11.09,74,'terminee','2026-05-15 07:46:00','2026-05-15 07:46:00'),(116,28,12,3,1,'2026-05-19 15:31:00',7637.00,42,'annulee','2026-05-19 15:31:00','2026-05-19 15:31:00'),(117,30,12,3,1,'2026-06-20 14:50:00',3595.00,44,'terminee','2026-06-20 14:50:00','2026-06-20 14:50:00'),(118,47,21,6,4,'2026-04-03 12:53:00',3288.00,18,'terminee','2026-04-03 12:53:00','2026-04-03 12:53:00'),(119,6,NULL,1,2,'2026-04-30 21:14:00',12018.00,58,'en_cours','2026-04-30 21:14:00','2026-04-30 21:14:00'),(120,42,15,5,2,'2026-03-27 14:50:00',13156.00,41,'terminee','2026-03-27 14:50:00','2026-03-27 14:50:00'),(121,59,24,24,2,'2026-03-31 22:35:00',36.47,11,'terminee','2026-03-31 22:35:00','2026-03-31 22:35:00'),(122,62,29,25,4,'2026-05-20 21:34:00',24.78,41,'terminee','2026-05-20 21:34:00','2026-05-20 21:34:00'),(123,68,NULL,25,4,'2026-05-28 19:33:00',21.60,54,'en_cours','2026-05-28 19:33:00','2026-05-28 19:33:00'),(124,38,14,5,2,'2026-07-12 07:22:00',11281.00,74,'terminee','2026-07-12 07:22:00','2026-07-12 07:22:00'),(125,44,20,6,1,'2026-06-27 20:01:00',3911.00,64,'terminee','2026-06-27 20:01:00','2026-06-27 20:01:00'),(126,23,5,2,1,'2026-07-02 23:17:00',4786.00,19,'terminee','2026-07-02 23:17:00','2026-07-02 23:17:00'),(127,23,4,2,1,'2026-07-05 18:29:00',5161.00,62,'terminee','2026-07-05 18:29:00','2026-07-05 18:29:00'),(128,54,25,24,4,'2026-05-24 16:02:00',14.30,22,'terminee','2026-05-24 16:02:00','2026-05-24 16:02:00'),(129,35,NULL,3,2,'2026-05-03 11:02:00',3252.00,57,'terminee','2026-05-03 11:02:00','2026-05-03 11:02:00'),(130,41,14,5,1,'2026-04-13 21:14:00',3378.00,11,'annulee','2026-04-13 21:14:00','2026-04-13 21:14:00'),(131,41,NULL,5,4,'2026-05-03 11:12:00',5858.00,16,'terminee','2026-05-03 11:12:00','2026-05-03 11:12:00'),(132,36,NULL,5,4,'2026-06-30 14:39:00',5786.00,35,'terminee','2026-06-30 14:39:00','2026-06-30 14:39:00'),(133,56,24,24,1,'2026-04-06 09:05:00',35.78,45,'annulee','2026-04-06 09:05:00','2026-04-06 09:05:00'),(134,68,28,25,1,'2026-07-04 13:28:00',14.88,25,'annulee','2026-07-04 13:28:00','2026-07-04 13:28:00'),(135,55,27,24,2,'2026-07-13 17:12:00',67.32,17,'terminee','2026-07-13 17:12:00','2026-07-13 17:12:00'),(136,36,15,5,2,'2026-06-04 12:27:00',4557.00,60,'terminee','2026-06-04 12:27:00','2026-06-04 12:27:00'),(137,20,6,2,1,'2026-05-31 14:18:00',1658.00,14,'terminee','2026-05-31 14:18:00','2026-05-31 14:18:00'),(138,54,25,24,4,'2026-06-29 07:40:00',11.04,75,'terminee','2026-06-29 07:40:00','2026-06-29 07:40:00'),(139,46,18,6,4,'2026-04-05 10:08:00',1333.00,74,'terminee','2026-04-05 10:08:00','2026-04-05 10:08:00'),(140,57,25,24,1,'2026-04-27 18:14:00',16.03,16,'terminee','2026-04-27 18:14:00','2026-04-27 18:14:00'),(141,54,NULL,24,2,'2026-05-20 06:37:00',49.92,30,'terminee','2026-05-20 06:37:00','2026-05-20 06:37:00'),(142,41,15,5,2,'2026-04-20 22:03:00',10032.00,70,'terminee','2026-04-20 22:03:00','2026-04-20 22:03:00'),(143,32,NULL,3,4,'2026-05-26 13:33:00',4821.00,67,'en_cours','2026-05-26 13:33:00','2026-05-26 13:33:00'),(144,44,17,6,1,'2026-05-16 14:26:00',7059.00,50,'terminee','2026-05-16 14:26:00','2026-05-16 14:26:00'),(145,54,24,24,2,'2026-06-08 06:21:00',55.22,45,'terminee','2026-06-08 06:21:00','2026-06-08 06:21:00'),(146,18,NULL,2,4,'2026-05-09 19:15:00',2503.00,14,'terminee','2026-05-09 19:15:00','2026-05-09 19:15:00'),(147,61,26,24,1,'2026-07-15 13:23:00',31.03,45,'terminee','2026-07-15 13:23:00','2026-07-15 13:23:00'),(148,18,8,2,4,'2026-07-03 12:43:00',5928.00,73,'terminee','2026-07-03 12:43:00','2026-07-03 12:43:00'),(149,28,12,3,1,'2026-04-30 07:16:00',7447.00,38,'terminee','2026-04-30 07:16:00','2026-04-30 07:16:00'),(150,65,NULL,25,2,'2026-05-25 07:22:00',19.71,41,'en_cours','2026-05-25 07:22:00','2026-05-25 07:22:00'),(151,14,4,2,2,'2026-05-17 08:40:00',8577.00,24,'annulee','2026-05-17 08:40:00','2026-05-17 08:40:00'),(152,48,18,6,2,'2026-06-30 09:57:00',6588.00,48,'terminee','2026-06-30 09:57:00','2026-06-30 09:57:00'),(153,3,2,1,2,'2026-05-02 08:29:00',14878.00,18,'terminee','2026-05-02 08:29:00','2026-05-02 08:29:00'),(154,5,2,1,1,'2026-04-19 06:43:00',5567.00,63,'terminee','2026-04-19 06:43:00','2026-04-19 06:43:00'),(155,46,18,6,2,'2026-05-02 12:14:00',14429.00,51,'terminee','2026-05-02 12:14:00','2026-05-02 12:14:00'),(156,16,8,2,4,'2026-06-21 20:22:00',2773.00,73,'annulee','2026-06-21 20:22:00','2026-06-21 20:22:00'),(157,34,9,3,1,'2026-05-05 12:01:00',4293.00,48,'terminee','2026-05-05 12:01:00','2026-05-05 12:01:00'),(158,60,27,24,2,'2026-04-06 06:59:00',29.92,62,'terminee','2026-04-06 06:59:00','2026-04-06 06:59:00'),(159,26,NULL,3,4,'2026-05-29 16:16:00',5114.00,19,'en_cours','2026-05-29 16:16:00','2026-05-29 16:16:00'),(160,53,23,24,4,'2026-04-12 21:14:00',22.53,58,'terminee','2026-04-12 21:14:00','2026-04-12 21:14:00'),(161,67,29,25,1,'2026-04-20 07:59:00',40.58,23,'terminee','2026-04-20 07:59:00','2026-04-20 07:59:00'),(162,45,21,6,2,'2026-04-24 07:44:00',2225.00,68,'terminee','2026-04-24 07:44:00','2026-04-24 07:44:00'),(163,49,NULL,6,2,'2026-04-03 07:38:00',3832.00,44,'en_cours','2026-04-03 07:38:00','2026-04-03 07:38:00'),(164,18,7,2,4,'2026-06-27 19:57:00',4518.00,34,'terminee','2026-06-27 19:57:00','2026-06-27 19:57:00'),(165,47,19,6,4,'2026-07-12 11:38:00',3803.00,45,'annulee','2026-07-12 11:38:00','2026-07-12 11:38:00'),(166,55,27,24,1,'2026-05-18 08:58:00',10.75,72,'annulee','2026-05-18 08:58:00','2026-05-18 08:58:00'),(167,43,15,5,4,'2026-06-27 20:57:00',2208.00,72,'terminee','2026-06-27 20:57:00','2026-06-27 20:57:00'),(168,3,1,1,4,'2026-04-01 09:57:00',3995.00,36,'terminee','2026-04-01 09:57:00','2026-04-01 09:57:00'),(169,70,32,25,4,'2026-04-07 21:16:00',17.97,55,'annulee','2026-04-07 21:16:00','2026-04-07 21:16:00'),(170,60,NULL,24,2,'2026-04-02 20:43:00',60.18,71,'en_cours','2026-04-02 20:43:00','2026-04-02 20:43:00'),(171,54,25,24,4,'2026-05-24 14:20:00',13.36,52,'terminee','2026-05-24 14:20:00','2026-05-24 14:20:00'),(172,60,23,24,2,'2026-04-27 19:25:00',88.46,44,'terminee','2026-04-27 19:25:00','2026-04-27 19:25:00'),(173,11,NULL,1,2,'2026-04-25 14:38:00',4219.00,67,'en_cours','2026-04-25 14:38:00','2026-04-25 14:38:00'),(174,45,22,6,4,'2026-05-05 13:18:00',4875.00,58,'terminee','2026-05-05 13:18:00','2026-05-05 13:18:00'),(175,62,30,25,2,'2026-04-28 18:42:00',59.73,8,'terminee','2026-04-28 18:42:00','2026-04-28 18:42:00'),(176,21,7,2,2,'2026-06-01 07:05:00',9993.00,73,'terminee','2026-06-01 07:05:00','2026-06-01 07:05:00'),(177,5,2,1,4,'2026-05-19 15:34:00',5347.00,26,'terminee','2026-05-19 15:34:00','2026-05-19 15:34:00'),(178,54,27,24,2,'2026-06-10 22:37:00',89.64,48,'terminee','2026-06-10 22:37:00','2026-06-10 22:37:00'),(179,42,14,5,2,'2026-03-19 13:16:00',14678.00,16,'terminee','2026-03-19 13:16:00','2026-03-19 13:16:00'),(180,18,5,2,4,'2026-05-03 18:30:00',1110.00,56,'annulee','2026-05-03 18:30:00','2026-05-03 18:30:00'),(181,28,12,3,2,'2026-06-11 10:49:00',5737.00,35,'terminee','2026-06-11 10:49:00','2026-06-11 10:49:00'),(182,69,32,25,1,'2026-03-26 20:00:00',19.71,34,'terminee','2026-03-26 20:00:00','2026-03-26 20:00:00'),(183,4,1,1,1,'2026-07-11 22:24:00',3293.00,33,'terminee','2026-07-11 22:24:00','2026-07-11 22:24:00'),(184,34,12,3,1,'2026-04-28 14:31:00',7950.00,45,'terminee','2026-04-28 14:31:00','2026-04-28 14:31:00'),(185,51,NULL,6,1,'2026-06-07 09:42:00',2147.00,61,'en_cours','2026-06-07 09:42:00','2026-06-07 09:42:00'),(186,64,32,25,1,'2026-04-03 12:35:00',14.00,20,'terminee','2026-04-03 12:35:00','2026-04-03 12:35:00'),(187,73,32,25,2,'2026-07-06 20:11:00',45.31,49,'terminee','2026-07-06 20:11:00','2026-07-06 20:11:00'),(188,13,4,2,1,'2026-06-14 13:40:00',6313.00,68,'terminee','2026-06-14 13:40:00','2026-06-14 13:40:00'),(189,72,28,25,1,'2026-06-22 16:25:00',37.16,8,'terminee','2026-06-22 16:25:00','2026-06-22 16:25:00'),(190,49,18,6,4,'2026-05-10 10:02:00',3808.00,38,'terminee','2026-05-10 10:02:00','2026-05-10 10:02:00'),(191,38,15,5,1,'2026-06-02 17:58:00',1925.00,11,'annulee','2026-06-02 17:58:00','2026-06-02 17:58:00'),(192,68,29,25,1,'2026-06-09 11:05:00',14.80,70,'terminee','2026-06-09 11:05:00','2026-06-09 11:05:00'),(193,37,NULL,5,1,'2026-04-22 06:35:00',7919.00,16,'en_cours','2026-04-22 06:35:00','2026-04-22 06:35:00'),(194,57,NULL,24,1,'2026-03-20 06:48:00',18.13,28,'en_cours','2026-03-20 06:48:00','2026-03-20 06:48:00'),(195,19,5,2,2,'2026-06-11 14:55:00',10085.00,31,'terminee','2026-06-11 14:55:00','2026-06-11 14:55:00'),(196,28,10,3,1,'2026-06-28 08:33:00',5837.00,33,'terminee','2026-06-28 08:33:00','2026-06-28 08:33:00'),(197,65,28,25,1,'2026-07-01 13:05:00',32.77,46,'annulee','2026-07-01 13:05:00','2026-07-01 13:05:00'),(198,60,26,24,4,'2026-05-28 23:14:00',32.95,71,'terminee','2026-05-28 23:14:00','2026-05-28 23:14:00'),(199,73,29,25,1,'2026-05-19 07:04:00',11.95,59,'terminee','2026-05-19 07:04:00','2026-05-19 07:04:00'),(200,24,NULL,2,2,'2026-04-13 21:16:00',3650.00,12,'en_cours','2026-04-13 21:16:00','2026-04-13 21:16:00'),(201,46,17,6,4,'2026-07-09 14:57:00',3865.00,36,'terminee','2026-07-09 14:57:00','2026-07-09 14:57:00'),(202,53,27,24,4,'2026-05-14 06:44:00',11.98,34,'terminee','2026-05-14 06:44:00','2026-05-14 06:44:00'),(203,38,NULL,5,2,'2026-06-22 12:40:00',5494.00,18,'en_cours','2026-06-22 12:40:00','2026-06-22 12:40:00'),(204,34,12,3,4,'2026-04-28 15:37:00',3076.00,70,'terminee','2026-04-28 15:37:00','2026-04-28 15:37:00'),(205,9,1,1,1,'2026-04-06 14:51:00',6592.00,20,'terminee','2026-04-06 14:51:00','2026-04-06 14:51:00'),(206,29,11,3,1,'2026-06-07 07:01:00',3602.00,47,'terminee','2026-06-07 07:01:00','2026-06-07 07:01:00'),(207,50,21,6,1,'2026-04-30 06:00:00',3499.00,67,'terminee','2026-04-30 06:00:00','2026-04-30 06:00:00'),(208,47,NULL,6,2,'2026-07-05 13:28:00',2786.00,12,'terminee','2026-07-05 13:28:00','2026-07-05 13:28:00'),(209,6,NULL,1,4,'2026-04-16 14:49:00',1879.00,61,'en_cours','2026-04-16 14:49:00','2026-04-16 14:49:00'),(210,54,26,24,4,'2026-07-11 22:43:00',16.01,22,'annulee','2026-07-11 22:43:00','2026-07-11 22:43:00'),(211,62,29,25,2,'2026-03-31 06:00:00',16.27,19,'annulee','2026-03-31 06:00:00','2026-03-31 06:00:00'),(212,31,9,3,1,'2026-06-08 18:28:00',4811.00,13,'terminee','2026-06-08 18:28:00','2026-06-08 18:28:00'),(213,41,15,5,1,'2026-04-03 18:39:00',2161.00,54,'terminee','2026-04-03 18:39:00','2026-04-03 18:39:00'),(214,61,NULL,24,2,'2026-03-23 18:55:00',19.76,72,'en_cours','2026-03-23 18:55:00','2026-03-23 18:55:00'),(215,60,23,24,1,'2026-06-14 17:32:00',35.22,43,'annulee','2026-06-14 17:32:00','2026-06-14 17:32:00'),(216,5,3,1,1,'2026-07-12 14:32:00',5464.00,19,'terminee','2026-07-12 14:32:00','2026-07-12 14:32:00'),(217,4,3,1,1,'2026-06-26 23:37:00',2118.00,67,'terminee','2026-06-26 23:37:00','2026-06-26 23:37:00'),(218,12,1,1,4,'2026-04-05 22:22:00',1787.00,29,'terminee','2026-04-05 22:22:00','2026-04-05 22:22:00'),(219,64,NULL,25,2,'2026-05-11 07:22:00',59.70,66,'terminee','2026-05-11 07:22:00','2026-05-11 07:22:00'),(220,68,28,25,1,'2026-04-17 11:11:00',9.67,69,'terminee','2026-04-17 11:11:00','2026-04-17 11:11:00'),(221,72,31,25,1,'2026-05-07 20:38:00',14.09,21,'terminee','2026-05-07 20:38:00','2026-05-07 20:38:00'),(222,24,8,2,1,'2026-06-29 11:11:00',6521.00,59,'terminee','2026-06-29 11:11:00','2026-06-29 11:11:00'),(223,60,NULL,24,4,'2026-05-16 07:43:00',7.38,42,'en_cours','2026-05-16 07:43:00','2026-05-16 07:43:00'),(224,59,NULL,24,2,'2026-06-11 17:06:00',53.70,55,'terminee','2026-06-11 17:06:00','2026-06-11 17:06:00'),(225,12,3,1,2,'2026-07-05 10:44:00',14943.00,32,'terminee','2026-07-05 10:44:00','2026-07-05 10:44:00'),(226,70,NULL,25,1,'2026-07-07 10:45:00',36.83,12,'terminee','2026-07-07 10:45:00','2026-07-07 10:45:00'),(227,11,1,1,2,'2026-07-09 13:17:00',4252.00,32,'terminee','2026-07-09 13:17:00','2026-07-09 13:17:00'),(228,16,NULL,2,1,'2026-07-04 23:24:00',6697.00,50,'en_cours','2026-07-04 23:24:00','2026-07-04 23:24:00'),(229,53,NULL,24,4,'2026-05-17 21:39:00',9.22,71,'annulee','2026-05-17 21:39:00','2026-05-17 21:39:00'),(230,66,28,25,2,'2026-04-15 20:35:00',17.09,8,'terminee','2026-04-15 20:35:00','2026-04-15 20:35:00'),(231,17,7,2,1,'2026-05-22 23:22:00',2093.00,62,'terminee','2026-05-22 23:22:00','2026-05-22 23:22:00'),(232,65,29,25,2,'2026-04-23 22:37:00',40.24,18,'terminee','2026-04-23 22:37:00','2026-04-23 22:37:00'),(233,21,NULL,2,1,'2026-04-04 22:52:00',6525.00,67,'en_cours','2026-04-04 22:52:00','2026-04-04 22:52:00'),(234,15,NULL,2,4,'2026-04-29 14:57:00',2604.00,27,'terminee','2026-04-29 14:57:00','2026-04-29 14:57:00'),(235,48,18,6,1,'2026-07-04 08:57:00',3658.00,18,'terminee','2026-07-04 08:57:00','2026-07-04 08:57:00'),(236,35,9,3,2,'2026-03-29 09:15:00',8904.00,13,'annulee','2026-03-29 09:15:00','2026-03-29 09:15:00'),(237,35,9,3,1,'2026-06-28 08:37:00',7287.00,24,'terminee','2026-06-28 08:37:00','2026-06-28 08:37:00'),(238,18,8,2,4,'2026-05-21 08:44:00',3088.00,66,'annulee','2026-05-21 08:44:00','2026-05-21 08:44:00'),(239,40,13,5,4,'2026-07-10 16:24:00',5751.00,70,'terminee','2026-07-10 16:24:00','2026-07-10 16:24:00'),(240,57,25,24,2,'2026-05-28 12:52:00',60.61,36,'annulee','2026-05-28 12:52:00','2026-05-28 12:52:00'),(241,68,NULL,25,4,'2026-05-24 22:02:00',25.79,39,'terminee','2026-05-24 22:02:00','2026-05-24 22:02:00'),(242,21,NULL,2,1,'2026-04-01 13:19:00',2778.00,55,'annulee','2026-04-01 13:19:00','2026-04-01 13:19:00'),(243,52,NULL,6,2,'2026-04-06 06:16:00',6283.00,47,'en_cours','2026-04-06 06:16:00','2026-04-06 06:16:00'),(244,5,3,1,1,'2026-05-16 07:21:00',6930.00,34,'terminee','2026-05-16 07:21:00','2026-05-16 07:21:00'),(245,39,15,5,4,'2026-05-17 11:13:00',5862.00,71,'terminee','2026-05-17 11:13:00','2026-05-17 11:13:00'),(246,51,22,6,4,'2026-05-25 06:36:00',1808.00,48,'terminee','2026-05-25 06:36:00','2026-05-25 06:36:00'),(247,13,5,2,1,'2026-04-25 18:25:00',7553.00,19,'terminee','2026-04-25 18:25:00','2026-04-25 18:25:00'),(248,1,3,1,4,'2026-06-06 14:21:00',5670.00,44,'terminee','2026-06-06 14:21:00','2026-06-06 14:21:00'),(249,45,19,6,2,'2026-03-31 07:46:00',7271.00,50,'terminee','2026-03-31 07:46:00','2026-03-31 07:46:00'),(250,65,29,25,1,'2026-05-27 23:40:00',29.44,13,'terminee','2026-05-27 23:40:00','2026-05-27 23:40:00'),(251,36,16,5,2,'2026-05-06 22:08:00',13016.00,37,'annulee','2026-05-06 22:08:00','2026-05-06 22:08:00'),(252,52,19,6,1,'2026-04-14 12:35:00',5017.00,46,'terminee','2026-04-14 12:35:00','2026-04-14 12:35:00'),(253,31,11,3,4,'2026-04-15 12:13:00',3251.00,62,'terminee','2026-04-15 12:13:00','2026-04-15 12:13:00'),(254,16,6,2,2,'2026-07-04 23:18:00',7981.00,41,'annulee','2026-07-04 23:18:00','2026-07-04 23:18:00'),(255,58,24,24,4,'2026-06-11 23:14:00',16.45,24,'terminee','2026-06-11 23:14:00','2026-06-11 23:14:00'),(256,34,NULL,3,2,'2026-04-15 12:05:00',5360.00,66,'en_cours','2026-04-15 12:05:00','2026-04-15 12:05:00'),(257,1,2,1,1,'2026-06-10 06:59:00',3592.00,8,'terminee','2026-06-10 06:59:00','2026-06-10 06:59:00'),(258,11,NULL,1,4,'2026-05-24 12:12:00',1784.00,20,'en_cours','2026-05-24 12:12:00','2026-05-24 12:12:00'),(259,52,20,6,2,'2026-05-08 17:19:00',4283.00,33,'terminee','2026-05-08 17:19:00','2026-05-08 17:19:00'),(260,26,NULL,3,4,'2026-04-02 09:04:00',2971.00,61,'annulee','2026-04-02 09:04:00','2026-04-02 09:04:00'),(261,39,14,5,1,'2026-05-03 22:44:00',3017.00,8,'terminee','2026-05-03 22:44:00','2026-05-03 22:44:00'),(262,15,8,2,1,'2026-06-13 22:44:00',5925.00,60,'terminee','2026-06-13 22:44:00','2026-06-13 22:44:00'),(263,42,13,5,4,'2026-05-12 14:19:00',4320.00,70,'terminee','2026-05-12 14:19:00','2026-05-12 14:19:00'),(264,68,28,25,1,'2026-06-09 19:41:00',10.89,33,'terminee','2026-06-09 19:41:00','2026-06-09 19:41:00'),(265,8,2,1,1,'2026-06-29 08:57:00',3985.00,42,'terminee','2026-06-29 08:57:00','2026-06-29 08:57:00'),(266,12,2,1,4,'2026-06-22 06:08:00',1858.00,72,'terminee','2026-06-22 06:08:00','2026-06-22 06:08:00'),(267,68,NULL,25,1,'2026-05-15 11:04:00',10.28,26,'terminee','2026-05-15 11:04:00','2026-05-15 11:04:00'),(268,3,2,1,1,'2026-05-05 13:42:00',6000.00,62,'terminee','2026-05-05 13:42:00','2026-05-05 13:42:00'),(269,7,3,1,4,'2026-03-27 14:51:00',1135.00,11,'terminee','2026-03-27 14:51:00','2026-03-27 14:51:00'),(270,50,21,6,2,'2026-06-03 16:16:00',6032.00,17,'annulee','2026-06-03 16:16:00','2026-06-03 16:16:00'),(271,4,NULL,1,4,'2026-04-13 18:42:00',4769.00,23,'terminee','2026-04-13 18:42:00','2026-04-13 18:42:00'),(272,54,25,24,1,'2026-05-06 23:34:00',39.12,23,'terminee','2026-05-06 23:34:00','2026-05-06 23:34:00'),(273,37,15,5,4,'2026-05-24 12:53:00',3845.00,52,'terminee','2026-05-24 12:53:00','2026-05-24 12:53:00'),(274,60,27,24,2,'2026-06-22 07:03:00',74.80,54,'terminee','2026-06-22 07:03:00','2026-06-22 07:03:00'),(275,56,24,24,2,'2026-06-29 21:42:00',61.07,31,'terminee','2026-06-29 21:42:00','2026-06-29 21:42:00'),(276,58,23,24,1,'2026-06-22 10:04:00',39.52,26,'terminee','2026-06-22 10:04:00','2026-06-22 10:04:00'),(277,37,NULL,5,2,'2026-06-08 12:28:00',8920.00,30,'terminee','2026-06-08 12:28:00','2026-06-08 12:28:00'),(278,39,NULL,5,2,'2026-05-27 14:55:00',4528.00,56,'annulee','2026-05-27 14:55:00','2026-05-27 14:55:00'),(279,47,20,6,1,'2026-05-12 06:50:00',2002.00,74,'annulee','2026-05-12 06:50:00','2026-05-12 06:50:00'),(280,37,NULL,5,2,'2026-05-03 17:39:00',13487.00,69,'en_cours','2026-05-03 17:39:00','2026-05-03 17:39:00'),(281,73,30,25,2,'2026-05-20 16:26:00',57.92,71,'terminee','2026-05-20 16:26:00','2026-05-20 16:26:00'),(282,46,17,6,4,'2026-06-09 06:16:00',2755.00,10,'terminee','2026-06-09 06:16:00','2026-06-09 06:16:00'),(283,25,9,3,4,'2026-04-02 19:57:00',1347.00,66,'terminee','2026-04-02 19:57:00','2026-04-02 19:57:00'),(284,17,6,2,1,'2026-04-13 21:30:00',5033.00,54,'annulee','2026-04-13 21:30:00','2026-04-13 21:30:00'),(285,44,18,6,4,'2026-07-07 22:16:00',1030.00,55,'terminee','2026-07-07 22:16:00','2026-07-07 22:16:00'),(286,37,14,5,1,'2026-05-11 14:06:00',1896.00,9,'annulee','2026-05-11 14:06:00','2026-05-11 14:06:00'),(287,49,22,6,4,'2026-07-11 14:50:00',1435.00,49,'terminee','2026-07-11 14:50:00','2026-07-11 14:50:00'),(288,33,9,3,1,'2026-04-21 07:07:00',6891.00,25,'terminee','2026-04-21 07:07:00','2026-04-21 07:07:00'),(289,37,13,5,1,'2026-03-31 19:11:00',3107.00,44,'terminee','2026-03-31 19:11:00','2026-03-31 19:11:00'),(290,46,18,6,1,'2026-04-05 22:51:00',4163.00,30,'terminee','2026-04-05 22:51:00','2026-04-05 22:51:00'),(291,41,NULL,5,1,'2026-04-15 16:20:00',3633.00,75,'terminee','2026-04-15 16:20:00','2026-04-15 16:20:00'),(292,40,15,5,4,'2026-03-23 08:41:00',5530.00,50,'terminee','2026-03-23 08:41:00','2026-03-23 08:41:00'),(293,18,NULL,2,2,'2026-06-03 20:55:00',3298.00,35,'terminee','2026-06-03 20:55:00','2026-06-03 20:55:00'),(294,50,NULL,6,2,'2026-07-03 16:04:00',10995.00,43,'en_cours','2026-07-03 16:04:00','2026-07-03 16:04:00'),(295,5,NULL,1,4,'2026-06-04 13:50:00',3127.00,72,'en_cours','2026-06-04 13:50:00','2026-06-04 13:50:00'),(296,38,14,5,1,'2026-05-11 11:09:00',7571.00,23,'terminee','2026-05-11 11:09:00','2026-05-11 11:09:00'),(297,18,5,2,4,'2026-05-18 08:47:00',1575.00,47,'annulee','2026-05-18 08:47:00','2026-05-18 08:47:00'),(298,3,1,1,1,'2026-04-17 07:44:00',1588.00,20,'annulee','2026-04-17 07:44:00','2026-04-17 07:44:00'),(299,50,21,6,1,'2026-07-09 11:59:00',5106.00,24,'terminee','2026-07-09 11:59:00','2026-07-09 11:59:00'),(300,10,3,1,1,'2026-04-21 08:25:00',1601.00,24,'terminee','2026-04-21 08:25:00','2026-04-21 08:25:00'),(301,14,5,2,2,'2026-06-26 20:23:00',7930.00,38,'terminee','2026-06-26 20:23:00','2026-06-26 20:23:00'),(302,30,NULL,3,4,'2026-06-12 12:28:00',5010.00,37,'en_cours','2026-06-12 12:28:00','2026-06-12 12:28:00'),(303,52,19,6,4,'2026-07-11 17:53:00',2819.00,42,'terminee','2026-07-11 17:53:00','2026-07-11 17:53:00'),(304,38,NULL,5,4,'2026-06-18 12:56:00',1916.00,30,'terminee','2026-06-18 12:56:00','2026-06-18 12:56:00'),(305,64,28,25,1,'2026-06-10 10:27:00',25.97,34,'terminee','2026-06-10 10:27:00','2026-06-10 10:27:00'),(306,23,NULL,2,1,'2026-05-08 15:33:00',3481.00,21,'en_cours','2026-05-08 15:33:00','2026-05-08 15:33:00'),(307,6,2,1,1,'2026-05-18 22:12:00',5430.00,20,'terminee','2026-05-18 22:12:00','2026-05-18 22:12:00'),(308,17,7,2,4,'2026-05-18 06:05:00',4346.00,49,'terminee','2026-05-18 06:05:00','2026-05-18 06:05:00'),(309,60,24,24,4,'2026-06-17 07:50:00',29.03,8,'terminee','2026-06-17 07:50:00','2026-06-17 07:50:00'),(310,37,NULL,5,4,'2026-06-19 20:23:00',3545.00,38,'terminee','2026-06-19 20:23:00','2026-06-19 20:23:00'),(311,46,18,6,2,'2026-06-30 14:20:00',4123.00,45,'terminee','2026-06-30 14:20:00','2026-06-30 14:20:00'),(312,32,9,3,2,'2026-04-28 14:10:00',3429.00,23,'terminee','2026-04-28 14:10:00','2026-04-28 14:10:00'),(313,73,29,25,1,'2026-05-11 17:14:00',18.32,20,'terminee','2026-05-11 17:14:00','2026-05-11 17:14:00'),(314,67,31,25,2,'2026-04-03 21:49:00',69.80,59,'terminee','2026-04-03 21:49:00','2026-04-03 21:49:00'),(315,7,2,1,2,'2026-04-26 13:18:00',10254.00,13,'terminee','2026-04-26 13:18:00','2026-04-26 13:18:00'),(316,57,NULL,24,4,'2026-07-03 19:40:00',17.98,10,'en_cours','2026-07-03 19:40:00','2026-07-03 19:40:00'),(317,71,31,25,2,'2026-04-28 19:16:00',65.45,57,'terminee','2026-04-28 19:16:00','2026-04-28 19:16:00'),(318,67,30,25,4,'2026-07-11 13:51:00',18.26,71,'terminee','2026-07-11 13:51:00','2026-07-11 13:51:00'),(319,37,13,5,4,'2026-05-27 18:42:00',5141.00,53,'terminee','2026-05-27 18:42:00','2026-05-27 18:42:00'),(320,46,NULL,6,1,'2026-07-09 10:39:00',7438.00,33,'en_cours','2026-07-09 10:39:00','2026-07-09 10:39:00'),(321,5,1,1,1,'2026-03-30 13:31:00',7404.00,42,'terminee','2026-03-30 13:31:00','2026-03-30 13:31:00'),(322,23,NULL,2,1,'2026-04-18 22:03:00',5174.00,47,'terminee','2026-04-18 22:03:00','2026-04-18 22:03:00'),(323,4,3,1,2,'2026-05-12 13:31:00',4496.00,53,'terminee','2026-05-12 13:31:00','2026-05-12 13:31:00'),(324,30,NULL,3,2,'2026-04-18 23:00:00',6792.00,21,'en_cours','2026-04-18 23:00:00','2026-04-18 23:00:00'),(325,25,9,3,1,'2026-04-25 08:28:00',3185.00,21,'terminee','2026-04-25 08:28:00','2026-04-25 08:28:00'),(326,48,22,6,2,'2026-05-09 17:11:00',4056.00,55,'terminee','2026-05-09 17:11:00','2026-05-09 17:11:00'),(327,49,17,6,1,'2026-04-16 22:34:00',2095.00,59,'terminee','2026-04-16 22:34:00','2026-04-16 22:34:00'),(328,54,24,24,1,'2026-06-01 14:07:00',8.81,51,'terminee','2026-06-01 14:07:00','2026-06-01 14:07:00'),(329,68,NULL,25,1,'2026-06-05 07:02:00',22.58,21,'terminee','2026-06-05 07:02:00','2026-06-05 07:02:00'),(330,55,26,24,4,'2026-03-24 19:15:00',12.76,49,'terminee','2026-03-24 19:15:00','2026-03-24 19:15:00'),(331,68,32,25,4,'2026-06-01 10:33:00',18.19,23,'terminee','2026-06-01 10:33:00','2026-06-01 10:33:00'),(332,50,NULL,6,1,'2026-04-08 15:20:00',5287.00,34,'terminee','2026-04-08 15:20:00','2026-04-08 15:20:00'),(333,2,NULL,1,4,'2026-04-05 17:29:00',1611.00,65,'terminee','2026-04-05 17:29:00','2026-04-05 17:29:00'),(334,21,4,2,4,'2026-05-30 22:00:00',3555.00,30,'terminee','2026-05-30 22:00:00','2026-05-30 22:00:00'),(335,47,22,6,2,'2026-04-06 12:45:00',14643.00,57,'terminee','2026-04-06 12:45:00','2026-04-06 12:45:00'),(336,26,11,3,1,'2026-05-14 07:30:00',4695.00,19,'terminee','2026-05-14 07:30:00','2026-05-14 07:30:00'),(337,59,26,24,4,'2026-03-29 14:26:00',23.87,35,'terminee','2026-03-29 14:26:00','2026-03-29 14:26:00'),(338,16,4,2,2,'2026-03-23 18:08:00',6745.00,14,'terminee','2026-03-23 18:08:00','2026-03-23 18:08:00'),(339,9,3,1,1,'2026-04-14 22:10:00',4228.00,63,'terminee','2026-04-14 22:10:00','2026-04-14 22:10:00'),(340,53,NULL,24,4,'2026-07-09 19:04:00',17.62,62,'en_cours','2026-07-09 19:04:00','2026-07-09 19:04:00'),(341,32,12,3,1,'2026-06-29 14:52:00',4968.00,69,'terminee','2026-06-29 14:52:00','2026-06-29 14:52:00'),(342,41,14,5,4,'2026-06-06 14:53:00',1197.00,56,'terminee','2026-06-06 14:53:00','2026-06-06 14:53:00'),(343,1,NULL,1,1,'2026-06-18 07:26:00',2917.00,62,'en_cours','2026-06-18 07:26:00','2026-06-18 07:26:00'),(344,72,29,25,2,'2026-05-31 07:09:00',77.68,17,'terminee','2026-05-31 07:09:00','2026-05-31 07:09:00'),(345,36,13,5,1,'2026-05-31 20:11:00',7015.00,22,'terminee','2026-05-31 20:11:00','2026-05-31 20:11:00'),(346,68,30,25,2,'2026-05-01 14:47:00',78.04,51,'terminee','2026-05-01 14:47:00','2026-05-01 14:47:00'),(347,67,29,25,4,'2026-04-16 17:03:00',25.74,10,'terminee','2026-04-16 17:03:00','2026-04-16 17:03:00'),(348,59,26,24,4,'2026-04-27 14:19:00',28.04,19,'annulee','2026-04-27 14:19:00','2026-04-27 14:19:00'),(349,15,7,2,2,'2026-05-19 16:12:00',13573.00,67,'terminee','2026-05-19 16:12:00','2026-05-19 16:12:00'),(350,59,NULL,24,1,'2026-06-01 13:19:00',8.10,39,'terminee','2026-06-01 13:19:00','2026-06-01 13:19:00'),(351,32,11,3,2,'2026-05-30 18:12:00',4006.00,63,'terminee','2026-05-30 18:12:00','2026-05-30 18:12:00'),(352,1,2,1,2,'2026-07-07 08:21:00',10040.00,8,'terminee','2026-07-07 08:21:00','2026-07-07 08:21:00'),(353,37,14,5,2,'2026-04-10 08:06:00',6468.00,14,'terminee','2026-04-10 08:06:00','2026-04-10 08:06:00'),(354,20,7,2,1,'2026-05-29 16:56:00',2377.00,26,'terminee','2026-05-29 16:56:00','2026-05-29 16:56:00'),(355,32,12,3,4,'2026-04-22 12:00:00',5053.00,70,'terminee','2026-04-22 12:00:00','2026-04-22 12:00:00'),(356,13,5,2,2,'2026-03-27 13:55:00',7666.00,31,'terminee','2026-03-27 13:55:00','2026-03-27 13:55:00'),(357,31,9,3,4,'2026-05-08 17:00:00',4049.00,67,'terminee','2026-05-08 17:00:00','2026-05-08 17:00:00'),(358,19,4,2,4,'2026-05-09 12:20:00',4489.00,61,'terminee','2026-05-09 12:20:00','2026-05-09 12:20:00'),(359,70,NULL,25,4,'2026-05-26 10:25:00',13.91,60,'en_cours','2026-05-26 10:25:00','2026-05-26 10:25:00'),(360,62,28,25,2,'2026-05-25 09:05:00',72.12,30,'terminee','2026-05-25 09:05:00','2026-05-25 09:05:00'),(361,55,23,24,1,'2026-04-25 19:18:00',24.64,47,'terminee','2026-04-25 19:18:00','2026-04-25 19:18:00'),(362,49,22,6,2,'2026-06-23 16:00:00',3904.00,74,'terminee','2026-06-23 16:00:00','2026-06-23 16:00:00'),(363,43,13,5,1,'2026-04-06 07:21:00',5319.00,8,'annulee','2026-04-06 07:21:00','2026-04-06 07:21:00'),(364,22,NULL,2,2,'2026-03-30 14:04:00',4366.00,25,'en_cours','2026-03-30 14:04:00','2026-03-30 14:04:00'),(365,34,10,3,1,'2026-04-16 18:33:00',1932.00,53,'terminee','2026-04-16 18:33:00','2026-04-16 18:33:00'),(366,51,22,6,4,'2026-05-19 17:34:00',4271.00,59,'terminee','2026-05-19 17:34:00','2026-05-19 17:34:00'),(367,16,5,2,1,'2026-04-20 22:29:00',4603.00,12,'terminee','2026-04-20 22:29:00','2026-04-20 22:29:00'),(368,58,23,24,1,'2026-04-18 10:08:00',36.17,51,'terminee','2026-04-18 10:08:00','2026-04-18 10:08:00'),(369,15,5,2,4,'2026-06-19 10:38:00',5841.00,8,'terminee','2026-06-19 10:38:00','2026-06-19 10:38:00'),(370,11,1,1,4,'2026-06-15 09:28:00',4475.00,8,'terminee','2026-06-15 09:28:00','2026-06-15 09:28:00'),(371,43,15,5,2,'2026-05-04 08:52:00',13304.00,20,'terminee','2026-05-04 08:52:00','2026-05-04 08:52:00'),(372,29,10,3,2,'2026-05-07 15:56:00',9569.00,48,'terminee','2026-05-07 15:56:00','2026-05-07 15:56:00'),(373,13,6,2,2,'2026-04-25 20:17:00',14339.00,44,'terminee','2026-04-25 20:17:00','2026-04-25 20:17:00'),(374,14,7,2,2,'2026-04-27 18:43:00',9027.00,36,'terminee','2026-04-27 18:43:00','2026-04-27 18:43:00'),(375,26,11,3,4,'2026-05-09 13:00:00',4977.00,74,'terminee','2026-05-09 13:00:00','2026-05-09 13:00:00'),(376,70,31,25,4,'2026-06-26 17:19:00',19.41,15,'terminee','2026-06-26 17:19:00','2026-06-26 17:19:00'),(377,56,24,24,4,'2026-06-17 21:12:00',20.56,23,'terminee','2026-06-17 21:12:00','2026-06-17 21:12:00'),(378,65,30,25,4,'2026-05-18 12:37:00',9.40,20,'terminee','2026-05-18 12:37:00','2026-05-18 12:37:00'),(379,4,2,1,1,'2026-05-20 16:55:00',2962.00,74,'annulee','2026-05-20 16:55:00','2026-05-20 16:55:00'),(380,5,3,1,1,'2026-03-28 20:08:00',4594.00,63,'terminee','2026-03-28 20:08:00','2026-03-28 20:08:00'),(381,43,13,5,1,'2026-07-14 10:20:00',5112.00,10,'annulee','2026-07-14 10:20:00','2026-07-14 10:20:00'),(382,37,13,5,2,'2026-06-15 10:55:00',2489.00,15,'terminee','2026-06-15 10:55:00','2026-06-15 10:55:00'),(383,3,1,1,2,'2026-04-14 10:42:00',14663.00,20,'terminee','2026-04-14 10:42:00','2026-04-14 10:42:00'),(384,55,25,24,2,'2026-04-14 18:27:00',15.90,27,'terminee','2026-04-14 18:27:00','2026-04-14 18:27:00'),(385,40,NULL,5,1,'2026-03-27 08:38:00',7053.00,35,'terminee','2026-03-27 08:38:00','2026-03-27 08:38:00'),(386,70,NULL,25,4,'2026-05-05 09:03:00',27.76,59,'annulee','2026-05-05 09:03:00','2026-05-05 09:03:00'),(387,59,26,24,1,'2026-04-05 14:48:00',40.73,75,'terminee','2026-04-05 14:48:00','2026-04-05 14:48:00'),(388,71,29,25,2,'2026-05-22 18:32:00',51.77,33,'terminee','2026-05-22 18:32:00','2026-05-22 18:32:00'),(389,65,30,25,1,'2026-05-06 13:50:00',10.46,12,'terminee','2026-05-06 13:50:00','2026-05-06 13:50:00'),(390,40,14,5,2,'2026-04-03 21:44:00',8446.00,47,'terminee','2026-04-03 21:44:00','2026-04-03 21:44:00'),(391,36,NULL,5,2,'2026-03-23 17:35:00',8521.00,50,'terminee','2026-03-23 17:35:00','2026-03-23 17:35:00'),(392,44,22,6,1,'2026-07-14 20:07:00',4445.00,40,'terminee','2026-07-14 20:07:00','2026-07-14 20:07:00'),(393,69,28,25,1,'2026-05-16 15:43:00',28.37,12,'terminee','2026-05-16 15:43:00','2026-05-16 15:43:00'),(394,27,10,3,4,'2026-04-27 12:51:00',3847.00,54,'terminee','2026-04-27 12:51:00','2026-04-27 12:51:00'),(395,19,6,2,4,'2026-05-19 15:35:00',5088.00,58,'terminee','2026-05-19 15:35:00','2026-05-19 15:35:00'),(396,41,NULL,5,1,'2026-05-15 08:00:00',2367.00,74,'terminee','2026-05-15 08:00:00','2026-05-15 08:00:00'),(397,5,2,1,1,'2026-05-14 06:21:00',1514.00,59,'terminee','2026-05-14 06:21:00','2026-05-14 06:21:00'),(398,7,1,1,1,'2026-03-22 21:46:00',2588.00,65,'terminee','2026-03-22 21:46:00','2026-03-22 21:46:00'),(399,38,15,5,4,'2026-07-06 19:10:00',3598.00,29,'terminee','2026-07-06 19:10:00','2026-07-06 19:10:00'),(400,51,18,6,2,'2026-05-17 22:32:00',13673.00,47,'terminee','2026-05-17 22:32:00','2026-05-17 22:32:00'),(401,17,NULL,2,4,'2026-07-11 17:34:00',4659.00,11,'terminee','2026-07-11 17:34:00','2026-07-11 17:34:00'),(402,26,11,3,2,'2026-06-24 20:41:00',13405.00,68,'terminee','2026-06-24 20:41:00','2026-06-24 20:41:00'),(403,4,NULL,1,2,'2026-06-18 16:06:00',9738.00,11,'terminee','2026-06-18 16:06:00','2026-06-18 16:06:00'),(404,64,NULL,25,2,'2026-06-13 10:27:00',23.47,8,'en_cours','2026-06-13 10:27:00','2026-06-13 10:27:00'),(405,40,16,5,2,'2026-06-03 18:32:00',8693.00,8,'terminee','2026-06-03 18:32:00','2026-06-03 18:32:00'),(406,24,NULL,2,4,'2026-06-22 12:08:00',1597.00,61,'terminee','2026-06-22 12:08:00','2026-06-22 12:08:00'),(407,47,19,6,4,'2026-07-02 14:34:00',2111.00,44,'terminee','2026-07-02 14:34:00','2026-07-02 14:34:00'),(408,56,NULL,24,4,'2026-05-28 10:57:00',12.02,49,'terminee','2026-05-28 10:57:00','2026-05-28 10:57:00'),(409,71,31,25,2,'2026-06-08 13:10:00',59.33,11,'terminee','2026-06-08 13:10:00','2026-06-08 13:10:00'),(410,51,NULL,6,1,'2026-04-29 15:52:00',6903.00,48,'terminee','2026-04-29 15:52:00','2026-04-29 15:52:00'),(411,47,19,6,1,'2026-03-21 12:59:00',6719.00,33,'annulee','2026-03-21 12:59:00','2026-03-21 12:59:00'),(412,37,15,5,1,'2026-04-28 06:53:00',7192.00,44,'terminee','2026-04-28 06:53:00','2026-04-28 06:53:00'),(413,39,16,5,1,'2026-07-01 16:52:00',5502.00,28,'annulee','2026-07-01 16:52:00','2026-07-01 16:52:00'),(414,30,NULL,3,2,'2026-05-23 19:02:00',11958.00,36,'en_cours','2026-05-23 19:02:00','2026-05-23 19:02:00'),(415,70,32,25,4,'2026-06-09 22:34:00',15.63,47,'terminee','2026-06-09 22:34:00','2026-06-09 22:34:00'),(416,7,2,1,1,'2026-05-14 14:09:00',4910.00,26,'terminee','2026-05-14 14:09:00','2026-05-14 14:09:00'),(417,61,27,24,1,'2026-04-25 11:17:00',14.66,29,'annulee','2026-04-25 11:17:00','2026-04-25 11:17:00'),(418,64,NULL,25,2,'2026-07-07 23:05:00',40.08,75,'terminee','2026-07-07 23:05:00','2026-07-07 23:05:00'),(419,9,2,1,2,'2026-05-28 08:19:00',8568.00,36,'terminee','2026-05-28 08:19:00','2026-05-28 08:19:00'),(420,16,4,2,2,'2026-04-30 13:20:00',2884.00,19,'terminee','2026-04-30 13:20:00','2026-04-30 13:20:00'),(421,15,7,2,4,'2026-07-04 12:22:00',4766.00,47,'terminee','2026-07-04 12:22:00','2026-07-04 12:22:00'),(422,69,31,25,1,'2026-05-20 15:03:00',39.53,38,'terminee','2026-05-20 15:03:00','2026-05-20 15:03:00'),(423,28,9,3,1,'2026-04-16 07:23:00',2107.00,12,'annulee','2026-04-16 07:23:00','2026-04-16 07:23:00'),(424,11,3,1,2,'2026-04-02 06:14:00',7285.00,27,'annulee','2026-04-02 06:14:00','2026-04-02 06:14:00'),(425,43,16,5,2,'2026-05-28 21:39:00',5006.00,14,'terminee','2026-05-28 21:39:00','2026-05-28 21:39:00'),(426,69,30,25,4,'2026-04-28 09:38:00',11.36,9,'terminee','2026-04-28 09:38:00','2026-04-28 09:38:00'),(427,4,1,1,1,'2026-06-10 20:02:00',2777.00,64,'annulee','2026-06-10 20:02:00','2026-06-10 20:02:00'),(428,40,16,5,1,'2026-04-19 13:04:00',3612.00,47,'terminee','2026-04-19 13:04:00','2026-04-19 13:04:00'),(429,68,NULL,25,1,'2026-06-15 22:30:00',38.53,23,'en_cours','2026-06-15 22:30:00','2026-06-15 22:30:00'),(430,8,NULL,1,1,'2026-06-04 17:34:00',3958.00,10,'terminee','2026-06-04 17:34:00','2026-06-04 17:34:00'),(431,42,NULL,5,2,'2026-03-27 12:16:00',8384.00,64,'en_cours','2026-03-27 12:16:00','2026-03-27 12:16:00'),(432,46,NULL,6,2,'2026-05-04 18:00:00',12960.00,67,'terminee','2026-05-04 18:00:00','2026-05-04 18:00:00'),(433,31,NULL,3,2,'2026-03-22 12:18:00',2309.00,53,'en_cours','2026-03-22 12:18:00','2026-03-22 12:18:00'),(434,63,NULL,25,2,'2026-06-24 09:12:00',62.83,32,'terminee','2026-06-24 09:12:00','2026-06-24 09:12:00'),(435,43,14,5,4,'2026-05-26 06:00:00',4071.00,37,'terminee','2026-05-26 06:00:00','2026-05-26 06:00:00'),(436,32,NULL,3,2,'2026-06-20 10:24:00',12183.00,10,'en_cours','2026-06-20 10:24:00','2026-06-20 10:24:00'),(437,6,1,1,1,'2026-05-21 22:02:00',7768.00,64,'terminee','2026-05-21 22:02:00','2026-05-21 22:02:00'),(438,47,20,6,1,'2026-04-13 23:02:00',2038.00,40,'terminee','2026-04-13 23:02:00','2026-04-13 23:02:00'),(439,58,NULL,24,2,'2026-06-21 15:11:00',71.23,60,'terminee','2026-06-21 15:11:00','2026-06-21 15:11:00'),(440,36,14,5,1,'2026-04-15 13:37:00',7160.00,64,'terminee','2026-04-15 13:37:00','2026-04-15 13:37:00'),(441,2,1,1,4,'2026-04-04 20:54:00',3562.00,60,'terminee','2026-04-04 20:54:00','2026-04-04 20:54:00'),(442,50,18,6,4,'2026-04-13 09:07:00',5458.00,72,'terminee','2026-04-13 09:07:00','2026-04-13 09:07:00'),(443,9,3,1,4,'2026-06-20 18:54:00',2068.00,52,'terminee','2026-06-20 18:54:00','2026-06-20 18:54:00'),(444,25,11,3,2,'2026-06-19 20:37:00',3033.00,57,'annulee','2026-06-19 20:37:00','2026-06-19 20:37:00'),(445,22,NULL,2,2,'2026-06-04 19:51:00',4872.00,36,'terminee','2026-06-04 19:51:00','2026-06-04 19:51:00'),(446,21,7,2,2,'2026-04-23 11:42:00',12188.00,48,'terminee','2026-04-23 11:42:00','2026-04-23 11:42:00'),(447,36,16,5,2,'2026-06-18 21:33:00',8809.00,75,'terminee','2026-06-18 21:33:00','2026-06-18 21:33:00'),(448,12,1,1,2,'2026-05-21 12:35:00',4033.00,40,'terminee','2026-05-21 12:35:00','2026-05-21 12:35:00'),(449,46,21,6,1,'2026-06-28 22:38:00',4849.00,23,'terminee','2026-06-28 22:38:00','2026-06-28 22:38:00'),(450,38,15,5,4,'2026-07-14 17:30:00',5936.00,65,'terminee','2026-07-14 17:30:00','2026-07-14 17:30:00'),(451,7,1,1,2,'2026-03-26 15:58:00',13215.00,75,'terminee','2026-03-26 15:58:00','2026-03-26 15:58:00'),(452,69,31,25,1,'2026-06-01 21:06:00',14.74,43,'terminee','2026-06-01 21:06:00','2026-06-01 21:06:00'),(453,44,NULL,6,4,'2026-04-22 07:39:00',3141.00,33,'terminee','2026-04-22 07:39:00','2026-04-22 07:39:00'),(454,56,26,24,2,'2026-05-06 20:54:00',26.99,12,'terminee','2026-05-06 20:54:00','2026-05-06 20:54:00'),(455,22,5,2,2,'2026-03-23 17:54:00',9374.00,50,'terminee','2026-03-23 17:54:00','2026-03-23 17:54:00'),(456,69,32,25,4,'2026-06-04 15:41:00',33.47,59,'annulee','2026-06-04 15:41:00','2026-06-04 15:41:00'),(457,26,9,3,1,'2026-07-09 16:49:00',5120.00,33,'terminee','2026-07-09 16:49:00','2026-07-09 16:49:00'),(458,50,NULL,6,4,'2026-06-05 13:43:00',3677.00,75,'en_cours','2026-06-05 13:43:00','2026-06-05 13:43:00'),(459,25,10,3,4,'2026-04-30 06:47:00',2694.00,27,'terminee','2026-04-30 06:47:00','2026-04-30 06:47:00'),(460,52,NULL,6,4,'2026-07-10 07:59:00',2905.00,24,'terminee','2026-07-10 07:59:00','2026-07-10 07:59:00'),(461,35,NULL,3,4,'2026-05-14 22:33:00',5162.00,63,'en_cours','2026-05-14 22:33:00','2026-05-14 22:33:00'),(462,42,13,5,2,'2026-06-30 10:10:00',8898.00,23,'terminee','2026-06-30 10:10:00','2026-06-30 10:10:00'),(463,13,NULL,2,1,'2026-05-26 20:35:00',5211.00,12,'en_cours','2026-05-26 20:35:00','2026-05-26 20:35:00'),(464,29,11,3,4,'2026-05-20 07:50:00',5061.00,38,'terminee','2026-05-20 07:50:00','2026-05-20 07:50:00'),(465,36,13,5,2,'2026-07-03 09:28:00',9032.00,64,'terminee','2026-07-03 09:28:00','2026-07-03 09:28:00'),(466,8,2,1,2,'2026-04-02 12:39:00',2388.00,25,'terminee','2026-04-02 12:39:00','2026-04-02 12:39:00'),(467,16,4,2,4,'2026-06-20 09:44:00',5175.00,73,'annulee','2026-06-20 09:44:00','2026-06-20 09:44:00'),(468,20,4,2,2,'2026-04-20 20:50:00',9692.00,38,'terminee','2026-04-20 20:50:00','2026-04-20 20:50:00'),(469,11,2,1,1,'2026-06-12 20:20:00',7335.00,21,'annulee','2026-06-12 20:20:00','2026-06-12 20:20:00'),(470,41,16,5,1,'2026-03-29 12:24:00',7343.00,29,'terminee','2026-03-29 12:24:00','2026-03-29 12:24:00'),(471,41,NULL,5,4,'2026-05-08 15:53:00',5361.00,15,'en_cours','2026-05-08 15:53:00','2026-05-08 15:53:00'),(472,8,3,1,2,'2026-06-28 14:46:00',14319.00,66,'annulee','2026-06-28 14:46:00','2026-06-28 14:46:00'),(473,5,1,1,2,'2026-05-18 11:25:00',13437.00,49,'terminee','2026-05-18 11:25:00','2026-05-18 11:25:00'),(474,72,NULL,25,4,'2026-06-05 17:24:00',9.33,11,'en_cours','2026-06-05 17:24:00','2026-06-05 17:24:00'),(475,30,9,3,1,'2026-04-28 19:16:00',6795.00,27,'terminee','2026-04-28 19:16:00','2026-04-28 19:16:00'),(476,64,29,25,2,'2026-06-03 22:41:00',34.90,71,'terminee','2026-06-03 22:41:00','2026-06-03 22:41:00'),(477,12,2,1,4,'2026-05-07 08:04:00',5876.00,52,'annulee','2026-05-07 08:04:00','2026-05-07 08:04:00'),(478,49,21,6,4,'2026-03-27 15:35:00',5782.00,14,'terminee','2026-03-27 15:35:00','2026-03-27 15:35:00'),(479,43,14,5,2,'2026-06-23 10:00:00',9286.00,16,'terminee','2026-06-23 10:00:00','2026-06-23 10:00:00'),(480,39,13,5,4,'2026-06-08 22:53:00',2437.00,55,'terminee','2026-06-08 22:53:00','2026-06-08 22:53:00'),(481,63,31,25,4,'2026-06-01 14:19:00',23.68,11,'terminee','2026-06-01 14:19:00','2026-06-01 14:19:00'),(482,42,NULL,5,2,'2026-04-09 15:58:00',5866.00,30,'terminee','2026-04-09 15:58:00','2026-04-09 15:58:00'),(483,6,2,1,4,'2026-04-21 16:27:00',4658.00,25,'terminee','2026-04-21 16:27:00','2026-04-21 16:27:00'),(484,41,13,5,4,'2026-04-01 08:09:00',3536.00,71,'terminee','2026-04-01 08:09:00','2026-04-01 08:09:00'),(485,34,11,3,1,'2026-03-27 06:34:00',7501.00,59,'annulee','2026-03-27 06:34:00','2026-03-27 06:34:00'),(486,25,NULL,3,2,'2026-04-24 13:58:00',8709.00,33,'en_cours','2026-04-24 13:58:00','2026-04-24 13:58:00'),(487,7,3,1,4,'2026-06-20 10:01:00',2790.00,8,'terminee','2026-06-20 10:01:00','2026-06-20 10:01:00'),(488,35,9,3,1,'2026-04-20 16:57:00',5522.00,37,'terminee','2026-04-20 16:57:00','2026-04-20 16:57:00'),(489,47,18,6,2,'2026-04-11 07:31:00',14189.00,53,'terminee','2026-04-11 07:31:00','2026-04-11 07:31:00'),(490,20,6,2,1,'2026-03-19 23:29:00',3114.00,14,'terminee','2026-03-19 23:29:00','2026-03-19 23:29:00'),(491,44,22,6,4,'2026-06-19 16:45:00',4872.00,35,'terminee','2026-06-19 16:45:00','2026-06-19 16:45:00'),(492,18,NULL,2,1,'2026-07-06 09:17:00',5594.00,31,'en_cours','2026-07-06 09:17:00','2026-07-06 09:17:00'),(493,59,27,24,1,'2026-04-02 17:35:00',19.07,39,'terminee','2026-04-02 17:35:00','2026-04-02 17:35:00'),(494,37,13,5,1,'2026-05-22 18:27:00',2886.00,40,'terminee','2026-05-22 18:27:00','2026-05-22 18:27:00'),(495,41,NULL,5,1,'2026-06-11 13:33:00',6474.00,53,'en_cours','2026-06-11 13:33:00','2026-06-11 13:33:00'),(496,52,19,6,4,'2026-05-08 08:26:00',1445.00,66,'terminee','2026-05-08 08:26:00','2026-05-08 08:26:00'),(497,61,26,24,4,'2026-04-29 20:23:00',20.13,26,'terminee','2026-04-29 20:23:00','2026-04-29 20:23:00'),(498,27,9,3,2,'2026-04-25 12:32:00',5687.00,68,'annulee','2026-04-25 12:32:00','2026-04-25 12:32:00'),(499,49,NULL,6,4,'2026-04-22 06:18:00',3995.00,18,'en_cours','2026-04-22 06:18:00','2026-04-22 06:18:00'),(500,73,28,25,2,'2026-06-24 23:51:00',20.81,54,'terminee','2026-06-24 23:51:00','2026-06-24 23:51:00'),(501,18,8,2,4,'2026-06-01 08:52:00',1459.00,37,'terminee','2026-06-01 08:52:00','2026-06-01 08:52:00'),(502,12,1,1,4,'2026-04-23 12:54:00',4171.00,60,'terminee','2026-04-23 12:54:00','2026-04-23 12:54:00'),(503,20,7,2,2,'2026-03-31 07:30:00',6170.00,70,'terminee','2026-03-31 07:30:00','2026-03-31 07:30:00'),(504,20,5,2,1,'2026-04-01 19:18:00',6165.00,73,'terminee','2026-04-01 19:18:00','2026-04-01 19:18:00'),(505,2,1,1,2,'2026-05-31 19:11:00',10667.00,19,'terminee','2026-05-31 19:11:00','2026-05-31 19:11:00'),(506,27,10,3,2,'2026-05-07 09:02:00',13698.00,32,'terminee','2026-05-07 09:02:00','2026-05-07 09:02:00'),(507,73,31,25,1,'2026-03-25 14:57:00',22.70,15,'terminee','2026-03-25 14:57:00','2026-03-25 14:57:00'),(508,3,1,1,4,'2026-05-19 21:46:00',2057.00,67,'terminee','2026-05-19 21:46:00','2026-05-19 21:46:00'),(509,8,1,1,4,'2026-06-26 22:45:00',3767.00,31,'terminee','2026-06-26 22:45:00','2026-06-26 22:45:00'),(510,25,10,3,4,'2026-06-02 22:55:00',5445.00,37,'terminee','2026-06-02 22:55:00','2026-06-02 22:55:00'),(511,58,27,24,1,'2026-04-29 07:48:00',22.50,29,'terminee','2026-04-29 07:48:00','2026-04-29 07:48:00'),(512,40,NULL,5,2,'2026-07-02 08:30:00',9273.00,67,'annulee','2026-07-02 08:30:00','2026-07-02 08:30:00'),(513,7,1,1,1,'2026-05-22 15:54:00',6324.00,55,'terminee','2026-05-22 15:54:00','2026-05-22 15:54:00'),(514,45,18,6,4,'2026-06-14 21:32:00',3691.00,27,'terminee','2026-06-14 21:32:00','2026-06-14 21:32:00'),(515,57,25,24,1,'2026-04-03 19:36:00',41.06,49,'terminee','2026-04-03 19:36:00','2026-04-03 19:36:00'),(516,29,12,3,2,'2026-05-30 10:42:00',4425.00,63,'terminee','2026-05-30 10:42:00','2026-05-30 10:42:00'),(517,48,21,6,2,'2026-03-24 13:58:00',11406.00,31,'terminee','2026-03-24 13:58:00','2026-03-24 13:58:00'),(518,45,22,6,4,'2026-05-12 06:55:00',5377.00,53,'terminee','2026-05-12 06:55:00','2026-05-12 06:55:00'),(519,60,26,24,2,'2026-04-20 15:47:00',82.64,8,'terminee','2026-04-20 15:47:00','2026-04-20 15:47:00'),(520,52,NULL,6,1,'2026-05-02 09:10:00',5607.00,34,'terminee','2026-05-02 09:10:00','2026-05-02 09:10:00'),(521,32,10,3,4,'2026-06-09 20:44:00',2442.00,22,'terminee','2026-06-09 20:44:00','2026-06-09 20:44:00'),(522,65,29,25,2,'2026-07-03 06:22:00',23.82,11,'terminee','2026-07-03 06:22:00','2026-07-03 06:22:00'),(523,41,NULL,5,1,'2026-04-22 16:11:00',3156.00,13,'terminee','2026-04-22 16:11:00','2026-04-22 16:11:00'),(524,41,NULL,5,2,'2026-05-03 07:25:00',8853.00,29,'terminee','2026-05-03 07:25:00','2026-05-03 07:25:00'),(525,28,NULL,3,1,'2026-05-23 07:32:00',5700.00,72,'en_cours','2026-05-23 07:32:00','2026-05-23 07:32:00'),(526,63,29,25,2,'2026-06-18 08:55:00',78.60,39,'terminee','2026-06-18 08:55:00','2026-06-18 08:55:00'),(527,34,12,3,4,'2026-04-01 22:03:00',4227.00,38,'terminee','2026-04-01 22:03:00','2026-04-01 22:03:00'),(528,6,2,1,4,'2026-05-15 14:06:00',1724.00,10,'terminee','2026-05-15 14:06:00','2026-05-15 14:06:00'),(529,27,10,3,4,'2026-03-29 06:54:00',2065.00,12,'terminee','2026-03-29 06:54:00','2026-03-29 06:54:00'),(530,62,NULL,25,1,'2026-05-13 10:58:00',23.23,10,'en_cours','2026-05-13 10:58:00','2026-05-13 10:58:00'),(531,13,NULL,2,1,'2026-06-03 17:46:00',5450.00,47,'en_cours','2026-06-03 17:46:00','2026-06-03 17:46:00'),(532,54,NULL,24,2,'2026-05-11 12:47:00',11.60,40,'en_cours','2026-05-11 12:47:00','2026-05-11 12:47:00'),(533,42,16,5,1,'2026-04-01 11:40:00',5331.00,58,'terminee','2026-04-01 11:40:00','2026-04-01 11:40:00'),(534,70,NULL,25,2,'2026-04-09 23:06:00',23.58,67,'terminee','2026-04-09 23:06:00','2026-04-09 23:06:00'),(535,11,NULL,1,1,'2026-04-20 14:13:00',2205.00,42,'terminee','2026-04-20 14:13:00','2026-04-20 14:13:00'),(536,40,13,5,2,'2026-05-15 14:57:00',14041.00,74,'terminee','2026-05-15 14:57:00','2026-05-15 14:57:00'),(537,12,1,1,4,'2026-06-02 08:08:00',2598.00,27,'terminee','2026-06-02 08:08:00','2026-06-02 08:08:00'),(538,34,10,3,2,'2026-03-29 21:52:00',14470.00,58,'terminee','2026-03-29 21:52:00','2026-03-29 21:52:00'),(539,27,NULL,3,1,'2026-03-21 10:21:00',6363.00,17,'terminee','2026-03-21 10:21:00','2026-03-21 10:21:00'),(540,60,NULL,24,4,'2026-07-07 17:26:00',24.77,28,'en_cours','2026-07-07 17:26:00','2026-07-07 17:26:00'),(541,33,9,3,4,'2026-04-28 22:01:00',4332.00,19,'annulee','2026-04-28 22:01:00','2026-04-28 22:01:00'),(542,49,20,6,1,'2026-05-23 07:42:00',6221.00,22,'terminee','2026-05-23 07:42:00','2026-05-23 07:42:00'),(543,14,7,2,4,'2026-03-31 22:01:00',4694.00,20,'terminee','2026-03-31 22:01:00','2026-03-31 22:01:00'),(544,3,2,1,4,'2026-04-30 19:48:00',5888.00,57,'annulee','2026-04-30 19:48:00','2026-04-30 19:48:00'),(545,32,NULL,3,2,'2026-05-03 11:07:00',9446.00,18,'en_cours','2026-05-03 11:07:00','2026-05-03 11:07:00'),(546,46,21,6,4,'2026-04-16 21:59:00',3137.00,41,'terminee','2026-04-16 21:59:00','2026-04-16 21:59:00'),(547,17,8,2,4,'2026-05-02 15:16:00',3586.00,27,'terminee','2026-05-02 15:16:00','2026-05-02 15:16:00'),(548,52,NULL,6,4,'2026-03-30 18:13:00',2142.00,46,'en_cours','2026-03-30 18:13:00','2026-03-30 18:13:00'),(549,38,NULL,5,2,'2026-04-23 06:00:00',2249.00,57,'terminee','2026-04-23 06:00:00','2026-04-23 06:00:00'),(550,57,26,24,4,'2026-06-22 16:37:00',20.12,47,'terminee','2026-06-22 16:37:00','2026-06-22 16:37:00'),(551,62,30,25,1,'2026-06-23 14:26:00',13.15,55,'terminee','2026-06-23 14:26:00','2026-06-23 14:26:00'),(552,36,NULL,5,1,'2026-06-20 09:20:00',3738.00,10,'terminee','2026-06-20 09:20:00','2026-06-20 09:20:00'),(553,19,NULL,2,1,'2026-05-07 09:54:00',5525.00,33,'terminee','2026-05-07 09:54:00','2026-05-07 09:54:00'),(554,26,11,3,4,'2026-06-02 17:04:00',5420.00,27,'terminee','2026-06-02 17:04:00','2026-06-02 17:04:00'),(555,46,22,6,4,'2026-06-15 18:16:00',1003.00,65,'terminee','2026-06-15 18:16:00','2026-06-15 18:16:00'),(556,46,20,6,4,'2026-04-15 17:04:00',2379.00,59,'terminee','2026-04-15 17:04:00','2026-04-15 17:04:00'),(557,23,6,2,2,'2026-05-16 21:53:00',4292.00,59,'terminee','2026-05-16 21:53:00','2026-05-16 21:53:00'),(558,44,17,6,2,'2026-06-16 21:00:00',14704.00,52,'annulee','2026-06-16 21:00:00','2026-06-16 21:00:00'),(559,32,NULL,3,1,'2026-04-01 15:12:00',2154.00,41,'terminee','2026-04-01 15:12:00','2026-04-01 15:12:00'),(560,65,NULL,25,4,'2026-03-31 23:41:00',22.25,44,'terminee','2026-03-31 23:41:00','2026-03-31 23:41:00'),(561,23,5,2,2,'2026-06-27 14:51:00',11191.00,73,'terminee','2026-06-27 14:51:00','2026-06-27 14:51:00'),(562,22,6,2,4,'2026-06-09 20:09:00',2179.00,60,'terminee','2026-06-09 20:09:00','2026-06-09 20:09:00'),(563,13,7,2,1,'2026-06-29 09:53:00',7751.00,45,'terminee','2026-06-29 09:53:00','2026-06-29 09:53:00'),(564,38,13,5,1,'2026-07-15 15:49:00',3908.00,46,'terminee','2026-07-15 15:49:00','2026-07-15 15:49:00'),(565,5,2,1,1,'2026-05-11 17:25:00',3586.00,60,'terminee','2026-05-11 17:25:00','2026-05-11 17:25:00'),(566,7,1,1,4,'2026-05-30 21:05:00',2566.00,20,'terminee','2026-05-30 21:05:00','2026-05-30 21:05:00'),(567,65,30,25,4,'2026-05-07 22:42:00',22.57,57,'terminee','2026-05-07 22:42:00','2026-05-07 22:42:00'),(568,28,12,3,2,'2026-06-20 14:37:00',3242.00,50,'annulee','2026-06-20 14:37:00','2026-06-20 14:37:00'),(569,31,9,3,2,'2026-05-17 13:55:00',6955.00,36,'terminee','2026-05-17 13:55:00','2026-05-17 13:55:00'),(570,41,14,5,2,'2026-06-13 17:57:00',7773.00,41,'terminee','2026-06-13 17:57:00','2026-06-13 17:57:00'),(571,54,24,24,2,'2026-05-29 11:52:00',71.37,13,'terminee','2026-05-29 11:52:00','2026-05-29 11:52:00'),(572,64,30,25,4,'2026-03-26 13:12:00',25.01,35,'terminee','2026-03-26 13:12:00','2026-03-26 13:12:00'),(573,8,2,1,4,'2026-05-08 12:22:00',1776.00,14,'terminee','2026-05-08 12:22:00','2026-05-08 12:22:00'),(574,27,9,3,1,'2026-06-05 22:23:00',1678.00,15,'terminee','2026-06-05 22:23:00','2026-06-05 22:23:00'),(575,62,28,25,2,'2026-04-26 14:32:00',45.35,74,'terminee','2026-04-26 14:32:00','2026-04-26 14:32:00'),(576,34,11,3,4,'2026-06-19 22:13:00',5267.00,48,'terminee','2026-06-19 22:13:00','2026-06-19 22:13:00'),(577,70,32,25,1,'2026-04-14 11:59:00',19.15,43,'terminee','2026-04-14 11:59:00','2026-04-14 11:59:00'),(578,54,25,24,4,'2026-06-05 22:48:00',29.53,12,'terminee','2026-06-05 22:48:00','2026-06-05 22:48:00'),(579,5,1,1,1,'2026-06-09 07:00:00',6021.00,39,'terminee','2026-06-09 07:00:00','2026-06-09 07:00:00'),(580,53,NULL,24,4,'2026-04-26 17:55:00',31.71,11,'en_cours','2026-04-26 17:55:00','2026-04-26 17:55:00'),(581,33,11,3,4,'2026-05-03 06:27:00',3947.00,42,'terminee','2026-05-03 06:27:00','2026-05-03 06:27:00'),(582,8,1,1,2,'2026-05-15 17:07:00',4422.00,56,'terminee','2026-05-15 17:07:00','2026-05-15 17:07:00'),(583,58,25,24,4,'2026-06-25 08:06:00',9.49,10,'terminee','2026-06-25 08:06:00','2026-06-25 08:06:00'),(584,68,NULL,25,4,'2026-04-12 08:06:00',20.54,49,'en_cours','2026-04-12 08:06:00','2026-04-12 08:06:00'),(585,48,NULL,6,2,'2026-06-04 08:14:00',6680.00,59,'en_cours','2026-06-04 08:14:00','2026-06-04 08:14:00'),(586,65,NULL,25,2,'2026-04-12 12:55:00',14.44,27,'terminee','2026-04-12 12:55:00','2026-04-12 12:55:00'),(587,65,30,25,4,'2026-03-31 09:16:00',24.73,63,'terminee','2026-03-31 09:16:00','2026-03-31 09:16:00'),(588,24,7,2,2,'2026-04-24 15:02:00',2334.00,67,'terminee','2026-04-24 15:02:00','2026-04-24 15:02:00'),(589,26,NULL,3,1,'2026-03-22 12:13:00',6374.00,58,'terminee','2026-03-22 12:13:00','2026-03-22 12:13:00'),(590,72,31,25,2,'2026-03-25 19:25:00',25.29,26,'terminee','2026-03-25 19:25:00','2026-03-25 19:25:00'),(591,17,NULL,2,2,'2026-06-28 21:50:00',9453.00,17,'terminee','2026-06-28 21:50:00','2026-06-28 21:50:00'),(592,21,7,2,2,'2026-05-10 15:00:00',4184.00,55,'terminee','2026-05-10 15:00:00','2026-05-10 15:00:00'),(593,1,1,1,4,'2026-04-09 17:20:00',1804.00,52,'terminee','2026-04-09 17:20:00','2026-04-09 17:20:00'),(594,61,24,24,1,'2026-04-03 15:26:00',9.75,14,'terminee','2026-04-03 15:26:00','2026-04-03 15:26:00'),(595,12,1,1,2,'2026-05-22 10:43:00',6246.00,20,'terminee','2026-05-22 10:43:00','2026-05-22 10:43:00'),(596,8,NULL,1,2,'2026-04-22 13:46:00',13825.00,55,'en_cours','2026-04-22 13:46:00','2026-04-22 13:46:00'),(597,1,NULL,1,1,'2026-04-16 15:24:00',5862.00,70,'en_cours','2026-04-16 15:24:00','2026-04-16 15:24:00'),(598,54,27,24,2,'2026-06-23 08:20:00',42.52,39,'terminee','2026-06-23 08:20:00','2026-06-23 08:20:00'),(599,9,NULL,1,1,'2026-06-14 15:10:00',2817.00,8,'terminee','2026-06-14 15:10:00','2026-06-14 15:10:00'),(600,55,23,24,4,'2026-03-26 19:35:00',15.63,71,'terminee','2026-03-26 19:35:00','2026-03-26 19:35:00'),(601,43,16,5,1,'2026-04-14 09:24:00',5853.00,22,'terminee','2026-04-14 09:24:00','2026-04-14 09:24:00'),(602,29,11,3,4,'2026-05-01 22:14:00',2807.00,30,'terminee','2026-05-01 22:14:00','2026-05-01 22:14:00'),(603,55,24,24,1,'2026-05-23 06:36:00',29.79,66,'terminee','2026-05-23 06:36:00','2026-05-23 06:36:00'),(604,20,NULL,2,4,'2026-04-17 19:42:00',5727.00,9,'en_cours','2026-04-17 19:42:00','2026-04-17 19:42:00'),(605,33,NULL,3,4,'2026-04-04 07:15:00',1039.00,15,'terminee','2026-04-04 07:15:00','2026-04-04 07:15:00'),(606,49,19,6,1,'2026-05-09 12:22:00',3124.00,44,'terminee','2026-05-09 12:22:00','2026-05-09 12:22:00'),(607,58,23,24,2,'2026-03-21 10:47:00',60.33,51,'terminee','2026-03-21 10:47:00','2026-03-21 10:47:00'),(608,71,28,25,1,'2026-07-15 14:56:00',27.46,73,'terminee','2026-07-15 14:56:00','2026-07-15 14:56:00'),(609,69,28,25,2,'2026-06-06 06:33:00',57.20,71,'annulee','2026-06-06 06:33:00','2026-06-06 06:33:00'),(610,29,11,3,4,'2026-04-08 20:03:00',2039.00,70,'terminee','2026-04-08 20:03:00','2026-04-08 20:03:00'),(611,62,NULL,25,2,'2026-04-02 22:14:00',34.80,57,'en_cours','2026-04-02 22:14:00','2026-04-02 22:14:00'),(612,24,7,2,2,'2026-05-28 16:33:00',10485.00,53,'terminee','2026-05-28 16:33:00','2026-05-28 16:33:00'),(613,20,5,2,1,'2026-04-19 17:45:00',3931.00,63,'terminee','2026-04-19 17:45:00','2026-04-19 17:45:00'),(614,29,9,3,4,'2026-06-03 18:56:00',4677.00,40,'terminee','2026-06-03 18:56:00','2026-06-03 18:56:00'),(615,38,13,5,4,'2026-04-28 19:23:00',2021.00,55,'terminee','2026-04-28 19:23:00','2026-04-28 19:23:00'),(616,50,NULL,6,2,'2026-03-29 22:12:00',3118.00,25,'terminee','2026-03-29 22:12:00','2026-03-29 22:12:00'),(617,73,NULL,25,2,'2026-05-28 19:54:00',81.17,11,'en_cours','2026-05-28 19:54:00','2026-05-28 19:54:00'),(618,2,2,1,4,'2026-04-06 10:53:00',4882.00,63,'annulee','2026-04-06 10:53:00','2026-04-06 10:53:00'),(619,59,23,24,1,'2026-06-14 09:04:00',29.06,47,'terminee','2026-06-14 09:04:00','2026-06-14 09:04:00'),(620,18,5,2,1,'2026-04-22 19:12:00',5748.00,15,'terminee','2026-04-22 19:12:00','2026-04-22 19:12:00'),(621,49,19,6,1,'2026-05-10 18:04:00',2697.00,26,'terminee','2026-05-10 18:04:00','2026-05-10 18:04:00'),(622,30,NULL,3,2,'2026-05-31 20:20:00',4770.00,29,'en_cours','2026-05-31 20:20:00','2026-05-31 20:20:00'),(623,33,9,3,2,'2026-05-11 21:35:00',5294.00,68,'terminee','2026-05-11 21:35:00','2026-05-11 21:35:00'),(624,64,NULL,25,4,'2026-03-20 22:55:00',22.15,42,'en_cours','2026-03-20 22:55:00','2026-03-20 22:55:00'),(625,34,9,3,1,'2026-04-15 20:16:00',2243.00,58,'terminee','2026-04-15 20:16:00','2026-04-15 20:16:00'),(626,30,10,3,2,'2026-06-18 10:19:00',11662.00,67,'terminee','2026-06-18 10:19:00','2026-06-18 10:19:00'),(627,22,6,2,4,'2026-06-07 07:24:00',4876.00,14,'annulee','2026-06-07 07:24:00','2026-06-07 07:24:00'),(628,30,10,3,1,'2026-04-06 18:38:00',7086.00,21,'terminee','2026-04-06 18:38:00','2026-04-06 18:38:00'),(629,31,9,3,4,'2026-07-08 23:47:00',3377.00,17,'terminee','2026-07-08 23:47:00','2026-07-08 23:47:00'),(630,12,1,1,1,'2026-04-22 21:36:00',2814.00,27,'terminee','2026-04-22 21:36:00','2026-04-22 21:36:00'),(631,27,9,3,4,'2026-05-10 07:12:00',5808.00,73,'annulee','2026-05-10 07:12:00','2026-05-10 07:12:00'),(632,48,20,6,2,'2026-05-26 06:41:00',3691.00,41,'terminee','2026-05-26 06:41:00','2026-05-26 06:41:00'),(633,39,14,5,2,'2026-03-27 21:37:00',8227.00,47,'terminee','2026-03-27 21:37:00','2026-03-27 21:37:00'),(634,32,11,3,4,'2026-04-08 19:52:00',3803.00,31,'annulee','2026-04-08 19:52:00','2026-04-08 19:52:00'),(635,66,30,25,2,'2026-05-13 15:30:00',73.60,65,'terminee','2026-05-13 15:30:00','2026-05-13 15:30:00'),(636,12,1,1,1,'2026-05-30 17:29:00',3101.00,19,'terminee','2026-05-30 17:29:00','2026-05-30 17:29:00'),(637,21,NULL,2,4,'2026-05-08 19:25:00',3550.00,45,'en_cours','2026-05-08 19:25:00','2026-05-08 19:25:00'),(638,45,NULL,6,4,'2026-04-25 17:32:00',1424.00,24,'en_cours','2026-04-25 17:32:00','2026-04-25 17:32:00'),(639,69,NULL,25,4,'2026-05-10 13:24:00',31.47,69,'en_cours','2026-05-10 13:24:00','2026-05-10 13:24:00'),(640,11,1,1,2,'2026-06-05 17:29:00',8949.00,58,'terminee','2026-06-05 17:29:00','2026-06-05 17:29:00'),(641,44,19,6,2,'2026-07-03 13:34:00',13330.00,56,'terminee','2026-07-03 13:34:00','2026-07-03 13:34:00'),(642,27,11,3,1,'2026-05-10 11:10:00',3253.00,62,'terminee','2026-05-10 11:10:00','2026-05-10 11:10:00'),(643,19,4,2,4,'2026-04-06 19:32:00',5206.00,26,'terminee','2026-04-06 19:32:00','2026-04-06 19:32:00'),(644,65,28,25,1,'2026-05-01 21:59:00',31.82,56,'terminee','2026-05-01 21:59:00','2026-05-01 21:59:00'),(645,40,14,5,1,'2026-07-14 09:38:00',7223.00,10,'terminee','2026-07-14 09:38:00','2026-07-14 09:38:00'),(646,72,NULL,25,1,'2026-05-02 20:37:00',37.35,19,'en_cours','2026-05-02 20:37:00','2026-05-02 20:37:00'),(647,8,NULL,1,1,'2026-06-22 07:29:00',5089.00,48,'en_cours','2026-06-22 07:29:00','2026-06-22 07:29:00'),(648,59,23,24,2,'2026-05-02 22:49:00',20.63,55,'annulee','2026-05-02 22:49:00','2026-05-02 22:49:00'),(649,39,15,5,4,'2026-05-23 15:36:00',2852.00,48,'terminee','2026-05-23 15:36:00','2026-05-23 15:36:00'),(650,41,14,5,2,'2026-05-01 15:28:00',6334.00,54,'terminee','2026-05-01 15:28:00','2026-05-01 15:28:00'),(651,21,8,2,1,'2026-07-10 07:47:00',2026.00,70,'annulee','2026-07-10 07:47:00','2026-07-10 07:47:00'),(652,19,8,2,4,'2026-06-17 23:36:00',3807.00,37,'terminee','2026-06-17 23:36:00','2026-06-17 23:36:00'),(653,69,32,25,4,'2026-06-29 08:23:00',21.21,13,'terminee','2026-06-29 08:23:00','2026-06-29 08:23:00'),(654,27,12,3,1,'2026-04-20 19:31:00',3608.00,75,'terminee','2026-04-20 19:31:00','2026-04-20 19:31:00'),(655,51,22,6,2,'2026-04-24 13:00:00',6831.00,47,'terminee','2026-04-24 13:00:00','2026-04-24 13:00:00'),(656,12,1,1,4,'2026-04-18 21:20:00',3163.00,51,'terminee','2026-04-18 21:20:00','2026-04-18 21:20:00'),(657,62,31,25,4,'2026-04-15 16:21:00',13.37,12,'terminee','2026-04-15 16:21:00','2026-04-15 16:21:00'),(658,37,15,5,2,'2026-03-27 08:16:00',10638.00,8,'terminee','2026-03-27 08:16:00','2026-03-27 08:16:00'),(659,55,NULL,24,4,'2026-04-01 06:57:00',13.29,18,'terminee','2026-04-01 06:57:00','2026-04-01 06:57:00'),(660,59,27,24,1,'2026-07-01 20:06:00',27.85,20,'terminee','2026-07-01 20:06:00','2026-07-01 20:06:00'),(661,49,19,6,1,'2026-06-03 11:45:00',3088.00,43,'terminee','2026-06-03 11:45:00','2026-06-03 11:45:00'),(662,31,NULL,3,4,'2026-04-21 12:12:00',3360.00,65,'en_cours','2026-04-21 12:12:00','2026-04-21 12:12:00'),(663,20,NULL,2,2,'2026-04-06 15:29:00',5751.00,12,'annulee','2026-04-06 15:29:00','2026-04-06 15:29:00'),(664,39,15,5,4,'2026-03-27 12:54:00',3404.00,19,'annulee','2026-03-27 12:54:00','2026-03-27 12:54:00'),(665,29,12,3,4,'2026-03-24 13:51:00',3230.00,64,'terminee','2026-03-24 13:51:00','2026-03-24 13:51:00'),(666,44,18,6,2,'2026-06-15 16:12:00',10982.00,73,'terminee','2026-06-15 16:12:00','2026-06-15 16:12:00'),(667,64,NULL,25,1,'2026-05-04 21:01:00',8.16,8,'en_cours','2026-05-04 21:01:00','2026-05-04 21:01:00'),(668,28,NULL,3,4,'2026-05-18 21:23:00',5462.00,18,'terminee','2026-05-18 21:23:00','2026-05-18 21:23:00'),(669,9,2,1,4,'2026-04-19 15:53:00',3635.00,12,'terminee','2026-04-19 15:53:00','2026-04-19 15:53:00'),(670,42,15,5,4,'2026-03-30 15:18:00',4135.00,13,'terminee','2026-03-30 15:18:00','2026-03-30 15:18:00'),(671,20,5,2,1,'2026-05-25 14:56:00',2594.00,46,'terminee','2026-05-25 14:56:00','2026-05-25 14:56:00'),(672,64,29,25,1,'2026-04-04 12:13:00',32.33,53,'terminee','2026-04-04 12:13:00','2026-04-04 12:13:00'),(673,73,32,25,1,'2026-06-19 09:47:00',18.24,70,'terminee','2026-06-19 09:47:00','2026-06-19 09:47:00'),(674,6,1,1,1,'2026-05-12 13:21:00',1699.00,38,'terminee','2026-05-12 13:21:00','2026-05-12 13:21:00'),(675,64,30,25,1,'2026-07-05 13:59:00',16.82,48,'annulee','2026-07-05 13:59:00','2026-07-05 13:59:00'),(676,39,15,5,1,'2026-04-25 08:17:00',4714.00,14,'terminee','2026-04-25 08:17:00','2026-04-25 08:17:00'),(677,61,25,24,4,'2026-06-27 17:31:00',21.66,30,'terminee','2026-06-27 17:31:00','2026-06-27 17:31:00'),(678,34,11,3,2,'2026-04-16 18:09:00',6278.00,64,'terminee','2026-04-16 18:09:00','2026-04-16 18:09:00'),(679,40,15,5,2,'2026-06-06 08:03:00',7177.00,23,'terminee','2026-06-06 08:03:00','2026-06-06 08:03:00'),(680,6,3,1,4,'2026-04-03 16:05:00',2538.00,55,'annulee','2026-04-03 16:05:00','2026-04-03 16:05:00'),(681,55,NULL,24,4,'2026-05-14 18:40:00',28.82,51,'terminee','2026-05-14 18:40:00','2026-05-14 18:40:00'),(682,16,8,2,1,'2026-05-03 09:04:00',7156.00,43,'terminee','2026-05-03 09:04:00','2026-05-03 09:04:00'),(683,46,NULL,6,4,'2026-05-01 13:19:00',5801.00,62,'terminee','2026-05-01 13:19:00','2026-05-01 13:19:00'),(684,40,14,5,2,'2026-04-01 16:01:00',7056.00,58,'terminee','2026-04-01 16:01:00','2026-04-01 16:01:00'),(685,50,NULL,6,1,'2026-06-08 22:11:00',7765.00,37,'en_cours','2026-06-08 22:11:00','2026-06-08 22:11:00'),(686,70,30,25,1,'2026-04-12 15:11:00',26.52,29,'annulee','2026-04-12 15:11:00','2026-04-12 15:11:00'),(687,39,15,5,1,'2026-07-03 16:22:00',2811.00,20,'terminee','2026-07-03 16:22:00','2026-07-03 16:22:00'),(688,26,10,3,4,'2026-03-30 10:37:00',3341.00,47,'terminee','2026-03-30 10:37:00','2026-03-30 10:37:00'),(689,69,30,25,4,'2026-06-02 20:37:00',6.89,14,'terminee','2026-06-02 20:37:00','2026-06-02 20:37:00'),(690,30,9,3,1,'2026-05-12 23:20:00',6018.00,56,'terminee','2026-05-12 23:20:00','2026-05-12 23:20:00'),(691,7,1,1,1,'2026-03-20 15:14:00',2509.00,59,'terminee','2026-03-20 15:14:00','2026-03-20 15:14:00'),(692,45,22,6,2,'2026-04-20 20:58:00',7037.00,33,'annulee','2026-04-20 20:58:00','2026-04-20 20:58:00'),(693,50,20,6,2,'2026-04-07 21:09:00',8016.00,39,'terminee','2026-04-07 21:09:00','2026-04-07 21:09:00'),(694,71,29,25,4,'2026-06-16 14:15:00',11.16,50,'terminee','2026-06-16 14:15:00','2026-06-16 14:15:00'),(695,9,2,1,2,'2026-06-17 09:59:00',7035.00,65,'terminee','2026-06-17 09:59:00','2026-06-17 09:59:00'),(696,13,6,2,4,'2026-04-07 18:35:00',4435.00,33,'annulee','2026-04-07 18:35:00','2026-04-07 18:35:00'),(697,59,NULL,24,1,'2026-04-20 06:09:00',26.00,20,'terminee','2026-04-20 06:09:00','2026-04-20 06:09:00'),(698,28,NULL,3,1,'2026-05-11 12:50:00',4700.00,61,'en_cours','2026-05-11 12:50:00','2026-05-11 12:50:00'),(699,71,29,25,2,'2026-04-19 20:19:00',80.69,74,'annulee','2026-04-19 20:19:00','2026-04-19 20:19:00'),(700,1,NULL,1,1,'2026-05-07 13:41:00',3919.00,53,'en_cours','2026-05-07 13:41:00','2026-05-07 13:41:00');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `demandes_comptes`
--

DROP TABLE IF EXISTS `demandes_comptes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demandes_comptes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `demandeur_id` bigint(20) unsigned NOT NULL,
  `pays_id` bigint(20) unsigned NOT NULL,
  `ville_id` bigint(20) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mot_de_passe_hash` varchar(255) NOT NULL,
  `statut` enum('en_attente','validee','refusee') NOT NULL DEFAULT 'en_attente',
  `motif_refus` varchar(255) DEFAULT NULL,
  `valideur_id` bigint(20) unsigned DEFAULT NULL,
  `utilisateur_id` bigint(20) unsigned DEFAULT NULL,
  `date_traitement` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dc_demandeur` (`demandeur_id`),
  KEY `fk_dc_ville` (`ville_id`),
  KEY `fk_dc_valideur` (`valideur_id`),
  KEY `fk_dc_utilisateur` (`utilisateur_id`),
  KEY `idx_dc_statut` (`statut`),
  KEY `idx_dc_pays` (`pays_id`),
  CONSTRAINT `fk_dc_demandeur` FOREIGN KEY (`demandeur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dc_pays` FOREIGN KEY (`pays_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dc_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_dc_valideur` FOREIGN KEY (`valideur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_dc_ville` FOREIGN KEY (`ville_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `demandes_comptes`
--

LOCK TABLES `demandes_comptes` WRITE;
/*!40000 ALTER TABLE `demandes_comptes` DISABLE KEYS */;
/*!40000 ALTER TABLE `demandes_comptes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `droits_acces`
--

DROP TABLE IF EXISTS `droits_acces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `droits_acces` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_droit` varchar(100) NOT NULL,
  `module_concerne` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_droits_libelle` (`libelle_droit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `droits_acces`
--

LOCK TABLES `droits_acces` WRITE;
/*!40000 ALTER TABLE `droits_acces` DISABLE KEYS */;
INSERT INTO `droits_acces` VALUES (1,'voir_dashboard','Dashboard','2026-07-15 15:51:12','2026-07-15 15:51:12'),(2,'voir_stats','Stats','2026-07-15 15:51:12','2026-07-15 15:51:12'),(3,'exporter_rapport','Rapports','2026-07-15 15:51:12','2026-07-15 15:51:12'),(4,'gerer_utilisateurs','Utilisateurs','2026-07-15 15:51:12','2026-07-15 15:51:12'),(5,'gerer_pays','Pays','2026-07-15 15:51:12','2026-07-15 15:51:12'),(6,'voir_activites','Parametres','2026-07-15 15:51:12','2026-07-15 15:51:12');
/*!40000 ALTER TABLE `droits_acces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantees`
--

DROP TABLE IF EXISTS `guarantees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarantees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `subtitle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`subtitle`)),
  `icon` varchar(255) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantees`
--

LOCK TABLES `guarantees` WRITE;
/*!40000 ALTER TABLE `guarantees` DISABLE KEYS */;
INSERT INTO `guarantees` VALUES (1,'securite-garantie','{\"fr\":\"S\\u00e9curit\\u00e9 garantie\",\"en\":\"Guaranteed security\"}','{\"fr\":\"Vos donn\\u00e9es sont prot\\u00e9g\\u00e9es\",\"en\":\"Your data is protected\"}','shield',0,'2026-07-17 09:22:53','2026-07-17 11:28:29'),(2,'paiements-securises','{\"fr\":\"Paiements s\\u00e9curis\\u00e9s\",\"en\":\"Secure payments\"}','{\"fr\":\"Transactions 100% s\\u00e9curis\\u00e9es\",\"en\":\"100% secure transactions\"}','card',1,'2026-07-17 09:22:53','2026-07-17 11:28:29'),(3,'disponibilite-247','{\"fr\":\"Disponibilit\\u00e9 24\\/7\",\"en\":\"Available 24\\/7\"}','{\"fr\":\"Nous sommes l\\u00e0 pour vous\",\"en\":\"We are here for you\"}','headset',2,'2026-07-17 09:22:53','2026-07-17 11:29:30'),(4,'support-reactif','{\"fr\":\"Support r\\u00e9actif\",\"en\":\"Responsive support\"}','{\"fr\":\"Assistance rapide et efficace\",\"en\":\"Fast, effective assistance\"}','clock',3,'2026-07-17 09:22:53','2026-07-17 11:28:29');
/*!40000 ALTER TABLE `guarantees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_offers`
--

DROP TABLE IF EXISTS `job_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_offers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `department` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`department`)),
  `location` varchar(255) NOT NULL,
  `contract` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contract`)),
  `excerpt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`excerpt`)),
  `mission` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`mission`)),
  `responsibilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsibilities`)),
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`requirements`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_offers_slug_unique` (`slug`),
  KEY `job_offers_is_active_index` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_offers`
--

LOCK TABLES `job_offers` WRITE;
/*!40000 ALTER TABLE `job_offers` DISABLE KEYS */;
INSERT INTO `job_offers` VALUES (1,'ingenieur-backend-senior','{\"fr\":\"Ing\\u00e9nieur\\u00b7e Backend Senior\",\"en\":\"Senior Backend Engineer\"}','{\"fr\":\"Ing\\u00e9nierie\",\"en\":\"Engineering\"}','Abidjan','{\"fr\":\"CDI\",\"en\":\"Permanent\"}','{\"fr\":\"Concevoir les services qui traitent des centaines de milliers de courses par jour, avec une contrainte : \\u00e7a doit marcher en 2G.\",\"en\":\"Build the services that handle hundreds of thousands of rides a day, under one constraint: it has to work on 2G.\"}','{\"fr\":\"Vous rejoignez l\'\\u00e9quipe qui construit le c\\u0153ur de MamaGo : l\'affectation des courses, le calcul des prix et le suivi temps r\\u00e9el. Vos d\\u00e9cisions techniques se mesurent en minutes d\'attente pour cinq millions de personnes.\",\"en\":\"You join the team building the core of MamaGo: ride dispatch, pricing and real-time tracking. Your technical decisions are measured in minutes of waiting for five million people.\"}','{\"fr\":[\"Concevoir et faire \\u00e9voluer les services d\'affectation et de tarification\",\"Optimiser les temps de r\\u00e9ponse sur des r\\u00e9seaux lents et instables\",\"Encadrer techniquement deux \\u00e0 trois ing\\u00e9nieurs\",\"Participer aux astreintes de l\'\\u00e9quipe (une semaine sur six)\"],\"en\":[\"Design and evolve the dispatch and pricing services\",\"Optimise response times on slow, unstable networks\",\"Provide technical mentorship to two or three engineers\",\"Take part in the team\'s on-call rota (one week in six)\"]}','{\"fr\":[\"Cinq ans ou plus en d\\u00e9veloppement backend (PHP, Go, Java ou \\u00e9quivalent)\",\"Exp\\u00e9rience solide des bases de donn\\u00e9es relationnelles et du cache\",\"\\u00c0 l\'aise avec les syst\\u00e8mes distribu\\u00e9s et la mesure de performance\",\"Fran\\u00e7ais courant, anglais technique\"],\"en\":[\"Five years or more in backend development (PHP, Go, Java or equivalent)\",\"Solid experience with relational databases and caching\",\"Comfortable with distributed systems and performance measurement\",\"Fluent French, technical English\"]}',1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(2,'product-designer','{\"fr\":\"Product Designer\",\"en\":\"Product Designer\"}','{\"fr\":\"Design\",\"en\":\"Design\"}','Dakar','{\"fr\":\"CDI\",\"en\":\"Permanent\"}','{\"fr\":\"Dessiner des parcours utilisables par quelqu\'un qui n\'a jamais utilis\\u00e9 d\'application, sur un \\u00e9cran de cinq pouces au soleil.\",\"en\":\"Design flows usable by someone who has never used an app before, on a five-inch screen in full sunlight.\"}','{\"fr\":\"Vous \\u00eates responsable de l\'exp\\u00e9rience de bout en bout sur un ou deux services (transport, livraison, paiement). Vous passez autant de temps sur le terrain avec les utilisateurs que devant votre \\u00e9cran.\",\"en\":\"You own the end-to-end experience of one or two services (rides, delivery, payments). You spend as much time in the field with users as you do at your screen.\"}','{\"fr\":[\"Mener les recherches utilisateurs sur le terrain, dans plusieurs villes\",\"Concevoir les parcours, du wireframe \\u00e0 la maquette finale\",\"Faire vivre et enrichir notre design system\",\"Confronter chaque hypoth\\u00e8se \\u00e0 un test utilisateur avant d\\u00e9veloppement\"],\"en\":[\"Run field user research across several cities\",\"Design the flows, from wireframe to final mockup\",\"Maintain and extend our design system\",\"Test every assumption with users before development starts\"]}','{\"fr\":[\"Trois ans ou plus en design produit mobile\",\"Portfolio d\\u00e9montrant des d\\u00e9cisions justifi\\u00e9es, pas seulement de jolies maquettes\",\"Exp\\u00e9rience de la recherche utilisateur en contexte contraint\",\"Fran\\u00e7ais courant\"],\"en\":[\"Three years or more in mobile product design\",\"A portfolio showing justified decisions, not just attractive mockups\",\"Experience of user research in constrained settings\",\"Fluent French\"]}',1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(3,'city-manager-douala','{\"fr\":\"City Manager \\u2014 Douala\",\"en\":\"City Manager \\u2014 Douala\"}','{\"fr\":\"Op\\u00e9rations\",\"en\":\"Operations\"}','Douala','{\"fr\":\"CDI\",\"en\":\"Permanent\"}','{\"fr\":\"Piloter l\'activit\\u00e9 d\'une ville enti\\u00e8re : chauffeurs, livreurs, restaurants, croissance et qualit\\u00e9 de service.\",\"en\":\"Run an entire city: drivers, couriers, restaurants, growth and service quality.\"}','{\"fr\":\"Vous \\u00eates responsable de la performance de MamaGo \\u00e0 Douala : l\'offre de partenaires, la demande, la qualit\\u00e9 de service et la rentabilit\\u00e9. C\'est un poste de terrain, pas de bureau.\",\"en\":\"You are accountable for MamaGo\'s performance in Douala: partner supply, demand, service quality and profitability. This is a field role, not a desk job.\"}','{\"fr\":[\"Recruter et fid\\u00e9liser chauffeurs, livreurs et commer\\u00e7ants partenaires\",\"Suivre les indicateurs quotidiens et corriger les d\\u00e9s\\u00e9quilibres offre\\/demande\",\"G\\u00e9rer une \\u00e9quipe locale de cinq \\u00e0 dix personnes\",\"Repr\\u00e9senter MamaGo aupr\\u00e8s des autorit\\u00e9s et partenaires locaux\"],\"en\":[\"Recruit and retain driver, courier and merchant partners\",\"Track daily metrics and correct supply\\/demand imbalances\",\"Manage a local team of five to ten people\",\"Represent MamaGo with local authorities and partners\"]}','{\"fr\":[\"Cinq ans ou plus en op\\u00e9rations, dont deux en management d\'\\u00e9quipe\",\"Connaissance fine du terrain camerounais\",\"\\u00c0 l\'aise avec les chiffres : vous pilotez par la donn\\u00e9e\",\"Fran\\u00e7ais courant, anglais appr\\u00e9ci\\u00e9\"],\"en\":[\"Five years or more in operations, including two managing a team\",\"Deep knowledge of the Cameroonian market\",\"Comfortable with numbers: you manage by data\",\"Fluent French, English a plus\"]}',1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(4,'data-analyst','{\"fr\":\"Data Analyst\",\"en\":\"Data Analyst\"}','{\"fr\":\"Data\",\"en\":\"Data\"}','Abidjan','{\"fr\":\"CDI\",\"en\":\"Permanent\"}','{\"fr\":\"Transformer des millions de courses en d\\u00e9cisions : o\\u00f9 lancer, combien facturer, quel livreur affecter.\",\"en\":\"Turn millions of rides into decisions: where to launch, what to charge, which courier to assign.\"}','{\"fr\":\"Vous travaillez avec les \\u00e9quipes op\\u00e9rations et produit pour r\\u00e9pondre aux questions qui engagent l\'entreprise. Vos analyses arbitrent des d\\u00e9cisions \\u00e0 plusieurs millions.\",\"en\":\"You work with the operations and product teams to answer the questions that commit the company. Your analyses settle multi-million decisions.\"}','{\"fr\":[\"Construire les tableaux de bord suivis quotidiennement par les villes\",\"Analyser l\'\\u00e9quilibre offre\\/demande et proposer des ajustements tarifaires\",\"Concevoir et interpr\\u00e9ter les tests A\\/B produit\",\"Rendre vos r\\u00e9sultats compr\\u00e9hensibles par des non-sp\\u00e9cialistes\"],\"en\":[\"Build the dashboards cities rely on every day\",\"Analyse supply\\/demand balance and propose pricing adjustments\",\"Design and interpret product A\\/B tests\",\"Make your findings understandable to non-specialists\"]}','{\"fr\":[\"Trois ans ou plus en analyse de donn\\u00e9es\",\"SQL avanc\\u00e9, Python ou R\",\"Solides bases en statistiques, notamment sur les tests\",\"Fran\\u00e7ais courant\"],\"en\":[\"Three years or more in data analysis\",\"Advanced SQL, Python or R\",\"Strong statistics fundamentals, particularly around testing\",\"Fluent French\"]}',1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(5,'responsable-support-client','{\"fr\":\"Responsable Support Client\",\"en\":\"Customer Support Manager\"}','{\"fr\":\"Support\",\"en\":\"Support\"}','Lomé','{\"fr\":\"CDI\",\"en\":\"Permanent\"}','{\"fr\":\"Structurer un support disponible 24\\/7 en quatre langues, sur dix pays et trois fuseaux horaires.\",\"en\":\"Build a support operation running 24\\/7 in four languages, across ten countries and three time zones.\"}','{\"fr\":\"Vous dirigez le centre de support de Lom\\u00e9, qui traite les demandes des clients et des partenaires de toute la r\\u00e9gion. Votre mission : r\\u00e9soudre vite, et faire remonter ce qui doit \\u00eatre corrig\\u00e9 \\u00e0 la source.\",\"en\":\"You lead the Lom\\u00e9 support centre, handling customer and partner requests across the region. Your mission: resolve fast, and escalate what needs fixing at the source.\"}','{\"fr\":[\"Encadrer une \\u00e9quipe de vingt conseillers, en horaires d\\u00e9cal\\u00e9s\",\"Tenir les engagements de d\\u00e9lai de premi\\u00e8re r\\u00e9ponse et de r\\u00e9solution\",\"Faire remonter les probl\\u00e8mes r\\u00e9currents aux \\u00e9quipes produit\",\"Recruter et former \\u00e0 mesure de l\'ouverture de nouveaux pays\"],\"en\":[\"Manage a team of twenty advisers working shifts\",\"Meet first-response and resolution time commitments\",\"Escalate recurring problems to the product teams\",\"Recruit and train as new countries open\"]}','{\"fr\":[\"Quatre ans ou plus en support client, dont deux en management\",\"Exp\\u00e9rience d\'un centre multilingue\",\"Rigueur sur les indicateurs de qualit\\u00e9 de service\",\"Fran\\u00e7ais et anglais courants\"],\"en\":[\"Four years or more in customer support, including two in management\",\"Experience running a multilingual centre\",\"Rigour around service-quality metrics\",\"Fluent French and English\"]}',1,'2026-07-17 10:28:12','2026-07-17 11:28:29');
/*!40000 ALTER TABLE `job_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `source` varchar(255) NOT NULL DEFAULT 'contact',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_country_id_foreign` (`country_id`),
  KEY `leads_email_index` (`email`),
  KEY `leads_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreurs`
--

DROP TABLE IF EXISTS `livreurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livreurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ville_id` bigint(20) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `note_moyenne` decimal(3,2) NOT NULL DEFAULT 0.00,
  `statut` enum('actif','inactif','suspendu') NOT NULL DEFAULT 'actif',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_livreurs_telephone` (`telephone`),
  KEY `idx_livreurs_ville` (`ville_id`),
  KEY `idx_livreurs_statut` (`statut`),
  CONSTRAINT `fk_livreurs_ville` FOREIGN KEY (`ville_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreurs`
--

LOCK TABLES `livreurs` WRITE;
/*!40000 ALTER TABLE `livreurs` DISABLE KEYS */;
INSERT INTO `livreurs` VALUES (1,1,'Fofana','Awa','0540538189',4.03,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(2,1,'Ba','Sekou','0596204264',3.60,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(3,1,'Diallo','Kofi','0538334949',4.85,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(4,2,'Ba','Yao','0543736292',4.44,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(5,2,'Sarr','Kofi','0523726673',4.55,'inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(6,2,'Dupont','Marie','0564740685',4.81,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(7,2,'Traore','Julie','0560703321',3.79,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(8,2,'Diop','Lea','0520388669',4.65,'suspendu','2026-07-15 15:51:12','2026-07-15 15:51:12'),(9,3,'Fofana','Sekou','0515770910',4.80,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(10,3,'Diop','Paul','0544356506',4.36,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(11,3,'Diallo','Kofi','0575174200',3.94,'inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(12,3,'Sow','Julie','0593994920',4.82,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(13,5,'Cisse','Paul','0543610691',3.72,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(14,5,'Kone','Aya','0512388433',3.58,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(15,5,'Cisse','Sophie','0594041448',4.42,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(16,5,'Traore','Nadege','0596926850',4.59,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(17,6,'Traore','Julie','0575625491',3.84,'inactif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(18,6,'Diallo','Kofi','0557585139',4.38,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(19,6,'Dupont','Aya','0542971364',3.68,'suspendu','2026-07-15 15:51:12','2026-07-15 15:51:12'),(20,6,'Gueye','Nadege','0575403682',3.93,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(21,6,'Traore','Paul','0552196903',4.85,'suspendu','2026-07-15 15:51:12','2026-07-15 15:51:12'),(22,6,'Yeo','Nadege','0511549259',4.21,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(23,24,'Sow','Ousmane','0535187008',3.94,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(24,24,'Ba','Clarisse','0541795936',4.20,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(25,24,'Dupont','Lea','0576598287',4.89,'suspendu','2026-07-15 15:51:12','2026-07-15 15:51:12'),(26,24,'Diallo','Yao','0597854014',3.78,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(27,24,'Bamba','Aya','0598693238',3.79,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(28,25,'Coulibaly','Aya','0561868743',4.56,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(29,25,'Toure','Jean','0528042302',4.70,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(30,25,'Ndiaye','Awa','0535996271',3.97,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(31,25,'Coulibaly','Aminata','0511762943',4.85,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12'),(32,25,'Martin','Paul','0545442793',4.50,'actif','2026-07-15 15:51:12','2026-07-15 15:51:12');
/*!40000 ALTER TABLE `livreurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_07_17_111347_create_services_table',1),(5,'2026_07_17_111348_create_countries_table',1),(6,'2026_07_17_111349_create_stats_table',1),(7,'2026_07_17_111350_create_leads_table',1),(8,'2026_07_17_111721_create_guarantees_table',1),(9,'2026_07_17_122249_create_posts_table',2),(10,'2026_07_17_122251_create_team_members_table',2),(11,'2026_07_17_122252_create_cities_table',2),(12,'2026_07_17_122253_create_values_table',2),(13,'2026_07_17_122310_create_job_offers_table',2),(14,'2026_07_17_131344_translate_posts_columns',3),(15,'2026_07_17_131736_translate_remaining_content',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiements`
--

DROP TABLE IF EXISTS `paiements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `type_paiement` enum('carte','especes','mobile_money','autre') NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `statut` enum('en_attente','valide','echoue','rembourse') NOT NULL DEFAULT 'en_attente',
  `date_paiement` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_paiements_course` (`course_id`),
  KEY `idx_paiements_type` (`type_paiement`),
  KEY `idx_paiements_date` (`date_paiement`),
  CONSTRAINT `fk_paiements_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiements`
--

LOCK TABLES `paiements` WRITE;
/*!40000 ALTER TABLE `paiements` DISABLE KEYS */;
INSERT INTO `paiements` VALUES (1,3,'carte',4419.00,'valide','2026-05-23 17:13:00','2026-05-23 17:13:00','2026-05-23 17:13:00'),(2,4,'mobile_money',1567.00,'valide','2026-04-17 15:09:00','2026-04-17 15:09:00','2026-04-17 15:09:00'),(3,5,'mobile_money',3957.00,'valide','2026-06-20 16:12:00','2026-06-20 16:12:00','2026-06-20 16:12:00'),(4,6,'mobile_money',14.27,'valide','2026-04-08 18:01:00','2026-04-08 18:01:00','2026-04-08 18:01:00'),(5,8,'autre',13598.00,'valide','2026-06-09 18:03:00','2026-06-09 18:03:00','2026-06-09 18:03:00'),(6,9,'mobile_money',1609.00,'valide','2026-07-15 13:45:00','2026-07-15 13:45:00','2026-07-15 13:45:00'),(7,10,'especes',2611.00,'valide','2026-04-04 18:50:00','2026-04-04 18:50:00','2026-04-04 18:50:00'),(8,12,'especes',5223.00,'valide','2026-04-18 18:52:00','2026-04-18 18:52:00','2026-04-18 18:52:00'),(9,13,'mobile_money',10871.00,'valide','2026-07-09 14:27:00','2026-07-09 14:27:00','2026-07-09 14:27:00'),(10,14,'especes',5701.00,'valide','2026-06-11 16:47:00','2026-06-11 16:47:00','2026-06-11 16:47:00'),(11,15,'especes',4631.00,'valide','2026-04-20 14:03:00','2026-04-20 14:03:00','2026-04-20 14:03:00'),(12,16,'especes',7242.00,'valide','2026-06-16 10:45:00','2026-06-16 10:45:00','2026-06-16 10:45:00'),(13,18,'especes',78.13,'valide','2026-03-31 10:38:00','2026-03-31 10:38:00','2026-03-31 10:38:00'),(14,20,'mobile_money',7587.00,'valide','2026-06-24 12:13:00','2026-06-24 12:13:00','2026-06-24 12:13:00'),(15,21,'mobile_money',5540.00,'valide','2026-04-12 06:42:00','2026-04-12 06:42:00','2026-04-12 06:42:00'),(16,22,'especes',10627.00,'valide','2026-05-08 14:27:00','2026-05-08 14:27:00','2026-05-08 14:27:00'),(17,23,'autre',6566.00,'valide','2026-07-12 22:54:00','2026-07-12 22:54:00','2026-07-12 22:54:00'),(18,24,'autre',3718.00,'valide','2026-04-04 15:09:00','2026-04-04 15:09:00','2026-04-04 15:09:00'),(19,25,'especes',1571.00,'valide','2026-04-30 08:33:00','2026-04-30 08:33:00','2026-04-30 08:33:00'),(20,28,'mobile_money',6157.00,'valide','2026-04-21 13:05:00','2026-04-21 13:05:00','2026-04-21 13:05:00'),(21,30,'mobile_money',4629.00,'valide','2026-06-12 20:47:00','2026-06-12 20:47:00','2026-06-12 20:47:00'),(22,32,'mobile_money',2422.00,'valide','2026-06-19 20:43:00','2026-06-19 20:43:00','2026-06-19 20:43:00'),(23,33,'mobile_money',14529.00,'valide','2026-06-14 21:55:00','2026-06-14 21:55:00','2026-06-14 21:55:00'),(24,34,'especes',11.56,'valide','2026-05-28 09:46:00','2026-05-28 09:46:00','2026-05-28 09:46:00'),(25,36,'mobile_money',2733.00,'valide','2026-07-12 07:08:00','2026-07-12 07:08:00','2026-07-12 07:08:00'),(26,37,'especes',63.25,'valide','2026-06-19 13:20:00','2026-06-19 13:20:00','2026-06-19 13:20:00'),(27,38,'mobile_money',2593.00,'valide','2026-04-11 23:18:00','2026-04-11 23:18:00','2026-04-11 23:18:00'),(28,39,'mobile_money',3261.00,'valide','2026-06-10 22:09:00','2026-06-10 22:09:00','2026-06-10 22:09:00'),(29,40,'especes',3323.00,'valide','2026-05-03 11:54:00','2026-05-03 11:54:00','2026-05-03 11:54:00'),(30,41,'autre',3278.00,'valide','2026-07-13 20:53:00','2026-07-13 20:53:00','2026-07-13 20:53:00'),(31,43,'mobile_money',2997.00,'valide','2026-05-31 22:34:00','2026-05-31 22:34:00','2026-05-31 22:34:00'),(32,44,'especes',20.80,'valide','2026-04-15 23:56:00','2026-04-15 23:56:00','2026-04-15 23:56:00'),(33,45,'carte',9467.00,'valide','2026-05-22 09:21:00','2026-05-22 09:21:00','2026-05-22 09:21:00'),(34,46,'especes',26.81,'valide','2026-07-05 14:46:00','2026-07-05 14:46:00','2026-07-05 14:46:00'),(35,49,'especes',26.40,'valide','2026-06-12 23:51:00','2026-06-12 23:51:00','2026-06-12 23:51:00'),(36,50,'especes',1649.00,'valide','2026-04-06 22:45:00','2026-04-06 22:45:00','2026-04-06 22:45:00'),(37,51,'especes',40.72,'valide','2026-05-25 09:39:00','2026-05-25 09:39:00','2026-05-25 09:39:00'),(38,52,'mobile_money',31.07,'valide','2026-04-29 16:17:00','2026-04-29 16:17:00','2026-04-29 16:17:00'),(39,55,'mobile_money',3488.00,'valide','2026-03-19 14:18:00','2026-03-19 14:18:00','2026-03-19 14:18:00'),(40,58,'mobile_money',14895.00,'valide','2026-06-02 19:46:00','2026-06-02 19:46:00','2026-06-02 19:46:00'),(41,59,'especes',88.23,'valide','2026-06-25 08:39:00','2026-06-25 08:39:00','2026-06-25 08:39:00'),(42,60,'mobile_money',30.90,'valide','2026-06-17 16:35:00','2026-06-17 16:35:00','2026-06-17 16:35:00'),(43,62,'mobile_money',2728.00,'valide','2026-05-17 10:58:00','2026-05-17 10:58:00','2026-05-17 10:58:00'),(44,63,'mobile_money',3811.00,'valide','2026-06-09 14:37:00','2026-06-09 14:37:00','2026-06-09 14:37:00'),(45,64,'autre',2321.00,'valide','2026-03-26 12:15:00','2026-03-26 12:15:00','2026-03-26 12:15:00'),(46,65,'mobile_money',6403.00,'valide','2026-05-21 16:18:00','2026-05-21 16:18:00','2026-05-21 16:18:00'),(47,66,'carte',13853.00,'valide','2026-06-14 10:51:00','2026-06-14 10:51:00','2026-06-14 10:51:00'),(48,67,'mobile_money',2083.00,'valide','2026-05-21 09:09:00','2026-05-21 09:09:00','2026-05-21 09:09:00'),(49,68,'mobile_money',5358.00,'valide','2026-05-27 22:16:00','2026-05-27 22:16:00','2026-05-27 22:16:00'),(50,69,'mobile_money',13272.00,'valide','2026-06-25 08:30:00','2026-06-25 08:30:00','2026-06-25 08:30:00'),(51,70,'especes',2419.00,'valide','2026-06-17 13:23:00','2026-06-17 13:23:00','2026-06-17 13:23:00'),(52,72,'especes',3245.00,'valide','2026-05-27 10:56:00','2026-05-27 10:56:00','2026-05-27 10:56:00'),(53,73,'especes',45.55,'valide','2026-05-26 09:47:00','2026-05-26 09:47:00','2026-05-26 09:47:00'),(54,74,'carte',2295.00,'valide','2026-06-27 16:40:00','2026-06-27 16:40:00','2026-06-27 16:40:00'),(55,75,'especes',2597.00,'valide','2026-05-15 08:43:00','2026-05-15 08:43:00','2026-05-15 08:43:00'),(56,76,'carte',29.28,'valide','2026-05-27 21:21:00','2026-05-27 21:21:00','2026-05-27 21:21:00'),(57,77,'autre',23.54,'valide','2026-06-09 08:19:00','2026-06-09 08:19:00','2026-06-09 08:19:00'),(58,78,'mobile_money',13395.00,'valide','2026-06-27 17:14:00','2026-06-27 17:14:00','2026-06-27 17:14:00'),(59,79,'especes',76.55,'valide','2026-04-18 08:37:00','2026-04-18 08:37:00','2026-04-18 08:37:00'),(60,80,'mobile_money',2141.00,'valide','2026-05-10 16:20:00','2026-05-10 16:20:00','2026-05-10 16:20:00'),(61,83,'especes',17.68,'valide','2026-03-23 22:29:00','2026-03-23 22:29:00','2026-03-23 22:29:00'),(62,84,'autre',30.39,'valide','2026-06-10 14:03:00','2026-06-10 14:03:00','2026-06-10 14:03:00'),(63,85,'mobile_money',12.55,'valide','2026-04-23 18:27:00','2026-04-23 18:27:00','2026-04-23 18:27:00'),(64,86,'especes',8137.00,'valide','2026-04-16 13:39:00','2026-04-16 13:39:00','2026-04-16 13:39:00'),(65,88,'especes',12038.00,'valide','2026-03-27 12:24:00','2026-03-27 12:24:00','2026-03-27 12:24:00'),(66,90,'mobile_money',8398.00,'valide','2026-06-15 11:49:00','2026-06-15 11:49:00','2026-06-15 11:49:00'),(67,91,'especes',4058.00,'valide','2026-05-04 06:13:00','2026-05-04 06:13:00','2026-05-04 06:13:00'),(68,92,'especes',4814.00,'valide','2026-04-15 17:46:00','2026-04-15 17:46:00','2026-04-15 17:46:00'),(69,93,'especes',2534.00,'valide','2026-06-06 07:42:00','2026-06-06 07:42:00','2026-06-06 07:42:00'),(70,94,'especes',4659.00,'valide','2026-07-12 19:17:00','2026-07-12 19:17:00','2026-07-12 19:17:00'),(71,95,'autre',7364.00,'valide','2026-04-11 08:11:00','2026-04-11 08:11:00','2026-04-11 08:11:00'),(72,97,'autre',9.42,'valide','2026-07-15 11:31:00','2026-07-15 11:31:00','2026-07-15 11:31:00'),(73,98,'mobile_money',4020.00,'valide','2026-06-11 23:39:00','2026-06-11 23:39:00','2026-06-11 23:39:00'),(74,99,'mobile_money',9433.00,'valide','2026-06-04 19:57:00','2026-06-04 19:57:00','2026-06-04 19:57:00'),(75,100,'autre',6319.00,'valide','2026-05-19 07:38:00','2026-05-19 07:38:00','2026-05-19 07:38:00'),(76,101,'especes',26.36,'valide','2026-06-08 16:40:00','2026-06-08 16:40:00','2026-06-08 16:40:00'),(77,103,'mobile_money',1273.00,'valide','2026-06-13 11:12:00','2026-06-13 11:12:00','2026-06-13 11:12:00'),(78,104,'especes',46.60,'valide','2026-06-18 06:50:00','2026-06-18 06:50:00','2026-06-18 06:50:00'),(79,106,'especes',9993.00,'valide','2026-05-19 09:08:00','2026-05-19 09:08:00','2026-05-19 09:08:00'),(80,107,'carte',4889.00,'valide','2026-03-19 19:54:00','2026-03-19 19:54:00','2026-03-19 19:54:00'),(81,109,'especes',2784.00,'valide','2026-03-27 13:17:00','2026-03-27 13:17:00','2026-03-27 13:17:00'),(82,110,'mobile_money',2178.00,'valide','2026-03-22 09:58:00','2026-03-22 09:58:00','2026-03-22 09:58:00'),(83,111,'especes',12.99,'valide','2026-05-15 23:23:00','2026-05-15 23:23:00','2026-05-15 23:23:00'),(84,112,'especes',10629.00,'valide','2026-07-15 16:13:00','2026-07-15 16:13:00','2026-07-15 16:13:00'),(85,113,'mobile_money',26.76,'valide','2026-04-16 06:22:00','2026-04-16 06:22:00','2026-04-16 06:22:00'),(86,114,'mobile_money',39.73,'valide','2026-04-14 08:52:00','2026-04-14 08:52:00','2026-04-14 08:52:00'),(87,115,'especes',11.09,'valide','2026-05-15 07:46:00','2026-05-15 07:46:00','2026-05-15 07:46:00'),(88,117,'mobile_money',3595.00,'valide','2026-06-20 14:50:00','2026-06-20 14:50:00','2026-06-20 14:50:00'),(89,118,'especes',3288.00,'valide','2026-04-03 12:53:00','2026-04-03 12:53:00','2026-04-03 12:53:00'),(90,120,'mobile_money',13156.00,'valide','2026-03-27 14:50:00','2026-03-27 14:50:00','2026-03-27 14:50:00'),(91,121,'mobile_money',36.47,'valide','2026-03-31 22:35:00','2026-03-31 22:35:00','2026-03-31 22:35:00'),(92,122,'especes',24.78,'valide','2026-05-20 21:34:00','2026-05-20 21:34:00','2026-05-20 21:34:00'),(93,124,'mobile_money',11281.00,'valide','2026-07-12 07:22:00','2026-07-12 07:22:00','2026-07-12 07:22:00'),(94,125,'mobile_money',3911.00,'valide','2026-06-27 20:01:00','2026-06-27 20:01:00','2026-06-27 20:01:00'),(95,126,'autre',4786.00,'valide','2026-07-02 23:17:00','2026-07-02 23:17:00','2026-07-02 23:17:00'),(96,127,'mobile_money',5161.00,'valide','2026-07-05 18:29:00','2026-07-05 18:29:00','2026-07-05 18:29:00'),(97,128,'mobile_money',14.30,'valide','2026-05-24 16:02:00','2026-05-24 16:02:00','2026-05-24 16:02:00'),(98,129,'especes',3252.00,'valide','2026-05-03 11:02:00','2026-05-03 11:02:00','2026-05-03 11:02:00'),(99,131,'mobile_money',5858.00,'valide','2026-05-03 11:12:00','2026-05-03 11:12:00','2026-05-03 11:12:00'),(100,132,'autre',5786.00,'valide','2026-06-30 14:39:00','2026-06-30 14:39:00','2026-06-30 14:39:00'),(101,135,'mobile_money',67.32,'valide','2026-07-13 17:12:00','2026-07-13 17:12:00','2026-07-13 17:12:00'),(102,136,'carte',4557.00,'valide','2026-06-04 12:27:00','2026-06-04 12:27:00','2026-06-04 12:27:00'),(103,137,'autre',1658.00,'valide','2026-05-31 14:18:00','2026-05-31 14:18:00','2026-05-31 14:18:00'),(104,138,'especes',11.04,'valide','2026-06-29 07:40:00','2026-06-29 07:40:00','2026-06-29 07:40:00'),(105,139,'mobile_money',1333.00,'valide','2026-04-05 10:08:00','2026-04-05 10:08:00','2026-04-05 10:08:00'),(106,140,'especes',16.03,'valide','2026-04-27 18:14:00','2026-04-27 18:14:00','2026-04-27 18:14:00'),(107,141,'mobile_money',49.92,'valide','2026-05-20 06:37:00','2026-05-20 06:37:00','2026-05-20 06:37:00'),(108,142,'especes',10032.00,'valide','2026-04-20 22:03:00','2026-04-20 22:03:00','2026-04-20 22:03:00'),(109,144,'especes',7059.00,'valide','2026-05-16 14:26:00','2026-05-16 14:26:00','2026-05-16 14:26:00'),(110,145,'autre',55.22,'valide','2026-06-08 06:21:00','2026-06-08 06:21:00','2026-06-08 06:21:00'),(111,146,'mobile_money',2503.00,'valide','2026-05-09 19:15:00','2026-05-09 19:15:00','2026-05-09 19:15:00'),(112,147,'mobile_money',31.03,'valide','2026-07-15 13:23:00','2026-07-15 13:23:00','2026-07-15 13:23:00'),(113,148,'mobile_money',5928.00,'valide','2026-07-03 12:43:00','2026-07-03 12:43:00','2026-07-03 12:43:00'),(114,149,'mobile_money',7447.00,'valide','2026-04-30 07:16:00','2026-04-30 07:16:00','2026-04-30 07:16:00'),(115,152,'mobile_money',6588.00,'valide','2026-06-30 09:57:00','2026-06-30 09:57:00','2026-06-30 09:57:00'),(116,153,'especes',14878.00,'valide','2026-05-02 08:29:00','2026-05-02 08:29:00','2026-05-02 08:29:00'),(117,154,'mobile_money',5567.00,'valide','2026-04-19 06:43:00','2026-04-19 06:43:00','2026-04-19 06:43:00'),(118,155,'mobile_money',14429.00,'valide','2026-05-02 12:14:00','2026-05-02 12:14:00','2026-05-02 12:14:00'),(119,157,'mobile_money',4293.00,'valide','2026-05-05 12:01:00','2026-05-05 12:01:00','2026-05-05 12:01:00'),(120,158,'carte',29.92,'valide','2026-04-06 06:59:00','2026-04-06 06:59:00','2026-04-06 06:59:00'),(121,160,'autre',22.53,'valide','2026-04-12 21:14:00','2026-04-12 21:14:00','2026-04-12 21:14:00'),(122,161,'carte',40.58,'valide','2026-04-20 07:59:00','2026-04-20 07:59:00','2026-04-20 07:59:00'),(123,162,'autre',2225.00,'valide','2026-04-24 07:44:00','2026-04-24 07:44:00','2026-04-24 07:44:00'),(124,164,'mobile_money',4518.00,'valide','2026-06-27 19:57:00','2026-06-27 19:57:00','2026-06-27 19:57:00'),(125,167,'especes',2208.00,'valide','2026-06-27 20:57:00','2026-06-27 20:57:00','2026-06-27 20:57:00'),(126,168,'mobile_money',3995.00,'valide','2026-04-01 09:57:00','2026-04-01 09:57:00','2026-04-01 09:57:00'),(127,171,'mobile_money',13.36,'valide','2026-05-24 14:20:00','2026-05-24 14:20:00','2026-05-24 14:20:00'),(128,172,'autre',88.46,'valide','2026-04-27 19:25:00','2026-04-27 19:25:00','2026-04-27 19:25:00'),(129,174,'especes',4875.00,'valide','2026-05-05 13:18:00','2026-05-05 13:18:00','2026-05-05 13:18:00'),(130,175,'especes',59.73,'valide','2026-04-28 18:42:00','2026-04-28 18:42:00','2026-04-28 18:42:00'),(131,176,'autre',9993.00,'valide','2026-06-01 07:05:00','2026-06-01 07:05:00','2026-06-01 07:05:00'),(132,177,'mobile_money',5347.00,'valide','2026-05-19 15:34:00','2026-05-19 15:34:00','2026-05-19 15:34:00'),(133,178,'carte',89.64,'valide','2026-06-10 22:37:00','2026-06-10 22:37:00','2026-06-10 22:37:00'),(134,179,'mobile_money',14678.00,'valide','2026-03-19 13:16:00','2026-03-19 13:16:00','2026-03-19 13:16:00'),(135,181,'especes',5737.00,'valide','2026-06-11 10:49:00','2026-06-11 10:49:00','2026-06-11 10:49:00'),(136,182,'carte',19.71,'valide','2026-03-26 20:00:00','2026-03-26 20:00:00','2026-03-26 20:00:00'),(137,183,'carte',3293.00,'valide','2026-07-11 22:24:00','2026-07-11 22:24:00','2026-07-11 22:24:00'),(138,184,'mobile_money',7950.00,'echoue','2026-04-28 14:31:00','2026-04-28 14:31:00','2026-04-28 14:31:00'),(139,186,'mobile_money',14.00,'valide','2026-04-03 12:35:00','2026-04-03 12:35:00','2026-04-03 12:35:00'),(140,187,'carte',45.31,'valide','2026-07-06 20:11:00','2026-07-06 20:11:00','2026-07-06 20:11:00'),(141,188,'mobile_money',6313.00,'valide','2026-06-14 13:40:00','2026-06-14 13:40:00','2026-06-14 13:40:00'),(142,189,'mobile_money',37.16,'valide','2026-06-22 16:25:00','2026-06-22 16:25:00','2026-06-22 16:25:00'),(143,190,'mobile_money',3808.00,'valide','2026-05-10 10:02:00','2026-05-10 10:02:00','2026-05-10 10:02:00'),(144,192,'especes',14.80,'valide','2026-06-09 11:05:00','2026-06-09 11:05:00','2026-06-09 11:05:00'),(145,195,'mobile_money',10085.00,'valide','2026-06-11 14:55:00','2026-06-11 14:55:00','2026-06-11 14:55:00'),(146,196,'especes',5837.00,'valide','2026-06-28 08:33:00','2026-06-28 08:33:00','2026-06-28 08:33:00'),(147,198,'especes',32.95,'valide','2026-05-28 23:14:00','2026-05-28 23:14:00','2026-05-28 23:14:00'),(148,199,'mobile_money',11.95,'valide','2026-05-19 07:04:00','2026-05-19 07:04:00','2026-05-19 07:04:00'),(149,201,'especes',3865.00,'valide','2026-07-09 14:57:00','2026-07-09 14:57:00','2026-07-09 14:57:00'),(150,202,'mobile_money',11.98,'valide','2026-05-14 06:44:00','2026-05-14 06:44:00','2026-05-14 06:44:00'),(151,204,'mobile_money',3076.00,'valide','2026-04-28 15:37:00','2026-04-28 15:37:00','2026-04-28 15:37:00'),(152,205,'carte',6592.00,'valide','2026-04-06 14:51:00','2026-04-06 14:51:00','2026-04-06 14:51:00'),(153,206,'especes',3602.00,'valide','2026-06-07 07:01:00','2026-06-07 07:01:00','2026-06-07 07:01:00'),(154,207,'mobile_money',3499.00,'valide','2026-04-30 06:00:00','2026-04-30 06:00:00','2026-04-30 06:00:00'),(155,208,'mobile_money',2786.00,'valide','2026-07-05 13:28:00','2026-07-05 13:28:00','2026-07-05 13:28:00'),(156,212,'mobile_money',4811.00,'valide','2026-06-08 18:28:00','2026-06-08 18:28:00','2026-06-08 18:28:00'),(157,213,'especes',2161.00,'valide','2026-04-03 18:39:00','2026-04-03 18:39:00','2026-04-03 18:39:00'),(158,216,'carte',5464.00,'valide','2026-07-12 14:32:00','2026-07-12 14:32:00','2026-07-12 14:32:00'),(159,217,'mobile_money',2118.00,'valide','2026-06-26 23:37:00','2026-06-26 23:37:00','2026-06-26 23:37:00'),(160,218,'carte',1787.00,'valide','2026-04-05 22:22:00','2026-04-05 22:22:00','2026-04-05 22:22:00'),(161,219,'mobile_money',59.70,'valide','2026-05-11 07:22:00','2026-05-11 07:22:00','2026-05-11 07:22:00'),(162,220,'especes',9.67,'valide','2026-04-17 11:11:00','2026-04-17 11:11:00','2026-04-17 11:11:00'),(163,221,'especes',14.09,'valide','2026-05-07 20:38:00','2026-05-07 20:38:00','2026-05-07 20:38:00'),(164,222,'especes',6521.00,'valide','2026-06-29 11:11:00','2026-06-29 11:11:00','2026-06-29 11:11:00'),(165,224,'mobile_money',53.70,'valide','2026-06-11 17:06:00','2026-06-11 17:06:00','2026-06-11 17:06:00'),(166,225,'mobile_money',14943.00,'valide','2026-07-05 10:44:00','2026-07-05 10:44:00','2026-07-05 10:44:00'),(167,226,'autre',36.83,'valide','2026-07-07 10:45:00','2026-07-07 10:45:00','2026-07-07 10:45:00'),(168,227,'mobile_money',4252.00,'valide','2026-07-09 13:17:00','2026-07-09 13:17:00','2026-07-09 13:17:00'),(169,230,'especes',17.09,'valide','2026-04-15 20:35:00','2026-04-15 20:35:00','2026-04-15 20:35:00'),(170,231,'autre',2093.00,'valide','2026-05-22 23:22:00','2026-05-22 23:22:00','2026-05-22 23:22:00'),(171,232,'especes',40.24,'valide','2026-04-23 22:37:00','2026-04-23 22:37:00','2026-04-23 22:37:00'),(172,234,'mobile_money',2604.00,'valide','2026-04-29 14:57:00','2026-04-29 14:57:00','2026-04-29 14:57:00'),(173,235,'autre',3658.00,'valide','2026-07-04 08:57:00','2026-07-04 08:57:00','2026-07-04 08:57:00'),(174,237,'autre',7287.00,'valide','2026-06-28 08:37:00','2026-06-28 08:37:00','2026-06-28 08:37:00'),(175,239,'mobile_money',5751.00,'valide','2026-07-10 16:24:00','2026-07-10 16:24:00','2026-07-10 16:24:00'),(176,241,'mobile_money',25.79,'valide','2026-05-24 22:02:00','2026-05-24 22:02:00','2026-05-24 22:02:00'),(177,244,'mobile_money',6930.00,'valide','2026-05-16 07:21:00','2026-05-16 07:21:00','2026-05-16 07:21:00'),(178,245,'mobile_money',5862.00,'valide','2026-05-17 11:13:00','2026-05-17 11:13:00','2026-05-17 11:13:00'),(179,246,'autre',1808.00,'valide','2026-05-25 06:36:00','2026-05-25 06:36:00','2026-05-25 06:36:00'),(180,247,'especes',7553.00,'valide','2026-04-25 18:25:00','2026-04-25 18:25:00','2026-04-25 18:25:00'),(181,248,'mobile_money',5670.00,'valide','2026-06-06 14:21:00','2026-06-06 14:21:00','2026-06-06 14:21:00'),(182,249,'mobile_money',7271.00,'valide','2026-03-31 07:46:00','2026-03-31 07:46:00','2026-03-31 07:46:00'),(183,250,'mobile_money',29.44,'valide','2026-05-27 23:40:00','2026-05-27 23:40:00','2026-05-27 23:40:00'),(184,252,'autre',5017.00,'valide','2026-04-14 12:35:00','2026-04-14 12:35:00','2026-04-14 12:35:00'),(185,253,'mobile_money',3251.00,'valide','2026-04-15 12:13:00','2026-04-15 12:13:00','2026-04-15 12:13:00'),(186,255,'mobile_money',16.45,'valide','2026-06-11 23:14:00','2026-06-11 23:14:00','2026-06-11 23:14:00'),(187,257,'especes',3592.00,'valide','2026-06-10 06:59:00','2026-06-10 06:59:00','2026-06-10 06:59:00'),(188,259,'autre',4283.00,'valide','2026-05-08 17:19:00','2026-05-08 17:19:00','2026-05-08 17:19:00'),(189,261,'especes',3017.00,'valide','2026-05-03 22:44:00','2026-05-03 22:44:00','2026-05-03 22:44:00'),(190,262,'especes',5925.00,'valide','2026-06-13 22:44:00','2026-06-13 22:44:00','2026-06-13 22:44:00'),(191,263,'especes',4320.00,'valide','2026-05-12 14:19:00','2026-05-12 14:19:00','2026-05-12 14:19:00'),(192,264,'carte',10.89,'valide','2026-06-09 19:41:00','2026-06-09 19:41:00','2026-06-09 19:41:00'),(193,265,'especes',3985.00,'echoue','2026-06-29 08:57:00','2026-06-29 08:57:00','2026-06-29 08:57:00'),(194,266,'mobile_money',1858.00,'valide','2026-06-22 06:08:00','2026-06-22 06:08:00','2026-06-22 06:08:00'),(195,267,'mobile_money',10.28,'valide','2026-05-15 11:04:00','2026-05-15 11:04:00','2026-05-15 11:04:00'),(196,268,'carte',6000.00,'valide','2026-05-05 13:42:00','2026-05-05 13:42:00','2026-05-05 13:42:00'),(197,269,'especes',1135.00,'valide','2026-03-27 14:51:00','2026-03-27 14:51:00','2026-03-27 14:51:00'),(198,271,'especes',4769.00,'valide','2026-04-13 18:42:00','2026-04-13 18:42:00','2026-04-13 18:42:00'),(199,272,'especes',39.12,'valide','2026-05-06 23:34:00','2026-05-06 23:34:00','2026-05-06 23:34:00'),(200,273,'carte',3845.00,'valide','2026-05-24 12:53:00','2026-05-24 12:53:00','2026-05-24 12:53:00'),(201,274,'especes',74.80,'valide','2026-06-22 07:03:00','2026-06-22 07:03:00','2026-06-22 07:03:00'),(202,275,'carte',61.07,'valide','2026-06-29 21:42:00','2026-06-29 21:42:00','2026-06-29 21:42:00'),(203,276,'carte',39.52,'echoue','2026-06-22 10:04:00','2026-06-22 10:04:00','2026-06-22 10:04:00'),(204,277,'autre',8920.00,'valide','2026-06-08 12:28:00','2026-06-08 12:28:00','2026-06-08 12:28:00'),(205,281,'especes',57.92,'valide','2026-05-20 16:26:00','2026-05-20 16:26:00','2026-05-20 16:26:00'),(206,282,'mobile_money',2755.00,'valide','2026-06-09 06:16:00','2026-06-09 06:16:00','2026-06-09 06:16:00'),(207,283,'carte',1347.00,'valide','2026-04-02 19:57:00','2026-04-02 19:57:00','2026-04-02 19:57:00'),(208,285,'mobile_money',1030.00,'valide','2026-07-07 22:16:00','2026-07-07 22:16:00','2026-07-07 22:16:00'),(209,287,'carte',1435.00,'valide','2026-07-11 14:50:00','2026-07-11 14:50:00','2026-07-11 14:50:00'),(210,288,'carte',6891.00,'valide','2026-04-21 07:07:00','2026-04-21 07:07:00','2026-04-21 07:07:00'),(211,289,'autre',3107.00,'valide','2026-03-31 19:11:00','2026-03-31 19:11:00','2026-03-31 19:11:00'),(212,290,'autre',4163.00,'valide','2026-04-05 22:51:00','2026-04-05 22:51:00','2026-04-05 22:51:00'),(213,291,'mobile_money',3633.00,'valide','2026-04-15 16:20:00','2026-04-15 16:20:00','2026-04-15 16:20:00'),(214,292,'especes',5530.00,'valide','2026-03-23 08:41:00','2026-03-23 08:41:00','2026-03-23 08:41:00'),(215,293,'mobile_money',3298.00,'valide','2026-06-03 20:55:00','2026-06-03 20:55:00','2026-06-03 20:55:00'),(216,296,'mobile_money',7571.00,'valide','2026-05-11 11:09:00','2026-05-11 11:09:00','2026-05-11 11:09:00'),(217,299,'mobile_money',5106.00,'valide','2026-07-09 11:59:00','2026-07-09 11:59:00','2026-07-09 11:59:00'),(218,300,'especes',1601.00,'valide','2026-04-21 08:25:00','2026-04-21 08:25:00','2026-04-21 08:25:00'),(219,301,'mobile_money',7930.00,'valide','2026-06-26 20:23:00','2026-06-26 20:23:00','2026-06-26 20:23:00'),(220,303,'autre',2819.00,'valide','2026-07-11 17:53:00','2026-07-11 17:53:00','2026-07-11 17:53:00'),(221,304,'mobile_money',1916.00,'valide','2026-06-18 12:56:00','2026-06-18 12:56:00','2026-06-18 12:56:00'),(222,305,'autre',25.97,'valide','2026-06-10 10:27:00','2026-06-10 10:27:00','2026-06-10 10:27:00'),(223,307,'mobile_money',5430.00,'valide','2026-05-18 22:12:00','2026-05-18 22:12:00','2026-05-18 22:12:00'),(224,308,'carte',4346.00,'valide','2026-05-18 06:05:00','2026-05-18 06:05:00','2026-05-18 06:05:00'),(225,309,'especes',29.03,'valide','2026-06-17 07:50:00','2026-06-17 07:50:00','2026-06-17 07:50:00'),(226,310,'especes',3545.00,'valide','2026-06-19 20:23:00','2026-06-19 20:23:00','2026-06-19 20:23:00'),(227,311,'autre',4123.00,'valide','2026-06-30 14:20:00','2026-06-30 14:20:00','2026-06-30 14:20:00'),(228,312,'especes',3429.00,'valide','2026-04-28 14:10:00','2026-04-28 14:10:00','2026-04-28 14:10:00'),(229,313,'autre',18.32,'valide','2026-05-11 17:14:00','2026-05-11 17:14:00','2026-05-11 17:14:00'),(230,314,'especes',69.80,'valide','2026-04-03 21:49:00','2026-04-03 21:49:00','2026-04-03 21:49:00'),(231,315,'mobile_money',10254.00,'valide','2026-04-26 13:18:00','2026-04-26 13:18:00','2026-04-26 13:18:00'),(232,317,'mobile_money',65.45,'valide','2026-04-28 19:16:00','2026-04-28 19:16:00','2026-04-28 19:16:00'),(233,318,'carte',18.26,'valide','2026-07-11 13:51:00','2026-07-11 13:51:00','2026-07-11 13:51:00'),(234,319,'mobile_money',5141.00,'valide','2026-05-27 18:42:00','2026-05-27 18:42:00','2026-05-27 18:42:00'),(235,321,'carte',7404.00,'valide','2026-03-30 13:31:00','2026-03-30 13:31:00','2026-03-30 13:31:00'),(236,322,'mobile_money',5174.00,'valide','2026-04-18 22:03:00','2026-04-18 22:03:00','2026-04-18 22:03:00'),(237,323,'mobile_money',4496.00,'valide','2026-05-12 13:31:00','2026-05-12 13:31:00','2026-05-12 13:31:00'),(238,325,'mobile_money',3185.00,'valide','2026-04-25 08:28:00','2026-04-25 08:28:00','2026-04-25 08:28:00'),(239,326,'mobile_money',4056.00,'valide','2026-05-09 17:11:00','2026-05-09 17:11:00','2026-05-09 17:11:00'),(240,327,'mobile_money',2095.00,'valide','2026-04-16 22:34:00','2026-04-16 22:34:00','2026-04-16 22:34:00'),(241,328,'carte',8.81,'valide','2026-06-01 14:07:00','2026-06-01 14:07:00','2026-06-01 14:07:00'),(242,329,'mobile_money',22.58,'valide','2026-06-05 07:02:00','2026-06-05 07:02:00','2026-06-05 07:02:00'),(243,330,'carte',12.76,'valide','2026-03-24 19:15:00','2026-03-24 19:15:00','2026-03-24 19:15:00'),(244,331,'especes',18.19,'valide','2026-06-01 10:33:00','2026-06-01 10:33:00','2026-06-01 10:33:00'),(245,332,'autre',5287.00,'valide','2026-04-08 15:20:00','2026-04-08 15:20:00','2026-04-08 15:20:00'),(246,333,'carte',1611.00,'valide','2026-04-05 17:29:00','2026-04-05 17:29:00','2026-04-05 17:29:00'),(247,334,'carte',3555.00,'echoue','2026-05-30 22:00:00','2026-05-30 22:00:00','2026-05-30 22:00:00'),(248,335,'especes',14643.00,'valide','2026-04-06 12:45:00','2026-04-06 12:45:00','2026-04-06 12:45:00'),(249,336,'mobile_money',4695.00,'valide','2026-05-14 07:30:00','2026-05-14 07:30:00','2026-05-14 07:30:00'),(250,337,'especes',23.87,'valide','2026-03-29 14:26:00','2026-03-29 14:26:00','2026-03-29 14:26:00'),(251,338,'mobile_money',6745.00,'valide','2026-03-23 18:08:00','2026-03-23 18:08:00','2026-03-23 18:08:00'),(252,339,'mobile_money',4228.00,'valide','2026-04-14 22:10:00','2026-04-14 22:10:00','2026-04-14 22:10:00'),(253,341,'carte',4968.00,'valide','2026-06-29 14:52:00','2026-06-29 14:52:00','2026-06-29 14:52:00'),(254,342,'especes',1197.00,'valide','2026-06-06 14:53:00','2026-06-06 14:53:00','2026-06-06 14:53:00'),(255,344,'mobile_money',77.68,'echoue','2026-05-31 07:09:00','2026-05-31 07:09:00','2026-05-31 07:09:00'),(256,345,'mobile_money',7015.00,'valide','2026-05-31 20:11:00','2026-05-31 20:11:00','2026-05-31 20:11:00'),(257,346,'carte',78.04,'valide','2026-05-01 14:47:00','2026-05-01 14:47:00','2026-05-01 14:47:00'),(258,347,'mobile_money',25.74,'valide','2026-04-16 17:03:00','2026-04-16 17:03:00','2026-04-16 17:03:00'),(259,349,'mobile_money',13573.00,'valide','2026-05-19 16:12:00','2026-05-19 16:12:00','2026-05-19 16:12:00'),(260,350,'especes',8.10,'valide','2026-06-01 13:19:00','2026-06-01 13:19:00','2026-06-01 13:19:00'),(261,351,'mobile_money',4006.00,'valide','2026-05-30 18:12:00','2026-05-30 18:12:00','2026-05-30 18:12:00'),(262,352,'mobile_money',10040.00,'valide','2026-07-07 08:21:00','2026-07-07 08:21:00','2026-07-07 08:21:00'),(263,353,'mobile_money',6468.00,'valide','2026-04-10 08:06:00','2026-04-10 08:06:00','2026-04-10 08:06:00'),(264,354,'mobile_money',2377.00,'valide','2026-05-29 16:56:00','2026-05-29 16:56:00','2026-05-29 16:56:00'),(265,355,'mobile_money',5053.00,'valide','2026-04-22 12:00:00','2026-04-22 12:00:00','2026-04-22 12:00:00'),(266,356,'carte',7666.00,'valide','2026-03-27 13:55:00','2026-03-27 13:55:00','2026-03-27 13:55:00'),(267,357,'especes',4049.00,'valide','2026-05-08 17:00:00','2026-05-08 17:00:00','2026-05-08 17:00:00'),(268,358,'carte',4489.00,'valide','2026-05-09 12:20:00','2026-05-09 12:20:00','2026-05-09 12:20:00'),(269,360,'especes',72.12,'valide','2026-05-25 09:05:00','2026-05-25 09:05:00','2026-05-25 09:05:00'),(270,361,'mobile_money',24.64,'valide','2026-04-25 19:18:00','2026-04-25 19:18:00','2026-04-25 19:18:00'),(271,362,'carte',3904.00,'valide','2026-06-23 16:00:00','2026-06-23 16:00:00','2026-06-23 16:00:00'),(272,365,'autre',1932.00,'valide','2026-04-16 18:33:00','2026-04-16 18:33:00','2026-04-16 18:33:00'),(273,366,'mobile_money',4271.00,'valide','2026-05-19 17:34:00','2026-05-19 17:34:00','2026-05-19 17:34:00'),(274,367,'mobile_money',4603.00,'valide','2026-04-20 22:29:00','2026-04-20 22:29:00','2026-04-20 22:29:00'),(275,368,'autre',36.17,'valide','2026-04-18 10:08:00','2026-04-18 10:08:00','2026-04-18 10:08:00'),(276,369,'mobile_money',5841.00,'valide','2026-06-19 10:38:00','2026-06-19 10:38:00','2026-06-19 10:38:00'),(277,370,'carte',4475.00,'valide','2026-06-15 09:28:00','2026-06-15 09:28:00','2026-06-15 09:28:00'),(278,371,'mobile_money',13304.00,'valide','2026-05-04 08:52:00','2026-05-04 08:52:00','2026-05-04 08:52:00'),(279,372,'mobile_money',9569.00,'valide','2026-05-07 15:56:00','2026-05-07 15:56:00','2026-05-07 15:56:00'),(280,373,'especes',14339.00,'valide','2026-04-25 20:17:00','2026-04-25 20:17:00','2026-04-25 20:17:00'),(281,374,'carte',9027.00,'valide','2026-04-27 18:43:00','2026-04-27 18:43:00','2026-04-27 18:43:00'),(282,375,'especes',4977.00,'valide','2026-05-09 13:00:00','2026-05-09 13:00:00','2026-05-09 13:00:00'),(283,376,'carte',19.41,'valide','2026-06-26 17:19:00','2026-06-26 17:19:00','2026-06-26 17:19:00'),(284,377,'mobile_money',20.56,'valide','2026-06-17 21:12:00','2026-06-17 21:12:00','2026-06-17 21:12:00'),(285,378,'carte',9.40,'valide','2026-05-18 12:37:00','2026-05-18 12:37:00','2026-05-18 12:37:00'),(286,380,'mobile_money',4594.00,'valide','2026-03-28 20:08:00','2026-03-28 20:08:00','2026-03-28 20:08:00'),(287,382,'mobile_money',2489.00,'valide','2026-06-15 10:55:00','2026-06-15 10:55:00','2026-06-15 10:55:00'),(288,383,'autre',14663.00,'valide','2026-04-14 10:42:00','2026-04-14 10:42:00','2026-04-14 10:42:00'),(289,384,'especes',15.90,'valide','2026-04-14 18:27:00','2026-04-14 18:27:00','2026-04-14 18:27:00'),(290,385,'especes',7053.00,'valide','2026-03-27 08:38:00','2026-03-27 08:38:00','2026-03-27 08:38:00'),(291,387,'carte',40.73,'valide','2026-04-05 14:48:00','2026-04-05 14:48:00','2026-04-05 14:48:00'),(292,388,'autre',51.77,'valide','2026-05-22 18:32:00','2026-05-22 18:32:00','2026-05-22 18:32:00'),(293,389,'especes',10.46,'valide','2026-05-06 13:50:00','2026-05-06 13:50:00','2026-05-06 13:50:00'),(294,390,'autre',8446.00,'valide','2026-04-03 21:44:00','2026-04-03 21:44:00','2026-04-03 21:44:00'),(295,391,'mobile_money',8521.00,'valide','2026-03-23 17:35:00','2026-03-23 17:35:00','2026-03-23 17:35:00'),(296,392,'especes',4445.00,'valide','2026-07-14 20:07:00','2026-07-14 20:07:00','2026-07-14 20:07:00'),(297,393,'especes',28.37,'valide','2026-05-16 15:43:00','2026-05-16 15:43:00','2026-05-16 15:43:00'),(298,394,'mobile_money',3847.00,'valide','2026-04-27 12:51:00','2026-04-27 12:51:00','2026-04-27 12:51:00'),(299,395,'especes',5088.00,'valide','2026-05-19 15:35:00','2026-05-19 15:35:00','2026-05-19 15:35:00'),(300,396,'mobile_money',2367.00,'valide','2026-05-15 08:00:00','2026-05-15 08:00:00','2026-05-15 08:00:00'),(301,397,'carte',1514.00,'valide','2026-05-14 06:21:00','2026-05-14 06:21:00','2026-05-14 06:21:00'),(302,398,'mobile_money',2588.00,'valide','2026-03-22 21:46:00','2026-03-22 21:46:00','2026-03-22 21:46:00'),(303,399,'mobile_money',3598.00,'valide','2026-07-06 19:10:00','2026-07-06 19:10:00','2026-07-06 19:10:00'),(304,400,'especes',13673.00,'valide','2026-05-17 22:32:00','2026-05-17 22:32:00','2026-05-17 22:32:00'),(305,401,'especes',4659.00,'valide','2026-07-11 17:34:00','2026-07-11 17:34:00','2026-07-11 17:34:00'),(306,402,'autre',13405.00,'valide','2026-06-24 20:41:00','2026-06-24 20:41:00','2026-06-24 20:41:00'),(307,403,'mobile_money',9738.00,'valide','2026-06-18 16:06:00','2026-06-18 16:06:00','2026-06-18 16:06:00'),(308,405,'carte',8693.00,'valide','2026-06-03 18:32:00','2026-06-03 18:32:00','2026-06-03 18:32:00'),(309,406,'mobile_money',1597.00,'echoue','2026-06-22 12:08:00','2026-06-22 12:08:00','2026-06-22 12:08:00'),(310,407,'carte',2111.00,'valide','2026-07-02 14:34:00','2026-07-02 14:34:00','2026-07-02 14:34:00'),(311,408,'autre',12.02,'valide','2026-05-28 10:57:00','2026-05-28 10:57:00','2026-05-28 10:57:00'),(312,409,'mobile_money',59.33,'valide','2026-06-08 13:10:00','2026-06-08 13:10:00','2026-06-08 13:10:00'),(313,410,'carte',6903.00,'valide','2026-04-29 15:52:00','2026-04-29 15:52:00','2026-04-29 15:52:00'),(314,412,'especes',7192.00,'valide','2026-04-28 06:53:00','2026-04-28 06:53:00','2026-04-28 06:53:00'),(315,415,'mobile_money',15.63,'valide','2026-06-09 22:34:00','2026-06-09 22:34:00','2026-06-09 22:34:00'),(316,416,'mobile_money',4910.00,'valide','2026-05-14 14:09:00','2026-05-14 14:09:00','2026-05-14 14:09:00'),(317,418,'mobile_money',40.08,'valide','2026-07-07 23:05:00','2026-07-07 23:05:00','2026-07-07 23:05:00'),(318,419,'mobile_money',8568.00,'valide','2026-05-28 08:19:00','2026-05-28 08:19:00','2026-05-28 08:19:00'),(319,420,'mobile_money',2884.00,'valide','2026-04-30 13:20:00','2026-04-30 13:20:00','2026-04-30 13:20:00'),(320,421,'especes',4766.00,'valide','2026-07-04 12:22:00','2026-07-04 12:22:00','2026-07-04 12:22:00'),(321,422,'mobile_money',39.53,'valide','2026-05-20 15:03:00','2026-05-20 15:03:00','2026-05-20 15:03:00'),(322,425,'autre',5006.00,'valide','2026-05-28 21:39:00','2026-05-28 21:39:00','2026-05-28 21:39:00'),(323,426,'especes',11.36,'valide','2026-04-28 09:38:00','2026-04-28 09:38:00','2026-04-28 09:38:00'),(324,428,'especes',3612.00,'valide','2026-04-19 13:04:00','2026-04-19 13:04:00','2026-04-19 13:04:00'),(325,430,'autre',3958.00,'valide','2026-06-04 17:34:00','2026-06-04 17:34:00','2026-06-04 17:34:00'),(326,432,'carte',12960.00,'valide','2026-05-04 18:00:00','2026-05-04 18:00:00','2026-05-04 18:00:00'),(327,434,'carte',62.83,'valide','2026-06-24 09:12:00','2026-06-24 09:12:00','2026-06-24 09:12:00'),(328,435,'mobile_money',4071.00,'valide','2026-05-26 06:00:00','2026-05-26 06:00:00','2026-05-26 06:00:00'),(329,437,'especes',7768.00,'valide','2026-05-21 22:02:00','2026-05-21 22:02:00','2026-05-21 22:02:00'),(330,438,'especes',2038.00,'valide','2026-04-13 23:02:00','2026-04-13 23:02:00','2026-04-13 23:02:00'),(331,439,'mobile_money',71.23,'valide','2026-06-21 15:11:00','2026-06-21 15:11:00','2026-06-21 15:11:00'),(332,440,'mobile_money',7160.00,'valide','2026-04-15 13:37:00','2026-04-15 13:37:00','2026-04-15 13:37:00'),(333,441,'mobile_money',3562.00,'valide','2026-04-04 20:54:00','2026-04-04 20:54:00','2026-04-04 20:54:00'),(334,442,'especes',5458.00,'echoue','2026-04-13 09:07:00','2026-04-13 09:07:00','2026-04-13 09:07:00'),(335,443,'mobile_money',2068.00,'valide','2026-06-20 18:54:00','2026-06-20 18:54:00','2026-06-20 18:54:00'),(336,445,'mobile_money',4872.00,'valide','2026-06-04 19:51:00','2026-06-04 19:51:00','2026-06-04 19:51:00'),(337,446,'autre',12188.00,'valide','2026-04-23 11:42:00','2026-04-23 11:42:00','2026-04-23 11:42:00'),(338,447,'mobile_money',8809.00,'valide','2026-06-18 21:33:00','2026-06-18 21:33:00','2026-06-18 21:33:00'),(339,448,'mobile_money',4033.00,'valide','2026-05-21 12:35:00','2026-05-21 12:35:00','2026-05-21 12:35:00'),(340,449,'especes',4849.00,'valide','2026-06-28 22:38:00','2026-06-28 22:38:00','2026-06-28 22:38:00'),(341,450,'mobile_money',5936.00,'valide','2026-07-14 17:30:00','2026-07-14 17:30:00','2026-07-14 17:30:00'),(342,451,'mobile_money',13215.00,'valide','2026-03-26 15:58:00','2026-03-26 15:58:00','2026-03-26 15:58:00'),(343,452,'especes',14.74,'valide','2026-06-01 21:06:00','2026-06-01 21:06:00','2026-06-01 21:06:00'),(344,453,'especes',3141.00,'valide','2026-04-22 07:39:00','2026-04-22 07:39:00','2026-04-22 07:39:00'),(345,454,'mobile_money',26.99,'valide','2026-05-06 20:54:00','2026-05-06 20:54:00','2026-05-06 20:54:00'),(346,455,'mobile_money',9374.00,'valide','2026-03-23 17:54:00','2026-03-23 17:54:00','2026-03-23 17:54:00'),(347,457,'carte',5120.00,'valide','2026-07-09 16:49:00','2026-07-09 16:49:00','2026-07-09 16:49:00'),(348,459,'mobile_money',2694.00,'valide','2026-04-30 06:47:00','2026-04-30 06:47:00','2026-04-30 06:47:00'),(349,460,'mobile_money',2905.00,'valide','2026-07-10 07:59:00','2026-07-10 07:59:00','2026-07-10 07:59:00'),(350,462,'mobile_money',8898.00,'valide','2026-06-30 10:10:00','2026-06-30 10:10:00','2026-06-30 10:10:00'),(351,464,'especes',5061.00,'valide','2026-05-20 07:50:00','2026-05-20 07:50:00','2026-05-20 07:50:00'),(352,465,'autre',9032.00,'valide','2026-07-03 09:28:00','2026-07-03 09:28:00','2026-07-03 09:28:00'),(353,466,'mobile_money',2388.00,'valide','2026-04-02 12:39:00','2026-04-02 12:39:00','2026-04-02 12:39:00'),(354,468,'carte',9692.00,'valide','2026-04-20 20:50:00','2026-04-20 20:50:00','2026-04-20 20:50:00'),(355,470,'autre',7343.00,'valide','2026-03-29 12:24:00','2026-03-29 12:24:00','2026-03-29 12:24:00'),(356,473,'carte',13437.00,'valide','2026-05-18 11:25:00','2026-05-18 11:25:00','2026-05-18 11:25:00'),(357,475,'especes',6795.00,'valide','2026-04-28 19:16:00','2026-04-28 19:16:00','2026-04-28 19:16:00'),(358,476,'especes',34.90,'valide','2026-06-03 22:41:00','2026-06-03 22:41:00','2026-06-03 22:41:00'),(359,478,'mobile_money',5782.00,'valide','2026-03-27 15:35:00','2026-03-27 15:35:00','2026-03-27 15:35:00'),(360,479,'especes',9286.00,'valide','2026-06-23 10:00:00','2026-06-23 10:00:00','2026-06-23 10:00:00'),(361,480,'especes',2437.00,'valide','2026-06-08 22:53:00','2026-06-08 22:53:00','2026-06-08 22:53:00'),(362,481,'especes',23.68,'valide','2026-06-01 14:19:00','2026-06-01 14:19:00','2026-06-01 14:19:00'),(363,482,'mobile_money',5866.00,'valide','2026-04-09 15:58:00','2026-04-09 15:58:00','2026-04-09 15:58:00'),(364,483,'carte',4658.00,'valide','2026-04-21 16:27:00','2026-04-21 16:27:00','2026-04-21 16:27:00'),(365,484,'carte',3536.00,'valide','2026-04-01 08:09:00','2026-04-01 08:09:00','2026-04-01 08:09:00'),(366,487,'mobile_money',2790.00,'echoue','2026-06-20 10:01:00','2026-06-20 10:01:00','2026-06-20 10:01:00'),(367,488,'mobile_money',5522.00,'valide','2026-04-20 16:57:00','2026-04-20 16:57:00','2026-04-20 16:57:00'),(368,489,'mobile_money',14189.00,'valide','2026-04-11 07:31:00','2026-04-11 07:31:00','2026-04-11 07:31:00'),(369,490,'mobile_money',3114.00,'echoue','2026-03-19 23:29:00','2026-03-19 23:29:00','2026-03-19 23:29:00'),(370,491,'especes',4872.00,'valide','2026-06-19 16:45:00','2026-06-19 16:45:00','2026-06-19 16:45:00'),(371,493,'autre',19.07,'valide','2026-04-02 17:35:00','2026-04-02 17:35:00','2026-04-02 17:35:00'),(372,494,'mobile_money',2886.00,'valide','2026-05-22 18:27:00','2026-05-22 18:27:00','2026-05-22 18:27:00'),(373,496,'carte',1445.00,'echoue','2026-05-08 08:26:00','2026-05-08 08:26:00','2026-05-08 08:26:00'),(374,497,'mobile_money',20.13,'valide','2026-04-29 20:23:00','2026-04-29 20:23:00','2026-04-29 20:23:00'),(375,500,'mobile_money',20.81,'valide','2026-06-24 23:51:00','2026-06-24 23:51:00','2026-06-24 23:51:00'),(376,501,'mobile_money',1459.00,'valide','2026-06-01 08:52:00','2026-06-01 08:52:00','2026-06-01 08:52:00'),(377,502,'especes',4171.00,'valide','2026-04-23 12:54:00','2026-04-23 12:54:00','2026-04-23 12:54:00'),(378,503,'mobile_money',6170.00,'valide','2026-03-31 07:30:00','2026-03-31 07:30:00','2026-03-31 07:30:00'),(379,504,'mobile_money',6165.00,'echoue','2026-04-01 19:18:00','2026-04-01 19:18:00','2026-04-01 19:18:00'),(380,505,'mobile_money',10667.00,'valide','2026-05-31 19:11:00','2026-05-31 19:11:00','2026-05-31 19:11:00'),(381,506,'especes',13698.00,'valide','2026-05-07 09:02:00','2026-05-07 09:02:00','2026-05-07 09:02:00'),(382,507,'especes',22.70,'valide','2026-03-25 14:57:00','2026-03-25 14:57:00','2026-03-25 14:57:00'),(383,508,'carte',2057.00,'valide','2026-05-19 21:46:00','2026-05-19 21:46:00','2026-05-19 21:46:00'),(384,509,'autre',3767.00,'valide','2026-06-26 22:45:00','2026-06-26 22:45:00','2026-06-26 22:45:00'),(385,510,'especes',5445.00,'valide','2026-06-02 22:55:00','2026-06-02 22:55:00','2026-06-02 22:55:00'),(386,511,'especes',22.50,'valide','2026-04-29 07:48:00','2026-04-29 07:48:00','2026-04-29 07:48:00'),(387,513,'mobile_money',6324.00,'valide','2026-05-22 15:54:00','2026-05-22 15:54:00','2026-05-22 15:54:00'),(388,514,'mobile_money',3691.00,'valide','2026-06-14 21:32:00','2026-06-14 21:32:00','2026-06-14 21:32:00'),(389,515,'mobile_money',41.06,'valide','2026-04-03 19:36:00','2026-04-03 19:36:00','2026-04-03 19:36:00'),(390,516,'mobile_money',4425.00,'valide','2026-05-30 10:42:00','2026-05-30 10:42:00','2026-05-30 10:42:00'),(391,517,'autre',11406.00,'valide','2026-03-24 13:58:00','2026-03-24 13:58:00','2026-03-24 13:58:00'),(392,518,'mobile_money',5377.00,'valide','2026-05-12 06:55:00','2026-05-12 06:55:00','2026-05-12 06:55:00'),(393,519,'especes',82.64,'valide','2026-04-20 15:47:00','2026-04-20 15:47:00','2026-04-20 15:47:00'),(394,520,'especes',5607.00,'echoue','2026-05-02 09:10:00','2026-05-02 09:10:00','2026-05-02 09:10:00'),(395,521,'especes',2442.00,'valide','2026-06-09 20:44:00','2026-06-09 20:44:00','2026-06-09 20:44:00'),(396,522,'especes',23.82,'valide','2026-07-03 06:22:00','2026-07-03 06:22:00','2026-07-03 06:22:00'),(397,523,'mobile_money',3156.00,'valide','2026-04-22 16:11:00','2026-04-22 16:11:00','2026-04-22 16:11:00'),(398,524,'autre',8853.00,'valide','2026-05-03 07:25:00','2026-05-03 07:25:00','2026-05-03 07:25:00'),(399,526,'mobile_money',78.60,'valide','2026-06-18 08:55:00','2026-06-18 08:55:00','2026-06-18 08:55:00'),(400,527,'especes',4227.00,'valide','2026-04-01 22:03:00','2026-04-01 22:03:00','2026-04-01 22:03:00'),(401,528,'especes',1724.00,'valide','2026-05-15 14:06:00','2026-05-15 14:06:00','2026-05-15 14:06:00'),(402,529,'mobile_money',2065.00,'valide','2026-03-29 06:54:00','2026-03-29 06:54:00','2026-03-29 06:54:00'),(403,533,'autre',5331.00,'valide','2026-04-01 11:40:00','2026-04-01 11:40:00','2026-04-01 11:40:00'),(404,534,'mobile_money',23.58,'valide','2026-04-09 23:06:00','2026-04-09 23:06:00','2026-04-09 23:06:00'),(405,535,'especes',2205.00,'valide','2026-04-20 14:13:00','2026-04-20 14:13:00','2026-04-20 14:13:00'),(406,536,'autre',14041.00,'valide','2026-05-15 14:57:00','2026-05-15 14:57:00','2026-05-15 14:57:00'),(407,537,'especes',2598.00,'valide','2026-06-02 08:08:00','2026-06-02 08:08:00','2026-06-02 08:08:00'),(408,538,'mobile_money',14470.00,'valide','2026-03-29 21:52:00','2026-03-29 21:52:00','2026-03-29 21:52:00'),(409,539,'mobile_money',6363.00,'valide','2026-03-21 10:21:00','2026-03-21 10:21:00','2026-03-21 10:21:00'),(410,542,'especes',6221.00,'valide','2026-05-23 07:42:00','2026-05-23 07:42:00','2026-05-23 07:42:00'),(411,543,'especes',4694.00,'valide','2026-03-31 22:01:00','2026-03-31 22:01:00','2026-03-31 22:01:00'),(412,546,'autre',3137.00,'valide','2026-04-16 21:59:00','2026-04-16 21:59:00','2026-04-16 21:59:00'),(413,547,'autre',3586.00,'valide','2026-05-02 15:16:00','2026-05-02 15:16:00','2026-05-02 15:16:00'),(414,549,'especes',2249.00,'valide','2026-04-23 06:00:00','2026-04-23 06:00:00','2026-04-23 06:00:00'),(415,550,'mobile_money',20.12,'valide','2026-06-22 16:37:00','2026-06-22 16:37:00','2026-06-22 16:37:00'),(416,551,'mobile_money',13.15,'valide','2026-06-23 14:26:00','2026-06-23 14:26:00','2026-06-23 14:26:00'),(417,552,'mobile_money',3738.00,'valide','2026-06-20 09:20:00','2026-06-20 09:20:00','2026-06-20 09:20:00'),(418,553,'especes',5525.00,'valide','2026-05-07 09:54:00','2026-05-07 09:54:00','2026-05-07 09:54:00'),(419,554,'especes',5420.00,'valide','2026-06-02 17:04:00','2026-06-02 17:04:00','2026-06-02 17:04:00'),(420,555,'autre',1003.00,'valide','2026-06-15 18:16:00','2026-06-15 18:16:00','2026-06-15 18:16:00'),(421,556,'carte',2379.00,'valide','2026-04-15 17:04:00','2026-04-15 17:04:00','2026-04-15 17:04:00'),(422,557,'especes',4292.00,'valide','2026-05-16 21:53:00','2026-05-16 21:53:00','2026-05-16 21:53:00'),(423,559,'mobile_money',2154.00,'valide','2026-04-01 15:12:00','2026-04-01 15:12:00','2026-04-01 15:12:00'),(424,560,'especes',22.25,'echoue','2026-03-31 23:41:00','2026-03-31 23:41:00','2026-03-31 23:41:00'),(425,561,'mobile_money',11191.00,'valide','2026-06-27 14:51:00','2026-06-27 14:51:00','2026-06-27 14:51:00'),(426,562,'mobile_money',2179.00,'valide','2026-06-09 20:09:00','2026-06-09 20:09:00','2026-06-09 20:09:00'),(427,563,'especes',7751.00,'valide','2026-06-29 09:53:00','2026-06-29 09:53:00','2026-06-29 09:53:00'),(428,564,'mobile_money',3908.00,'valide','2026-07-15 15:49:00','2026-07-15 15:49:00','2026-07-15 15:49:00'),(429,565,'mobile_money',3586.00,'valide','2026-05-11 17:25:00','2026-05-11 17:25:00','2026-05-11 17:25:00'),(430,566,'mobile_money',2566.00,'valide','2026-05-30 21:05:00','2026-05-30 21:05:00','2026-05-30 21:05:00'),(431,567,'mobile_money',22.57,'valide','2026-05-07 22:42:00','2026-05-07 22:42:00','2026-05-07 22:42:00'),(432,569,'autre',6955.00,'valide','2026-05-17 13:55:00','2026-05-17 13:55:00','2026-05-17 13:55:00'),(433,570,'especes',7773.00,'valide','2026-06-13 17:57:00','2026-06-13 17:57:00','2026-06-13 17:57:00'),(434,571,'autre',71.37,'valide','2026-05-29 11:52:00','2026-05-29 11:52:00','2026-05-29 11:52:00'),(435,572,'carte',25.01,'valide','2026-03-26 13:12:00','2026-03-26 13:12:00','2026-03-26 13:12:00'),(436,573,'mobile_money',1776.00,'valide','2026-05-08 12:22:00','2026-05-08 12:22:00','2026-05-08 12:22:00'),(437,574,'mobile_money',1678.00,'echoue','2026-06-05 22:23:00','2026-06-05 22:23:00','2026-06-05 22:23:00'),(438,575,'especes',45.35,'valide','2026-04-26 14:32:00','2026-04-26 14:32:00','2026-04-26 14:32:00'),(439,576,'especes',5267.00,'valide','2026-06-19 22:13:00','2026-06-19 22:13:00','2026-06-19 22:13:00'),(440,577,'especes',19.15,'valide','2026-04-14 11:59:00','2026-04-14 11:59:00','2026-04-14 11:59:00'),(441,578,'mobile_money',29.53,'valide','2026-06-05 22:48:00','2026-06-05 22:48:00','2026-06-05 22:48:00'),(442,579,'mobile_money',6021.00,'valide','2026-06-09 07:00:00','2026-06-09 07:00:00','2026-06-09 07:00:00'),(443,581,'mobile_money',3947.00,'valide','2026-05-03 06:27:00','2026-05-03 06:27:00','2026-05-03 06:27:00'),(444,582,'especes',4422.00,'valide','2026-05-15 17:07:00','2026-05-15 17:07:00','2026-05-15 17:07:00'),(445,583,'mobile_money',9.49,'valide','2026-06-25 08:06:00','2026-06-25 08:06:00','2026-06-25 08:06:00'),(446,586,'autre',14.44,'valide','2026-04-12 12:55:00','2026-04-12 12:55:00','2026-04-12 12:55:00'),(447,587,'especes',24.73,'valide','2026-03-31 09:16:00','2026-03-31 09:16:00','2026-03-31 09:16:00'),(448,588,'mobile_money',2334.00,'valide','2026-04-24 15:02:00','2026-04-24 15:02:00','2026-04-24 15:02:00'),(449,589,'autre',6374.00,'valide','2026-03-22 12:13:00','2026-03-22 12:13:00','2026-03-22 12:13:00'),(450,590,'mobile_money',25.29,'valide','2026-03-25 19:25:00','2026-03-25 19:25:00','2026-03-25 19:25:00'),(451,591,'especes',9453.00,'valide','2026-06-28 21:50:00','2026-06-28 21:50:00','2026-06-28 21:50:00'),(452,592,'autre',4184.00,'valide','2026-05-10 15:00:00','2026-05-10 15:00:00','2026-05-10 15:00:00'),(453,593,'especes',1804.00,'valide','2026-04-09 17:20:00','2026-04-09 17:20:00','2026-04-09 17:20:00'),(454,594,'carte',9.75,'valide','2026-04-03 15:26:00','2026-04-03 15:26:00','2026-04-03 15:26:00'),(455,595,'especes',6246.00,'echoue','2026-05-22 10:43:00','2026-05-22 10:43:00','2026-05-22 10:43:00'),(456,598,'especes',42.52,'valide','2026-06-23 08:20:00','2026-06-23 08:20:00','2026-06-23 08:20:00'),(457,599,'mobile_money',2817.00,'valide','2026-06-14 15:10:00','2026-06-14 15:10:00','2026-06-14 15:10:00'),(458,600,'mobile_money',15.63,'valide','2026-03-26 19:35:00','2026-03-26 19:35:00','2026-03-26 19:35:00'),(459,601,'especes',5853.00,'valide','2026-04-14 09:24:00','2026-04-14 09:24:00','2026-04-14 09:24:00'),(460,602,'mobile_money',2807.00,'valide','2026-05-01 22:14:00','2026-05-01 22:14:00','2026-05-01 22:14:00'),(461,603,'mobile_money',29.79,'valide','2026-05-23 06:36:00','2026-05-23 06:36:00','2026-05-23 06:36:00'),(462,605,'carte',1039.00,'echoue','2026-04-04 07:15:00','2026-04-04 07:15:00','2026-04-04 07:15:00'),(463,606,'carte',3124.00,'valide','2026-05-09 12:22:00','2026-05-09 12:22:00','2026-05-09 12:22:00'),(464,607,'autre',60.33,'valide','2026-03-21 10:47:00','2026-03-21 10:47:00','2026-03-21 10:47:00'),(465,608,'carte',27.46,'valide','2026-07-15 14:56:00','2026-07-15 14:56:00','2026-07-15 14:56:00'),(466,610,'mobile_money',2039.00,'valide','2026-04-08 20:03:00','2026-04-08 20:03:00','2026-04-08 20:03:00'),(467,612,'especes',10485.00,'echoue','2026-05-28 16:33:00','2026-05-28 16:33:00','2026-05-28 16:33:00'),(468,613,'especes',3931.00,'valide','2026-04-19 17:45:00','2026-04-19 17:45:00','2026-04-19 17:45:00'),(469,614,'especes',4677.00,'valide','2026-06-03 18:56:00','2026-06-03 18:56:00','2026-06-03 18:56:00'),(470,615,'autre',2021.00,'valide','2026-04-28 19:23:00','2026-04-28 19:23:00','2026-04-28 19:23:00'),(471,616,'mobile_money',3118.00,'valide','2026-03-29 22:12:00','2026-03-29 22:12:00','2026-03-29 22:12:00'),(472,619,'autre',29.06,'valide','2026-06-14 09:04:00','2026-06-14 09:04:00','2026-06-14 09:04:00'),(473,620,'mobile_money',5748.00,'valide','2026-04-22 19:12:00','2026-04-22 19:12:00','2026-04-22 19:12:00'),(474,621,'mobile_money',2697.00,'valide','2026-05-10 18:04:00','2026-05-10 18:04:00','2026-05-10 18:04:00'),(475,623,'mobile_money',5294.00,'valide','2026-05-11 21:35:00','2026-05-11 21:35:00','2026-05-11 21:35:00'),(476,625,'mobile_money',2243.00,'valide','2026-04-15 20:16:00','2026-04-15 20:16:00','2026-04-15 20:16:00'),(477,626,'especes',11662.00,'valide','2026-06-18 10:19:00','2026-06-18 10:19:00','2026-06-18 10:19:00'),(478,628,'carte',7086.00,'valide','2026-04-06 18:38:00','2026-04-06 18:38:00','2026-04-06 18:38:00'),(479,629,'especes',3377.00,'valide','2026-07-08 23:47:00','2026-07-08 23:47:00','2026-07-08 23:47:00'),(480,630,'autre',2814.00,'valide','2026-04-22 21:36:00','2026-04-22 21:36:00','2026-04-22 21:36:00'),(481,632,'especes',3691.00,'valide','2026-05-26 06:41:00','2026-05-26 06:41:00','2026-05-26 06:41:00'),(482,633,'mobile_money',8227.00,'valide','2026-03-27 21:37:00','2026-03-27 21:37:00','2026-03-27 21:37:00'),(483,635,'mobile_money',73.60,'valide','2026-05-13 15:30:00','2026-05-13 15:30:00','2026-05-13 15:30:00'),(484,636,'especes',3101.00,'valide','2026-05-30 17:29:00','2026-05-30 17:29:00','2026-05-30 17:29:00'),(485,640,'especes',8949.00,'valide','2026-06-05 17:29:00','2026-06-05 17:29:00','2026-06-05 17:29:00'),(486,641,'carte',13330.00,'valide','2026-07-03 13:34:00','2026-07-03 13:34:00','2026-07-03 13:34:00'),(487,642,'autre',3253.00,'valide','2026-05-10 11:10:00','2026-05-10 11:10:00','2026-05-10 11:10:00'),(488,643,'mobile_money',5206.00,'valide','2026-04-06 19:32:00','2026-04-06 19:32:00','2026-04-06 19:32:00'),(489,644,'mobile_money',31.82,'valide','2026-05-01 21:59:00','2026-05-01 21:59:00','2026-05-01 21:59:00'),(490,645,'mobile_money',7223.00,'valide','2026-07-14 09:38:00','2026-07-14 09:38:00','2026-07-14 09:38:00'),(491,649,'carte',2852.00,'valide','2026-05-23 15:36:00','2026-05-23 15:36:00','2026-05-23 15:36:00'),(492,650,'mobile_money',6334.00,'valide','2026-05-01 15:28:00','2026-05-01 15:28:00','2026-05-01 15:28:00'),(493,652,'autre',3807.00,'valide','2026-06-17 23:36:00','2026-06-17 23:36:00','2026-06-17 23:36:00'),(494,653,'mobile_money',21.21,'valide','2026-06-29 08:23:00','2026-06-29 08:23:00','2026-06-29 08:23:00'),(495,654,'especes',3608.00,'valide','2026-04-20 19:31:00','2026-04-20 19:31:00','2026-04-20 19:31:00'),(496,655,'autre',6831.00,'valide','2026-04-24 13:00:00','2026-04-24 13:00:00','2026-04-24 13:00:00'),(497,656,'especes',3163.00,'valide','2026-04-18 21:20:00','2026-04-18 21:20:00','2026-04-18 21:20:00'),(498,657,'autre',13.37,'valide','2026-04-15 16:21:00','2026-04-15 16:21:00','2026-04-15 16:21:00'),(499,658,'mobile_money',10638.00,'valide','2026-03-27 08:16:00','2026-03-27 08:16:00','2026-03-27 08:16:00'),(500,659,'mobile_money',13.29,'valide','2026-04-01 06:57:00','2026-04-01 06:57:00','2026-04-01 06:57:00'),(501,660,'mobile_money',27.85,'valide','2026-07-01 20:06:00','2026-07-01 20:06:00','2026-07-01 20:06:00'),(502,661,'mobile_money',3088.00,'valide','2026-06-03 11:45:00','2026-06-03 11:45:00','2026-06-03 11:45:00'),(503,665,'mobile_money',3230.00,'valide','2026-03-24 13:51:00','2026-03-24 13:51:00','2026-03-24 13:51:00'),(504,666,'especes',10982.00,'valide','2026-06-15 16:12:00','2026-06-15 16:12:00','2026-06-15 16:12:00'),(505,668,'mobile_money',5462.00,'valide','2026-05-18 21:23:00','2026-05-18 21:23:00','2026-05-18 21:23:00'),(506,669,'mobile_money',3635.00,'valide','2026-04-19 15:53:00','2026-04-19 15:53:00','2026-04-19 15:53:00'),(507,670,'mobile_money',4135.00,'valide','2026-03-30 15:18:00','2026-03-30 15:18:00','2026-03-30 15:18:00'),(508,671,'especes',2594.00,'valide','2026-05-25 14:56:00','2026-05-25 14:56:00','2026-05-25 14:56:00'),(509,672,'carte',32.33,'valide','2026-04-04 12:13:00','2026-04-04 12:13:00','2026-04-04 12:13:00'),(510,673,'mobile_money',18.24,'valide','2026-06-19 09:47:00','2026-06-19 09:47:00','2026-06-19 09:47:00'),(511,674,'especes',1699.00,'valide','2026-05-12 13:21:00','2026-05-12 13:21:00','2026-05-12 13:21:00'),(512,676,'especes',4714.00,'valide','2026-04-25 08:17:00','2026-04-25 08:17:00','2026-04-25 08:17:00'),(513,677,'mobile_money',21.66,'echoue','2026-06-27 17:31:00','2026-06-27 17:31:00','2026-06-27 17:31:00'),(514,678,'especes',6278.00,'valide','2026-04-16 18:09:00','2026-04-16 18:09:00','2026-04-16 18:09:00'),(515,679,'especes',7177.00,'valide','2026-06-06 08:03:00','2026-06-06 08:03:00','2026-06-06 08:03:00'),(516,681,'carte',28.82,'valide','2026-05-14 18:40:00','2026-05-14 18:40:00','2026-05-14 18:40:00'),(517,682,'autre',7156.00,'valide','2026-05-03 09:04:00','2026-05-03 09:04:00','2026-05-03 09:04:00'),(518,683,'autre',5801.00,'valide','2026-05-01 13:19:00','2026-05-01 13:19:00','2026-05-01 13:19:00'),(519,684,'mobile_money',7056.00,'valide','2026-04-01 16:01:00','2026-04-01 16:01:00','2026-04-01 16:01:00'),(520,687,'mobile_money',2811.00,'valide','2026-07-03 16:22:00','2026-07-03 16:22:00','2026-07-03 16:22:00'),(521,688,'mobile_money',3341.00,'valide','2026-03-30 10:37:00','2026-03-30 10:37:00','2026-03-30 10:37:00'),(522,689,'especes',6.89,'valide','2026-06-02 20:37:00','2026-06-02 20:37:00','2026-06-02 20:37:00'),(523,690,'mobile_money',6018.00,'valide','2026-05-12 23:20:00','2026-05-12 23:20:00','2026-05-12 23:20:00'),(524,691,'especes',2509.00,'valide','2026-03-20 15:14:00','2026-03-20 15:14:00','2026-03-20 15:14:00'),(525,693,'autre',8016.00,'valide','2026-04-07 21:09:00','2026-04-07 21:09:00','2026-04-07 21:09:00'),(526,694,'mobile_money',11.16,'valide','2026-06-16 14:15:00','2026-06-16 14:15:00','2026-06-16 14:15:00'),(527,695,'mobile_money',7035.00,'valide','2026-06-17 09:59:00','2026-06-17 09:59:00','2026-06-17 09:59:00'),(528,697,'mobile_money',26.00,'valide','2026-04-20 06:09:00','2026-04-20 06:09:00','2026-04-20 06:09:00');
/*!40000 ALTER TABLE `paiements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!50001 DROP VIEW IF EXISTS `pays`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pays` AS SELECT
 1 AS `id`,
  1 AS `nom_pays`,
  1 AS `code_iso`,
  1 AS `devise`,
  1 AS `ca_global`,
  1 AS `created_at`,
  1 AS `updated_at` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `category` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`category`)),
  `excerpt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`excerpt`)),
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`body`)),
  `author` varchar(255) NOT NULL,
  `author_role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`author_role`)),
  `cover` varchar(255) DEFAULT NULL,
  `read_minutes` smallint(5) unsigned NOT NULL DEFAULT 4,
  `published_at` date NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_is_active_published_at_index` (`is_active`,`published_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'levee-de-fonds-serie-b','{\"fr\":\"MamaGo l\\u00e8ve 12 millions de dollars pour acc\\u00e9l\\u00e9rer son expansion\",\"en\":\"MamaGo raises $12 million to accelerate its expansion\"}','{\"fr\":\"Actualit\\u00e9s\",\"en\":\"News\"}','{\"fr\":\"Ce tour de table va financer l\'ouverture de six nouveaux pays et le recrutement de 200 personnes d\'ici la fin de l\'ann\\u00e9e.\",\"en\":\"The round will fund six new country launches and 200 hires before the end of the year.\"}','{\"fr\":\"Nous annon\\u00e7ons aujourd\'hui la cl\\u00f4ture de notre s\\u00e9rie B : 12 millions de dollars, men\\u00e9s par un consortium d\'investisseurs panafricains, avec la participation de nos partenaires historiques.\\n\\nIl y a quatre ans, MamaGo \\u00e9tait une application de r\\u00e9servation de taxis disponible dans un seul quartier d\'Abidjan. Aujourd\'hui, plus de cinq millions de personnes l\'utilisent dans dix pays pour se d\\u00e9placer, se faire livrer, faire leurs courses et payer.\\n\\nCe financement a trois objectifs. D\'abord, ouvrir six nouveaux march\\u00e9s en Afrique de l\'Ouest et centrale d\'ici dix-huit mois. Ensuite, renforcer nos \\u00e9quipes techniques : nous recrutons 200 personnes, dont la moiti\\u00e9 en ing\\u00e9nierie, r\\u00e9parties entre Abidjan, Dakar et Douala. Enfin, investir dans les revenus de nos partenaires, avec un fonds d\\u00e9di\\u00e9 \\u00e0 l\'\\u00e9quipement des livreurs.\\n\\nNous restons convaincus d\'une chose : les meilleures solutions africaines se construisent en Afrique, avec des \\u00e9quipes qui vivent les probl\\u00e8mes qu\'elles r\\u00e9solvent. Merci \\u00e0 nos partenaires, \\u00e0 nos \\u00e9quipes, et surtout \\u00e0 vous.\",\"en\":\"Today we are announcing the close of our Series B: $12 million, led by a consortium of pan-African investors, with participation from our long-standing partners.\\n\\nFour years ago, MamaGo was a taxi-booking app available in a single Abidjan neighbourhood. Today more than five million people use it across ten countries to travel, get deliveries, shop and pay.\\n\\nThe funding has three goals. First, opening six new markets in West and Central Africa within eighteen months. Second, strengthening our technical teams: we are hiring 200 people, half of them in engineering, across Abidjan, Dakar and Douala. Third, investing in our partners\' earnings, through a fund dedicated to equipping couriers.\\n\\nWe remain convinced of one thing: the best African solutions are built in Africa, by teams who live the problems they solve. Thank you to our partners, to our teams, and above all to you.\"}','Aminata Traoré','{\"fr\":\"CEO & cofondatrice\",\"en\":\"CEO & co-founder\"}','blog-levee-de-fonds.jpg',4,'2026-06-24',1,1,'2026-07-17 10:28:12','2026-07-17 11:17:15'),(2,'reduire-temps-attente-abidjan','{\"fr\":\"Comment nous avons r\\u00e9duit le temps d\'attente de 40 % \\u00e0 Abidjan\",\"en\":\"How we cut waiting times by 40% in Abidjan\"}','{\"fr\":\"Produit\",\"en\":\"Product\"}','{\"fr\":\"Un algorithme d\'affectation repens\\u00e9 autour d\'une contrainte que personne n\'avait mod\\u00e9lis\\u00e9e : les embouteillages du Plateau.\",\"en\":\"A dispatch algorithm rebuilt around a constraint nobody had modelled: the traffic jams of the Plateau.\"}','{\"fr\":\"Pendant longtemps, notre algorithme affectait la course au chauffeur le plus proche \\u00e0 vol d\'oiseau. C\'est la solution \\u00e9vidente. C\'est aussi la mauvaise.\\n\\n\\u00c0 Abidjan, deux points s\\u00e9par\\u00e9s de 800 m\\u00e8tres peuvent \\u00eatre \\u00e0 vingt minutes l\'un de l\'autre si un pont les s\\u00e9pare aux heures de pointe. Le chauffeur \\u00ab le plus proche \\u00bb \\u00e9tait souvent le plus lent \\u00e0 arriver.\\n\\nNous avons donc remplac\\u00e9 la distance par une estimation du temps de trajet r\\u00e9el, nourrie par les traces GPS anonymis\\u00e9es de nos propres courses. Le mod\\u00e8le apprend que le boulevard VGE \\u00e0 7 h 30 n\'a rien \\u00e0 voir avec le m\\u00eame boulevard \\u00e0 14 h.\\n\\nR\\u00e9sultat sur trois mois : le temps d\'attente m\\u00e9dian est pass\\u00e9 de 8 minutes 40 \\u00e0 5 minutes 10, soit une baisse de 40 %. Les annulations avant prise en charge ont chut\\u00e9 d\'un tiers. Et les chauffeurs font plus de courses par heure, donc gagnent davantage.\\n\\nLa le\\u00e7on nous semble g\\u00e9n\\u00e9rale : importer une solution con\\u00e7ue pour une ville quadrill\\u00e9e et fluide ne fonctionne pas. Il faut mod\\u00e9liser la ville telle qu\'elle est.\",\"en\":\"For a long time, our algorithm assigned each ride to the nearest driver as the crow flies. It is the obvious solution. It is also the wrong one.\\n\\nIn Abidjan, two points 800 metres apart can be twenty minutes from each other if a bridge separates them at rush hour. The \\\"nearest\\\" driver was often the slowest to arrive.\\n\\nSo we replaced distance with an estimate of real travel time, fed by anonymised GPS traces from our own rides. The model learns that Boulevard VGE at 7:30 am has nothing in common with the same road at 2 pm.\\n\\nThe result over three months: median waiting time fell from 8 minutes 40 to 5 minutes 10, a 40% drop. Cancellations before pickup fell by a third. And drivers complete more rides per hour, so they earn more.\\n\\nThe lesson feels general: importing a solution designed for a gridded, free-flowing city does not work. You have to model the city as it actually is.\"}','Kwame Osei','{\"fr\":\"CTO & cofondateur\",\"en\":\"CTO & co-founder\"}','blog-temps-attente.jpg',6,'2026-06-11',0,1,'2026-07-17 10:28:12','2026-07-17 11:17:15'),(3,'paiement-mobile-afrique','{\"fr\":\"Paiement mobile : pourquoi l\'Afrique invente le futur de la finance\",\"en\":\"Mobile payments: why Africa is inventing the future of finance\"}','{\"fr\":\"D\\u00e9cryptage\",\"en\":\"Analysis\"}','{\"fr\":\"Pendant que l\'Europe d\\u00e9bat du sans-contact, des centaines de millions de personnes paient d\\u00e9j\\u00e0 tout avec un t\\u00e9l\\u00e9phone sans \\u00e9cran tactile.\",\"en\":\"While Europe debates contactless cards, hundreds of millions already pay for everything with a phone that has no touchscreen.\"}','{\"fr\":\"Le paiement mobile n\'est pas une innovation import\\u00e9e en Afrique. Il y est n\\u00e9, et le continent a une d\\u00e9cennie d\'avance sur ce que d\'autres march\\u00e9s d\\u00e9couvrent \\u00e0 peine.\\n\\nLa raison est simple : l\\u00e0 o\\u00f9 l\'infrastructure bancaire n\'a jamais \\u00e9t\\u00e9 dense, il n\'y a rien \\u00e0 remplacer. Pas de r\\u00e9seau d\'agences \\u00e0 prot\\u00e9ger, pas de cartes \\u00e0 faire cohabiter avec un nouveau syst\\u00e8me. On construit directement ce qui marche.\\n\\nChez MamaGo, cela nous impose une discipline : accepter tous les moyens de paiement, sans hi\\u00e9rarchie. Le portefeuille MamaGo, les op\\u00e9rateurs mobiles, la carte bancaire pour ceux qui en ont une, et l\'esp\\u00e8ce \\u2014 qui reste majoritaire dans plusieurs de nos villes.\\n\\nRefuser l\'esp\\u00e8ce serait exclure une partie de nos clients. Nous pr\\u00e9f\\u00e9rons rendre le passage au portefeuille tellement simple qu\'il devienne \\u00e9vident, plut\\u00f4t que forc\\u00e9.\\n\\nLe futur de la finance ne ressemblera pas \\u00e0 une carte sans contact. Il ressemblera \\u00e0 un num\\u00e9ro de t\\u00e9l\\u00e9phone.\",\"en\":\"Mobile payment is not an innovation imported into Africa. It was born here, and the continent is a decade ahead of what other markets are only beginning to discover.\\n\\nThe reason is simple: where banking infrastructure was never dense, there is nothing to replace. No branch network to protect, no cards to reconcile with a new system. You build what works, directly.\\n\\nAt MamaGo, that imposes a discipline: accept every payment method, without hierarchy. The MamaGo wallet, mobile operators, bank cards for those who have one, and cash \\u2014 still the majority in several of our cities.\\n\\nRefusing cash would mean excluding part of our customers. We would rather make moving to the wallet so simple that it becomes obvious, instead of forced.\\n\\nThe future of finance will not look like a contactless card. It will look like a phone number.\"}','Jean-Marc Bello','{\"fr\":\"Directeur financier\",\"en\":\"Chief Financial Officer\"}','blog-paiement-mobile.jpg',5,'2026-05-28',0,1,'2026-07-17 10:28:12','2026-07-17 11:17:15'),(4,'portrait-fatou-livreuse-dakar','{\"fr\":\"Fatou, livreuse \\u00e0 Dakar : \\u00ab Je choisis mes horaires, c\'est tout ce que je demandais \\u00bb\",\"en\":\"Fatou, courier in Dakar: \\\"I choose my own hours \\u2014 that is all I was asking for\\\"\"}','{\"fr\":\"Communaut\\u00e9\",\"en\":\"Community\"}','{\"fr\":\"Portrait d\'une partenaire de la premi\\u00e8re heure, qui a mont\\u00e9 sa propre \\u00e9quipe de trois livreurs en deux ans.\",\"en\":\"A portrait of an early partner who built her own team of three couriers in two years.\"}','{\"fr\":\"Fatou Sow a rejoint MamaGo il y a deux ans, trois semaines apr\\u00e8s le lancement \\u00e0 Dakar. Elle \\u00e9tait alors vendeuse sur un march\\u00e9 de Grand-Yoff.\\n\\n\\u00ab Ce qui m\'a d\\u00e9cid\\u00e9e, ce n\'est pas l\'argent au d\\u00e9but. C\'est de pouvoir m\'arr\\u00eater \\u00e0 16 h pour aller chercher ma fille \\u00e0 l\'\\u00e9cole, sans demander la permission \\u00e0 personne. \\u00bb\\n\\nEn deux ans, elle est pass\\u00e9e de deux livraisons par jour \\u00e0 une trentaine, et a form\\u00e9 trois livreurs qui travaillent d\\u00e9sormais avec elle. Elle g\\u00e8re leurs plannings depuis l\'application, et n\\u00e9gocie elle-m\\u00eame ses contrats avec deux restaurants du quartier.\\n\\n\\u00ab Le plus dur, ce sont les adresses. Ici, personne ne dit \\\"12 rue untel\\\". On dit \\\"derri\\u00e8re la station, la maison bleue\\\". Au d\\u00e9but je perdais des heures. \\u00bb\\n\\nC\'est ce retour, r\\u00e9p\\u00e9t\\u00e9 par des centaines de livreurs, qui nous a pouss\\u00e9s \\u00e0 construire notre syst\\u00e8me de points de rep\\u00e8re : les clients peuvent enregistrer une description et une photo plut\\u00f4t qu\'une adresse formelle. Une fonctionnalit\\u00e9 qui n\'aurait aucun sens ailleurs, et qui est devenue essentielle ici.\",\"en\":\"Fatou Sow joined MamaGo two years ago, three weeks after the Dakar launch. At the time she was a trader in a Grand-Yoff market.\\n\\n\\\"What convinced me wasn\'t the money, at first. It was being able to stop at 4 pm to pick my daughter up from school, without asking anyone\'s permission.\\\"\\n\\nIn two years she has gone from two deliveries a day to about thirty, and has trained three couriers who now work alongside her. She manages their schedules from the app, and negotiates her own contracts with two restaurants in the neighbourhood.\\n\\n\\\"The hardest part is addresses. Here, nobody says \'12 such-and-such street\'. They say \'behind the petrol station, the blue house\'. At the start I lost hours.\\\"\\n\\nThat feedback, repeated by hundreds of couriers, is what pushed us to build our landmark system: customers can save a description and a photo rather than a formal address. A feature that would make no sense elsewhere, and that has become essential here.\"}','Leïla Benali','{\"fr\":\"Directrice marketing\",\"en\":\"Chief Marketing Officer\"}','blog-portrait-livreuse.jpg',4,'2026-05-14',0,1,'2026-07-17 10:28:12','2026-07-17 11:17:15'),(5,'mamago-arrive-au-gabon','{\"fr\":\"MamaGo arrive au Gabon\",\"en\":\"MamaGo launches in Gabon\"}','{\"fr\":\"Actualit\\u00e9s\",\"en\":\"News\"}','{\"fr\":\"Libreville devient notre dixi\\u00e8me pays. Transport et livraison sont disponibles d\\u00e8s aujourd\'hui, le paiement suivra en septembre.\",\"en\":\"Libreville becomes our tenth country. Rides and delivery are live today; payments follow in September.\"}','{\"fr\":\"\\u00c0 partir d\'aujourd\'hui, MamaGo est disponible \\u00e0 Libreville. C\'est notre dixi\\u00e8me pays, et le troisi\\u00e8me en Afrique centrale apr\\u00e8s le Cameroun et la RDC.\\n\\nLe lancement d\\u00e9marre avec le transport et la livraison. Le portefeuille et le paiement entre particuliers arriveront en septembre, une fois les agr\\u00e9ments finalis\\u00e9s avec les autorit\\u00e9s locales.\\n\\nNous avons pass\\u00e9 quatre mois sur place avant d\'ouvrir. Recruter et former 300 chauffeurs, cartographier les quartiers, comprendre pourquoi les trajets vers Port-Gentil se font en avion et pas en voiture. Un lancement r\\u00e9ussi, c\'est 80 % de travail invisible fait avant le premier jour.\\n\\nPort-Gentil suivra d\\u00e9but 2027.\",\"en\":\"From today, MamaGo is available in Libreville. It is our tenth country, and the third in Central Africa after Cameroon and the DRC.\\n\\nThe launch starts with rides and delivery. The wallet and peer-to-peer payments arrive in September, once approvals are finalised with the local authorities.\\n\\nWe spent four months on the ground before opening. Recruiting and training 300 drivers, mapping the neighbourhoods, understanding why journeys to Port-Gentil are made by plane rather than car. A successful launch is 80% invisible work done before day one.\\n\\nPort-Gentil follows in early 2027.\"}','Fatou Ndiaye','{\"fr\":\"Directrice des op\\u00e9rations\",\"en\":\"Chief Operating Officer\"}','blog-gabon.jpg',3,'2026-04-30',0,1,'2026-07-17 10:28:12','2026-07-17 11:17:15'),(6,'conseils-livraison-heures-pointe','{\"fr\":\"5 conseils pour vos livraisons aux heures de pointe\",\"en\":\"5 tips for your deliveries at peak hours\"}','{\"fr\":\"Conseils\",\"en\":\"Tips\"}','{\"fr\":\"Comment faire arriver un repas chaud entre 12 h et 14 h, quand toute la ville commande en m\\u00eame temps.\",\"en\":\"How to get a hot meal delivered between noon and 2 pm, when the whole city orders at once.\"}','{\"fr\":\"Entre 12 h et 14 h, nous traitons pr\\u00e8s d\'un tiers des livraisons de la journ\\u00e9e. Voici ce qui fait vraiment la diff\\u00e9rence, d\'apr\\u00e8s nos donn\\u00e9es.\\n\\n**Commandez avant 11 h 45.** Quinze minutes plus t\\u00f4t, c\'est en moyenne dix-huit minutes de livraison en moins. La courbe de saturation est brutale, pas lin\\u00e9aire.\\n\\n**Enregistrez votre point de rep\\u00e8re.** Les commandes avec une description de rep\\u00e8re et une photo arrivent en moyenne sept minutes plus vite. C\'est le gain le plus simple \\u00e0 obtenir.\\n\\n**Groupez vos commandes de bureau.** Une livraison pour cinq personnes co\\u00fbte moins cher et mobilise un seul livreur. Tout le monde y gagne, y compris les autres clients du quartier.\\n\\n**Payez d\'avance.** Le paiement \\u00e0 la livraison ajoute en moyenne deux minutes par course, le temps de faire l\'appoint.\\n\\n**Notez votre livreur.** Ce n\'est pas une formalit\\u00e9 : les notes alimentent directement l\'attribution des courses. Un bon livreur bien not\\u00e9 travaille davantage.\",\"en\":\"Between noon and 2 pm we handle nearly a third of the day\'s deliveries. Here is what actually makes a difference, based on our data.\\n\\n**Order before 11:45.** Fifteen minutes earlier means eighteen fewer minutes of delivery time on average. The saturation curve is brutal, not linear.\\n\\n**Save your landmark.** Orders with a landmark description and a photo arrive seven minutes faster on average. It is the easiest gain available.\\n\\n**Group your office orders.** One delivery for five people costs less and occupies a single courier. Everyone wins, including the other customers in the neighbourhood.\\n\\n**Pay in advance.** Cash on delivery adds about two minutes per trip, the time it takes to find change.\\n\\n**Rate your courier.** This is not a formality: ratings feed directly into how rides are assigned. A well-rated courier works more.\"}','Fatou Ndiaye','{\"fr\":\"Directrice des op\\u00e9rations\",\"en\":\"Chief Operating Officer\"}','blog-conseils-livraison.jpg',3,'2026-04-08',0,1,'2026-07-17 10:28:12','2026-07-17 11:17:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rapports`
--

DROP TABLE IF EXISTS `rapports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rapports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `pays_id` bigint(20) unsigned NOT NULL,
  `type_export` enum('csv','pdf') NOT NULL,
  `periode_couverte` varchar(50) DEFAULT NULL,
  `chemin_fichier` varchar(255) DEFAULT NULL,
  `date_generation` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rapports_utilisateur` (`utilisateur_id`),
  KEY `idx_rapports_pays` (`pays_id`),
  KEY `idx_rapports_date` (`date_generation`),
  CONSTRAINT `fk_rapports_pays` FOREIGN KEY (`pays_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_rapports_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rapports`
--

LOCK TABLES `rapports` WRITE;
/*!40000 ALTER TABLE `rapports` DISABLE KEYS */;
/*!40000 ALTER TABLE `rapports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_droit_acces`
--

DROP TABLE IF EXISTS `role_droit_acces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_droit_acces` (
  `role_id` bigint(20) unsigned NOT NULL,
  `droit_acces_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`droit_acces_id`),
  KEY `fk_rd_droit` (`droit_acces_id`),
  CONSTRAINT `fk_rd_droit` FOREIGN KEY (`droit_acces_id`) REFERENCES `droits_acces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rd_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_droit_acces`
--

LOCK TABLES `role_droit_acces` WRITE;
/*!40000 ALTER TABLE `role_droit_acces` DISABLE KEYS */;
INSERT INTO `role_droit_acces` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,1),(2,2),(2,3),(2,6),(3,1),(3,2);
/*!40000 ALTER TABLE `role_droit_acces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `libelle_role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_roles_libelle` (`libelle_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SuperAdmin','2026-07-15 15:51:12','2026-07-15 15:51:12'),(2,'Admin Pays','2026-07-15 15:51:12','2026-07-15 15:51:12'),(3,'Commercial','2026-07-15 15:51:12','2026-07-15 15:51:12');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`description`)),
  `icon` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_operational` tinyint(1) NOT NULL DEFAULT 0,
  `description_metier` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nom_service` varchar(150) GENERATED ALWAYS AS (json_unquote(json_extract(`title`,'$.fr'))) VIRTUAL,
  `actif` tinyint(1) GENERATED ALWAYS AS (`is_active`) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_slug_unique` (`slug`),
  KEY `services_is_active_position_index` (`is_active`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'transport','{\"fr\":\"Transport\",\"en\":\"Rides\"}','{\"fr\":\"R\\u00e9servez vos trajets en taxi, moto ou VTC en toute simplicit\\u00e9.\",\"en\":\"Book a taxi, motorbike or private car in a couple of taps.\"}','car','#',0,1,1,'Transport de personnes','2026-07-17 09:22:53','2026-07-17 11:28:28','Transport',1),(2,'livraison','{\"fr\":\"Livraison\",\"en\":\"Delivery\"}','{\"fr\":\"Faites livrer vos colis, repas et courses rapidement.\",\"en\":\"Get parcels, meals and groceries delivered fast.\"}','scooter','#',1,1,1,'Livraison de colis','2026-07-17 09:22:53','2026-07-17 11:28:28','Livraison',1),(3,'shopping','{\"fr\":\"Shopping\",\"en\":\"Shopping\"}','{\"fr\":\"Achetez vos produits en ligne parmi des milliers d\'articles.\",\"en\":\"Shop online from thousands of items.\"}','bag','#',2,1,0,NULL,'2026-07-17 09:22:53','2026-07-17 11:28:28','Shopping',1),(4,'restauration','{\"fr\":\"Restauration\",\"en\":\"Food\"}','{\"fr\":\"Commandez vos plats pr\\u00e9f\\u00e9r\\u00e9s chez vos restaurants favoris.\",\"en\":\"Order your favourite dishes from the restaurants you love.\"}','food','#',3,1,1,'Livraison de repas a domicile','2026-07-17 09:22:53','2026-07-17 11:28:28','Restauration',1),(5,'paiement','{\"fr\":\"Paiement\",\"en\":\"Payments\"}','{\"fr\":\"Payez, transf\\u00e9rez et g\\u00e9rez votre argent en toute s\\u00e9curit\\u00e9.\",\"en\":\"Pay, transfer and manage your money securely.\"}','wallet','#',4,1,0,NULL,'2026-07-17 09:22:53','2026-07-17 11:28:28','Paiement',1),(6,'paiement-2','{\"fr\":\"Paiement\",\"en\":\"Payments\"}','{\"fr\":\"Payez, transf\\u00e9rez et g\\u00e9rez votre argent en toute s\\u00e9curit\\u00e9.\",\"en\":\"Pay, transfer and manage your money securely.\"}','wallet-alt','#',5,1,0,NULL,'2026-07-17 09:22:53','2026-07-17 11:28:28','Paiement',1),(7,'plus-de-services','{\"fr\":\"Plus de services\",\"en\":\"More services\"}','{\"fr\":\"R\\u00e9servations, \\u00e9v\\u00e9nements, pharmacies, billets et bien plus encore.\",\"en\":\"Bookings, events, pharmacies, tickets and much more.\"}','grid','#',6,1,0,NULL,'2026-07-17 09:22:53','2026-07-17 11:28:28','Plus de services',1);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `label` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`label`)),
  `icon` varchar(255) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stats_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,'users','+5M','{\"fr\":\"Utilisateurs\",\"en\":\"Users\"}','users',0,'2026-07-17 09:22:53','2026-07-17 11:28:29'),(2,'countries','10+','{\"fr\":\"Pays\",\"en\":\"Countries\"}','pin',1,'2026-07-17 09:22:53','2026-07-17 11:28:29'),(3,'secure','100%','{\"fr\":\"S\\u00e9curis\\u00e9\",\"en\":\"Secure\"}','shield',2,'2026-07-17 09:22:53','2026-07-17 11:28:29'),(4,'support','24/7','{\"fr\":\"Support\",\"en\":\"Support\"}','headset',3,'2026-07-17 09:22:53','2026-07-17 11:28:29');
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats_ca_ville_service`
--

DROP TABLE IF EXISTS `stats_ca_ville_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats_ca_ville_service` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ville_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `periode` date NOT NULL,
  `montant_ca` decimal(14,2) NOT NULL DEFAULT 0.00,
  `nb_courses` int(10) unsigned NOT NULL DEFAULT 0,
  `nb_clients` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_stats_ville_service_periode` (`ville_id`,`service_id`,`periode`),
  KEY `fk_stats_service` (`service_id`),
  KEY `idx_stats_periode` (`periode`),
  CONSTRAINT `fk_stats_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_stats_ville` FOREIGN KEY (`ville_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats_ca_ville_service`
--

LOCK TABLES `stats_ca_ville_service` WRITE;
/*!40000 ALTER TABLE `stats_ca_ville_service` DISABLE KEYS */;
INSERT INTO `stats_ca_ville_service` VALUES (1,1,1,'2026-03-01',17095.00,4,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(2,1,1,'2026-04-01',24574.00,7,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(3,1,1,'2026-05-01',47262.00,10,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(4,1,1,'2026-06-01',24913.00,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(5,1,1,'2026-07-01',13644.00,4,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(6,1,4,'2026-03-01',1135.00,1,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(7,1,4,'2026-04-01',37397.00,12,7,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(8,1,4,'2026-05-01',17528.00,6,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(9,1,4,'2026-06-01',24499.00,8,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(10,1,2,'2026-03-01',15393.00,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(11,1,2,'2026-04-01',32528.00,4,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(12,1,2,'2026-05-01',80063.00,10,8,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(13,1,2,'2026-06-01',73975.00,8,7,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(14,1,2,'2026-07-01',46430.00,5,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(15,2,1,'2026-03-01',3114.00,1,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(16,2,1,'2026-04-01',33174.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(17,2,1,'2026-05-01',24648.00,7,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(18,2,1,'2026-06-01',26510.00,4,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(19,2,1,'2026-07-01',9947.00,2,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(20,2,4,'2026-03-01',8182.00,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(21,2,4,'2026-04-01',7810.00,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(22,2,4,'2026-05-01',26564.00,7,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(23,2,4,'2026-06-01',21820.00,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(24,2,4,'2026-07-01',15353.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(25,2,2,'2026-03-01',32276.00,5,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(26,2,2,'2026-04-01',58601.00,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(27,2,2,'2026-05-01',38853.00,5,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(28,2,2,'2026-06-01',98384.00,10,8,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(29,3,1,'2026-03-01',12737.00,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(30,3,1,'2026-04-01',59627.00,12,8,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(31,3,1,'2026-05-01',25758.00,6,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(32,3,1,'2026-06-01',35039.00,8,7,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(33,3,1,'2026-07-01',5120.00,1,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(34,3,4,'2026-03-01',8636.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(35,3,4,'2026-04-01',34724.00,11,7,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(36,3,4,'2026-05-01',30722.00,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(37,3,4,'2026-06-01',27880.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(38,3,4,'2026-07-01',3377.00,1,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(39,3,2,'2026-03-01',14470.00,1,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(40,3,2,'2026-04-01',9707.00,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(41,3,2,'2026-05-01',47199.00,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(42,3,2,'2026-06-01',34824.00,4,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(43,5,1,'2026-03-01',17503.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(44,5,1,'2026-04-01',53600.00,11,7,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(45,5,1,'2026-05-01',25453.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(46,5,1,'2026-06-01',13396.00,3,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(47,5,1,'2026-07-01',18601.00,4,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(48,5,4,'2026-03-01',9665.00,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(49,5,4,'2026-04-01',7128.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(50,5,4,'2026-05-01',34032.00,8,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(51,5,4,'2026-06-01',19623.00,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(52,5,4,'2026-07-01',15285.00,3,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(53,5,2,'2026-03-01',67258.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(54,5,2,'2026-04-01',40117.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(55,5,2,'2026-05-01',57005.00,6,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(56,5,2,'2026-06-01',87697.00,11,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(57,5,2,'2026-07-01',31184.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(58,6,1,'2026-04-01',36366.00,8,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(59,6,1,'2026-05-01',27436.00,6,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(60,6,1,'2026-06-01',11848.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(61,6,1,'2026-07-01',13209.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(62,6,4,'2026-03-01',13455.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(63,6,4,'2026-04-01',22454.00,7,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(64,6,4,'2026-05-01',27385.00,7,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(65,6,4,'2026-06-01',12321.00,4,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(66,6,4,'2026-07-01',14165.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(67,6,2,'2026-03-01',21795.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(68,6,2,'2026-04-01',45904.00,5,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(69,6,2,'2026-05-01',70122.00,8,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(70,6,2,'2026-06-01',36995.00,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(71,6,2,'2026-07-01',18849.00,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(72,24,1,'2026-04-01',262.71,10,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(73,24,1,'2026-05-01',109.63,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(74,24,1,'2026-06-01',115.88,5,4,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(75,24,1,'2026-07-01',85.69,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(76,24,4,'2026-03-01',52.26,3,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(77,24,4,'2026-04-01',82.77,5,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(78,24,4,'2026-05-01',124.99,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(79,24,4,'2026-06-01',157.88,8,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(80,24,2,'2026-03-01',96.80,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(81,24,2,'2026-04-01',247.99,5,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(82,24,2,'2026-05-01',148.28,3,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(83,24,2,'2026-06-01',583.01,9,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(84,24,2,'2026-07-01',67.32,1,1,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(85,25,1,'2026-03-01',42.41,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(86,25,1,'2026-04-01',176.26,7,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(87,25,1,'2026-05-01',194.26,9,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(88,25,1,'2026-06-01',214.79,10,8,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(89,25,1,'2026-07-01',64.29,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(90,25,4,'2026-03-01',89.67,4,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(91,25,4,'2026-04-01',50.47,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(92,25,4,'2026-05-01',122.91,6,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(93,25,4,'2026-06-01',139.71,8,5,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(94,25,4,'2026-07-01',27.68,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(95,25,2,'2026-03-01',103.42,2,2,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(96,25,2,'2026-04-01',412.23,9,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(97,25,2,'2026-05-01',529.37,9,8,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(98,25,2,'2026-06-01',346.12,7,6,'2026-07-15 15:51:15','2026-07-15 15:51:15'),(99,25,2,'2026-07-01',109.21,3,3,'2026-07-15 15:51:15','2026-07-15 15:51:15');
/*!40000 ALTER TABLE `stats_ca_ville_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`role`)),
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`bio`)),
  `photo` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_members_is_active_position_index` (`is_active`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES (1,'Aminata Traoré','{\"fr\":\"CEO & cofondatrice\",\"en\":\"CEO & co-founder\"}','{\"fr\":\"Ancienne directrice des op\\u00e9rations d\'un op\\u00e9rateur mobile panafricain. Elle a fond\\u00e9 MamaGo apr\\u00e8s avoir attendu deux heures un taxi sous la pluie \\u00e0 Abidjan.\",\"en\":\"Former operations director at a pan-African mobile operator. She founded MamaGo after waiting two hours for a taxi in the rain in Abidjan.\"}','team-1.jpg',0,1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(2,'Kwame Osei','{\"fr\":\"CTO & cofondateur\",\"en\":\"CTO & co-founder\"}','{\"fr\":\"Ing\\u00e9nieur logiciel pass\\u00e9 par Accra et Berlin. Il a con\\u00e7u l\'architecture qui permet \\u00e0 l\'application de fonctionner m\\u00eame en 2G.\",\"en\":\"Software engineer who worked in Accra and Berlin. He designed the architecture that keeps the app usable even on 2G.\"}','team-2.jpg',1,1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(3,'Fatou Ndiaye','{\"fr\":\"Directrice des op\\u00e9rations\",\"en\":\"Chief Operating Officer\"}','{\"fr\":\"Elle pilote le lancement de chaque nouvelle ville, du premier chauffeur recrut\\u00e9 \\u00e0 la centi\\u00e8me course quotidienne.\",\"en\":\"She runs every new city launch, from the first driver recruited to the hundredth daily ride.\"}','team-3.jpg',2,1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(4,'Jean-Marc Bello','{\"fr\":\"Directeur financier\",\"en\":\"Chief Financial Officer\"}','{\"fr\":\"Vingt ans de finance en Afrique centrale. Il veille \\u00e0 ce que la croissance ne se fasse jamais au d\\u00e9triment des partenaires.\",\"en\":\"Twenty years in finance across Central Africa. He makes sure growth never comes at our partners\' expense.\"}','team-4.jpg',3,1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(5,'Chidi Okonkwo','{\"fr\":\"VP Engineering\",\"en\":\"VP Engineering\"}','{\"fr\":\"Il dirige les \\u00e9quipes produit r\\u00e9parties entre Abidjan, Lagos et Dakar, et d\\u00e9fend l\'id\\u00e9e qu\'un bon code se lit comme une phrase.\",\"en\":\"He leads the product teams across Abidjan, Lagos and Dakar, and argues that good code reads like a sentence.\"}','team-5.jpg',4,1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(6,'Leïla Benali','{\"fr\":\"Directrice marketing\",\"en\":\"Chief Marketing Officer\"}','{\"fr\":\"Elle a construit la marque MamaGo autour d\'une conviction : parler aux gens comme \\u00e0 des voisins, pas comme \\u00e0 des utilisateurs.\",\"en\":\"She built the MamaGo brand around one conviction: talk to people like neighbours, not like users.\"}','team-6.jpg',5,1,'2026-07-17 10:28:12','2026-07-17 11:28:29');
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_pays`
--

DROP TABLE IF EXISTS `utilisateur_pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur_pays` (
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `pays_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`utilisateur_id`,`pays_id`),
  KEY `fk_up_pays` (`pays_id`),
  CONSTRAINT `fk_up_pays` FOREIGN KEY (`pays_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_up_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_pays`
--

LOCK TABLES `utilisateur_pays` WRITE;
/*!40000 ALTER TABLE `utilisateur_pays` DISABLE KEYS */;
INSERT INTO `utilisateur_pays` VALUES (1,1),(1,2),(1,11),(2,1),(3,2);
/*!40000 ALTER TABLE `utilisateur_pays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_ville`
--

DROP TABLE IF EXISTS `utilisateur_ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur_ville` (
  `utilisateur_id` bigint(20) unsigned NOT NULL,
  `ville_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`utilisateur_id`,`ville_id`),
  KEY `fk_uv_ville` (`ville_id`),
  CONSTRAINT `fk_uv_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uv_ville` FOREIGN KEY (`ville_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_ville`
--

LOCK TABLES `utilisateur_ville` WRITE;
/*!40000 ALTER TABLE `utilisateur_ville` DISABLE KEYS */;
INSERT INTO `utilisateur_ville` VALUES (3,5);
/*!40000 ALTER TABLE `utilisateur_ville` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mot_de_passe_hash` varchar(255) NOT NULL,
  `theme_pref` enum('clair','sombre') NOT NULL DEFAULT 'clair',
  `couleur_pref` enum('noir','vert') NOT NULL DEFAULT 'vert',
  `actif` tinyint(1) NOT NULL DEFAULT 1,
  `derniere_connexion` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_utilisateurs_email` (`email`),
  KEY `idx_utilisateurs_role` (`role_id`),
  CONSTRAINT `fk_utilisateurs_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,1,'Admin','Super','admin@mamago.com','+225 07 00 00 00 01','$2y$10$pjDVUljgNHH7GOqoJM1KEu8ir7fnos/uvNE6P.9zEicyIrHiRLqPy','clair','vert',1,'2026-07-19 16:45:51','2026-07-15 15:51:12','2026-07-15 15:51:12'),(2,2,'Kouassi','Aya','ci.admin@mamago.com','+225 07 45 12 88 30','$2y$10$pjDVUljgNHH7GOqoJM1KEu8ir7fnos/uvNE6P.9zEicyIrHiRLqPy','clair','vert',1,NULL,'2026-07-15 15:51:12','2026-07-15 15:51:12'),(3,3,'Ndiaye','Moussa','commercial@mamago.com','+221 77 512 44 09','$2y$10$pjDVUljgNHH7GOqoJM1KEu8ir7fnos/uvNE6P.9zEicyIrHiRLqPy','clair','vert',1,NULL,'2026-07-15 15:51:12','2026-07-15 15:51:12');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `values`
--

DROP TABLE IF EXISTS `values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`description`)),
  `icon` varchar(255) NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `values`
--

LOCK TABLES `values` WRITE;
/*!40000 ALTER TABLE `values` DISABLE KEYS */;
INSERT INTO `values` VALUES (1,'lafrique-dabord','{\"fr\":\"L\'Afrique d\'abord\",\"en\":\"Africa first\"}','{\"fr\":\"Nous ne transposons pas des solutions venues d\'ailleurs. Chaque fonctionnalit\\u00e9 est pens\\u00e9e pour les r\\u00e9alit\\u00e9s africaines : r\\u00e9seau intermittent, paiement en esp\\u00e8ces, adressage informel.\",\"en\":\"We do not transplant solutions from elsewhere. Every feature is designed for African realities: patchy networks, cash payments, informal addressing.\"}','pin',0,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(2,'simplicite-radicale','{\"fr\":\"Simplicit\\u00e9 radicale\",\"en\":\"Radical simplicity\"}','{\"fr\":\"Une application doit s\'utiliser sans mode d\'emploi. Si une fonctionnalit\\u00e9 demande une explication, c\'est qu\'elle est mal con\\u00e7ue.\",\"en\":\"An app should work without a manual. If a feature needs explaining, it is badly designed.\"}','shield',1,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(3,'confiance-avant-tout','{\"fr\":\"Confiance avant tout\",\"en\":\"Trust above all\"}','{\"fr\":\"Chaque chauffeur et chaque livreur est v\\u00e9rifi\\u00e9. Chaque transaction est chiffr\\u00e9e. La confiance se gagne lentement et se perd en une course.\",\"en\":\"Every driver and courier is vetted. Every transaction is encrypted. Trust is earned slowly and lost in a single ride.\"}','card',2,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(4,'proximite-reelle','{\"fr\":\"Proximit\\u00e9 r\\u00e9elle\",\"en\":\"Genuine proximity\"}','{\"fr\":\"Nos \\u00e9quipes vivent dans les villes qu\'elles servent. Un probl\\u00e8me \\u00e0 Douala se r\\u00e8gle depuis Douala, pas depuis un si\\u00e8ge \\u00e0 6 000 km.\",\"en\":\"Our teams live in the cities they serve. A problem in Douala is solved from Douala, not from a head office 6,000 km away.\"}','headset',3,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(5,'impact-local','{\"fr\":\"Impact local\",\"en\":\"Local impact\"}','{\"fr\":\"Plus de 40 000 partenaires gagnent leur vie gr\\u00e2ce \\u00e0 MamaGo. Notre croissance n\'a de sens que si la leur suit.\",\"en\":\"More than 40,000 partners earn their living through MamaGo. Our growth only means something if theirs follows.\"}','users',4,'2026-07-17 10:28:12','2026-07-17 11:28:29'),(6,'exigence-technique','{\"fr\":\"Exigence technique\",\"en\":\"Technical rigour\"}','{\"fr\":\"Une seconde de latence co\\u00fbte une course. Nous mesurons, nous optimisons, et nous recommen\\u00e7ons.\",\"en\":\"One second of latency costs a ride. We measure, we optimise, and we start again.\"}','clock',5,'2026-07-17 10:28:12','2026-07-17 11:28:29');
/*!40000 ALTER TABLE `values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `villes`
--

DROP TABLE IF EXISTS `villes`;
/*!50001 DROP VIEW IF EXISTS `villes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `villes` AS SELECT
 1 AS `id`,
  1 AS `pays_id`,
  1 AS `nom_ville`,
  1 AS `created_at`,
  1 AS `updated_at` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mamago'
--

--
-- Dumping routines for database 'mamago'
--

--
-- Current Database: `mamago`
--

USE `mamago`;

--
-- Final view structure for view `pays`
--

/*!50001 DROP VIEW IF EXISTS `pays`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pays` AS select `c`.`id` AS `id`,json_unquote(json_extract(`c`.`name`,'$.fr')) AS `nom_pays`,`c`.`code` AS `code_iso`,`c`.`devise` AS `devise`,`c`.`ca_global` AS `ca_global`,`c`.`created_at` AS `created_at`,`c`.`updated_at` AS `updated_at` from `countries` `c` where `c`.`is_placeholder` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `villes`
--

/*!50001 DROP VIEW IF EXISTS `villes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `villes` AS select `ci`.`id` AS `id`,`ci`.`country_id` AS `pays_id`,`ci`.`name` AS `nom_ville`,`ci`.`created_at` AS `created_at`,`ci`.`updated_at` AS `updated_at` from `cities` `ci` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-19 16:48:35
