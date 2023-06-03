-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: klc
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add order',7,'add_order'),(26,'Can change order',7,'change_order'),(27,'Can delete order',7,'delete_order'),(28,'Can view order',7,'view_order'),(29,'Can add role',8,'add_role'),(30,'Can change role',8,'change_role'),(31,'Can delete role',8,'delete_role'),(32,'Can view role',8,'view_role'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add product',10,'add_product'),(38,'Can change product',10,'change_product'),(39,'Can delete product',10,'delete_product'),(40,'Can view product',10,'view_product'),(41,'Can add order product',11,'add_orderproduct'),(42,'Can change order product',11,'change_orderproduct'),(43,'Can delete order product',11,'delete_orderproduct'),(44,'Can view order product',11,'view_orderproduct'),(45,'Can add application',12,'add_application'),(46,'Can change application',12,'change_application'),(47,'Can delete application',12,'delete_application'),(48,'Can view application',12,'view_application'),(49,'Can add access token',13,'add_accesstoken'),(50,'Can change access token',13,'change_accesstoken'),(51,'Can delete access token',13,'delete_accesstoken'),(52,'Can view access token',13,'view_accesstoken'),(53,'Can add grant',14,'add_grant'),(54,'Can change grant',14,'change_grant'),(55,'Can delete grant',14,'delete_grant'),(56,'Can view grant',14,'view_grant'),(57,'Can add refresh token',15,'add_refreshtoken'),(58,'Can change refresh token',15,'change_refreshtoken'),(59,'Can delete refresh token',15,'delete_refreshtoken'),(60,'Can view refresh token',15,'view_refreshtoken'),(61,'Can add id token',16,'add_idtoken'),(62,'Can change id token',16,'change_idtoken'),(63,'Can delete id token',16,'delete_idtoken'),(64,'Can view id token',16,'view_idtoken'),(65,'Can add Token',17,'add_token'),(66,'Can change Token',17,'change_token'),(67,'Can delete Token',17,'delete_token'),(68,'Can view Token',17,'view_token'),(69,'Can add token',18,'add_tokenproxy'),(70,'Can change token',18,'change_tokenproxy'),(71,'Can delete token',18,'delete_tokenproxy'),(72,'Can view token',18,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'2023-05-12 17:18:11.112700','2023-05-12 17:18:11.112700',1,'MacBook'),(2,'2023-05-12 17:18:29.134713','2023-05-12 17:18:29.134713',1,'Asus'),(3,'2023-05-12 17:18:34.630375','2023-05-12 17:18:34.630375',1,'Hp'),(4,'2023-05-12 17:18:39.391805','2023-05-12 17:18:39.391805',1,'Lenovo'),(5,'2023-05-12 17:18:44.641529','2023-05-12 17:18:44.641529',1,'Acer'),(6,'2023-05-12 17:18:49.264462','2023-05-12 17:18:49.264462',1,'Dell'),(7,'2023-05-12 17:18:54.299526','2023-05-12 17:18:54.299526',1,'MSI'),(9,'2023-05-15 08:47:22.561815','2023-05-15 08:47:22.561815',1,'abc');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_KLC_App_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(17,'authtoken','token'),(18,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(6,'KLC_App','category'),(7,'KLC_App','order'),(11,'KLC_App','orderproduct'),(10,'KLC_App','product'),(8,'KLC_App','role'),(9,'KLC_App','user'),(13,'oauth2_provider','accesstoken'),(12,'oauth2_provider','application'),(14,'oauth2_provider','grant'),(16,'oauth2_provider','idtoken'),(15,'oauth2_provider','refreshtoken'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-03 07:33:43.757239'),(2,'contenttypes','0002_remove_content_type_name','2023-06-03 07:33:43.805919'),(3,'auth','0001_initial','2023-06-03 07:33:44.002578'),(4,'auth','0002_alter_permission_name_max_length','2023-06-03 07:33:44.045689'),(5,'auth','0003_alter_user_email_max_length','2023-06-03 07:33:44.050874'),(6,'auth','0004_alter_user_username_opts','2023-06-03 07:33:44.050874'),(7,'auth','0005_alter_user_last_login_null','2023-06-03 07:33:44.066969'),(8,'auth','0006_require_contenttypes_0002','2023-06-03 07:33:44.066969'),(9,'auth','0007_alter_validators_add_error_messages','2023-06-03 07:33:44.066969'),(10,'auth','0008_alter_user_username_max_length','2023-06-03 07:33:44.081984'),(11,'auth','0009_alter_user_last_name_max_length','2023-06-03 07:33:44.101426'),(12,'auth','0010_alter_group_name_max_length','2023-06-03 07:33:44.113438'),(13,'auth','0011_update_proxy_permissions','2023-06-03 07:33:44.129156'),(14,'auth','0012_alter_user_first_name_max_length','2023-06-03 07:33:44.129156'),(15,'KLC_App','0001_initial','2023-06-03 07:33:44.625330'),(16,'admin','0001_initial','2023-06-03 07:33:44.746518'),(17,'admin','0002_logentry_remove_auto_add','2023-06-03 07:33:44.754844'),(18,'admin','0003_logentry_add_action_flag_choices','2023-06-03 07:33:44.754844'),(19,'authtoken','0001_initial','2023-06-03 07:33:44.832476'),(20,'authtoken','0002_auto_20160226_1747','2023-06-03 07:33:44.897968'),(21,'authtoken','0003_tokenproxy','2023-06-03 07:33:44.913625'),(22,'oauth2_provider','0001_initial','2023-06-03 07:33:45.404733'),(23,'oauth2_provider','0002_auto_20190406_1805','2023-06-03 07:33:45.448001'),(24,'oauth2_provider','0003_auto_20201211_1314','2023-06-03 07:33:45.498935'),(25,'oauth2_provider','0004_auto_20200902_2022','2023-06-03 07:33:45.781588'),(26,'oauth2_provider','0005_auto_20211222_2352','2023-06-03 07:33:45.812851'),(27,'oauth2_provider','0006_alter_application_client_secret','2023-06-03 07:33:45.849116'),(28,'sessions','0001_initial','2023-06-03 07:33:45.864602');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klc_app_user`
--

DROP TABLE IF EXISTS `klc_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klc_app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klc_app_user`
--

LOCK TABLES `klc_app_user` WRITE;
/*!40000 ALTER TABLE `klc_app_user` DISABLE KEYS */;
INSERT INTO `klc_app_user` VALUES (1,'pbkdf2_sha256$600000$HEqEnSCcJLB8yqMKOj0C6m$wZuyC34lc01tpO4Yc7HIs7ftCAT2LVAyy51SxGE3tj8=',NULL,0,'abc','','Minh','md@gmail.com',0,1,'2023-06-03 07:35:20.657583','user/User-avatar.svg_COPJQRM.png');
/*!40000 ALTER TABLE `klc_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klc_app_user_groups`
--

DROP TABLE IF EXISTS `klc_app_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klc_app_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KLC_App_user_groups_user_id_group_id_6b87c96e_uniq` (`user_id`,`group_id`),
  KEY `KLC_App_user_groups_group_id_a4a0505a_fk_auth_group_id` (`group_id`),
  CONSTRAINT `KLC_App_user_groups_group_id_a4a0505a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `KLC_App_user_groups_user_id_ebd7d84c_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klc_app_user_groups`
--

LOCK TABLES `klc_app_user_groups` WRITE;
/*!40000 ALTER TABLE `klc_app_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `klc_app_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klc_app_user_user_permissions`
--

DROP TABLE IF EXISTS `klc_app_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klc_app_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KLC_App_user_user_permis_user_id_permission_id_02a380b1_uniq` (`user_id`,`permission_id`),
  KEY `KLC_App_user_user_pe_permission_id_37da6692_fk_auth_perm` (`permission_id`),
  CONSTRAINT `KLC_App_user_user_pe_permission_id_37da6692_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `KLC_App_user_user_pe_user_id_4e42b972_fk_KLC_App_u` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klc_app_user_user_permissions`
--

LOCK TABLES `klc_app_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `klc_app_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `klc_app_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_KLC_App_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_KLC_App_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_KLC_App_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_KLC_App_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_KLC_App_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_KLC_App_user_id` FOREIGN KEY (`user_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_amount` int NOT NULL,
  `account_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_account_id_0ea08f21_fk_KLC_App_user_id` (`account_id`),
  CONSTRAINT `order_account_id_0ea08f21_fk_KLC_App_user_id` FOREIGN KEY (`account_id`) REFERENCES `klc_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2023-06-03 07:36:41.153300','2023-06-03 07:36:41.153300',1,'John Doe','123 Main St','123456789',100,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_f65b4f18_fk_order_id` (`order_id`),
  KEY `order_product_product_id_53139cb6_fk_product_id` (`product_id`),
  CONSTRAINT `order_product_order_id_f65b4f18_fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_product_product_id_53139cb6_fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,'2023-06-03 07:54:18.289484','2023-06-03 07:54:18.289484',1,10,2,1,1);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_id_640030a0_fk_category_id` (`category_id`),
  CONSTRAINT `product_category_id_640030a0_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2023-05-13 07:30:28.007295','2023-05-13 08:27:33.089674',1,'Laptop Apple MacBook Air M1 2020','8GB/256GB/7-core GPU (MGN63SA/A)',18490000,'products/macbook-air-m1-2020-silver-01-org.jpg','static/products/macbook-air-m1-2020-silver-02-org.jpg',1),(2,'2023-05-13 07:32:07.861022','2023-05-13 08:27:39.165870',1,'Laptop Apple MacBook Air M2 2022','8GB/256GB/8-core GPU (MLY13SA/A)',27690000,'products/apple-macbook-air-m2-2022-01.jpg','static/products/apple-macbook-air-m2-2022-02.jpg',1),(3,'2023-05-13 07:33:08.790865','2023-05-13 08:27:44.686530',1,'Laptop Apple MacBook Pro M2 2022','8GB/256GB/10-core GPU (MNEH3SA/A)',29890000,'products/apple-macbook-pro-13-inch-m2-2022-1.jpg','static/products/apple-macbook-pro-13-inch-m2-2022-2.jpg',1),(4,'2023-05-13 07:34:00.792314','2023-05-13 08:27:50.523793',1,'Laptop Apple MacBook Pro 14 M1 Pro 2021','10-core CPU/16GB/1TB SSD/16-core GPU (MKGQ3SA/A)',44990000,'products/macbook-pro-14-m1-pro-2021-bac-1.jpg','static/products/macbook-pro-14-m1-pro-2021-bac-2.jpg',1),(5,'2023-05-13 07:34:55.197672','2023-05-13 08:27:57.517584',1,'Laptop Apple MacBook Pro 16 M1 Pro 2021','10 core-CPU/16GB/512GB/16 core-GPU (MK183SA/A)',44990000,'products/apple-macbook-pro-16-m1-pro-2021-1-1.jpg','static/products/apple-macbook-pro-16-m1-pro-2021-2-1.jpg',1),(6,'2023-05-13 07:36:02.178717','2023-05-13 08:28:04.171608',1,'Laptop MacBook Pro 14 inch M2 Pro 2023','10-core CPU/16GB/512GB/16-core GPU (MPHE3SA/A)',51990000,'products/macbook-pro-14-inch-m2-pro-gray-1.jpg','static/products/macbook-pro-14-inch-m2-pro-gray-2.jpg',1),(7,'2023-05-13 07:37:10.413272','2023-05-13 08:28:10.934373',1,'Laptop MacBook Pro 16 inch M2 Pro 2023','12-core CPU/16GB/512GB/19-core GPU (MNW83SA/A)',64990000,'products/macbook-pro-16-inch-m2-pro-gray-1.jpg','static/products/macbook-pro-16-inch-m2-pro-gray-7.jpg',1),(8,'2023-05-13 07:38:32.015970','2023-05-13 08:28:17.053583',1,'Laptop Apple MacBook Air M2 2022','16GB/512GB/10-core GPU (Z15Z0003L)',39690000,'products/apple-macbook-air-m2-2022-16gb-1-1.jpg','static/products/apple-macbook-air-m2-2022-16gb-2-1.jpg',1),(9,'2023-05-13 07:39:28.998053','2023-05-13 08:28:23.434828',1,'Laptop MacBook Pro 13 inch M2 2022','16GB/512GB/10-core GPU (Z16U)',38390000,'products/apple-macbook-pro-m2-2022-16gb-1-1.jpg','static/products/apple-macbook-pro-m2-2022-16gb-2-1.jpg',1),(10,'2023-05-13 07:40:10.657327','2023-05-13 08:28:30.453045',1,'Laptop Apple MacBook Pro M1 2020','16GB/512GB (Z11C)',34990000,'products/space-1-org.jpg','static/products/space-2-org.jpg',1),(11,'2023-05-13 07:42:24.056267','2023-05-13 08:28:40.899011',1,'Laptop Asus TUF Gaming F15 FX506LHB','i5 10300H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN188W)',15890000,'products/asus-tuf-gaming-fx506lhb-i5-hn188w-2.jpg','static/products/asus-tuf-gaming-fx506lhb-i5-hn188w-1.jpg',2),(12,'2023-05-13 07:43:16.504892','2023-05-13 07:43:16.504892',1,'Laptop Asus Vivobook X415EA','i3 1115G4/8GB/256GB/Win11 (EK2034W)',10090000,'products/asus-vivobook-x415ea-i3-ek2034w-abc-glr-1.jpg','static/products/asus-vivobook-x415ea-i3-ek2034w-abc-glr-2.jpg',2),(13,'2023-05-13 07:44:06.177827','2023-05-13 08:28:49.676512',1,'Laptop Asus VivoBook 15X OLED A1503ZA','i5 12500H/8GB/512GB/Win11 (L1290W)',16890000,'products/asus-vivobook-15x-oled-a1503za-i5-l1290w-1-1.jpg','static/products/asus-vivobook-15x-oled-a1503za-i5-l1290w-2-1.jpg',2),(14,'2023-05-13 07:45:01.771056','2023-05-13 08:28:55.546239',1,'Laptop Asus Vivobook 15 X1502ZA','i5 1240P/8GB/512GB/Win11 (EJ120W)',15390000,'products/asus-vivobook-15-x1502za-i5-ej120w-1-1.jpg','static/products/asus-vivobook-15-x1502za-i5-ej120w-2-1.jpg',2),(15,'2023-05-13 07:45:58.940037','2023-05-13 07:45:58.940037',1,'Laptop Asus VivoBook X515MA','N4020/4GB/256GB/Win11 (BR480W)',7490000,'products/asus-vivobook-x515ma-n4020-br480w-1-1.jpg','static/products/asus-vivobook-x515ma-n4020-br480w-2-1.jpg',2),(16,'2023-05-13 07:46:58.877106','2023-05-13 07:46:58.877106',1,'Laptop Asus Vivobook 14X OLED A1403ZA','i5 12500H/8GB/512GB/Win11 (KM065W)',16890000,'products/asus-vivobook-x515ma-n4020-br480w-1-1_YRaF6Q4.jpg','static/products/asus-vivobook-x515ma-n4020-br480w-2-1_fYnFycm.jpg',2),(17,'2023-05-13 07:48:39.245227','2023-05-13 08:29:11.945668',1,'Laptop Asus Vivobook 14 X1402ZA','i5 1240P/8GB/512GB/Win11 (EK083W)',15390000,'products/asus-vivobook-14-x1402za-i5-ek083w-1.jpg','static/products/asus-vivobook-14-x1402za-i5-ek083w-3.jpg',2),(18,'2023-05-13 07:49:30.956843','2023-05-13 07:49:30.956843',1,'Laptop Asus Gaming ROG Strix G15 G513IH','R7 4800H/8GB/512GB/4GB GTX1650/144Hz/Win11 (HN015W)',18290000,'products/asus-rog-strix-gaming-g513ih-r7-hn015w-1-1.jpg','static/products/asus-rog-strix-gaming-g513ih-r7-hn015w-2-1.jpg',2),(19,'2023-05-13 07:50:46.041678','2023-05-13 07:50:46.041678',1,'Laptop Asus Gaming TUF Dash F15 FX517ZC','i5 12450H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN077W)',20990000,'static/products/asus-tuf-gaming-fx517zc-i5-hn077w-ab-1.jpg','static/products/asus-tuf-gaming-fx517zc-i5-hn077w-ab-2.jpg',2),(20,'2023-05-13 07:51:46.129858','2023-05-13 07:51:46.129858',1,'Laptop Asus TUF Gaming F15 FX506HC','i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win11 (HN144W)',20390000,'static/products/asus-tuf-gaming-fx506hc-i5-hn144w-1.jpg','static/products/asus-tuf-gaming-fx506hc-i5-hn144w-xy-2.jpg',2),(21,'2023-05-13 07:53:44.290102','2023-05-13 07:53:44.290102',1,'Laptop HP 15s fq2716TU','i3 1115G4/8GB/512GB/Win11 (7C0X3PA)',10690000,'static/products/hp-15s-fq2716tu-i3-7c0x3pa-glr-2.jpg','static/products/hp-15s-fq2716tu-i3-7c0x3pa-glr-1.jpg',3),(22,'2023-05-13 07:54:33.581092','2023-05-13 07:54:33.581092',1,'Laptop HP Pavilion 15 eg2082TU','i5 1240P/8GB/512GB/Win11 (7C0Q5PA)',16990000,'static/products/hp-pavilion-15-eg2082tu-i5-7c0q5pa-1.jpg','static/products/hp-pavilion-15-eg2082tu-i5-7c0q5pa-2.jpg',3),(23,'2023-05-13 07:55:26.644501','2023-05-13 08:29:01.185786',1,'Laptop HP 240 G8','i3 1115G4/8GB/256GB/Win11 (6L1A1PA)',9990000,'static/products/hp-240-g8-i3-6l1a1pa-abc-des-glr-1.jpg','static/products/hp-240-g8-i3-6l1a1pa-abc-des-glr-2.jpg',3),(24,'2023-05-13 07:56:18.664383','2023-05-13 07:56:18.664383',1,'Laptop HP 15s fq5147TU','i7 1255U/8GB/512GB/Win11 (7C133PA)',17890000,'static/products/hp-15s-fq5147tu-i7-7c133pa-1.jpg','static/products/hp-15s-fq5147tu-i7-7c133pa-2.jpg',3),(25,'2023-05-13 07:58:16.384948','2023-05-13 08:30:43.368184',1,'Laptop HP 15s fq5078TU','i5 1235U/8GB/512GB/Win11 (6K798PA)',14090000,'static/products/hp-15s-fq5078tu-i5-6k798pa-1-2.jpg','static/products/hp-15s-fq5078tu-i5-6k798pa-2-2.jpg',3),(26,'2023-05-13 07:59:49.803743','2023-05-13 07:59:49.803743',1,'Laptop HP 245 G9 R5','5625U/8GB/512GB/Win11 (6L1N9PA)',11990000,'static/products/hp-245-g9-r5-6l1n9pa-1.jpg','static/products/hp-245-g9-r5-6l1n9pa-2.jpg',3),(27,'2023-05-13 08:00:37.676983','2023-05-13 08:00:37.676983',1,'Laptop HP Pavilion X360 14 ek0134TU','i5 1235U/8GB/512GB/Touch/Pen/Win11 (7C0P8PA)',18690000,'static/products/hp-pavilion-x360-14-ek0134tu-i5-7c0p8pa-1.jpg','static/products/hp-pavilion-x360-14-ek0134tu-i5-7c0p8pa-2.jpg',3),(28,'2023-05-13 08:01:40.398689','2023-05-13 08:01:40.398689',1,'Laptop HP Pavilion 15 eg2035TX','i5 1235U/8GB/512GB/2GB MX550/Win11 (6K781PA)',17490000,'static/products/hp-pavilion-15-eg2035tx-i5-6k781pa-1-2.jpg','static/products/hp-pavilion-15-eg2035tx-i5-6k781pa-2-2.jpg',3),(29,'2023-05-13 08:02:42.062216','2023-05-13 08:02:42.062216',1,'Laptop HP Pavilion 14 dv2074TU','i5 1235U/8GB/512GB/Win11 (7C0P3PA)',16690000,'static/products/hp-pavilion-14-dv2074tu-i5-7c0p3pa-1.jpg','static/products/hp-pavilion-14-dv2074tu-i5-7c0p3pa-2.jpg',3),(30,'2023-05-13 08:03:28.918438','2023-05-13 08:03:28.918438',1,'Laptop HP 15s fq5162TU','i5 1235U/8GB/512GB/Win11 (7C134PA)',14090000,'static/products/hp-15s-fq5162tu-i5-7c134pa-1.jpg','static/products/hp-15s-fq5162tu-i5-7c134pa-2.jpg',3),(31,'2023-05-13 08:04:33.931560','2023-05-13 08:04:33.931560',1,'Laptop Lenovo Ideapad 3 15IAU7','i3 1215U/8GB/256GB/Win11 (82RK005LVN)',10390000,'static/products/lenovo-ideapad-3-15iau7-i3-82rk005lvn-1-1.jpg','static/products/lenovo-ideapad-3-15iau7-i3-82rk005lvn-2-1.jpg',4),(32,'2023-05-13 08:05:26.134607','2023-05-13 08:05:26.135604',1,'Laptop Lenovo ThinkBook 14 G3 ACL','R5 5500U/8GB/512GB/Win11 (21A200R0VN)',11990000,'static/products/lenovo-thinkbook-14-g3-acl-r5-21a200r0vn-1.jpg','static/products/lenovo-thinkbook-14-g3-acl-r5-21a200r0vn-2.jpg',4),(33,'2023-05-13 08:06:16.709967','2023-05-13 08:06:16.709967',1,'Laptop Lenovo IdeaPad 1 15AMN7','R5 7520U/8GB/256GB/Win11 (82VG0061VN)',10490000,'static/products/lenovo-ideapad-1-15amn7-r5-82vg0061vn-glr-1.jpg','static/products/lenovo-ideapad-1-15amn7-r5-82vg0061vn-glr-2.jpg',4),(34,'2023-05-13 08:07:04.843811','2023-05-13 08:31:10.196597',1,'Laptop Lenovo Ideapad 3 15ITL6','i5 1155G7/8GB/512GB/Win11 (82H803CVVN)',12590000,'static/products/lenovo-ideapad-3-15itl6-i5-82h803cvvn-1.jpg','static/products/lenovo-ideapad-3-15itl6-i5-82h803cvvn-2.jpg',4),(35,'2023-05-13 08:07:50.498159','2023-05-13 08:31:03.656712',1,'Laptop Lenovo IdeaPad Slim 5 Light 14ABR8','R5 7530U/16GB/512GB/Win11 (82XS002KVN)',17490000,'static/products/lenovo-ideapad-slim-5-light-14abr8-r5-82xs002kvn-abc-glr-1.jpg','static/products/lenovo-ideapad-slim-5-light-14abr8-r5-82xs002kvn-abc-glr-2.jpg',4),(36,'2023-05-13 08:08:42.401464','2023-05-13 08:30:57.815642',1,'Laptop Lenovo Ideapad 3 15IAU7','i5 1235U/8GB/512GB/Win11 (82RK001PVN)',14190000,'static/products/lenovo-ideapad-3-15iau7-i5-82rk001pvn-1-1.jpg','static/products/lenovo-ideapad-3-15iau7-i5-82rk001pvn-2-1.jpg',4),(37,'2023-05-13 08:09:35.849378','2023-05-13 08:30:26.176987',1,'Laptop Lenovo Ideapad 3 15IAU7','i3 1215U/8GB/512GB/Win11 (82RK001MVN)',10990000,'static/products/lenovo-ideapad-3-15iau7-i3-82rk001mvn-1-1.jpg','static/products/lenovo-ideapad-3-15iau7-i3-82rk001mvn-2.jpg',4),(38,'2023-05-13 08:10:16.284319','2023-05-13 08:30:20.754148',1,'Laptop Lenovo Ideapad 5 15IAL7','i5 1235U/8GB/512GB/Win11 (82SF005HVN)',14890000,'static/products/lenovo-ideapad-5-15ial7-i5-82sf005hvn-glr-1.jpg','static/products/lenovo-ideapad-5-15ial7-i5-82sf005hvn-glr-2.jpg',4),(39,'2023-05-13 08:10:57.708187','2023-05-13 08:10:57.708187',1,'Laptop Lenovo Ideapad 3 14ABA7','R5 5625U/8GB/256GB/Win11 (82RM003WVN)',10990000,'static/products/lenovo-ideapad-3-14aba7-r5-82rm003wvn-glr-1.jpg','static/products/lenovo-ideapad-3-14aba7-r5-82rm003wvn-glr-2.jpg',4),(40,'2023-05-13 08:11:44.219795','2023-05-13 08:11:44.219795',1,'Laptop Lenovo Ideapad Gaming 3 15IAH7','i5 12500H/8GB/512GB/4GB RTX3050/120Hz/Win11 (82S9007TVN)',18990000,'static/products/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-1-1.jpg','static/products/lenovo-ideapad-gaming-3-15iah7-i5-82s9007tvn-2-1.jpg',4),(41,'2023-05-13 08:12:27.524195','2023-05-13 08:30:15.601115',1,'Laptop Acer Aspire 3 A315 58 54XF','i5 1135G7/8GB/512GB/Win11 (NX.AM0SV.007)',12990000,'static/products/acer-aspire-3-a315-58-54xf-i5-nxam0sv007-ab-1.jpg','static/products/acer-aspire-3-a315-58-54xf-i5-nxam0sv007-ab-2.jpg',5),(42,'2023-05-13 08:13:06.551371','2023-05-13 08:30:10.426041',1,'Laptop Acer Aspire 7 Gaming A715 42G R05G','R5 5500U/8GB/512GB/4GB GTX1650/144Hz/Win11 (NH.QAYSV.007)',15290000,'static/products/acer-aspire-7-gaming-a715-42g-r05g-r5-nhqaysv007-1.jpg','static/products/acer-aspire-7-gaming-a715-42g-r05g-r5-nhqaysv007-xy-2.jpg',5),(43,'2023-05-13 08:13:51.069762','2023-05-13 08:30:05.379423',1,'Laptop Acer Aspire 5 A514 54 511G','i5 1135G7/8GB/1TB SSD/Win11 (NX.A28SV.009)',14190000,'static/products/acer-aspire-a514-54-511g-i5-nxa28sv009-3.jpg','static/products/acer-aspire-a514-54-511g-i5-nxa28sv009-1.jpg',5),(44,'2023-05-13 08:14:42.435873','2023-05-13 08:30:01.000650',1,'Laptop Acer Aspire 3 A315 57 379K','i3 1005G1/4GB/256GB/Win11 (NX.KAGSV.001)',7790000,'static/products/acer-aspire-3-a315-57-379k-i3-nxkagsv001-ab-1-1.jpg','static/products/acer-aspire-3-a315-57-379k-i3-nxkagsv001-ab-2.jpg',5),(45,'2023-05-13 08:15:36.621909','2023-05-13 08:15:36.621909',1,'Laptop Acer Nitro 5 Gaming AN515 45 R6EV','R5 5600H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QBMSV.006)',17290000,'static/products/acer-nitro-5-gaming-an515-45-r6ev-r5-nhqbmsv006-1.jpg','static/products/acer-nitro-5-gaming-an515-45-r6ev-r5-nhqbmsv006-ab-2.jpg',5),(46,'2023-05-13 08:16:27.587283','2023-05-13 08:29:55.048204',1,'Laptop Acer Aspire 3 A315 59 314F','i3 1215U/8GB/256GB/Win11 (NX.K6TSV.002)',10490000,'static/products/acer-aspire-3-a315-59-314f-i3-nxk6tsv002-2-2.jpg','static/products/acer-aspire-3-a315-59-314f-i3-nxk6tsv002-1-2.jpg',5),(47,'2023-05-13 08:17:35.538071','2023-05-13 08:29:50.086446',1,'Laptop Acer Aspire 3 A314 35 P3G9','N6000/4GB/256GB/Win11 (NX.A7SSV.007)',6790000,'static/products/acer-aspire-3-a314-35-p3g9-n6000-nxa7ssv007-2.jpg','static/products/acer-aspire-3-a314-35-p3g9-n6000-nxa7ssv007-4.jpg',5),(48,'2023-05-13 08:18:51.917509','2023-05-13 08:30:50.640682',1,'Laptop Acer Nitro 5 Gaming AN515 57 5669','i5 11400H/8GB/512GB/144Hz/4GB GTX1650/Win11 (NH.QEHSV.001)',18490000,'static/products/acer-nitro-5-gaming-an515-57-5669-i5-nhqehsv001-2-1.jpg','static/products/acer-nitro-5-gaming-an515-57-5669-i5-nhqehsv001-1.jpg',5),(49,'2023-05-13 08:19:54.545759','2023-05-13 08:29:42.417479',1,'Laptop Acer Nitro 5 Gaming AN515 57 553E','i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win11 (NH.QENSV.006)',19990000,'static/products/acer-nitro-5-gaming-an515-57-553e-i5-nhqensv006-xy-2.jpg','static/products/acer-nitro-5-gaming-an515-57-553e-i5-nhqensv006-xy-3.jpg',5),(50,'2023-05-13 08:20:41.716186','2023-05-13 08:29:36.207077',1,'Laptop Dell Vostro 3510','i5 1135G7/8GB/512GB/2GB MX350/OfficeHS/Win11 (P112F002BBL)',16790000,'static/products/dell-vostro-3510-i5-p112f002bbl-1-1.jpg','static/products/dell-vostro-3510-i5-p112f002bbl-2-2.jpg',6),(51,'2023-05-13 08:21:21.806930','2023-05-13 08:29:24.061037',1,'Laptop Dell Inspiron 15 3520','i5 1235U/8GB/256GB/120Hz/OfficeHS/Win11 (N5I5122W1)',15890000,'static/products/dell-inspiron-15-3520-i5-n5i5122w1-a-2.jpg','static/products/dell-inspiron-15-3520-i5-n5i5122w1-a-3.jpg',6),(52,'2023-05-13 08:22:18.958356','2023-05-13 08:22:18.958356',1,'Laptop Dell Vostro 3400','i5 1135G7/8GB/512GB/2GB MX330/OfficeHS/Win11 (YX51W6)',15990000,'static/products/dell-vostro-3400-i5-yx51w6-1.jpg','static/products/dell-vostro-3400-i5-yx51w6-xy-2.jpg',6),(53,'2023-05-13 08:23:04.625091','2023-05-13 08:29:30.643104',1,'Laptop Dell Gaming G15 5511','i5 11400H/8GB/256GB/4GB RTX3050/120Hz/OfficeHS/Win11 (70266676)',21990000,'static/products/dell-gaming-g15-5511-i5-70266676-1-1.jpg','static/products/dell-gaming-g15-5511-i5-70266676-2-2.jpg',6),(54,'2023-05-13 08:23:53.385663','2023-05-13 08:29:18.090079',1,'Laptop Dell Inspiron 16 5620','i7 1255U/8GB/512GB/OfficeHS/Win11 (N6I7110W1)',22490000,'static/products/dell-inspiron-16-5620-i7-n6i7110w1-1-1.jpg','static/products/dell-inspiron-16-5620-i7-n6i7110w1-2-1.jpg',6),(55,'2023-05-13 08:24:43.646864','2023-05-13 08:24:43.646864',1,'Laptop MSI Gaming GF63 Thin 11SC','i5 11400H/8GB/512GB/4GB GTX1650/144Hz/Win11 (664VN)',16290000,'static/products/msi-gaming-gf63-thin-11sc-i5-664vn-123-glr-1-2.jpg','static/products/msi-gaming-gf63-thin-11sc-i5-664vn-123-glr-2.jpg',7),(56,'2023-05-13 08:25:26.230409','2023-05-13 08:25:26.230409',1,'Laptop MSI Modern 14 B11MOU','i3 1115G4/8GB/256GB/Win11 (1027VN)',9290000,'static/products/msi-modern-14-b11mou-i3-1027vn-1-1.jpg','static/products/msi-modern-14-b11mou-i3-1027vn-2-2.jpg',7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 14:57:21
