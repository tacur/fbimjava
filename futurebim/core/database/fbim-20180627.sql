-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: futurebim
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `ownerid` int(11) NOT NULL,
  `owner_type` varchar(45) NOT NULL,
  `address_name` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `street` varchar(45) NOT NULL,
  `street2` varchar(200) DEFAULT NULL,
  `house_number` varchar(10) NOT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ownerid`,`owner_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'company','Hauptfiliale','Deutschland','Hannover','30419','Fischteichweg',NULL,'22',NULL,1,'2018-06-10 11:01:58.940668','2018-06-10 11:02:31.431829');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `comments` text,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `version` int(11) NOT NULL DEFAULT '1',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Test Company',NULL,1,1,'2018-06-04 19:31:58.672344','2018-06-04 19:31:58.672344'),(2,'Company 1',NULL,2,1,'2018-06-08 19:10:21.325301','2018-06-08 19:10:21.325301'),(3,'Company 2',NULL,3,1,'2018-06-08 19:10:21.328295','2018-06-08 19:10:21.328295'),(4,'Company 3',NULL,0,1,'2018-06-09 10:13:19.446634','2018-06-10 10:16:34.473327');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`companies_BEFORE_UPDATE` BEFORE UPDATE ON `companies` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `company_contact_person`
--

DROP TABLE IF EXISTS `company_contact_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_contact_person` (
  `companyid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`companyid`,`userid`),
  KEY `FK_COMPANY_CONTACT_PERSON_USER_idx` (`userid`),
  CONSTRAINT `FK_COMPANY_CONTACT_PERSON_COMPANY` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_COMPANY_CONTACT_PERSON_USER` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_contact_person`
--

LOCK TABLES `company_contact_person` WRITE;
/*!40000 ALTER TABLE `company_contact_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_contact_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `ownerid` int(11) NOT NULL,
  `owner_type` varchar(45) NOT NULL,
  `email_name` varchar(45) NOT NULL,
  `emailaddress` varchar(50) NOT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ownerid`,`owner_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'company','Info','aaaa@em.de',NULL,1,'2018-06-10 11:05:42.997236','2018-06-10 11:05:42.997236');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`emails_BEFORE_UPDATE` BEFORE UPDATE ON `emails` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ifc_building`
--

DROP TABLE IF EXISTS `ifc_building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_building` (
  `id` varchar(50) NOT NULL,
  `site_id` varchar(50) NOT NULL,
  `building_name` varchar(50) NOT NULL,
  `object_placement` varchar(50) NOT NULL,
  `composition_type` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCBUILDING_SITE` (`site_id`),
  CONSTRAINT `IFCBUILDING_SITE` FOREIGN KEY (`site_id`) REFERENCES `ifc_project_site` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_building`
--

LOCK TABLES `ifc_building` WRITE;
/*!40000 ALTER TABLE `ifc_building` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_building_storey`
--

