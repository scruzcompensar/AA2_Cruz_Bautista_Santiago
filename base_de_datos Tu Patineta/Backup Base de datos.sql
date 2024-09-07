CREATE DATABASE  IF NOT EXISTS `tupatineta` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `tupatineta`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tupatineta
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(45) NOT NULL,
  `apellidos_usuario` varchar(45) NOT NULL,
  `identificacion_usuario` varchar(45) NOT NULL,
  `telefono_usuario` varchar(45) NOT NULL,
  `direccion_usuario` varchar(45) NOT NULL,
  `correo_usuario` varchar(45) NOT NULL,
  `contraseña_usuario` varchar(45) NOT NULL,
  `role` enum('usuario','administrador') NOT NULL DEFAULT 'usuario',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `id_usuario_UNIQUE` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `tarifa_base` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`),
  UNIQUE KEY `id_tipo_servicio_UNIQUE` (`id_tipo_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `fecha_inicio` varchar(30) NOT NULL,
  `fecha_fin` varchar(30) NOT NULL,
  `tarifa_fin` int(11) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `id_tipo_servicio` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `id_usuario_idx` (`id_usuario`),
  KEY `fk_servicio_tipo_servicio` (`id_tipo_servicio`),
  CONSTRAINT `fk_servicio_tipo_servicio` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (42,'administrador','administrador','123','123456789','calle 34 bis','admin@gmail.com','56e0e6859b4220b08c238f0df3494e2ecf1b0421','administrador'),(46,'Maria Helena','Benitez Herrera','101478965','carrera 8 # 15 n 25 ','321856974','MariaH@gmail.com','a7ff0036c335801994031326786b0a2bfc40fa6f','usuario'),(47,'Jose Hernando ','Gutierrez Paez','98745212','calle 58 sur # 36 c 75','3207896541','Josegupa@outlook.com','7b0705b01e2dc94bbdd0a903acfaeffd4b927702','usuario'),(48,'Milena ','Restrepo Cifuentes','85471236','Diagonal 36 b # 63 - 14','3152069874','MilenaRC@yahoo.com','66ea1dfdc3bc28438631374c3455888a8a703858','usuario'),(49,'Esteban ','Henao Bustamante','1025963214','Kr 25 # 84 n 36 ','3139518677','Esteban@gmail.com','cd8ba83702bcafe235ee54dc4faf3563c6700558','usuario');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'Alquiler de patineta','Alquier de patineta',2000),(2,'Tour guiado','Tour guiado',2000),(3,'Asistencia en carretera','Asistencia en carretera',3000),(4,'Alquiler corporativo','Alquiler corporativo',5000);
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('2024-07-26T19:00','2024-08-02T18:58',131014,'activo',1,40,46),('2024-08-09T11:03','2024-08-11T10:58',37375,'activo',1,42,46),('2024-08-13T14:05','2024-08-19T13:01',111488,'activo',1,43,46),('2024-07-27T08:02','2024-07-27T16:00',14340,'activo',2,44,47),('2024-07-29T08:00','2024-07-31T18:00',27840,'activo',4,45,47),('2024-07-28T08:00','2024-07-31T18:00',9000,'activo',3,46,47),('2024-07-28T08:00','2024-07-31T18:00',63960,'activo',1,47,47),('2024-08-02T10:04','2024-08-09T09:08',130312,'activo',1,48,48),('2024-08-23T13:07','2024-08-29T13:12',112385,'inactivo',1,49,48),('2024-07-27T14:07','2024-08-29T13:12',9000,'activo',3,50,48),('2024-08-10T10:07','2024-08-10T15:14',9210,'activo',2,51,48),('2024-08-01T06:07','2024-08-06T09:11',95992,'inactivo',1,52,49),('2024-08-17T06:07','2024-08-17T17:21',20220,'activo',2,53,49),('2024-08-17T06:07','2024-08-17T17:21',9000,'activo',3,54,49),('2024-08-19T08:09','2024-08-21T07:24',36855,'activo',1,55,49),('2024-08-22T11:12','2024-08-26T09:24',73476,'inactivo',1,56,49),('2024-08-01T11:31','2024-08-01T12:31',9000,'activo',3,57,46);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-06 17:55:07
