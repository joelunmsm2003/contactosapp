-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: belleza
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `app_categoria`
--

DROP TABLE IF EXISTS `app_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `orden` int(11),
  `icono` varchar(100),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_categoria`
--

LOCK TABLES `app_categoria` WRITE;
/*!40000 ALTER TABLE `app_categoria` DISABLE KEYS */;
INSERT INTO `app_categoria` VALUES (1,'manos','static/MAICURE_listopsd_-_copia.png',2,'static/WhatsApp_Image_2017-12-26_at_10.23.09_2.jpeg'),(2,'pies','static/xxxpedicure.png',3,'static/WhatsApp_Image_2017-12-26_at_10.23.07.jpeg'),(3,'maquillaje','static/2_-_copia.png',1,'static/WhatsApp_Image_2017-12-26_at_10.23.10.jpeg'),(4,'podologia','static/PODOLOGIA.png',5,'static/WhatsApp_Image_2017-12-26_at_10.23.08.jpeg'),(5,'masajes','static/masajes_2.png',7,'static/WhatsApp_Image_2017-12-26_at_10.23.10_1.jpeg'),(6,'manicure de niñas','static/MAICURE_NIÑA.png',4,'static/WhatsApp_Image_2017-12-26_at_10.23.05.jpeg'),(7,'baber','static/BARBER_TpZW6C3.png',6,'static/WhatsApp_Image_2017-12-26_at_10.23.09_1.jpeg'),(8,'extras','static/SERIVIOS_EXTRAS_LyRpnCd.png',8,'static/WhatsApp_Image_2017-12-26_at_10.23.09.jpeg');
/*!40000 ALTER TABLE `app_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_cliente`
--

DROP TABLE IF EXISTS `app_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `numero_notificacion` varchar(1000) DEFAULT NULL,
  `apellido` varchar(1000) DEFAULT NULL,
  `edad` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `telefono` varchar(1000) DEFAULT NULL,
  `photo` varchar(100),
  `direccion` varchar(1000),
  `distrito` int(11),
  PRIMARY KEY (`id`),
  KEY `app_cliente_user_id_197589be_fk_auth_user_id` (`user_id`),
  KEY `app_cliente_433765cf` (`distrito`),
  CONSTRAINT `app_cliente_distrito_51cd6e18_fk_app_distrito_id` FOREIGN KEY (`distrito`) REFERENCES `app_distrito` (`id`),
  CONSTRAINT `app_cliente_user_id_197589be_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cliente`
--

LOCK TABLES `app_cliente` WRITE;
/*!40000 ALTER TABLE `app_cliente` DISABLE KEYS */;
INSERT INTO `app_cliente` VALUES (1,'Carlos',5,'b228c867-34ec-49dc-8591-e810a898bd17','Perez','2121','carlos@bex.com','21212','static/pp_H7x0DJ0.jpg','Jr Pinos 223 Miraflores',4);
/*!40000 ALTER TABLE `app_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_clientesocias`
--

DROP TABLE IF EXISTS `app_clientesocias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_clientesocias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `socia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_clientesocias_cliente_id_f34a247f_fk_app_cliente_id` (`cliente_id`),
  KEY `app_clientesocias_socia_id_ea7c7522_fk_socia_id` (`socia_id`),
  CONSTRAINT `app_clientesocias_cliente_id_f34a247f_fk_app_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `app_cliente` (`id`),
  CONSTRAINT `app_clientesocias_socia_id_ea7c7522_fk_socia_id` FOREIGN KEY (`socia_id`) REFERENCES `socia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_clientesocias`
--

LOCK TABLES `app_clientesocias` WRITE;
/*!40000 ALTER TABLE `app_clientesocias` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_clientesocias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_dia`
--

DROP TABLE IF EXISTS `app_dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_dia`
--

LOCK TABLES `app_dia` WRITE;
/*!40000 ALTER TABLE `app_dia` DISABLE KEYS */;
INSERT INTO `app_dia` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miercoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sabado'),(7,'Domingo');
/*!40000 ALTER TABLE `app_dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_distrito`
--

DROP TABLE IF EXISTS `app_distrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_distrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_distrito`
--

LOCK TABLES `app_distrito` WRITE;
/*!40000 ALTER TABLE `app_distrito` DISABLE KEYS */;
INSERT INTO `app_distrito` VALUES (1,'San Juan de Miraflores'),(4,'Lince'),(5,'Los Olivos'),(6,'Miraflores'),(7,'Chorrillos'),(8,'San Martin de Porres');
/*!40000 ALTER TABLE `app_distrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_estado`
--

DROP TABLE IF EXISTS `app_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_estado`
--

LOCK TABLES `app_estado` WRITE;
/*!40000 ALTER TABLE `app_estado` DISABLE KEYS */;
INSERT INTO `app_estado` VALUES (1,'Pendiente'),(2,'Aceptado');
/*!40000 ALTER TABLE `app_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_notificacion`
--

DROP TABLE IF EXISTS `app_notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_notificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `servicio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_notificacion_4bb699dc` (`servicio_id`),
  CONSTRAINT `app_notificacion_servicio_id_d4a2b0e6_fk_app_servicio_id` FOREIGN KEY (`servicio_id`) REFERENCES `app_servicio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_notificacion`
--

LOCK TABLES `app_notificacion` WRITE;
/*!40000 ALTER TABLE `app_notificacion` DISABLE KEYS */;
INSERT INTO `app_notificacion` VALUES (9,'2017-12-06 05:19:35','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":-408139233,\"displayType\":0,\"payload\":{\"notificationID\":\"7ce05481-2b88-4eeb-bfaf-fd28bb81ce2d\",\"body\":\"English Messag000e\",\"additionalData\":{\"servicio\":2},\"lockScreenVisibility\":1,\"fromProjectNumber\":\"466431784640\",\"priority\":0,\"rawPayload\":\"{\\\\\"google.sent_time\\\\\":1512537562341,\\\\\"custom\\\\\":\\\\\"{\\\\\\\\\\\\\"a\\\\\\\\\\\\\":{\\\\\\\\\\\\\"servicio\\\\\\\\\\\\\":2},\\\\\\\\\\\\\"i\\\\\\\\\\\\\":\\\\\\\\\\\\\"7ce05481-2b88-4eeb-bfaf-fd28bb81ce2d\\\\\\\\\\\\\"}\\\\\",\\\\\"from\\\\\":\\\\\"466431784640\\\\\",\\\\\"alert\\\\\":\\\\\"English Messag000e\\\\\",\\\\\"google.message_id\\\\\":\\\\\"0:1512537562346894%b8ff167ef9fd7ecd\\\\\",\\\\\"notificationId\\\\\":-408139233}\"}}}\'}',2),(10,'2017-12-06 05:27:58','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":1099947002,\"displayType\":1,\"payload\":{\"notificationID\":\"bd4733b6-20ea-4f5c-a9f7-92890c7d593b\",\"body\":\"English Messag000e\",\"additionalData\":{\"servicio\":3},\"lockScreenVisibility\":1,\"fromProjectNumber\":\"466431784640\",\"priority\":0,\"rawPayload\":\"{\\\\\"google.sent_time\\\\\":1512537647250,\\\\\"custom\\\\\":\\\\\"{\\\\\\\\\\\\\"a\\\\\\\\\\\\\":{\\\\\\\\\\\\\"servicio\\\\\\\\\\\\\":3},\\\\\\\\\\\\\"i\\\\\\\\\\\\\":\\\\\\\\\\\\\"bd4733b6-20ea-4f5c-a9f7-92890c7d593b\\\\\\\\\\\\\"}\\\\\",\\\\\"from\\\\\":\\\\\"466431784640\\\\\",\\\\\"alert\\\\\":\\\\\"English Messag000e\\\\\",\\\\\"google.message_id\\\\\":\\\\\"0:1512537647261702%b8ff167ef9fd7ecd\\\\\",\\\\\"notificationId\\\\\":1099947002}\"}}}\'}',3),(11,'2017-12-06 05:46:05','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":1748196163,\"displayType\":0,\"payload\":{\"notificationID\":\"16388b93-8a23-472b-bdef-ab05484c5f16\",\"body\":\"English Messag000e\",\"additionalData\":{\"servicio\":10},\"lockScreenVisibility\":1,\"fromProjectNumber\":\"466431784640\",\"priority\":0,\"rawPayload\":\"{\\\\\"google.sent_time\\\\\":1512539160276,\\\\\"custom\\\\\":\\\\\"{\\\\\\\\\\\\\"a\\\\\\\\\\\\\":{\\\\\\\\\\\\\"servicio\\\\\\\\\\\\\":10},\\\\\\\\\\\\\"i\\\\\\\\\\\\\":\\\\\\\\\\\\\"16388b93-8a23-472b-bdef-ab05484c5f16\\\\\\\\\\\\\"}\\\\\",\\\\\"from\\\\\":\\\\\"466431784640\\\\\",\\\\\"alert\\\\\":\\\\\"English Messag000e\\\\\",\\\\\"google.message_id\\\\\":\\\\\"0:1512539160282271%b8ff167ef9fd7ecd\\\\\",\\\\\"notificationId\\\\\":1748196163}\"}}}\'}',10),(12,'2017-12-06 13:59:02','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":false,\"shown\":true,\"androidNotificationId\":-825880740,\"displayType\":0,\"payload\":{\"notificationID\":\"a048c819-2015-4982-be3c-042b4cf6b98a\",\"body\":\"Tienes una nueva Chica que te atendera\",\"additionalData\":{\"servicio\":10},\"lockScreenVisibility\":1,\"fromProjectNumber\":\"466431784640\",\"priority\":0,\"rawPayload\":\"{\\\\\"google.sent_time\\\\\":1512568723338,\\\\\"custom\\\\\":\\\\\"{\\\\\\\\\\\\\"a\\\\\\\\\\\\\":{\\\\\\\\\\\\\"servicio\\\\\\\\\\\\\":10},\\\\\\\\\\\\\"i\\\\\\\\\\\\\":\\\\\\\\\\\\\"a048c819-2015-4982-be3c-042b4cf6b98a\\\\\\\\\\\\\"}\\\\\",\\\\\"from\\\\\":\\\\\"466431784640\\\\\",\\\\\"alert\\\\\":\\\\\"Tienes una nueva Chica que te atendera\\\\\",\\\\\"google.message_id\\\\\":\\\\\"0:1512568723344970%b8ff167ef9fd7ecd\\\\\",\\\\\"notificationId\\\\\":-825880740}\"}}}\'}',10);
/*!40000 ALTER TABLE `app_notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_opcion`
--

DROP TABLE IF EXISTS `app_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_opcion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  `sociasubcategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_opcion_b57f1c22` (`sociasubcategoria_id`),
  CONSTRAINT `app_op_sociasubcategoria_id_c0d01f85_fk_app_sociasubcategoria_id` FOREIGN KEY (`sociasubcategoria_id`) REFERENCES `app_sociasubcategoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_opcion`
--

LOCK TABLES `app_opcion` WRITE;
/*!40000 ALTER TABLE `app_opcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_portadaphoto`
--

DROP TABLE IF EXISTS `app_portadaphoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_portadaphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_portadaphoto`
--

LOCK TABLES `app_portadaphoto` WRITE;
/*!40000 ALTER TABLE `app_portadaphoto` DISABLE KEYS */;
INSERT INTO `app_portadaphoto` VALUES (4,'','static/WhatsApp_Image_2017-12-29_at_21.59.53.jpeg'),(5,'','static/WhatsApp_Image_2017-12-29_at_22.00.02.jpeg'),(6,'','static/WhatsApp_Image_2017-12-29_at_22.00.17.jpeg');
/*!40000 ALTER TABLE `app_portadaphoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_servicio`
--

DROP TABLE IF EXISTS `app_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` time DEFAULT NULL,
  `fecha_fin` time DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `dia_id` int(11) DEFAULT NULL,
  `socia_id` int(11) DEFAULT NULL,
  `notificacion_cuerpo` longtext NOT NULL,
  `notificacion_titulo` varchar(1000) NOT NULL,
  `precio` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `latitud` varchar(1000),
  `longitud` varchar(1000),
  `estado_id` int(11),
  PRIMARY KEY (`id`),
  KEY `app_servicio_cliente_id_cca88c56_fk_app_cliente_id` (`cliente_id`),
  KEY `app_servicio_dia_id_4ad2c1ad_fk_app_dia_id` (`dia_id`),
  KEY `app_servicio_85ffcb7c` (`socia_id`),
  KEY `app_servicio_2c189993` (`estado_id`),
  CONSTRAINT `app_servicio_cliente_id_cca88c56_fk_app_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `app_cliente` (`id`),
  CONSTRAINT `app_servicio_dia_id_4ad2c1ad_fk_app_dia_id` FOREIGN KEY (`dia_id`) REFERENCES `app_dia` (`id`),
  CONSTRAINT `app_servicio_estado_id_1254a554_fk_app_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `app_estado` (`id`),
  CONSTRAINT `app_servicio_socia_id_6ef83998_fk_socia_id` FOREIGN KEY (`socia_id`) REFERENCES `socia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_servicio`
--

LOCK TABLES `app_servicio` WRITE;
/*!40000 ALTER TABLE `app_servicio` DISABLE KEYS */;
INSERT INTO `app_servicio` VALUES (1,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(2,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(3,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(4,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(5,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(6,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(7,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(8,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(9,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(10,'22:56:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(11,'01:00:00',NULL,NULL,1,5,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(12,'22:32:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(13,'22:32:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(14,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(15,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(16,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(17,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(18,'19:01:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(19,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(20,'23:32:00',NULL,NULL,1,3,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(21,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(22,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(23,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(24,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(25,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(26,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(27,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(28,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(29,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(30,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(31,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(32,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(33,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(34,'20:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(35,'21:59:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(36,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(37,'08:23:00',NULL,NULL,1,4,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(38,'20:05:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(39,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(40,'22:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(41,'22:39:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(42,'22:39:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(43,'22:39:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(44,'22:39:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(45,'22:39:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(46,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(47,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(48,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(49,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(50,'22:01:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(51,'22:57:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(52,'22:01:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(53,'22:00:00',NULL,NULL,1,5,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(54,'22:00:00',NULL,NULL,1,5,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(55,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(56,'22:12:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(57,'22:12:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(58,'22:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(59,'00:00:00',NULL,NULL,1,5,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(60,'00:00:00',NULL,NULL,1,5,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(61,'10:37:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(62,'20:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(63,'20:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(64,'20:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(65,'20:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(66,'20:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(67,'01:09:00',NULL,NULL,1,6,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(68,'01:09:00',NULL,NULL,1,6,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(69,'09:46:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(70,'20:05:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(71,'21:06:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(72,'02:01:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(73,'05:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(74,'00:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(75,'00:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(76,'00:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(77,'00:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23',NULL,NULL,NULL),(78,'00:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.0463731','-77.042754',NULL),(79,'21:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.0463731','-77.042754',NULL),(80,'21:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.0463731','-77.042754',NULL),(81,'21:00:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.0463731','-77.042754',NULL),(82,'22:45:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.1605250299','-76.995021073',NULL),(83,'21:52:00',NULL,NULL,1,2,3,'','',NULL,'2017-12-23','-12.1577033294','-76.9950550307',NULL),(85,'23:21:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1531020077','-76.9932172862',NULL),(86,'23:24:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1589068584','-76.9952517074',NULL),(87,'23:25:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.1586162898','-76.9950376307',NULL),(88,'23:26:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.1588446295','-76.9949077847',NULL),(89,'23:28:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.158446079','-76.9949507',NULL),(90,'23:28:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1549073281','-76.9932116286',NULL),(91,'23:30:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1553963903','-76.9917752645',NULL),(92,'23:30:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-23','-12.1589933398','-76.9931891709',NULL),(93,'23:32:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1588152292','-76.993756328',NULL),(94,'23:33:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1591777265','-76.9946381926',NULL),(95,'23:33:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1591777265','-76.9946381926',NULL),(96,'23:33:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1591777265','-76.9946381926',NULL),(97,'23:33:00',NULL,NULL,1,7,3,'','',NULL,'2017-12-23','-12.1568493475','-76.9926211714',NULL),(98,'15:29:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1636116237','-76.991831151',NULL),(99,'15:32:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1577784588','-76.9926742714',NULL),(100,'15:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1572699768','-76.9948257963',NULL),(101,'15:38:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1559904105','-76.9929160635',NULL),(102,'15:41:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1598383432','-76.9940512778',NULL),(103,'15:43:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1587925528','-76.9939742894',NULL),(104,'15:44:00',NULL,NULL,1,1,3,'','',NULL,'2017-12-25','-12.1606094346','-76.9943156698',NULL),(105,'15:43:00',NULL,NULL,1,2,3,'','',NULL,'2018-01-02','-12.1586420617','-76.9934958936',NULL),(106,'15:43:00',NULL,NULL,1,2,3,'','',NULL,'2018-01-02','-12.1586420617','-76.9934958936',NULL),(107,'17:20:00',NULL,NULL,1,2,3,'','',NULL,'2017-12-26','-12.1189992346','-77.0323088212',NULL),(108,'16:52:00',NULL,NULL,1,7,3,'','',NULL,'2018-12-30','-12.1263581924','-77.0333783556',NULL),(109,'10:44:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','40.3087369188','-111.682250839',NULL),(110,'16:50:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1609958057','-76.9954130534',NULL),(111,'16:50:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1609958057','-76.9954130534',NULL),(112,'16:50:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1609958057','-76.9954130534',NULL),(113,'16:50:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1609958057','-76.9954130534',NULL),(114,'20:57:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1594050134','-76.9951726614',NULL),(115,'20:37:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1651243874','-76.9908829558',NULL),(116,'23:27:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1574879652','-76.9953460381',NULL),(117,'23:27:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1574879652','-76.9953460381',NULL),(118,'23:27:00',NULL,NULL,1,1,3,'','',NULL,'2018-01-01','-12.1574879652','-76.9953460381',NULL),(119,'20:27:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1574879652','-76.9953460381',NULL),(120,'20:49:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1280507727','-77.0009791434',NULL),(121,'20:33:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.156121837','-76.989716028',1),(122,'20:41:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1558124218','-76.9925592407',2),(123,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',2),(124,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',2),(125,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',1),(126,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',1),(127,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',1),(128,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',1),(129,'20:56:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1586927145','-76.9918399375',1),(130,'20:43:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1599491393','-76.9921487026',1),(131,'20:43:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1599491393','-76.9921487026',1),(132,'20:43:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1599491393','-76.9921487026',1),(133,'20:43:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1599491393','-76.9921487026',1),(134,'20:59:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.160006868','-76.9916721762',1),(135,'20:59:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.160006868','-76.9916721762',1),(136,'20:59:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.160006868','-76.9916721762',1),(137,'20:25:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1596317717','-76.9928374481',2),(138,'20:33:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1625297797','-76.9929583365',2),(139,'21:39:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1611120058','-76.9926365714',1),(140,'21:39:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1611120058','-76.9926365714',2),(141,'20:43:00',NULL,NULL,1,1,1,'','',NULL,'2018-01-01','-12.1619127741','-76.9933449746',2),(142,'02:14:00',NULL,NULL,1,2,NULL,'','',NULL,'2018-01-02','-12.1613593','-76.9949682',1),(143,'02:21:00',NULL,NULL,1,2,NULL,'','',NULL,'2018-01-02','-12.1621383154','-76.993560936',1),(144,'02:21:00',NULL,NULL,1,2,NULL,'','',NULL,'2018-01-02','-12.1621383154','-76.993560936',1);
/*!40000 ALTER TABLE `app_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_serviciopedido`
--

DROP TABLE IF EXISTS `app_serviciopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_serviciopedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio_id` int(11) DEFAULT NULL,
  `subcategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_serviciopedido_4bb699dc` (`servicio_id`),
  KEY `app_serviciopedido_9ef96962` (`subcategoria_id`),
  CONSTRAINT `app_serviciopedi_subcategoria_id_c08a5033_fk_app_subcategoria_id` FOREIGN KEY (`subcategoria_id`) REFERENCES `app_subcategoria` (`id`),
  CONSTRAINT `app_serviciopedido_servicio_id_59b9c506_fk_app_servicio_id` FOREIGN KEY (`servicio_id`) REFERENCES `app_servicio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_serviciopedido`
--

LOCK TABLES `app_serviciopedido` WRITE;
/*!40000 ALTER TABLE `app_serviciopedido` DISABLE KEYS */;
INSERT INTO `app_serviciopedido` VALUES (1,7,1),(2,8,1),(3,9,1),(4,10,1),(5,11,1),(6,12,1),(7,13,1),(8,14,1),(9,14,2),(10,15,1),(11,15,2),(12,16,1),(13,16,2),(14,17,1),(15,17,2),(16,18,1),(17,19,5),(18,20,1),(19,20,3),(20,20,4),(21,20,7),(22,21,1),(23,22,1),(24,23,1),(25,24,1),(26,25,1),(27,26,1),(28,27,1),(29,28,1),(30,29,1),(31,30,1),(32,31,1),(33,32,1),(34,33,1),(35,34,1),(36,35,1),(37,36,1),(38,36,2),(39,36,3),(40,36,4),(41,36,7),(42,37,1),(43,37,2),(44,38,1),(45,39,1),(46,40,1),(47,41,1),(48,42,1),(49,43,1),(50,44,1),(51,45,1),(52,46,1),(53,47,1),(54,48,1),(55,49,1),(56,50,1),(57,51,1),(58,52,1),(59,53,1),(60,54,1),(61,55,1),(62,56,1),(63,57,1),(64,58,1),(65,59,1),(66,60,1),(67,61,1),(68,61,2),(69,62,1),(70,62,2),(71,63,1),(72,64,1),(73,65,1),(74,66,1),(75,67,1),(76,67,5),(77,68,1),(78,68,5),(79,69,1),(80,70,1),(81,71,1),(82,72,1),(83,73,1),(84,74,1),(85,75,1),(86,76,1),(87,77,1),(88,78,1),(89,79,1),(90,80,1),(91,81,1),(92,82,1),(93,82,2),(94,83,17),(95,83,18),(96,85,17),(97,85,18),(98,86,17),(99,86,18),(100,87,17),(101,87,18),(102,88,17),(103,88,18),(104,89,17),(105,89,18),(106,90,17),(107,90,18),(108,91,17),(109,91,18),(110,91,19),(111,92,17),(112,92,18),(113,93,17),(114,93,18),(115,94,17),(116,94,18),(117,95,17),(118,95,18),(119,96,17),(120,96,18),(121,97,17),(122,97,18),(123,98,17),(124,98,18),(125,99,17),(126,99,18),(127,99,19),(128,100,1),(129,101,1),(130,101,2),(131,102,17),(132,103,17),(133,103,18),(134,104,17),(135,104,18),(136,105,1),(137,106,1),(138,107,1),(139,108,1),(140,109,1),(141,110,17),(142,111,17),(143,112,17),(144,113,17),(145,114,1),(146,115,1),(147,116,1),(148,117,1),(149,118,1),(150,119,1),(151,120,1),(152,121,1),(153,122,1),(154,123,1),(155,124,1),(156,125,1),(157,126,1),(158,127,1),(159,128,1),(160,129,1),(161,130,1),(162,131,1),(163,132,1),(164,133,1),(165,134,1),(166,135,1),(167,136,1),(168,137,1),(169,138,1),(170,139,1),(171,140,1),(172,141,1),(173,142,1),(174,143,17),(175,144,17);
/*!40000 ALTER TABLE `app_serviciopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_smsrecibidos`
--

DROP TABLE IF EXISTS `app_smsrecibidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_smsrecibidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1000) NOT NULL,
  `when` datetime(6) DEFAULT NULL,
  `sender` varchar(1000) DEFAULT NULL,
  `receiver` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_smsrecibidos`
--

LOCK TABLES `app_smsrecibidos` WRITE;
/*!40000 ALTER TABLE `app_smsrecibidos` DISABLE KEYS */;
INSERT INTO `app_smsrecibidos` VALUES (1,'Hdhdhd','2017-12-09 10:17:52.000000','51980729169','SPOTMEDIA'),(2,'Habla','2017-12-09 10:14:57.000000','51980729169','SPOTMEDIA'),(3,'Holaaa','2017-12-09 10:17:21.000000','51980729169','SPOTMEDIA'),(4,'Hola esto es una prueba','2017-12-09 10:26:56.000000','51980729169','SPOTMEDIA'),(5,'Queee','2017-12-09 10:28:21.000000','51980729169','SPOTMEDIA'),(6,'Queeeee','2017-12-09 10:37:49.000000','51980729169','SPOTMEDIA'),(7,'Esto yo envie el domingo','2017-12-10 23:32:21.000000','51980729169','SPOTMEDIA');
/*!40000 ALTER TABLE `app_smsrecibidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_sociadistrito`
--

DROP TABLE IF EXISTS `app_sociadistrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_sociadistrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distrito_id` int(11) DEFAULT NULL,
  `socia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_sociadistrito_distrito_id_b7a9bd95_fk_app_distrito_id` (`distrito_id`),
  KEY `app_sociadistrito_socia_id_903e0bff_fk_socia_id` (`socia_id`),
  CONSTRAINT `app_sociadistrito_distrito_id_b7a9bd95_fk_app_distrito_id` FOREIGN KEY (`distrito_id`) REFERENCES `app_distrito` (`id`),
  CONSTRAINT `app_sociadistrito_socia_id_903e0bff_fk_socia_id` FOREIGN KEY (`socia_id`) REFERENCES `socia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_sociadistrito`
--

LOCK TABLES `app_sociadistrito` WRITE;
/*!40000 ALTER TABLE `app_sociadistrito` DISABLE KEYS */;
INSERT INTO `app_sociadistrito` VALUES (2,1,1),(3,8,1),(4,1,2),(5,4,2);
/*!40000 ALTER TABLE `app_sociadistrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_sociasubcategoria`
--

DROP TABLE IF EXISTS `app_sociasubcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_sociasubcategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socia_id` int(11) DEFAULT NULL,
  `subcategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_sociasubcategoria_socia_id_cf25733f_fk_socia_id` (`socia_id`),
  KEY `app_sociasubcategoria_9ef96962` (`subcategoria_id`),
  CONSTRAINT `app_sociasubcate_subcategoria_id_a003382c_fk_app_subcategoria_id` FOREIGN KEY (`subcategoria_id`) REFERENCES `app_subcategoria` (`id`),
  CONSTRAINT `app_sociasubcategoria_socia_id_cf25733f_fk_socia_id` FOREIGN KEY (`socia_id`) REFERENCES `socia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_sociasubcategoria`
--

LOCK TABLES `app_sociasubcategoria` WRITE;
/*!40000 ALTER TABLE `app_sociasubcategoria` DISABLE KEYS */;
INSERT INTO `app_sociasubcategoria` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,17),(7,2,19),(8,2,18),(10,2,2);
/*!40000 ALTER TABLE `app_sociasubcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_subcategoria`
--

DROP TABLE IF EXISTS `app_subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_subcategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`id`),
  KEY `app_subcategoria_categoria_id_96610f85_fk_app_categoria_id` (`categoria_id`),
  CONSTRAINT `app_subcategoria_categoria_id_96610f85_fk_app_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `app_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_subcategoria`
--

LOCK TABLES `app_subcategoria` WRITE;
/*!40000 ALTER TABLE `app_subcategoria` DISABLE KEYS */;
INSERT INTO `app_subcategoria` VALUES (1,'Manicure Express',1,2,'ghghg'),(2,'Manicure Spa',1,2,NULL),(3,'Uñas en Gel',1,2,NULL),(4,'Uñas Acrigel',1,2,NULL),(5,'Pedicure Basico',2,2,NULL),(6,'Pedicure Spa',2,2,NULL),(7,'Uñas Acrilicas',1,2,NULL),(8,'Retoques de Acrilicos',1,2,NULL),(9,'Colocacion de Tips',1,2,NULL),(10,'Diseños Especiales',1,2,NULL),(11,'Cambios de Acrilicos',1,2,NULL),(12,'Retiro de Acrilicos',1,2,NULL),(13,'Pedicure con Acrilico',2,2,NULL),(14,'Diseños Especiales',2,2,NULL),(15,'Cambios de Acrilicos',2,2,NULL),(16,'Podologia',2,21,NULL),(17,'Maquillaje del Dia',3,21,NULL),(18,'Maquillaje de Noche',3,21,NULL),(19,'Maquillaje de Novia',3,21,NULL),(20,'Maquillaje de Quince Años',3,21,NULL),(21,'Caritas Pintadas',3,21,NULL),(22,'Ampolla Costo Aparte',3,12.2,NULL);
/*!40000 ALTER TABLE `app_subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_turno`
--

DROP TABLE IF EXISTS `app_turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_turno`
--

LOCK TABLES `app_turno` WRITE;
/*!40000 ALTER TABLE `app_turno` DISABLE KEYS */;
INSERT INTO `app_turno` VALUES (1,'Mañana'),(2,'Tarde'),(3,'Noche');
/*!40000 ALTER TABLE `app_turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_turnosocia`
--

DROP TABLE IF EXISTS `app_turnosocia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_turnosocia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` time DEFAULT NULL,
  `fecha_fin` time DEFAULT NULL,
  `dia_id` int(11) DEFAULT NULL,
  `socia_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_turnosocia_dia_id_c54bfa10_uniq` (`dia_id`),
  KEY `app_turnosocia_85ffcb7c` (`socia_id`),
  CONSTRAINT `app_turnosocia_dia_id_c54bfa10_fk_app_dia_id` FOREIGN KEY (`dia_id`) REFERENCES `app_dia` (`id`),
  CONSTRAINT `app_turnosocia_socia_id_3dbe6f30_fk_socia_id` FOREIGN KEY (`socia_id`) REFERENCES `socia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_turnosocia`
--

LOCK TABLES `app_turnosocia` WRITE;
/*!40000 ALTER TABLE `app_turnosocia` DISABLE KEYS */;
INSERT INTO `app_turnosocia` VALUES (1,'21:35:47','23:35:48',6,1),(7,'21:46:31','23:46:33',2,1),(8,'21:47:23','22:47:24',3,1),(9,'10:47:51','12:47:47',6,1),(10,'15:06:25','18:06:25',1,2),(11,'12:06:43','23:06:45',1,2),(12,'12:10:50','22:10:50',1,1);
/*!40000 ALTER TABLE `app_turnosocia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'Administrador'),(2,'Cliente'),(6,'Diseñador Web'),(5,'Monitoreo'),(4,'Sistemas'),(1,'Socia');
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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,2,1),(68,2,2),(69,2,3),(70,2,4),(71,2,5),(72,2,6),(73,2,7),(74,2,8),(75,2,9),(76,2,10),(77,2,11),(78,2,12),(79,2,13),(80,2,14),(81,2,15),(82,2,16),(83,2,17),(84,2,18),(85,2,19),(86,2,20),(87,2,21),(88,2,22),(89,2,23),(90,2,24),(91,2,25),(92,2,26),(93,2,27),(94,2,28),(95,2,29),(96,2,30),(97,2,31),(98,2,32),(99,2,33),(100,2,34),(101,2,35),(102,2,36),(103,2,37),(104,2,38),(105,2,39),(106,2,40),(107,2,41),(108,2,42),(109,2,43),(110,2,44),(111,2,45),(112,2,46),(113,2,47),(114,2,48),(115,2,49),(116,2,50),(117,2,51),(118,2,52),(119,2,53),(120,2,54),(121,2,55),(122,2,56),(123,2,57),(124,2,58),(125,2,59),(126,2,60),(127,2,61),(128,2,62),(129,2,63),(130,2,64),(131,2,65),(132,2,66),(133,3,1),(134,3,2),(135,3,3),(136,3,4),(137,3,5),(138,3,6),(139,3,7),(140,3,8),(141,3,9),(142,3,10),(143,3,11),(144,3,12),(145,3,13),(146,3,14),(147,3,15),(148,3,16),(149,3,17),(150,3,18),(151,3,19),(152,3,20),(153,3,21),(154,3,22),(155,3,23),(156,3,24),(157,3,25),(158,3,26),(159,3,27),(160,3,28),(161,3,29),(162,3,30),(163,3,31),(164,3,32),(165,3,33),(166,3,34),(167,3,35),(168,3,36),(169,3,37),(170,3,38),(171,3,39),(172,3,40),(173,3,41),(174,3,42),(175,3,43),(176,3,44),(177,3,45),(178,3,46),(179,3,47),(180,3,48),(181,3,49),(182,3,50),(183,3,51),(184,3,52),(185,3,53),(186,3,54),(187,3,55),(188,3,56),(189,3,57),(190,3,58),(191,3,59),(192,3,60),(193,3,61),(194,3,62),(195,3,63),(196,3,64),(197,3,65),(198,3,66),(199,4,1),(200,4,2),(201,4,3),(202,4,4),(203,4,5),(204,4,6),(205,4,7),(206,4,8),(207,4,9),(208,4,10),(209,4,11),(210,4,12),(211,4,13),(212,4,14),(213,4,15),(214,4,16),(215,4,17),(216,4,18),(217,4,19),(218,4,20),(219,4,21),(220,4,22),(221,4,23),(222,4,24),(223,4,25),(224,4,26),(225,4,27),(226,4,28),(227,4,29),(228,4,30),(229,4,31),(230,4,32),(231,4,33),(232,4,34),(233,4,35),(234,4,36),(235,4,37),(236,4,38),(237,4,39),(238,4,40),(239,4,41),(240,4,42),(241,4,43),(242,4,44),(243,4,45),(244,4,46),(245,4,47),(246,4,48),(247,4,49),(248,4,50),(249,4,51),(250,4,52),(251,4,53),(252,4,54),(253,4,55),(254,4,56),(255,4,57),(256,4,58),(257,4,59),(258,4,60),(259,4,61),(260,4,62),(261,4,63),(262,4,64),(263,4,65),(264,4,66),(265,5,1),(266,5,2),(267,5,3),(268,5,4),(269,5,5),(270,5,6),(271,5,7),(272,5,8),(273,5,9),(274,5,10),(275,5,11),(276,5,12),(277,5,13),(278,5,14),(279,5,15),(280,5,16),(281,5,17),(282,5,18),(283,5,19),(284,5,20),(285,5,21),(286,5,22),(287,5,23),(288,5,24),(289,5,25),(290,5,26),(291,5,27),(292,5,28),(293,5,29),(294,5,30),(295,5,31),(296,5,32),(297,5,33),(298,5,34),(299,5,35),(300,5,36),(301,5,37),(302,5,38),(303,5,39),(304,5,40),(305,5,41),(306,5,42),(307,5,43),(308,5,44),(309,5,45),(310,5,46),(311,5,47),(312,5,48),(313,5,49),(314,5,50),(315,5,51),(316,5,52),(317,5,53),(318,5,54),(319,5,55),(320,5,56),(321,5,57),(322,5,58),(323,5,59),(324,5,60),(325,5,61),(326,5,62),(327,5,63),(328,5,64),(329,5,65),(330,5,66),(331,6,19),(332,6,20),(333,6,21);
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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Categoria',7,'add_categoria'),(20,'Can change Categoria',7,'change_categoria'),(21,'Can delete Categoria',7,'delete_categoria'),(22,'Can add Subcategoria',8,'add_subcategoria'),(23,'Can change Subcategoria',8,'change_subcategoria'),(24,'Can delete Subcategoria',8,'delete_subcategoria'),(25,'Can add Portada/Photo',9,'add_portadaphoto'),(26,'Can change Portada/Photo',9,'change_portadaphoto'),(27,'Can delete Portada/Photo',9,'delete_portadaphoto'),(28,'Can add Cliente',10,'add_cliente'),(29,'Can change Cliente',10,'change_cliente'),(30,'Can delete Cliente',10,'delete_cliente'),(31,'Can add Distrito',11,'add_distrito'),(32,'Can change Distrito',11,'change_distrito'),(33,'Can delete Distrito',11,'delete_distrito'),(34,'Can add Socia',12,'add_socia'),(35,'Can change Socia',12,'change_socia'),(36,'Can delete Socia',12,'delete_socia'),(37,'Can add Socia/Especialidad',13,'add_sociasubcategoria'),(38,'Can change Socia/Especialidad',13,'change_sociasubcategoria'),(39,'Can delete Socia/Especialidad',13,'delete_sociasubcategoria'),(40,'Can add Clientes/Socias',14,'add_clientesocias'),(41,'Can change Clientes/Socias',14,'change_clientesocias'),(42,'Can delete Clientes/Socias',14,'delete_clientesocias'),(43,'Can add Socia/Distrito',15,'add_sociadistrito'),(44,'Can change Socia/Distrito',15,'change_sociadistrito'),(45,'Can delete Socia/Distrito',15,'delete_sociadistrito'),(46,'Can add Socia/Especialidad/Opcion',16,'add_opcion'),(47,'Can change Socia/Especialidad/Opcion',16,'change_opcion'),(48,'Can delete Socia/Especialidad/Opcion',16,'delete_opcion'),(49,'Can add Turno',17,'add_turno'),(50,'Can change Turno',17,'change_turno'),(51,'Can delete Turno',17,'delete_turno'),(52,'Can add Dia',18,'add_dia'),(53,'Can change Dia',18,'change_dia'),(54,'Can delete Dia',18,'delete_dia'),(55,'Can add Servicio',19,'add_servicio'),(56,'Can change Servicio',19,'change_servicio'),(57,'Can delete Servicio',19,'delete_servicio'),(58,'Can add Servicio / Pedido',20,'add_serviciopedido'),(59,'Can change Servicio / Pedido',20,'change_serviciopedido'),(60,'Can delete Servicio / Pedido',20,'delete_serviciopedido'),(61,'Can add Notificacion',21,'add_notificacion'),(62,'Can change Notificacion',21,'change_notificacion'),(63,'Can delete Notificacion',21,'delete_notificacion'),(64,'Can add Turno/Socia',22,'add_turnosocia'),(65,'Can change Turno/Socia',22,'change_turnosocia'),(66,'Can delete Turno/Socia',22,'delete_turnosocia'),(67,'Can add Sms Recibidos',23,'add_smsrecibidos'),(68,'Can change Sms Recibidos',23,'change_smsrecibidos'),(69,'Can delete Sms Recibidos',23,'delete_smsrecibidos'),(70,'Can add Estado del Servicio',24,'add_estado'),(71,'Can change Estado del Servicio',24,'change_estado'),(72,'Can delete Estado del Servicio',24,'delete_estado');
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
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$DpOlAQ5fdCkk$yz65811tLAC3qDle8grv3DHxcaV3OTHksmMS7rYehmQ=','2018-01-01 14:14:48',1,'root','','','',1,1,'2017-12-05 03:35:36'),(2,'pbkdf2_sha256$24000$jCe9RacBvb95$CWl3gI7jekaQ5ETuaaYLbKLMXo6Ys2bv1tVg4PaWxjo=',NULL,0,'andy','','','',0,1,'2017-12-06 02:25:11'),(3,'pbkdf2_sha256$24000$wAXqBLhpgfJY$i//ULuFKLztSxmfwXXhBmngDtzDn0yF21w7ySjkbckQ=',NULL,0,'socia2','','','',0,1,'2017-12-06 02:29:19'),(4,'pbkdf2_sha256$24000$FclQXbg4hOR3$Kh/RcfY3w997iQ9GC5MHStuioGu6/g03uW1JnDq5BnI=',NULL,0,'rosangela','','','',0,1,'2017-12-07 12:41:59'),(5,'pbkdf2_sha256$24000$W4uDErBvvJWf$Bh5bTstJ/XpQrz0oc+KhGKFaaLv4p7qww8Rqp78lYT8=',NULL,0,'Carlos','','','',0,1,'2017-12-08 15:56:06'),(6,'pbkdf2_sha256$24000$S8c7ZWUpdxKN$SdJNO9y7AX338Z8QIGYaswSgYV5STyQSeqW3nd+GUlQ=','2017-12-11 18:00:05',0,'sms','','','',1,1,'2017-12-09 05:20:24'),(7,'pbkdf2_sha256$24000$L0gF8QRQoQ4K$zBR91ZRQB5bDoL3gNQkQMXgrVVUMczD/P2QX6tcpy78=','2017-12-22 22:08:38',0,'tati','','','',1,1,'2017-12-20 13:08:54'),(8,'pbkdf2_sha256$24000$AnBPLRhZ7AEI$j4+CK0gQlo0rQSZZ9AlZSSqZW8XoY+YMfq7GFM0irdM=',NULL,0,'joel@gmail.com','','','joel@gmail.com',0,1,'2017-12-30 05:32:05'),(10,'pbkdf2_sha256$24000$ct3ahs62XHTK$AhdziZrv+X9JzTtU3AjM5CBT6lAJoitsQrpdUAPw+cA=',NULL,0,'joeli@gmail.com','','','joeli@gmail.com',0,1,'2017-12-30 05:32:50'),(11,'pbkdf2_sha256$24000$9zADtcyX8r38$zxX9KjAT2PMLFpno3Mhbg+Sxsap2ptxJQjWu1OzdhhE=',NULL,0,'j77oeli@gmail.com','','','j77oeli@gmail.com',0,1,'2017-12-30 05:33:17'),(12,'pbkdf2_sha256$24000$KQCPHuFoyG37$aX1FLyJdZWwRCAXG0i+W7DWil0ROVnJxQpdOp13yB9A=',NULL,0,'j779oeli@gmail.com','','','j779oeli@gmail.com',0,1,'2017-12-30 05:33:41'),(16,'pbkdf2_sha256$24000$j41cOwiXQkZy$n8IhhTOtu+cw7qmr9ZUGaN1yihbhpddknbNBanUJD8Q=',NULL,0,'kiol@gmail.com','','','kiol@gmail.com',0,1,'2017-12-30 05:36:36'),(18,'pbkdf2_sha256$24000$0U1AGVcxRk1T$F2fowDgM4EoHnfZuQkoYwGDmGJGuDiBRcTbjXPpVcmQ=',NULL,0,'joel22|@gmail.com','','','joel22|@gmail.com',0,1,'2017-12-30 05:43:45'),(20,'pbkdf2_sha256$24000$IxSsG5U5BmlO$4E4KwKr1F3VWK1JDFPw6xohHs/mpOE8N5sMTFJ4m0/I=',NULL,0,'carlos3232@gmail.com','','','carlos3232@gmail.com',0,1,'2017-12-30 05:44:38'),(21,'pbkdf2_sha256$24000$dCCP8kronT1u$/BK0QXgra0cS/50vAwol3g8BSxzaJohrNU3VR7BSNuU=',NULL,0,'carlos123@gmail.com','','','carlos123@gmail.com',0,1,'2017-12-30 05:45:58'),(22,'pbkdf2_sha256$24000$2kx8l0mWwavi$3nAG1HXKGKaGXsIUJW1Vi4I8BZSAGInWp+zxXYqO7MU=',NULL,0,'pepe@gmail.com','','','pepe@gmail.com',0,1,'2017-12-30 05:47:19'),(23,'pbkdf2_sha256$24000$ovssZOvfY6oB$f7QUI+2q5yOoSGz1mHmx3OYwMolm3lyX5cDjpITQgbI=',NULL,0,'rosangela123','','','rosangela123',0,1,'2017-12-30 05:48:17'),(24,'pbkdf2_sha256$24000$EL3ykkv7HrKM$ai3sFZ6yIM7dhSIYWYS4piisCFDQdRsD6H6XPKZHbxo=',NULL,0,'carlos22222','','','carlos22222',0,1,'2017-12-30 05:50:45'),(25,'pbkdf2_sha256$24000$YySf3IETpMVJ$+ljX5I84vpW4Tt7sM1/blbw2hwXuAG8jf2UayZo4NvM=',NULL,0,'ext','','','ext',0,1,'2017-12-30 12:44:58'),(26,'pbkdf2_sha256$24000$dh4KomeRZkOp$m5zLa6NcI/DO2EXKb+HhZYf08ntugfXD/SeFkCWkIgI=',NULL,0,'text','','','text',0,1,'2017-12-30 12:45:24'),(29,'pbkdf2_sha256$24000$5TsVvrdEtEtH$6aKnZYlOCCVO5UZ6RbKHzEDhstZUKHwOfQb8x90Wmsg=',NULL,0,'extext','','','extext',0,1,'2017-12-30 12:45:42'),(32,'pbkdf2_sha256$24000$DSnPqi2RLkOm$GAGN1wb+I9sIWsG84VjnbC5Gp0wLWYsJOpuiLF/xdzc=',NULL,0,'t','','','t',0,1,'2017-12-30 12:46:05'),(34,'pbkdf2_sha256$24000$tEm0ULVk8ODV$4PdJaE1h21RAHIs4W0Llb+ziPqkx+NYUuYDdpxSFDRI=',NULL,0,'ttext','','','ttext',0,1,'2017-12-30 12:46:12'),(37,'pbkdf2_sha256$24000$Kt64Jo3RInXv$Ug4xZmWKs50x/pPTVnTxI/h6UgjPhvyv2x1NZ2/o6qg=',NULL,0,'xt','','','xt',0,1,'2017-12-30 12:46:52'),(38,'pbkdf2_sha256$24000$Xrcu6ZB3GIhp$uGRjO+eNvU43J5AL/+Gll1MlQA5eaGDHkoh6N7Zva5w=',NULL,0,'extexttext','','','extexttext',0,1,'2017-12-30 12:46:56'),(39,'pbkdf2_sha256$24000$DvBZ8CXph2OC$U4wPv18y+uaiQb2VlzG0AMbakIHVECtPpVH0PeUdNgs=',NULL,0,'extexttexttext','','','extexttexttext',0,1,'2017-12-30 12:47:09'),(40,'pbkdf2_sha256$24000$8aGWse3zrYkD$+MKibYf5ZCtPD9zJ7E3yNb0dGEqJ0Fd4VkUd4E0Z8Og=',NULL,0,'ex','','','ex',0,1,'2017-12-30 12:47:15'),(43,'pbkdf2_sha256$24000$pi2BupiB1k9q$Ki1XKBvKlG304i9HxUr0quf7kdbQLwHOTJKg+ZNDPDU=',NULL,0,'tex','','','tex',0,1,'2017-12-30 12:47:33'),(56,'pbkdf2_sha256$24000$NaqueMP3RmWI$+eOH0JG3kzHuK/+SavIQl5sz6mWeFFRBNyLv5+HrhUA=',NULL,0,'carloscano.e@gmail.com','','','carloscano.e@gmail.com',0,1,'2017-12-31 07:35:04');
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
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (5,2,1),(3,4,1),(2,5,2),(4,7,6);
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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,6,67),(2,6,68),(3,6,69);
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
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-12-05 03:54:26','1','manos',2,'Modificado/a photo.',7,1),(2,'2017-12-05 03:54:47','2','pies',2,'Modificado/a photo.',7,1),(3,'2017-12-05 03:55:01','3','maquillaje',2,'Modificado/a photo.',7,1),(4,'2017-12-05 03:55:21','4','podologia',1,'Añadido.',7,1),(5,'2017-12-05 03:56:50','1','',1,'Añadido.',9,1),(6,'2017-12-05 03:58:17','2','',1,'Añadido.',9,1),(7,'2017-12-06 02:25:11','2','socia1',1,'Añadido.',4,1),(8,'2017-12-06 02:25:43','1','San Juan de Miraflores',1,'Añadido.',11,1),(9,'2017-12-06 02:25:52','1','Socia1',1,'Añadido.',12,1),(10,'2017-12-06 02:26:06','2','San Juan de Miraflores',1,'Añadido.',11,1),(11,'2017-12-06 02:26:10','1','Socia1/San Juan de Miraflores',1,'Añadido.',15,1),(12,'2017-12-06 02:26:42','2','San Juan de Miraflores',3,'',11,1),(13,'2017-12-06 02:27:05','3','San Juan de Miraflores',1,'Añadido.',11,1),(14,'2017-12-06 02:27:11','4','Lince',1,'Añadido.',11,1),(15,'2017-12-06 02:27:17','5','Los Olivos',1,'Añadido.',11,1),(16,'2017-12-06 02:27:29','6','Miraflores',1,'Añadido.',11,1),(17,'2017-12-06 02:27:35','7','Chorrillos',1,'Añadido.',11,1),(19,'2017-12-06 02:28:25','3','San Juan de Miraflores',3,'',11,1),(20,'2017-12-06 02:28:38','2','Socia1/San Juan de Miraflores',1,'Añadido.',15,1),(21,'2017-12-06 02:28:48','3','Socia1/Chorrillos',1,'Añadido.',15,1),(22,'2017-12-06 02:29:19','3','socia2',1,'Añadido.',4,1),(23,'2017-12-06 02:29:50','8','San Martin de Porras',1,'Añadido.',11,1),(24,'2017-12-06 02:29:52','2','Socia2',1,'Añadido.',12,1),(25,'2017-12-06 02:30:09','8','San Martin de Porres',2,'Modificado/a nombre.',11,1),(26,'2017-12-06 02:30:11','3','Socia1/San Martin de Porres',2,'Modificado/a distrito.',15,1),(27,'2017-12-06 02:30:33','4','Socia2/San Martin de Porres',1,'Añadido.',15,1),(28,'2017-12-06 02:30:44','5','Socia2/San Martin de Porres',1,'Añadido.',15,1),(29,'2017-12-06 02:32:00','1','Socia1/Manicure Express',1,'Añadido.',13,1),(30,'2017-12-06 02:32:09','2','Socia1/Manicure Spa',1,'Añadido.',13,1),(31,'2017-12-06 02:32:19','3','Socia1/Uñas en Gel',1,'Añadido.',13,1),(32,'2017-12-06 02:32:26','4','Socia1/Uñas Acrigel',1,'Añadido.',13,1),(33,'2017-12-06 02:32:40','5','Socia1/Pedicure Basico',1,'Añadido.',13,1),(34,'2017-12-06 02:32:52','6','Socia2/Maquillaje del Dia',1,'Añadido.',13,1),(35,'2017-12-06 02:33:01','7','Socia2/Maquillaje de Novia',1,'Añadido.',13,1),(36,'2017-12-06 02:33:13','8','Socia2/Maquillaje de Noche',1,'Añadido.',13,1),(37,'2017-12-06 02:33:56','1','Mañana',1,'Añadido.',17,1),(38,'2017-12-06 02:34:05','2','Tarde',1,'Añadido.',17,1),(39,'2017-12-06 02:34:10','3','Noche',1,'Añadido.',17,1),(40,'2017-12-06 02:35:16','1','Lunes',1,'Añadido.',18,1),(41,'2017-12-06 02:35:21','2','Martes',1,'Añadido.',18,1),(42,'2017-12-06 02:35:27','3','Miercoles',1,'Añadido.',18,1),(43,'2017-12-06 02:35:32','4','Jueves',1,'Añadido.',18,1),(44,'2017-12-06 02:35:37','5','Viernes',1,'Añadido.',18,1),(45,'2017-12-06 02:35:43','6','Sabado',1,'Añadido.',18,1),(46,'2017-12-06 02:36:13','1','Noche',1,'Añadido.',22,1),(47,'2017-12-06 02:47:16','7','Socia1',1,'Añadido.',22,1),(48,'2017-12-06 02:47:31','8','Socia1',1,'Añadido.',22,1),(49,'2017-12-06 02:48:02','9','Socia1',1,'Añadido.',22,1),(50,'2017-12-06 03:06:38','10','Socia2',1,'Añadido.',22,1),(51,'2017-12-06 03:06:52','11','Socia2',1,'Añadido.',22,1),(52,'2017-12-06 03:07:55','9','Socia2/Manicure Express',1,'Añadido.',13,1),(53,'2017-12-06 03:09:39','10','Socia2/Manicure Spa',1,'Añadido.',13,1),(54,'2017-12-06 03:10:57','12','Socia1',1,'Añadido.',22,1),(55,'2017-12-06 03:28:19','4','Socia2/San Juan de Miraflores',2,'Modificado/a distrito.',15,1),(56,'2017-12-06 03:28:31','5','Socia2/Lince',2,'Modificado/a distrito.',15,1),(57,'2017-12-06 03:29:28','11','Socia2',2,'Modificado/a fecha_inicio.',22,1),(58,'2017-12-06 03:29:53','12','Socia1',2,'Modificado/a fecha_inicio.',22,1),(59,'2017-12-06 05:12:47','1','Cliente1',1,'Añadido.',10,1),(60,'2017-12-06 05:19:14','8','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":1378356258,\"displayType\":1,\"payload\":{\"notificationID\":\"da0b27a8-be92-4683-b69b-edeee3f26fad\",',3,'',21,1),(61,'2017-12-06 05:19:14','7','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":1759542700,\"displayType\":1,\"payload\":{\"notificationID\":\"846e552c-9007-4c67-94f1-7c763f6ba773\",',3,'',21,1),(62,'2017-12-06 05:19:14','6','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":-129526913,\"displayType\":1,\"payload\":{\"notificationID\":\"647ae1fe-4035-41f5-9440-cc170e30dad8\",',3,'',21,1),(63,'2017-12-06 05:19:14','5','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":-1776951918,\"displayType\":1,\"payload\":{\"notificationID\":\"b6a6183e-75f6-458a-a448-61792b08b945\"',3,'',21,1),(64,'2017-12-06 05:19:14','4','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":-1588837787,\"displayType\":0,\"payload\":{\"notificationID\":\"4c55c849-2c24-4865-ac24-1614b6171e17\"',3,'',21,1),(65,'2017-12-06 05:19:14','3','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":-1459738740,\"displayType\":1,\"payload\":{\"notificationID\":\"77b19579-8bb9-4940-b4ee-f42744204857\"',3,'',21,1),(66,'2017-12-06 05:19:14','2','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":-1990557253,\"displayType\":0,\"payload\":{\"notificationID\":\"f6b789c0-8886-4192-965a-730b48c2299f\"',3,'',21,1),(67,'2017-12-06 05:19:14','1','{u\'data\': u\'{\"action\":{\"type\":0},\"notification\":{\"isAppInFocus\":true,\"shown\":true,\"androidNotificationId\":2068999192,\"displayType\":1,\"payload\":{\"notificationID\":\"2e5966f4-5fc6-476f-a298-ed3e090fef3a\",',3,'',21,1),(68,'2017-12-06 12:24:08','1','Cliente1',2,'Modificado/a photo.',10,1),(69,'2017-12-06 12:35:58','1','Cliente1',2,'Modificado/a photo.',10,1),(70,'2017-12-06 13:26:49','3','',1,'Añadido.',12,1),(71,'2017-12-07 04:18:38','10','10--Cliente1',2,'Modificado/a fecha.',19,1),(72,'2017-12-07 12:38:16','1','Socia',1,'Añadido.',3,1),(73,'2017-12-07 12:38:25','2','Cliente',1,'Añadido.',3,1),(74,'2017-12-07 12:38:42','3','Administrador',1,'Añadido.',3,1),(75,'2017-12-07 12:39:02','4','Sistemas',1,'Añadido.',3,1),(76,'2017-12-07 12:39:19','5','Monitoreo',1,'Añadido.',3,1),(77,'2017-12-07 12:41:59','4','cliente1',1,'Añadido.',4,1),(78,'2017-12-07 12:42:20','4','rosangela',2,'Modificado/a username y groups.',4,1),(79,'2017-12-07 12:42:23','1','Cliente1',2,'Modificado/a user.',10,1),(80,'2017-12-07 12:43:46','4','rosangela',2,'Modificado/a first_name.',4,1),(81,'2017-12-07 12:45:24','1','Rosangela',2,'Modificado/a nombre.',10,1),(82,'2017-12-07 12:48:32','4','rosangela',2,'Modificado/a first_name.',4,1),(83,'2017-12-07 12:48:55','4','rosangela',2,'Modificado/a password.',4,1),(84,'2017-12-07 12:49:21','1','Rosangela',2,'No ha cambiado ningún campo.',10,1),(85,'2017-12-08 13:12:16','4','rosangela',2,'Modificado/a password.',4,1),(86,'2017-12-08 14:42:47','1','Rosangela',2,'Modificado/a apellido, edad, telefono, email y numero_notificacion.',10,1),(87,'2017-12-08 14:45:45','1','Rosangela',2,'Modificado/a direccion.',10,1),(88,'2017-12-08 14:47:19','1','Rosangela',2,'Modificado/a distrito.',10,1),(89,'2017-12-08 15:45:05','2','Socia2',2,'Modificado/a photo.',12,1),(90,'2017-12-08 15:45:26','1','Socia1',2,'Modificado/a photo.',12,1),(91,'2017-12-08 15:46:40','37','37-Socia1-Rosangela',2,'Modificado/a socia.',19,1),(92,'2017-12-08 15:47:04','36','36-Socia2-Rosangela',2,'Modificado/a socia.',19,1),(93,'2017-12-08 15:47:06','41','Uñas Acrilicas',2,'No ha cambiado ningún campo.',20,1),(94,'2017-12-08 15:47:51','10','10-Socia1-Rosangela',2,'Modificado/a socia.',19,1),(95,'2017-12-08 15:47:53','4','Manicure Express',2,'No ha cambiado ningún campo.',20,1),(96,'2017-12-08 15:49:31','2','Carlos',2,'Modificado/a nombre.',12,1),(97,'2017-12-08 15:49:33','5','Carlos/Lince',2,'No ha cambiado ningún campo.',15,1),(98,'2017-12-08 15:49:47','1','Joel',2,'Modificado/a nombre.',12,1),(99,'2017-12-08 15:49:56','1','Joel',2,'No ha cambiado ningún campo.',12,1),(100,'2017-12-08 15:53:28','2','Carlos',2,'Modificado/a photo.',12,1),(101,'2017-12-08 15:53:29','5','Carlos/Lince',2,'No ha cambiado ningún campo.',15,1),(102,'2017-12-08 15:54:23','1','Andy',2,'Modificado/a nombre y photo.',12,1),(103,'2017-12-08 15:54:25','3','Andy/San Martin de Porres',2,'No ha cambiado ningún campo.',15,1),(104,'2017-12-08 15:56:06','5','carlos',1,'Añadido.',4,1),(105,'2017-12-08 15:56:13','1','Carlos',2,'Modificado/a nombre, email y user.',10,1),(106,'2017-12-08 15:56:47','2','Rosangela',2,'Modificado/a user, nombre y photo.',12,1),(107,'2017-12-08 15:57:06','2','andy',2,'Modificado/a username.',4,1),(108,'2017-12-08 15:57:09','1','Andy',2,'No ha cambiado ningún campo.',12,1),(109,'2017-12-08 15:59:08','1','Carlos',2,'Modificado/a photo.',10,1),(110,'2017-12-08 16:52:21','5','carlos',2,'Modificado/a groups.',4,1),(111,'2017-12-08 16:52:40','4','rosangela',2,'Modificado/a groups.',4,1),(112,'2017-12-08 19:51:17','2','Rosangela',2,'Modificado/a apellido, dni, telefono, correo, direccion, referencia, texperiencia y photo.',12,1),(113,'2017-12-09 05:20:24','6','sms',1,'Añadido.',4,1),(114,'2017-12-09 05:21:03','6','sms',2,'Modificado/a user_permissions.',4,1),(115,'2017-12-09 05:23:32','6','sms',2,'No ha cambiado ningún campo.',4,1),(116,'2017-12-09 05:23:47','6','sms',2,'Modificado/a password.',4,1),(117,'2017-12-09 05:23:53','6','sms',2,'Modificado/a is_staff.',4,1),(118,'2017-12-09 14:40:45','1','Carlos',2,'No ha cambiado ningún campo.',10,1),(119,'2017-12-09 14:47:50','9','Rosangela/Manicure Express',3,'',13,1),(120,'2017-12-09 16:14:34','1','Carlos',2,'Modificado/a numero_notificacion.',10,1),(121,'2017-12-13 13:57:17','1','Carlos',2,'Modificado/a numero_notificacion.',10,1),(122,'2017-12-20 00:03:22','4','podologia',2,'Modificado/a photo.',7,1),(123,'2017-12-20 00:05:25','3','maquillaje',2,'Modificado/a photo.',7,1),(124,'2017-12-20 00:06:05','2','pies',2,'Modificado/a photo.',7,1),(125,'2017-12-20 00:06:33','1','manos',2,'Modificado/a photo.',7,1),(126,'2017-12-20 00:07:39','5','masajes',1,'Añadido.',7,1),(127,'2017-12-20 00:07:58','2','',3,'',9,1),(128,'2017-12-20 00:07:58','1','',3,'',9,1),(129,'2017-12-20 00:08:21','3','',1,'Añadido.',9,1),(130,'2017-12-20 00:08:36','4','',1,'Añadido.',9,1),(131,'2017-12-20 04:27:32','3','maquillaje',2,'Modificado/a orden.',7,1),(132,'2017-12-20 04:27:32','2','pies',2,'Modificado/a orden.',7,1),(133,'2017-12-20 04:27:32','1','manos',2,'Modificado/a orden.',7,1),(134,'2017-12-20 04:27:50','6','manicure de niñas',1,'Añadido.',7,1),(135,'2017-12-20 04:28:06','4','podologia',2,'Modificado/a orden.',7,1),(136,'2017-12-20 04:29:05','7','baber',1,'Añadido.',7,1),(137,'2017-12-20 04:29:15','8','extras',1,'Añadido.',7,1),(138,'2017-12-20 04:29:38','8','extras',2,'Modificado/a orden.',7,1),(139,'2017-12-20 04:29:38','7','baber',2,'Modificado/a orden.',7,1),(140,'2017-12-20 04:29:38','5','masajes',2,'Modificado/a orden.',7,1),(141,'2017-12-20 04:30:06','4','',3,'',9,1),(142,'2017-12-20 04:31:21','8','extras',2,'Modificado/a photo.',7,1),(143,'2017-12-20 04:31:35','7','baber',2,'Modificado/a photo.',7,1),(144,'2017-12-20 04:31:49','6','manicure de niñas',2,'Modificado/a photo.',7,1),(145,'2017-12-20 05:08:39','8','extras',2,'Modificado/a icono.',7,1),(146,'2017-12-20 05:08:39','8','extras',2,'Modificado/a icono.',7,1),(147,'2017-12-20 05:15:14','3','maquillaje',2,'Modificado/a icono.',7,1),(148,'2017-12-20 05:25:17','1','manos',2,'Modificado/a icono.',7,1),(149,'2017-12-20 05:26:46','1','manos',2,'Modificado/a icono.',7,1),(150,'2017-12-20 05:27:25','3','maquillaje',2,'Modificado/a icono.',7,1),(151,'2017-12-20 05:41:46','3','maquillaje',2,'Modificado/a icono.',7,1),(152,'2017-12-20 05:43:43','1','manos',2,'Modificado/a icono.',7,1),(153,'2017-12-20 05:47:37','8','extras',2,'Modificado/a icono.',7,1),(154,'2017-12-20 05:50:29','2','pies',2,'Modificado/a icono.',7,1),(155,'2017-12-20 05:53:03','6','manicure de niñas',2,'Modificado/a icono.',7,1),(156,'2017-12-20 13:08:22','6','Diseñador Web',1,'Añadido.',3,1),(157,'2017-12-20 13:08:54','7','tati',1,'Añadido.',4,1),(158,'2017-12-20 13:09:28','7','tati',2,'Modificado/a is_staff.',4,1),(159,'2017-12-20 13:10:28','7','tati',2,'Modificado/a groups.',4,1),(160,'2017-12-20 13:40:13','8','extras',2,'Modificado/a icono.',7,7),(161,'2017-12-20 13:40:45','1','manos',2,'Modificado/a icono.',7,7),(162,'2017-12-20 13:41:13','3','maquillaje',2,'Modificado/a icono.',7,7),(163,'2017-12-20 13:44:37','6','manicure de niñas',2,'Modificado/a icono.',7,7),(164,'2017-12-20 13:45:15','2','pies',2,'Modificado/a icono.',7,7),(165,'2017-12-23 04:00:45','1','manos',2,'Modificado/a photo.',7,1),(166,'2017-12-23 04:01:57','1','manos',2,'Modificado/a photo.',7,1),(167,'2017-12-23 04:02:21','2','pies',2,'Modificado/a photo.',7,1),(168,'2017-12-23 04:03:15','7','baber',2,'Modificado/a photo.',7,1),(169,'2017-12-24 23:23:25','7','Domingo',1,'Añadido.',18,1),(170,'2017-12-27 21:32:50','1','manos',2,'Modificado/a icono.',7,1),(171,'2017-12-27 21:33:09','2','pies',2,'Modificado/a icono.',7,1),(172,'2017-12-27 21:33:28','3','maquillaje',2,'Modificado/a icono.',7,1),(173,'2017-12-27 21:33:39','4','podologia',2,'Modificado/a icono.',7,1),(174,'2017-12-27 21:45:43','5','masajes',2,'Modificado/a icono.',7,1),(175,'2017-12-27 21:45:53','6','manicure de niñas',2,'Modificado/a icono.',7,1),(176,'2017-12-27 21:46:03','7','baber',2,'Modificado/a icono.',7,1),(177,'2017-12-27 21:46:17','8','extras',2,'Modificado/a icono.',7,1),(178,'2017-12-30 17:44:15','4','',1,'Añadido.',9,1),(179,'2017-12-30 17:44:24','5','',1,'Añadido.',9,1),(180,'2017-12-30 17:44:33','6','',1,'Añadido.',9,1),(181,'2017-12-30 17:44:43','3','',3,'',9,1),(182,'2017-12-31 18:21:10','5','carlos',2,'Modificado/a password.',4,1),(183,'2017-12-31 18:21:20','5','Carlos',2,'Modificado/a username.',4,1),(184,'2017-12-31 21:14:53','2','andy',2,'Modificado/a groups.',4,1),(185,'2017-12-31 21:35:54','1','Andy',2,'Modificado/a correo y direccion.',12,1),(186,'2017-12-31 21:36:14','1','Andy',2,'Modificado/a apellido y telefono.',12,1),(187,'2018-01-01 14:27:58','119','119-Andy-Carlos',2,'Modificado/a socia.',19,1),(188,'2018-01-01 19:28:50','1','Pendiente',1,'Añadido.',24,1),(189,'2018-01-01 19:29:03','2','Aceptado',1,'Añadido.',24,1),(190,'2018-01-01 19:54:32','1','Andy',2,'Modificado/a numero_notificacion.',12,1),(191,'2018-01-01 19:54:38','1','Andy',2,'No ha cambiado ningún campo.',12,1),(192,'2018-01-01 21:25:23','1','Andy',2,'Modificado/a numero_notificacion.',12,1);
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
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','categoria'),(10,'app','cliente'),(14,'app','clientesocias'),(18,'app','dia'),(11,'app','distrito'),(24,'app','estado'),(21,'app','notificacion'),(16,'app','opcion'),(9,'app','portadaphoto'),(19,'app','servicio'),(20,'app','serviciopedido'),(23,'app','smsrecibidos'),(12,'app','socia'),(15,'app','sociadistrito'),(13,'app','sociasubcategoria'),(8,'app','subcategoria'),(17,'app','turno'),(22,'app','turnosocia'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-05 03:35:00'),(2,'auth','0001_initial','2017-12-05 03:35:00'),(3,'admin','0001_initial','2017-12-05 03:35:01'),(4,'admin','0002_logentry_remove_auto_add','2017-12-05 03:35:01'),(5,'app','0001_initial','2017-12-05 03:35:01'),(6,'app','0002_auto_20171124_0310','2017-12-05 03:35:01'),(7,'app','0003_auto_20171124_0315','2017-12-05 03:35:01'),(8,'app','0004_auto_20171124_0411','2017-12-05 03:35:01'),(9,'app','0005_servicio_notificacion_titulo','2017-12-05 03:35:01'),(10,'app','0006_auto_20171124_0444','2017-12-05 03:35:02'),(11,'app','0007_auto_20171124_0454','2017-12-05 03:35:02'),(12,'app','0008_auto_20171124_0455','2017-12-05 03:35:02'),(13,'app','0009_auto_20171124_0524','2017-12-05 03:35:02'),(14,'app','0010_subcategoria_subcategoria','2017-12-05 03:35:02'),(15,'app','0011_auto_20171126_1512','2017-12-05 03:35:02'),(16,'app','0012_auto_20171126_2216','2017-12-05 03:35:02'),(17,'app','0013_remove_turnosocia_sociasubcategoria','2017-12-05 03:35:03'),(18,'app','0014_turnosocia_socia','2017-12-05 03:35:03'),(19,'app','0015_sociadistrito','2017-12-05 03:35:03'),(20,'app','0016_socia_numero_notificacion','2017-12-05 03:35:03'),(21,'app','0017_cliente_numero_notificacion','2017-12-05 03:35:03'),(22,'app','0018_auto_20171127_0028','2017-12-05 03:35:03'),(23,'app','0019_clientesocias','2017-12-05 03:35:03'),(24,'app','0020_socia_descripcion_notificacion','2017-12-05 03:35:03'),(25,'app','0021_auto_20171128_2216','2017-12-05 03:35:03'),(26,'app','0022_configuracion_titulo_notificacion','2017-12-05 03:35:03'),(27,'app','0023_configuracion_tipo','2017-12-05 03:35:03'),(28,'app','0024_auto_20171128_2249','2017-12-05 03:35:04'),(29,'app','0025_auto_20171201_1413','2017-12-05 03:35:04'),(30,'app','0026_auto_20171201_1431','2017-12-05 03:35:04'),(31,'app','0027_auto_20171201_1444','2017-12-05 03:35:04'),(32,'app','0028_auto_20171201_1446','2017-12-05 03:35:04'),(33,'contenttypes','0002_remove_content_type_name','2017-12-05 03:35:04'),(34,'auth','0002_alter_permission_name_max_length','2017-12-05 03:35:04'),(35,'auth','0003_alter_user_email_max_length','2017-12-05 03:35:04'),(36,'auth','0004_alter_user_username_opts','2017-12-05 03:35:04'),(37,'auth','0005_alter_user_last_login_null','2017-12-05 03:35:04'),(38,'auth','0006_require_contenttypes_0002','2017-12-05 03:35:04'),(39,'auth','0007_alter_validators_add_error_messages','2017-12-05 03:35:04'),(40,'sessions','0001_initial','2017-12-05 03:35:04'),(41,'app','0029_auto_20171206_0010','2017-12-06 05:11:06'),(42,'app','0030_cliente_photo','2017-12-06 12:23:38'),(43,'app','0031_auto_20171206_2245','2017-12-07 03:46:12'),(44,'app','0032_auto_20171206_2311','2017-12-07 04:11:20'),(45,'app','0033_cliente_direccion','2017-12-08 14:45:27'),(46,'app','0034_cliente_distrito','2017-12-08 14:47:12'),(47,'app','0035_smsrecibidos','2017-12-09 05:09:07'),(48,'app','0036_auto_20171213_0812','2017-12-13 13:12:32'),(49,'app','0037_auto_20171219_2322','2017-12-20 04:23:08'),(50,'app','0038_categoria_icono','2017-12-20 05:01:30'),(51,'app','0039_auto_20180101_1425','2018-01-01 19:26:06');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('37qcvuswjmmytno6sxu4sgs4m5eku671','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-12-30 04:58:47'),('4ab61lk9ps3gg2r0ssgl2uz9u6zm71n8','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-12-19 03:36:15'),('5e7y6gkxz1zeeava7ir57yrwkev0t1vm','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-15 14:14:48'),('6rdr70gy4d80v30nd841wq64k7h9a0qo','NTJjMDUwNmE5NWUxZWExYjhiNzExNDIwYmU0OGZkNzdiYmQyYjhmOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1ZjljMzhkZWEzMmZkMzgxNGU4ODk5ODI0MjQ5ODVmYTAyYjExOTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2018-01-05 22:08:38'),('9tso6l4ji4mpwx1odqyxhupztcb7e012','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 05:46:14'),('a31su13hsdvbxfn2q44s0omy7z4g7rzg','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-14 20:46:51'),('ax5knunuzlrjo3dl3uhbw0vhbg2sh12z','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-10 21:32:18'),('betovgjj57ijd9glhbbbvyzb8tiggszi','YTM4ZWY0ZWQ2YTZkZDE2ZTdlZDA2ODNlNzMyYTBlYTE0NTgwMDI3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0MTE4OWVlNTJmN2E2OTljYWUxNTE4NTIyNzAxODM3YWY1YjY0NzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-12-24 18:34:06'),('bkg2b8io0dchh4p5m99jybs910uguh6f','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-06 03:58:16'),('hgzv2vnhb2ab3glezeqjchcvh20mff0h','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-08 14:58:15'),('kldi532d3dy4w82s8xzoapy3a4jhzx3g','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-03 00:02:03'),('lkxz8vecjxct2940vw1qqo69pxfvurrf','YTM4ZWY0ZWQ2YTZkZDE2ZTdlZDA2ODNlNzMyYTBlYTE0NTgwMDI3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0MTE4OWVlNTJmN2E2OTljYWUxNTE4NTIyNzAxODM3YWY1YjY0NzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-12-24 18:46:30'),('o1bim132dv7ubqn5ri3nib983p992lse','NTJjMDUwNmE5NWUxZWExYjhiNzExNDIwYmU0OGZkNzdiYmQyYjhmOTp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1ZjljMzhkZWEzMmZkMzgxNGU4ODk5ODI0MjQ5ODVmYTAyYjExOTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI3In0=','2018-01-03 13:10:35'),('on1blagcytm7fnretgyq75proiugb8sv','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-12-23 06:14:58'),('swm2lh6w77p4n2w383iti76nc529lroz','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-13 17:43:33'),('tl5tkk33oxmbb12gqbtkzql5pco33gob','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-12-20 02:17:44'),('x9gaec2hyf356rlhp4jcf45gog2bq6xd','YTM4ZWY0ZWQ2YTZkZDE2ZTdlZDA2ODNlNzMyYTBlYTE0NTgwMDI3OTp7Il9hdXRoX3VzZXJfaGFzaCI6IjY0MTE4OWVlNTJmN2E2OTljYWUxNTE4NTIyNzAxODM3YWY1YjY0NzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=','2017-12-24 18:50:04'),('y3ycwzj2kgta5a8pk1eb7kf21fcgyc6w','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-01 19:41:26'),('y42lwcnm4pe29sfpeyidk8xlydpret8n','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-07 22:53:21'),('y6l0aqn2u7ygldv58ce6fkdrszw9tzca','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-08 03:31:45'),('zpxvczyt1mksdmezpmmg67hvhvb1y7h8','MjI1NDIxYTE5OGNmOTcxNWUxNzRkYzk4NTIzNmE5NDYzM2NiNzY5Mjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI5OGZkZjI3MmQ3MjY0YzQzMTE3ODY3MWZjZjM5ZGVmMDVmMDBkZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-09 17:05:15');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socia`
--

DROP TABLE IF EXISTS `socia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(1000) DEFAULT NULL,
  `apellido` varchar(1000) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `correo` varchar(1000) DEFAULT NULL,
  `direccion` varchar(1000) DEFAULT NULL,
  `referencia` varchar(1000) DEFAULT NULL,
  `texperiencia` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `ncuenta` varchar(1000) DEFAULT NULL,
  `distrito` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `numero_notificacion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `socia_distrito_c7a689d6_fk_app_distrito_id` (`distrito`),
  KEY `socia_user_646cb873_fk_auth_user_id` (`user`),
  CONSTRAINT `socia_distrito_c7a689d6_fk_app_distrito_id` FOREIGN KEY (`distrito`) REFERENCES `app_distrito` (`id`),
  CONSTRAINT `socia_user_646cb873_fk_auth_user_id` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socia`
--

LOCK TABLES `socia` WRITE;
/*!40000 ALTER TABLE `socia` DISABLE KEYS */;
INSERT INTO `socia` VALUES (1,'Andy','Jeres',4125565,212121,'andy@gmail.com','Calle Las Cantuarias','',NULL,'static/pp_1.jpg','',1,2,'9dd4123a-e315-4df7-a6af-29d45f3cd19c'),(2,'Rosangela','Saenz',3234,2121,'21@gmailcom','2121','212',212,'static/images_6QMt9Ku.jpg','',8,4,''),(3,'','',NULL,NULL,'','','',NULL,'static/dd3f519f6bc7824066e933c3255b10ac--asian-image-ulzzang-girl.jpg','',1,1,'');
/*!40000 ALTER TABLE `socia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-02  0:27:45