DROP TABLE IF EXISTS `ifc_building_storey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_building_storey` (
  `id` varchar(50) NOT NULL,
  `building_id` varchar(50) NOT NULL,
  `storey_name` varchar(50) NOT NULL,
  `object_placement` varchar(50) NOT NULL,
  `composition_type` varchar(50) NOT NULL,
  `elevation` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCBUILDINGSTOREY_BUILDING` (`building_id`),
  CONSTRAINT `IFCBUILDINGSTOREY_BUILDING` FOREIGN KEY (`building_id`) REFERENCES `ifc_building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_building_storey`
--

LOCK TABLES `ifc_building_storey` WRITE;
/*!40000 ALTER TABLE `ifc_building_storey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_building_storey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_doorstyle`
--

DROP TABLE IF EXISTS `ifc_doorstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_doorstyle` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `operation_type` varchar(50) NOT NULL,
  `construction_type` varchar(50) NOT NULL,
  `parameter_takes_precedence` varchar(50) NOT NULL,
  `sizeable` varchar(10) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCDOORSTYLE_IFC` (`ifc_id`),
  CONSTRAINT `IFCDOORSTYLE_IFC` FOREIGN KEY (`ifc_id`) REFERENCES `project_ifc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_doorstyle`
--

LOCK TABLES `ifc_doorstyle` WRITE;
/*!40000 ALTER TABLE `ifc_doorstyle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_doorstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_furnituretypes`
--

DROP TABLE IF EXISTS `ifc_furnituretypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_furnituretypes` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `assembly_place` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCFURNITURETYPE_IFC` (`ifc_id`),
  CONSTRAINT `IFCFURNITURETYPE_IFC` FOREIGN KEY (`ifc_id`) REFERENCES `project_ifc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_furnituretypes`
--

LOCK TABLES `ifc_furnituretypes` WRITE;
/*!40000 ALTER TABLE `ifc_furnituretypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_furnituretypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_layers`
--

DROP TABLE IF EXISTS `ifc_layers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_layers` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `layer_name` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCLAYER_IFC` (`ifc_id`),
  CONSTRAINT `IFCLAYER_IFC` FOREIGN KEY (`ifc_id`) REFERENCES `project_ifc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_layers`
--

LOCK TABLES `ifc_layers` WRITE;
/*!40000 ALTER TABLE `ifc_layers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_layers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_project`
--

DROP TABLE IF EXISTS `ifc_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_project` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `project_long_name` varchar(100) NOT NULL,
  `phase` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCPROJECT_IFC` (`ifc_id`),
  CONSTRAINT `IFCPROJECT_IFC` FOREIGN KEY (`ifc_id`) REFERENCES `project_ifc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_project`
--

LOCK TABLES `ifc_project` WRITE;
/*!40000 ALTER TABLE `ifc_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_project_site`
--

DROP TABLE IF EXISTS `ifc_project_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_project_site` (
  `id` varchar(50) NOT NULL,
  `project_id` varchar(50) NOT NULL,
  `site_name` varchar(50) NOT NULL,
  `object_type` varchar(50) NOT NULL,
  `object_placement` varchar(50) NOT NULL,
  `composition_type` varchar(50) NOT NULL,
  `ref_latitude` varchar(50) NOT NULL,
  `ref_longitude` varchar(50) NOT NULL,
  `ref_elevation` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCPROJECTSITE_IFC` (`project_id`),
  CONSTRAINT `IFCPROJECTSITE_IFC` FOREIGN KEY (`project_id`) REFERENCES `ifc_project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_project_site`
--

LOCK TABLES `ifc_project_site` WRITE;
/*!40000 ALTER TABLE `ifc_project_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_project_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_properties`
--

DROP TABLE IF EXISTS `ifc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_properties` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `property_name` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCPROPERTIES_IFC` (`ifc_id`),
  CONSTRAINT `IFCPROPERTIES_IFC` FOREIGN KEY (`ifc_id`) REFERENCES `project_ifc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_properties`
--

LOCK TABLES `ifc_properties` WRITE;
/*!40000 ALTER TABLE `ifc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_properties_value`
--

DROP TABLE IF EXISTS `ifc_properties_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_properties_value` (
  `id` varchar(50) NOT NULL,
  `property_id` varchar(50) NOT NULL,
  `value_name` varchar(50) NOT NULL,
  `nominal_value` varchar(50) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCPROPERTIESVALUE_PROPERTIES` (`property_id`),
  CONSTRAINT `IFCPROPERTIESVALUE_PROPERTIES` FOREIGN KEY (`property_id`) REFERENCES `ifc_properties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_properties_value`
--

LOCK TABLES `ifc_properties_value` WRITE;
/*!40000 ALTER TABLE `ifc_properties_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_properties_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_units`
--

DROP TABLE IF EXISTS `ifc_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_units` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `unit_type` varchar(100) NOT NULL,
  `equivalent` varchar(100) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `PROJECT_IFC_FILES_PROJECT` (`ifc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_units`
--

LOCK TABLES `ifc_units` WRITE;
/*!40000 ALTER TABLE `ifc_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ifc_windowstyle`
--

DROP TABLE IF EXISTS `ifc_windowstyle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ifc_windowstyle` (
  `id` varchar(50) NOT NULL,
  `ifc_id` varchar(50) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `operation_type` varchar(50) NOT NULL,
  `construction_type` varchar(50) NOT NULL,
  `parameter_takes_precedence` varchar(50) NOT NULL,
  `sizeable` varchar(10) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `IFCWINDOWSTYLE_IFC` (`ifc_id`),
  CONSTRAINT `IFCWINDOWSTYLE_IFC` FOREIGN KEY (`ifc_id`) REFERENCES `project_ifc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ifc_windowstyle`
--

LOCK TABLES `ifc_windowstyle` WRITE;
/*!40000 ALTER TABLE `ifc_windowstyle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ifc_windowstyle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1528924419),('m130524_201442_init',1528924427);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_access_type`
--

DROP TABLE IF EXISTS `project_access_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_access_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_access_type`
--

LOCK TABLES `project_access_type` WRITE;
/*!40000 ALTER TABLE `project_access_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_access_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_bcf_files`
--

DROP TABLE IF EXISTS `project_bcf_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_bcf_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `object_id` varchar(100) NOT NULL,
  `viewpoint` varchar(45) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `PROJECT_BFC_FILES_PROJECT` (`project_id`),
  CONSTRAINT `PROJECT_BFC_FILES_PROJECT` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_bcf_files`
--

LOCK TABLES `project_bcf_files` WRITE;
/*!40000 ALTER TABLE `project_bcf_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_bcf_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`project_bcf_files_BEFORE_UPDATE` BEFORE UPDATE ON `project_bcf_files` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project_ifc`
--

DROP TABLE IF EXISTS `project_ifc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_ifc` (
  `id` varchar(50) NOT NULL,
  `project_id` int(11) NOT NULL,
  `ifc_name` varchar(100) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `version` int(11) NOT NULL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `PROJECT_IFC_FILES_PROJECT` (`project_id`),
  CONSTRAINT `PROJECT_IFC_PROJECT` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_ifc`
--

LOCK TABLES `project_ifc` WRITE;
/*!40000 ALTER TABLE `project_ifc` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_ifc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`project_ifc_BEFORE_UPDATE` BEFORE UPDATE ON `project_ifc` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project_ifc_files`
--

DROP TABLE IF EXISTS `project_ifc_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_ifc_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `PROJECT_IFC_FILES_PROJECT` (`project_id`),
  CONSTRAINT `PROJECT_IFC_FILES_PROJECT` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_ifc_files`
--

LOCK TABLES `project_ifc_files` WRITE;
/*!40000 ALTER TABLE `project_ifc_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_ifc_files` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`project_ifc_files_BEFORE_UPDATE` BEFORE UPDATE ON `project_ifc_files` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `project_tasks`
--

DROP TABLE IF EXISTS `project_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_tasks` (
  `id` int(10) unsigned zerofill NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_name` varchar(45) NOT NULL,
  `task_comments` text,
  `user_create` int(11) NOT NULL,
  `user_allocated` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deatline` date DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `PROJECT_TASKS_PROJECT` (`project_id`),
  CONSTRAINT `PROJECT_TASKS_PROJECT` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tasks`
--

LOCK TABLES `project_tasks` WRITE;
/*!40000 ALTER TABLE `project_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`project_tasks_BEFORE_UPDATE` BEFORE UPDATE ON `project_tasks` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `project_name` varchar(200) NOT NULL,
  `responsible_user` int(11) NOT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deatline` date DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_PROJECTS_ACCOUNT_idx` (`companyid`),
  CONSTRAINT `FK_PROJECTS_ACCOUNT` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `companyid`, `project_name`, `responsible_user`, `start_date`, `deatline`, `version`, `created`, `updated`) VALUES (1,1,'Projeckt 1',0,'2018-06-14 21:35:15',NULL,1,'2018-06-04 19:36:44.310401','2018-06-04 19:36:44.310401'),(2,1,'Projeckt 2',0,'2018-06-14 21:35:15',NULL,1,'2018-06-04 19:36:44.310863','2018-06-04 19:36:44.310863'),(3,1,'Projeckt 3',0,'2018-06-14 21:35:15',NULL,1,'2018-06-04 19:36:44.310863','2018-06-04 19:36:44.310863');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`projects_BEFORE_UPDATE` BEFORE UPDATE ON `projects` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `telephonesnumbers`
--

DROP TABLE IF EXISTS `telephonesnumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telephonesnumbers` (
  `ownerid` int(11) NOT NULL,
  `owner_type` varchar(45) NOT NULL,
  `telephone_name` varchar(45) NOT NULL,
  `country_code` varchar(45) NOT NULL,
  `city_code` varchar(45) NOT NULL,
  `subscriber` varchar(15) NOT NULL,
  `comments` varchar(300) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '1',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`ownerid`,`owner_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephonesnumbers`
--

LOCK TABLES `telephonesnumbers` WRITE;
/*!40000 ALTER TABLE `telephonesnumbers` DISABLE KEYS */;
INSERT INTO `telephonesnumbers` VALUES (1,'company','Empfang','49','115','123456',NULL,1,'2018-06-10 11:04:01.293072','2018-06-10 11:04:01.293072');
/*!40000 ALTER TABLE `telephonesnumbers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`telephonesnumbers_BEFORE_UPDATE` BEFORE UPDATE ON `telephonesnumbers` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `toolbars`
--

DROP TABLE IF EXISTS `toolbars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toolbars` (
  `id` varchar(40) NOT NULL,
  `parent` varchar(40) NOT NULL DEFAULT '-',
  `label` varchar(45) NOT NULL DEFAULT '-',
  `url` varchar(100) NOT NULL,
  `image` varchar(45) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `type` varchar(45) NOT NULL,
  `pos` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toolbars`
--

LOCK TABLES `toolbars` WRITE;
/*!40000 ALTER TABLE `toolbars` DISABLE KEYS */;
INSERT INTO `toolbars` VALUES ('menu.basicdata','','menu.basicdata','/basics/','glyphicon glyphicon-list',1,'top',10),('menu.basicdata.companies','menu.basicdata','menu.basicdata.companies','/basics/companies/index','glyphicon glyphicon-user',1,'left',5),('menu.mydashboard','','menu.mydashboard','/my/dashboard','glyphicon glyphicon-home',1,'top',5),('menu.mydashboard.dashboard','menu.mydashboard','menu.mydashboard','/my/dashboard','glyphicon glyphicon-home',1,'left',5),('menu.user','','menu.user','/user/changepassword','glyphicon glyphicon-user',1,'top',15),('menu.user.changepassword','menu.user','menu.user.changepassword','/user/changepassword','glyphicon glyphicon-user',1,'left',5);
/*!40000 ALTER TABLE `toolbars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project_access`
--

DROP TABLE IF EXISTS `user_project_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project_access` (
  `userid` int(11) NOT NULL,
  `projectid` int(11) NOT NULL,
  `access_type` int(11) NOT NULL,
  `status` smallint(6) GENERATED ALWAYS AS (1) VIRTUAL,
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`userid`,`projectid`),
  KEY `FK_USER_PROJECT_ACCESS_ACCESSTYPE` (`access_type`),
  KEY `FK_USER_PROJECT_ACCESS_PROJECT` (`projectid`),
  CONSTRAINT `FK_USER_PROJECT_ACCESS_ACCESSTYPE` FOREIGN KEY (`access_type`) REFERENCES `project_access_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_PROJECT_ACCESS_PROJECT` FOREIGN KEY (`projectid`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_PROJECT_ACCESS_USER` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project_access`
--

LOCK TABLES `user_project_access` WRITE;
/*!40000 ALTER TABLE `user_project_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_project_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyid` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `hash_password` varchar(45) NOT NULL,
  `gender` smallint(6) NOT NULL DEFAULT '0',
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `name_tag` varchar(45) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '1',
  `version` int(11) NOT NULL DEFAULT '1',
  `created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `FK_USERS_ACCOUNT_idx` (`companyid`),
  CONSTRAINT `FK_USERS_COMPANY` FOREIGN KEY (`companyid`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'administrator','admin',0,'','',NULL,NULL,'',1,1,'2018-06-04 07:51:54.890891','2018-06-04 19:31:38.938720'),(2,1,'user','user',0,'','',NULL,NULL,'',1,1,'2018-06-04 07:52:09.815891','2018-06-04 19:31:38.945944'),(3,1,'u2','u2',0,'','',NULL,NULL,'',1,1,'2018-06-04 07:52:09.815891','2018-06-04 19:31:38.946434');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `futurebim`.`users_BEFORE_UPDATE` BEFORE UPDATE ON `users` FOR EACH ROW
set new.updated = CURRENT_TIMESTAMP(6) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-28  0:53:55
