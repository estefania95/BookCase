-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: BookCase.mysql.pythonanywhere-services.com    Database: BookCase$default
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add libro usuario',7,'add_librousuario'),(26,'Can change libro usuario',7,'change_librousuario'),(27,'Can delete libro usuario',7,'delete_librousuario'),(28,'Can view libro usuario',7,'view_librousuario'),(29,'Can add usuario',8,'add_usuario'),(30,'Can change usuario',8,'change_usuario'),(31,'Can delete usuario',8,'delete_usuario'),(32,'Can view usuario',8,'view_usuario'),(33,'Can add ranking',9,'add_ranking'),(34,'Can change ranking',9,'change_ranking'),(35,'Can delete ranking',9,'delete_ranking'),(36,'Can view ranking',9,'view_ranking'),(37,'Can add libreria',10,'add_libreria'),(38,'Can change libreria',10,'change_libreria'),(39,'Can delete libreria',10,'delete_libreria'),(40,'Can view libreria',10,'view_libreria'),(41,'Can add genero',11,'add_genero'),(42,'Can change genero',11,'change_genero'),(43,'Can delete genero',11,'delete_genero'),(44,'Can view genero',11,'view_genero'),(45,'Can add libro',12,'add_libro'),(46,'Can change libro',12,'change_libro'),(47,'Can delete libro',12,'delete_libro'),(48,'Can view libro',12,'view_libro'),(49,'Can add autor',13,'add_autor'),(50,'Can change autor',13,'change_autor'),(51,'Can delete autor',13,'delete_autor'),(52,'Can view autor',13,'view_autor');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$ykV11KG9CHUB$XWIpHtwwAnANLEIfWDTrn1HlrdIUCGKZ6eWEH0m9d1Y=','2019-05-29 18:00:40.600059',1,'bookcase','','','',1,1,'2019-05-29 16:47:04.450148'),(2,'pbkdf2_sha256$150000$b765pasirQ55$JSh4xQ57gQ52K4HFIllvYL5REdmHqtVsl2wDmtEuYQY=','2019-05-29 16:47:42.106195',0,'estefania','','','estefi.95.c@gmail.com',0,1,'2019-05-29 16:47:41.716884'),(3,'pbkdf2_sha256$150000$3Qvfe5aQdbiI$aRcbi4BB3zXTv9OfXZ4quaUXxoz47U3l2XN+EWASJwI=','2019-05-29 17:18:51.306785',0,'Madalenachafada','','','eric-elvikingo22@hotmail.com',0,1,'2019-05-29 17:13:55.286961');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-05-29 16:53:23.310996','2','bookcase',1,'[{\"added\": {}}]',8,1),(2,'2019-05-29 16:54:50.715000','1','Historia',1,'[{\"added\": {}}]',11,1),(3,'2019-05-29 16:55:17.926788','2','Novela histórica',1,'[{\"added\": {}}]',11,1),(4,'2019-05-29 16:55:41.314563','3','Literatura contemporánea',1,'[{\"added\": {}}]',11,1),(5,'2019-05-29 16:56:13.687991','4','Autoayuda',1,'[{\"added\": {}}]',11,1),(6,'2019-05-29 16:57:03.154447','5','Cómics y mangas',1,'[{\"added\": {}}]',11,1),(7,'2019-05-29 16:57:29.489840','6','Novela negra',1,'[{\"added\": {}}]',11,1),(8,'2019-05-29 16:58:12.922915','7','Juvenil',1,'[{\"added\": {}}]',11,1),(9,'2019-05-29 16:58:40.141731','8','Infantil',1,'[{\"added\": {}}]',11,1),(10,'2019-05-29 16:59:58.723746','9','Literatura',1,'[{\"added\": {}}]',11,1),(11,'2019-05-29 17:00:21.510246','10','Novela romántica',1,'[{\"added\": {}}]',11,1),(12,'2019-05-29 17:01:36.153854','1','Harry Potter y la piedra filosofal',1,'[{\"added\": {}}]',12,1),(13,'2019-05-29 17:02:19.190754','2','Sed',1,'[{\"added\": {}}]',12,1),(14,'2019-05-29 17:03:09.853349','3','Mister',1,'[{\"added\": {}}]',12,1),(15,'2019-05-29 17:03:45.038602','4','Bienvenida al club. Cabronas sin fronteras',1,'[{\"added\": {}}]',12,1),(16,'2019-05-29 17:04:33.493640','5','El dia que se perdió la cordura',1,'[{\"added\": {}}]',12,1),(17,'2019-05-29 17:05:18.944729','6','El día que se perdió el amor',1,'[{\"added\": {}}]',12,1),(18,'2019-05-29 17:06:03.601370','7','Reina roja',1,'[{\"added\": {}}]',12,1),(19,'2019-05-29 17:06:38.595818','8','Marfil',1,'[{\"added\": {}}]',12,1),(20,'2019-05-29 17:07:18.643676','9','La chica invisible',1,'[{\"added\": {}}]',12,1),(21,'2019-05-29 17:08:10.719645','1','J. K.',1,'[{\"added\": {}}]',13,1),(22,'2019-05-29 17:08:34.534247','2','Neal',1,'[{\"added\": {}}]',13,1),(23,'2019-05-29 17:09:03.495753','3','E.L.',1,'[{\"added\": {}}]',13,1),(24,'2019-05-29 17:09:26.492737','4','Megan',1,'[{\"added\": {}}]',13,1),(25,'2019-05-29 17:09:58.898374','5','Javier',1,'[{\"added\": {}}]',13,1),(26,'2019-05-29 17:10:43.545983','6','Blue',1,'[{\"added\": {}}]',13,1),(27,'2019-05-29 17:11:21.314555','7','Mercedes',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'libro','autor'),(11,'libro','genero'),(12,'libro','libro'),(6,'sessions','session'),(10,'usuario','libreria'),(7,'usuario','librousuario'),(9,'usuario','ranking'),(8,'usuario','usuario');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-05-29 15:42:05.855572'),(2,'auth','0001_initial','2019-05-29 15:43:17.237678'),(3,'admin','0001_initial','2019-05-29 15:43:43.710499'),(4,'admin','0002_logentry_remove_auto_add','2019-05-29 15:43:43.834618'),(5,'admin','0003_logentry_add_action_flag_choices','2019-05-29 15:43:43.860677'),(6,'contenttypes','0002_remove_content_type_name','2019-05-29 15:43:43.956612'),(7,'auth','0002_alter_permission_name_max_length','2019-05-29 15:43:44.011702'),(8,'auth','0003_alter_user_email_max_length','2019-05-29 15:43:44.077374'),(9,'auth','0004_alter_user_username_opts','2019-05-29 15:43:44.091271'),(10,'auth','0005_alter_user_last_login_null','2019-05-29 15:43:44.140900'),(11,'auth','0006_require_contenttypes_0002','2019-05-29 15:43:44.147411'),(12,'auth','0007_alter_validators_add_error_messages','2019-05-29 15:43:44.158730'),(13,'auth','0008_alter_user_username_max_length','2019-05-29 15:43:44.226487'),(14,'auth','0009_alter_user_last_name_max_length','2019-05-29 15:43:44.289160'),(15,'auth','0010_alter_group_name_max_length','2019-05-29 15:43:44.385826'),(16,'auth','0011_update_proxy_permissions','2019-05-29 15:43:44.400140'),(17,'sessions','0001_initial','2019-05-29 15:43:51.499810'),(18,'libro','0001_initial','2019-05-29 16:43:45.820520'),(19,'usuario','0001_initial','2019-05-29 16:44:42.538421'),(20,'usuario','0002_auto_20190517_1844','2019-05-29 16:44:43.585603'),(21,'usuario','0003_auto_20190520_1625','2019-05-29 16:44:43.652534'),(22,'usuario','0004_libreria_maxlibros','2019-05-29 16:44:47.064673');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0ci6l02j68um5b0hb5l3bwebt82gu5ir','MzllZGM1MTQ4NjA4ZmNkOTc4NDVmZTA1YjcyOTc3ZDhmODAxYTBhODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZmQ2NjJhOTQxNGMwMDU3ZWZkMzRmYWQ5ZmY3MDIwZmNmNWQ3NTUxIn0=','2019-06-12 16:52:35.751673'),('4q2loqj71faqsiyj8kx08w0jxeeu7q01','MzllZGM1MTQ4NjA4ZmNkOTc4NDVmZTA1YjcyOTc3ZDhmODAxYTBhODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmZmQ2NjJhOTQxNGMwMDU3ZWZkMzRmYWQ5ZmY3MDIwZmNmNWQ3NTUxIn0=','2019-06-12 18:00:40.606909'),('5n7qlub9szhwo840p9cmfhsbjn7a63rh','MGRmZDMxM2FjMmE3MTkxZjE5NjFiYmMzODNkNWVhNWNlNDc3NzAxODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNzg0MWFhMTI0OTQ0NTMwZTg1OThiOTVmMjEzZWMxMmFiYmViMWI5In0=','2019-06-12 16:47:42.122202'),('x14mks2kfrmp8yf1vjc6o5fkyl763dl2','MGUzMGQxY2UxOTc4ZGI4MTgwY2U0ZDM0MDMzYjBmZWE3NzMxN2Q4ODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2MGYwMTE4ZTgyNmU4OGIwYzdjMGY0NGJkNTA5NDE1MjgzN2ZlZTM5In0=','2019-06-12 17:13:55.742406');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor`
--

DROP TABLE IF EXISTS `libro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `anoNacimiento` int(11) DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor`
--

LOCK TABLES `libro_autor` WRITE;
/*!40000 ALTER TABLE `libro_autor` DISABLE KEYS */;
INSERT INTO `libro_autor` VALUES (1,'J. K.','Rowling',1965,'J K (Joanne Kathleen) Rowling es autora de los siete libros de la famosa saga de Harry Potter. Amada por lectores de todo el mundo, la serie ha vendido más de 500 millones de ejemplares, se ha traducido a ochenta idiomas y ha inspirado ocho películas de enorme éxito de taquilla. Ha escrito asimismo tres volúmenes complementarios con fines benéficos: Quidditch a través de los tiempos, Animales fantásticos y dónde encontrarlos (en beneficio de Comic Relief y Lumos), y Los cuentos de Beedle el Bardo (en beneficio de Lumos), así como el guión inspirado en Animales fantásticos y dónde encontrarlos, la primera de una serie de cinco películas que escribirá la autora. También colaboró en una obra, Harry Potter y el legado maldito, Partes Uno y Dos, que se estrenó en el West End de Londres en el verano de 2016. En 2012 creó la plataforma digital Pottermore, donde sus fans pueden disfrutar de noticias, reportajes y artículos, así como de contenido original escrito por J. K. Rowling. Asimismo, ha escrito la novela para adultos Una vacante imprevista, y, con el seudónimo Robert Galbraith, la serie de novelas policíacas protagonizadas por Cormoran Strike. Ha sido galardonada con numerosos premios, entre ellos la Orden del Imperio Británico por su contribución a la literatura infantil y la Orden de los Compañeros de Honor, la Orden de la Legión de Honor de Francia y el Premio Hans Christian Andersen.'),(2,'Neal','Shusterman',1962,'Neal Shusterman, autor premiado y superventas en las listas delNew York Times, cuenta con una reconocida trayectoria en el ámbito de la literatura infantil y juvenil. Entre sus obras destacan la saga distópicaDesconexión, la trilogíaEverlostyLa trilogía de los Accelerati, publicadas en Anaya. Por su última novela,El abismo, ha recibido el National Book Award 2015, en la categoría de literatura juvenil.'),(3,'E.L.','James',1963,'E.L. James ha desempeñado cargos ejecutivos en televisión. Está casada, tiene dos hijos y vive en Londres. De niña, soñaba con escribir historias que cautivarían a los lectores, pero postergó sus sueños para dedicarse a su familia y a su carrera. Finalmente reunió el coraje para escribir su primera novela Cincuenta sombras de Grey. Es también la autora de Cincuenta sombras más oscuras y Cincuenta sombras liberadas. Con motivo del fenómeno editorial que ha supuesto su trilogía Cincuenta sombras, con gran repercusión en los medios y que ya ha vendido millones de ejemplares, la revista Time ha nombrado a E.L. James una de las cien personas más influyentes del año. Los derechos de traducción ya se han vendido en cuarenta países, y Universal Pictures y Focus Features han comprado los derechos cinematográficos.'),(4,'Megan','Maxwell',1965,'Megan Maxwell es una reconocida y prolífica escritora de género romántico. De madre española y padre americano, ha publicado novelas como Te lo dije (2009), Diario de una chirli (2009), Deseo concedido (2010), Fue un beso tonto (2010), Te esperaré toda mi vida (2011), Niyomismalosé (2011), Casi una novela (2011) y Las ranas también se enamoran (2011), además de relatos y cuentos en antologías colectivas. Ha ganado el Premio Internacional de Novela Romántica Seseña 2010 y el Premio Dama 2010 de Clubromantica.com, entre otros.'),(5,'Javier','Castillo',1987,'Javier Castillo creció en Málaga, se diplomó en empresariales y estudió el máster in Management de ESCP Europe, en el itinerario Madrid-Shanghái-París. Actualmente trabaja como consultor de finanzas c orporativas en una compañía con presencia nacional. Escritor de relatos cortos desde la adolescencia, El día que se perdió la cordura es su primera novela y un éxito comercial en internet.'),(6,'Blue','Jeans',1978,'BLUE JEANS, seudónimo de Francisco de Paula Fernández, nació en Sevilla, aunque toda su adolescencia la pasó en Carmona. A los dieciocho años se trasladó a Madrid, ciudad en la que actualmente reside, para estudiar periodismo en la Universidad Europea. Después de hacer un máster en periodismo deportivo y colaborar en algunos medios, encontró finalmente su lugar cuando se dejó llevar por su gran pasión, la escritura. La trilogía «Canciones para Paula» es su primera obra publicada, una historia que miles de seguidores comenzaron a leer en diferentes redes sociales antes de verla consagrada al papel.Cuando no está escribiendo, BLUE JEANS dedica su tiempo libre a responder las preguntas de sus seguidores en las redes sociales. También ha colaborado con la revista Superpop.'),(7,'Mercedes','Ron',1993,'Mercedes Ron es una joven escritora española que ha triunfado en Wattpad, donde tiene más de 258k seguidores. Los dos primeros títulos de la saga Culpa mía llevan más de 33 millones de lecturas acumuladas. Actualmente se encuentra escribiendo la tercera parte de la saga.');
/*!40000 ALTER TABLE `libro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_autor_libro`
--

DROP TABLE IF EXISTS `libro_autor_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_autor_libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autor_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libro_autor_libro_autor_id_libro_id_231264ab_uniq` (`autor_id`,`libro_id`),
  KEY `libro_autor_libro_libro_id_c980126a_fk_libro_libro_id` (`libro_id`),
  CONSTRAINT `libro_autor_libro_autor_id_97ca9e7d_fk_libro_autor_id` FOREIGN KEY (`autor_id`) REFERENCES `libro_autor` (`id`),
  CONSTRAINT `libro_autor_libro_libro_id_c980126a_fk_libro_libro_id` FOREIGN KEY (`libro_id`) REFERENCES `libro_libro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_autor_libro`
--

LOCK TABLES `libro_autor_libro` WRITE;
/*!40000 ALTER TABLE `libro_autor_libro` DISABLE KEYS */;
INSERT INTO `libro_autor_libro` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,5,6),(7,6,9),(8,7,8);
/*!40000 ALTER TABLE `libro_autor_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_genero`
--

DROP TABLE IF EXISTS `libro_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `nombreImagen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_genero`
--

LOCK TABLES `libro_genero` WRITE;
/*!40000 ALTER TABLE `libro_genero` DISABLE KEYS */;
INSERT INTO `libro_genero` VALUES (1,'Historia','Historia Antigua, Moderna, Contemporánea... Si crees que es necesario entender el pasado para comprender el presente, encuentra aquí el libro que buscas.','historia.jpg'),(2,'Novela histórica','Viaja cientos de años atrás en el tiempo con las mejores novelas históricas. Entra y transpórtate a otras épocas para conocer la historia.','historica.jpg'),(3,'Literatura contemporánea','Todas las novelas las encontrarás aquí. Descubre miles de lecturas que te atraparán desde la primera página.','contemporanea.jpg'),(4,'Autoayuda','Libros de autoayuda para los que buscan resolver sus dudas o satisfacer su curiosidad. Descubre también nuestros títulos de crecimiento personal y bienestar.','autoayuda.png'),(5,'Cómics y mangas','Todos los cómics, mangas y novelas ilustradas.',NULL),(6,'Novela negra','Adéntrate en las mejores novelas negras y de misterio. Lee los grandes clásicos y los mejores thrillers de momento. Todas las novelas de policías, detectives, libros de terror, crímenes, asesinatos, mafia, espionaje y libros de suspense.','novelaNegra.jpg'),(7,'Juvenil','Descubre tu próxima lectura juvenil. ¿Te gusta el misterio, la ciencia-ficción, la fantasía? ¿O prefieres las novelas románticas y realistas? ¡Una amplia variedad de historias llenas de emociones!','juvenil.jpg'),(8,'Infantil','Los mejores libros para los más pequeños.',NULL),(9,'Literatura','Hay muchas joyas de la literatura que no hemos leído por falta de tiempo o sencillamente porque siempre tenemos otra lectura a medias que queremos acabar. Si tienes ganas de descubrir un libro que recuerdes para siempre, has llegado al lugar adecuado.',NULL),(10,'Novela romántica','Disfruta de las novelas románticas más apasionantes y descubre todos los libros de romántica contemporánea y histórica, highlanders, regencia y romántica fantástica. ¡Te enamorarás de sus personajes!',NULL);
/*!40000 ALTER TABLE `libro_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_libro`
--

DROP TABLE IF EXISTS `libro_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `editorial` varchar(100) NOT NULL,
  `numeroPaginas` int(11) NOT NULL,
  `anoEdicion` int(11) NOT NULL,
  `sinopsis` longtext NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_libro`
--

LOCK TABLES `libro_libro` WRITE;
/*!40000 ALTER TABLE `libro_libro` DISABLE KEYS */;
INSERT INTO `libro_libro` VALUES (1,'Harry Potter y la piedra filosofal','9788498382662','Salamandra',256,2010,'Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y el insoportable primo Dudley. Harry se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el Colegio Hogwarts de Magia. A partir de ese momento, la suerte de Harry da un vuelco espectacular. En esa escuela tan especial aprenderá encantamientos, trucos fabulosos y tácticas de defensa contra las malas artes. Se convertirá en el campeón escolar de quidditch, especie de fútbol aéreo que se juega montado sobre escobas, y hará un puñado de buenos amigos... aunque también algunos temibles enemigos. Pero, sobre todo, conocerá los secretos que le permitirán cumplir con su destino. Pues, aunque no lo parezca a primera vista, Harry no es un chico normal y corriente: ¡es un verdadero mago!','https://imagessl2.casadellibro.com/a/l/t5/62/9788498382662.jpg'),(2,'Sed','9788416858897','Nocturna ediciones',424,2019,'¿Hasta dónde llegarías para conseguir la última gota de agua? Alyssa vive con su familia al sur de California, en un barrio residencial muy apacible... Hasta que, un día, del fregadero deja de salir agua. Tras padecer varios años de sequía, eso tampoco es extraño; allí todo el mundo está acostumbrado a las advertencias: no riegues el césped, no llenes la piscina, no te des duchas largas.Pero esta vez ya no queda agua que ahorrar. En muy poco tiempo, el supermercado del apacible barrio residencial se ha llenado de familias desesperadas y dispuestas a todo con tal de conseguir un bidón de agua. Y cuando sus padres salen en busca de provisiones y no regresan, Alyssa, su hermano y el peculiar vecino que los acompaña no tienen más remedio que empezar a tomar decisiones difíciles para sobrevivir. Cueste lo que cueste.','https://imagessl7.casadellibro.com/a/l/t5/97/9788416858897.jpg'),(3,'Mister','9788425358098','Grijalbo',604,2019,'La vida siempre ha sido fácil para Maxim Trevelyan. Gracias a su innegable atractivo, su entorno aristocrático y su riqueza, nunca ha tenido que trabajar y pocas veces duerme solo. Pero todo cambia cuando estalla la tragedia y lleva a Maxim a heredar el título nobiliario, la fortuna y las propiedades familiares. Pero no está preparado para esta responsabilidad y le cuesta afrontarlo. Sin embargo, su mayor desafío es luchar contra el deseo que le despierta inesperadamente una enigmática joven…','https://imagessl8.casadellibro.com/a/l/t5/98/9788425358098.jpg'),(4,'Bienvenida al club. Cabronas sin fronteras','9788408210801','Planeta',480,2019,'na comedia romántica que nos enseña a dejar de ser princesas para convertirnos en auténticas guerreras. Amar y ser amada es lo que toda mujer… desea. Lo que toda mujer… ansía. Y con lo que toda mujer… sueña. Pero ¿qué pasa cuando el sueño se desvanece, eres consciente de que tu vida es pura mentira y encima vas rayando los techos allí por donde pasas? Te pongo en situación. Silvia, Rosa y Elisa no han tenido demasiada suerte en el amor. Por diferentes circunstancias, las tres han acabado rompiendo sus supuestamente felices vidas matrimoniales y han adoptado el estado civil de solteras o divorciadas. Y también está Venecia. Soltera y sin hijos, tanto la vida de sus amigas como su último fracaso amoroso le hacen ver que el amor, además de caduco, es una mierda. Tras una noche de juerga y borrachera en un karaoke, donde conocen las historias de otras mujeres, tienen varias cosas claras: 1. El amor es para los incautos. 2. Se acabó ser una princesa para empezar a ser una guerrera. 3. Corazón blindado y cabeza fría (y si es en «modo tío»…, mejor). 4. Crearán un club privado llamado… Cabronas sin fronteras. Si quieres reírte y ver cómo las mujeres somos capaces de dar un giro a nuestras vidas, no puedes quedarte sin leer Bienvenida al club. Cabronas sin fronteras.','https://imagessl1.casadellibro.com/a/l/t5/01/9788408210801.jpg'),(5,'El dia que se perdió la cordura','9788483659052','Suma',300,2017,'Amor, odio, destino, extrañas prácticas, intriga y acción trepidante inundan las páginas de una novela que se ha convertido en todo un fenómeno editorial antes de su publicación en papel.«A veces el destino nos pone a prueba para que sepamos que existe».Centro de Boston, 24 de diciembre, un hombre camina desnudo con la cabeza decapitada de una joven. El doctor Jenkins, director del centro psiquiátrico de la ciudad, y Stella Hyden, agente de perfiles del FBI, se adentrarán en una investigación que pondrá en juego sus vidas, su concepción de la cordura y que los llevará hasta unos sucesos fortuitos ocurridos en el misterioso pueblo de Salt Lake diecisiete años atrás.','https://imagessl2.casadellibro.com/a/l/t5/52/9788483659052.jpg'),(6,'El día que se perdió el amor','9788491291732','Suma',432,2018,'Adictiva, trepidante y absorbente, Javier Castillo, autor del exitoso thriller El día que se perdió la cordura, nos introduce de nuevo en una historia frenética cargada suspense y amor a partes iguales. «A veces el amor te pone en el camino equivocado para que sepas cuánto duele.» A las doce de la mañana del 14 de diciembre, una joven llena de magulladuras se presenta desnuda en las instalaciones del FBI en Nueva York. El inspector Bowring, jefe de la Unidad de Criminología, intentará descubrir qué esconde una nota amarillenta con el nombre de una mujer que horas después aparece decapitada en un descampado. La investigación lo sumirá de lleno en una trama en la que el destino, el amor y la venganza se entrelazan en una truculenta historia que guarda conexión con la desaparición de una chica varios años antes y cuyo paradero nunca pudo descubrir.','https://imagessl2.casadellibro.com/a/l/t5/32/9788491291732.jpg'),(7,'Reina roja','9788466664417','S.A. EDICIONES B',568,2018,'Vuelve el autor español de thriller más leído en todo el mundo Antonia Scott es una mujer muy especial. Tiene un don que es al mismo tiempo una maldición: una extraordinaria inteligencia. Gracias a ella ha salvado decenas de vidas, pero también lo ha perdido todo. Hoy se parapeta contra el mundo en su piso casi vacío de Lavapiés, del que no piensa volver a salir. Ya no queda nada ahí fuera que le interese lo más mínimo. El inspector Jon Gutiérrez está acusado de corrupción, suspendido de empleo y sueldo. Es un buen policía metido en un asunto muy feo, y ya no tiene mucho que perder. Por eso acepta la propuesta de un misterioso desconocido: ir a buscar a Antonia y sacarla de su encierro, conseguir que vuelva a hacer lo que fuera que hiciera antes, y el desconocido le ayudará a limpiar su nombre. Un encargo extraño aunque aparentemente fácil. Pero Jon se dará cuenta en seguida de que con Antonia nada es fácil.','https://imagessl7.casadellibro.com/a/l/t5/17/9788466664417.jpg'),(8,'Marfil','9788417671488','Montena',448,2019,'Amar nunca fue tan peligroso como en «Enfrentados», la nueva saga de Mercedes Ron. Marfil tiene 20 años y vive en Nueva York, pero no todo es tan idílico como parece: hace unos días fue secuestrada mientras paseaba por Central Park. Su padre tiene muy claro que la razón del secuestro ha sido para mandarle un mensaje: podemos llegar a ella. A pesar de ser liberada, todo ha cambiado para Marfil: su vida no es la misma, y ella tampoco. Sobre todo porque ahora nunca está sola: siempre la acompaña Sebastian Moore, su guardaespaldas. Sebastian demostrará ser el encargado perfecto para protegerla, sobre todo cuando comienzan a llegar las amenazas de muerte, aunque nunca hubiese pensado que la tarea más complicada no sería esa, sino mantener a Marfil Cortés alejada de él. ¿Está Marfil preparada para descubrir la verdad de su pasado? ¿Lo pondrá todo en riesgo la atracción que ha surgido entre ambos?','https://imagessl8.casadellibro.com/a/l/t5/88/9788417671488.jpg'),(9,'La chica invisible','9788408184782','Planeta',544,2018,'Aurora Ríos es invisible para casi todos. Los acontecimientos del pasado han hecho que se aísle del mundo y que apenas se relacione. A sus diecisiete años, no tiene amigos y está harta de que los habitantes de aquel pueblo hablen a su espalda. Una noche de mayo, su madre no la encuentra en casa cuando regresa del trabajo. No es lo habitual. Aurora aparece muerta a la mañana siguiente en el vestuario de su instituto, el Rubén Darío. Tiene un golpe en la cabeza y han dejado una brújula junto a su cuerpo. ¿Quién es el responsable de aquel terrible suceso? Julia Plaza, compañera de clase de la chica invisible, está obsesionada con encontrar la respuesta. Su gran inteligencia y su memoria prodigiosa le sirven para realizar el cubo de Rubik en cincuenta segundos o ser invencible jugando al ajedrez. Pero ¿podrá ayudar a sus padres en la resolución de aquel enigma? Su madre, Aitana, es la forense del caso y su padre, Miguel Ángel, el sargento de la Policía Judicial de la Guardia Civil encargado de la investigación. Julia, junto a su inseparable amigo Emilio, un chico muy particular con una mirada inquietante, tratará de hacer todo lo que esté en su mano para que el asesinato de Aurora Ríos no quede impune. ¿Conseguirán averiguar quién es el Asesino de la brújula y qué hay detrás de aquella extraña muerte?','https://imagessl2.casadellibro.com/a/l/t5/82/9788408184782.jpg');
/*!40000 ALTER TABLE `libro_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro_libro_genero`
--

DROP TABLE IF EXISTS `libro_libro_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `libro_libro_genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libro_libro_genero_libro_id_genero_id_b05771cb_uniq` (`libro_id`,`genero_id`),
  KEY `libro_libro_genero_genero_id_a0ed9e32_fk_libro_genero_id` (`genero_id`),
  CONSTRAINT `libro_libro_genero_genero_id_a0ed9e32_fk_libro_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `libro_genero` (`id`),
  CONSTRAINT `libro_libro_genero_libro_id_05650adc_fk_libro_libro_id` FOREIGN KEY (`libro_id`) REFERENCES `libro_libro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro_libro_genero`
--

LOCK TABLES `libro_libro_genero` WRITE;
/*!40000 ALTER TABLE `libro_libro_genero` DISABLE KEYS */;
INSERT INTO `libro_libro_genero` VALUES (1,1,7),(2,2,7),(3,3,10),(4,4,10),(5,5,6),(6,6,6),(7,7,6),(8,8,7),(9,9,6),(10,9,7);
/*!40000 ALTER TABLE `libro_libro_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_libreria`
--

DROP TABLE IF EXISTS `usuario_libreria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_libreria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  `estantes` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `maxLibros` int(11),
  PRIMARY KEY (`id`),
  KEY `usuario_libreria_usuario_id_8644d861_fk_usuario_usuario_id` (`usuario_id`),
  CONSTRAINT `usuario_libreria_usuario_id_8644d861_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_libreria`
--

LOCK TABLES `usuario_libreria` WRITE;
/*!40000 ALTER TABLE `usuario_libreria` DISABLE KEYS */;
INSERT INTO `usuario_libreria` VALUES (1,'Libreria juvenil','Aqui hay libros juveniles',2,2,40);
/*!40000 ALTER TABLE `usuario_libreria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_libreria_libro`
--

DROP TABLE IF EXISTS `usuario_libreria_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_libreria_libro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libreria_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_libreria_libro_libreria_id_libro_id_5087564b_uniq` (`libreria_id`,`libro_id`),
  KEY `usuario_libreria_libro_libro_id_4e24d947_fk_libro_libro_id` (`libro_id`),
  CONSTRAINT `usuario_libreria_lib_libreria_id_7ff3bd51_fk_usuario_l` FOREIGN KEY (`libreria_id`) REFERENCES `usuario_libreria` (`id`),
  CONSTRAINT `usuario_libreria_libro_libro_id_4e24d947_fk_libro_libro_id` FOREIGN KEY (`libro_id`) REFERENCES `libro_libro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_libreria_libro`
--

LOCK TABLES `usuario_libreria_libro` WRITE;
/*!40000 ALTER TABLE `usuario_libreria_libro` DISABLE KEYS */;
INSERT INTO `usuario_libreria_libro` VALUES (1,1,2),(2,1,9);
/*!40000 ALTER TABLE `usuario_libreria_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_librousuario`
--

DROP TABLE IF EXISTS `usuario_librousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_librousuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(2) NOT NULL,
  `dia` date DEFAULT NULL,
  `libro_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_librousuario_libro_id_0f1397ae_fk_libro_libro_id` (`libro_id`),
  KEY `usuario_librousuario_usuario_id_88b3aee5_fk_usuario_usuario_id` (`usuario_id`),
  CONSTRAINT `usuario_librousuario_libro_id_0f1397ae_fk_libro_libro_id` FOREIGN KEY (`libro_id`) REFERENCES `libro_libro` (`id`),
  CONSTRAINT `usuario_librousuario_usuario_id_88b3aee5_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_librousuario`
--

LOCK TABLES `usuario_librousuario` WRITE;
/*!40000 ALTER TABLE `usuario_librousuario` DISABLE KEYS */;
INSERT INTO `usuario_librousuario` VALUES (1,'LD',NULL,2,2);
/*!40000 ALTER TABLE `usuario_librousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_ranking`
--

DROP TABLE IF EXISTS `usuario_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tiempo` varchar(2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_ranking_usuario_id_899a8756_fk_usuario_usuario_id` (`usuario_id`),
  CONSTRAINT `usuario_ranking_usuario_id_899a8756_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_ranking`
--

LOCK TABLES `usuario_ranking` WRITE;
/*!40000 ALTER TABLE `usuario_ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario`
--

DROP TABLE IF EXISTS `usuario_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `usuario_usuario_usuario_id_617b687d_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario`
--

LOCK TABLES `usuario_usuario` WRITE;
/*!40000 ALTER TABLE `usuario_usuario` DISABLE KEYS */;
INSERT INTO `usuario_usuario` VALUES (2,1),(1,2),(3,3);
/*!40000 ALTER TABLE `usuario_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_usuario_genero`
--

DROP TABLE IF EXISTS `usuario_usuario_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_usuario_genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `genero_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_usuario_genero_usuario_id_genero_id_b415e91a_uniq` (`usuario_id`,`genero_id`),
  KEY `usuario_usuario_genero_genero_id_e9ed3adb_fk_libro_genero_id` (`genero_id`),
  CONSTRAINT `usuario_usuario_genero_genero_id_e9ed3adb_fk_libro_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `libro_genero` (`id`),
  CONSTRAINT `usuario_usuario_genero_usuario_id_93152a73_fk_usuario_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_usuario_genero`
--

LOCK TABLES `usuario_usuario_genero` WRITE;
/*!40000 ALTER TABLE `usuario_usuario_genero` DISABLE KEYS */;
INSERT INTO `usuario_usuario_genero` VALUES (1,2,7);
/*!40000 ALTER TABLE `usuario_usuario_genero` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-29 19:50:04
