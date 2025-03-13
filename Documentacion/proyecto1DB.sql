/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: proyecto1IPC2
-- ------------------------------------------------------
-- Server version	11.7.2-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(250) NOT NULL,
  `nombreCliente` varchar(250) NOT NULL,
  `direccionCliente` varchar(250) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente`
--

DROP TABLE IF EXISTS `componente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente` (
  `idComponente` int(11) NOT NULL AUTO_INCREMENT,
  `tipoComponente` varchar(250) NOT NULL,
  `precioComponente` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente`
--

LOCK TABLES `componente` WRITE;
/*!40000 ALTER TABLE `componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computadora`
--

DROP TABLE IF EXISTS `computadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `computadora` (
  `idComputadora` int(11) NOT NULL AUTO_INCREMENT,
  `nombreComputadora` varchar(250) NOT NULL,
  `precioComputadora` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idComputadora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computadora`
--

LOCK TABLES `computadora` WRITE;
/*!40000 ALTER TABLE `computadora` DISABLE KEYS */;
/*!40000 ALTER TABLE `computadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computadoraEnsamblada`
--

DROP TABLE IF EXISTS `computadoraEnsamblada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `computadoraEnsamblada` (
  `idComputadoraEnsamblada` int(11) NOT NULL AUTO_INCREMENT,
  `idComputadora` int(11) NOT NULL,
  `idUsuario` varchar(10) NOT NULL,
  `fechaCreada` date NOT NULL,
  `costoTotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idComputadoraEnsamblada`),
  KEY `idComputadora` (`idComputadora`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `computadoraEnsamblada_ibfk_1` FOREIGN KEY (`idComputadora`) REFERENCES `computadora` (`idComputadora`),
  CONSTRAINT `computadoraEnsamblada_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computadoraEnsamblada`
--

LOCK TABLES `computadoraEnsamblada` WRITE;
/*!40000 ALTER TABLE `computadoraEnsamblada` DISABLE KEYS */;
/*!40000 ALTER TABLE `computadoraEnsamblada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleVenta`
--

DROP TABLE IF EXISTS `detalleVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleVenta` (
  `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) NOT NULL,
  `idComputadoraEnsamblada` int(11) NOT NULL,
  `cantidadDV` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `idVenta` (`idVenta`),
  KEY `idComputadoraEnsamblada` (`idComputadoraEnsamblada`),
  CONSTRAINT `detalleVenta_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`),
  CONSTRAINT `detalleVenta_ibfk_2` FOREIGN KEY (`idComputadoraEnsamblada`) REFERENCES `computadoraEnsamblada` (`idComputadoraEnsamblada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleVenta`
--

LOCK TABLES `detalleVenta` WRITE;
/*!40000 ALTER TABLE `detalleVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensamblajePiezas`
--

DROP TABLE IF EXISTS `ensamblajePiezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ensamblajePiezas` (
  `idEnsamblajePiezas` int(11) NOT NULL AUTO_INCREMENT,
  `idComputadora` int(11) NOT NULL,
  `idComponnete` int(11) NOT NULL,
  `cantidadPiezas` int(11) NOT NULL,
  PRIMARY KEY (`idEnsamblajePiezas`),
  KEY `idComputadora` (`idComputadora`),
  KEY `idComponnete` (`idComponnete`),
  CONSTRAINT `ensamblajePiezas_ibfk_1` FOREIGN KEY (`idComputadora`) REFERENCES `computadora` (`idComputadora`),
  CONSTRAINT `ensamblajePiezas_ibfk_2` FOREIGN KEY (`idComponnete`) REFERENCES `componente` (`idComponente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensamblajePiezas`
--

LOCK TABLES `ensamblajePiezas` WRITE;
/*!40000 ALTER TABLE `ensamblajePiezas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ensamblajePiezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `idReporte` int(11) NOT NULL AUTO_INCREMENT,
  `tipoReporte` varchar(1) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  `detalles` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`idReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` varchar(10) NOT NULL,
  `nombreUsuario` varchar(250) NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `password` varchar(10) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES
('jp123','Juan Perez','1','0123456789');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idUsuario` varchar(10) NOT NULL,
  `fechaVenta` date NOT NULL,
  `totalVenta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `idCliente` (`idCliente`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-12 23:21:25
