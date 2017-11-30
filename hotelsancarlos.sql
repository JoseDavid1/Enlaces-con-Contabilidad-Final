-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hotelsancarlos
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `aguinaldo`
--

DROP TABLE IF EXISTS `aguinaldo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aguinaldo` (
  `idAguinaldo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_aguinaldo_pago` datetime NOT NULL,
  `valorPercepcion` float NOT NULL,
  `estadoPago` int(11) NOT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`idAguinaldo`),
  KEY `fk_aguinaldo_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aguinaldo`
--

LOCK TABLES `aguinaldo` WRITE;
/*!40000 ALTER TABLE `aguinaldo` DISABLE KEYS */;
/*!40000 ALTER TABLE `aguinaldo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacion`
--

DROP TABLE IF EXISTS `aplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aplicacion` (
  `idAplicacion` int(11) NOT NULL,
  `nombreAplicacion` varchar(45) DEFAULT NULL,
  `descripcionAplicacion` varchar(45) DEFAULT NULL,
  `habilitarAplicacion` varchar(45) DEFAULT NULL,
  `reporteador_idReporte` int(11) NOT NULL,
  PRIMARY KEY (`idAplicacion`),
  KEY `fk_aplicacion_reporteador1_idx` (`reporteador_idReporte`),
  CONSTRAINT `fk_aplicacion_reporteador1` FOREIGN KEY (`reporteador_idReporte`) REFERENCES `reporteador` (`idReporte`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacion`
--

LOCK TABLES `aplicacion` WRITE;
/*!40000 ALTER TABLE `aplicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `aplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asientos`
--

DROP TABLE IF EXISTS `asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asientos` (
  `idasientos` int(11) NOT NULL AUTO_INCREMENT,
  `fila` varchar(45) DEFAULT NULL,
  `columna` varchar(45) DEFAULT NULL,
  `tipoAsiento_idtipoAsiento` int(11) NOT NULL,
  `sala_idsala` int(11) NOT NULL,
  PRIMARY KEY (`idasientos`),
  KEY `fk_asientos_tipoAsiento1_idx` (`tipoAsiento_idtipoAsiento`),
  KEY `fk_asientos_sala1_idx` (`sala_idsala`),
  CONSTRAINT `fk_asientos_sala1` FOREIGN KEY (`sala_idsala`) REFERENCES `sala` (`idsala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asientos_tipoAsiento1` FOREIGN KEY (`tipoAsiento_idtipoAsiento`) REFERENCES `tipoasiento` (`idtipoAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientos`
--

LOCK TABLES `asientos` WRITE;
/*!40000 ALTER TABLE `asientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asientosreservados`
--

DROP TABLE IF EXISTS `asientosreservados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asientosreservados` (
  `idasientosReservados` int(11) NOT NULL AUTO_INCREMENT,
  `tipoAsiento_idtipoAsiento` int(11) NOT NULL,
  `ordenDeCompra_idordenDeCompra` int(11) NOT NULL,
  `asientos_idasientos` int(11) NOT NULL,
  PRIMARY KEY (`idasientosReservados`),
  KEY `fk_asientosReservados_tipoAsiento1_idx` (`tipoAsiento_idtipoAsiento`),
  KEY `fk_asientosReservados_ordenDeCompra1_idx` (`ordenDeCompra_idordenDeCompra`),
  KEY `fk_asientosReservados_asientos1_idx` (`asientos_idasientos`),
  CONSTRAINT `fk_asientosReservados_asientos1` FOREIGN KEY (`asientos_idasientos`) REFERENCES `asientos` (`idasientos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asientosReservados_ordenDeCompra1` FOREIGN KEY (`ordenDeCompra_idordenDeCompra`) REFERENCES `ordendecompra` (`idordenDeCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asientosReservados_tipoAsiento1` FOREIGN KEY (`tipoAsiento_idtipoAsiento`) REFERENCES `tipoasiento` (`idtipoAsiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asientosreservados`
--

LOCK TABLES `asientosreservados` WRITE;
/*!40000 ALTER TABLE `asientosreservados` DISABLE KEYS */;
/*!40000 ALTER TABLE `asientosreservados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacionhabitacion`
--

DROP TABLE IF EXISTS `asignacionhabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacionhabitacion` (
  `idAsignacionHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` date DEFAULT NULL,
  `fechaFinal` date DEFAULT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `habitacion_idHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`idAsignacionHabitacion`),
  KEY `fk_asignacionhabitacion_cliente1_idx` (`cliente_idCliente`),
  KEY `fk_asignacionhabitacion_habitacion1_idx` (`habitacion_idHabitacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacionhabitacion`
--

LOCK TABLES `asignacionhabitacion` WRITE;
/*!40000 ALTER TABLE `asignacionhabitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacionhabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banco`
--

DROP TABLE IF EXISTS `banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banco` (
  `idBanco` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idBanco`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banco`
--

LOCK TABLES `banco` WRITE;
/*!40000 ALTER TABLE `banco` DISABLE KEYS */;
/*!40000 ALTER TABLE `banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitacora` (
  `idBitacora` int(11) NOT NULL,
  `fechaBitacora` date DEFAULT NULL,
  `horaBitacora` time DEFAULT NULL,
  `accionUsuario` varchar(45) DEFAULT NULL,
  `resultadoBitacora` varchar(45) DEFAULT NULL,
  `errorBitacora` varchar(45) DEFAULT NULL,
  `ipPc` varchar(45) DEFAULT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  `aplicacion_idAplicacion` int(11) NOT NULL,
  PRIMARY KEY (`idBitacora`),
  KEY `fk_bitacora_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_bitacora_aplicacion1_idx` (`aplicacion_idAplicacion`),
  CONSTRAINT `fk_bitacora_aplicacion1` FOREIGN KEY (`aplicacion_idAplicacion`) REFERENCES `aplicacion` (`idAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacora_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bodega`
--

DROP TABLE IF EXISTS `bodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bodega` (
  `idBodega` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `nivel` varchar(45) DEFAULT NULL,
  `capacidad` varchar(45) DEFAULT NULL,
  `encargado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBodega`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodega`
--

LOCK TABLES `bodega` WRITE;
/*!40000 ALTER TABLE `bodega` DISABLE KEYS */;
INSERT INTO `bodega` VALUES (1,'Bodega 1',NULL,'Primer Nivel','150','Encargado 1'),(2,'Bodega 2',NULL,'Segundo Nivel','150','Encargado 2');
/*!40000 ALTER TABLE `bodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bono14`
--

DROP TABLE IF EXISTS `bono14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bono14` (
  `idBono` int(11) NOT NULL AUTO_INCREMENT,
  `fechaBono14` datetime NOT NULL,
  `valorPercepcion` float NOT NULL,
  `estadoBono` int(11) NOT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`idBono`),
  KEY `fk_bono14_contrato1_idx` (`contrato_idContrato`),
  CONSTRAINT `fk_bono14_contrato1` FOREIGN KEY (`contrato_idContrato`) REFERENCES `contrato` (`idContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bono14`
--

LOCK TABLES `bono14` WRITE;
/*!40000 ALTER TABLE `bono14` DISABLE KEYS */;
/*!40000 ALTER TABLE `bono14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (7,'A','Peliculas para todo publico'),(8,'B','ninios acompaniados de adultos'),(9,'B12','Peliculas para adolecentes de 12 anios en adelante'),(10,'B15','No recomendada para ninios menores de 15 anios');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cierrenomina`
--

DROP TABLE IF EXISTS `cierrenomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cierrenomina` (
  `idCierre` int(11) NOT NULL AUTO_INCREMENT,
  `nomina_idNomina` int(11) NOT NULL,
  `fechaCierre` datetime NOT NULL,
  `totalPercibido` float NOT NULL,
  `totalDeducido` float NOT NULL,
  PRIMARY KEY (`idCierre`),
  KEY `fk_cierreNomina_nomina1_idx` (`nomina_idNomina`),
  CONSTRAINT `fk_cierreNomina_nomina1` FOREIGN KEY (`nomina_idNomina`) REFERENCES `nomina` (`idNomina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cierrenomina`
--

LOCK TABLES `cierrenomina` WRITE;
/*!40000 ALTER TABLE `cierrenomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `cierrenomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cine`
--

DROP TABLE IF EXISTS `cine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cine` (
  `idcine` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCine` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `ciudad_idciudad` int(11) NOT NULL,
  PRIMARY KEY (`idcine`),
  KEY `fk_cine_ciudad_idx` (`ciudad_idciudad`),
  CONSTRAINT `fk_cine_ciudad` FOREIGN KEY (`ciudad_idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cine`
--

LOCK TABLES `cine` WRITE;
/*!40000 ALTER TABLE `cine` DISABLE KEYS */;
INSERT INTO `cine` VALUES (1,'movie++ Cayala',NULL,'56897858',1),(2,'movie++ El Frutal ',NULL,'45857899',1),(3,'movie++ Miraflores',NULL,'22566698',1),(4,'movie++ Naranjo Mall',NULL,'22336659',1),(5,'movie++ Oakland Mall',NULL,'44458887',1),(6,'movie++ Portales',NULL,'22336655',1),(7,'movie++ Santa Clara',NULL,'44445588',1);
/*!40000 ALTER TABLE `cine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinefranquisia`
--

DROP TABLE IF EXISTS `cinefranquisia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cinefranquisia` (
  `idcineFranquisia` int(11) NOT NULL AUTO_INCREMENT,
  `cine_idcine` int(11) NOT NULL,
  `franquisia_idfranquisia` int(11) NOT NULL,
  PRIMARY KEY (`idcineFranquisia`),
  KEY `fk_cineFranquisia_cine1_idx` (`cine_idcine`),
  KEY `fk_cineFranquisia_franquisia1_idx` (`franquisia_idfranquisia`),
  CONSTRAINT `fk_cineFranquisia_cine1` FOREIGN KEY (`cine_idcine`) REFERENCES `cine` (`idcine`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cineFranquisia_franquisia1` FOREIGN KEY (`franquisia_idfranquisia`) REFERENCES `franquisia` (`idfranquisia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinefranquisia`
--

LOCK TABLES `cinefranquisia` WRITE;
/*!40000 ALTER TABLE `cinefranquisia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinefranquisia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCiudad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Guatemala'),(2,'Quetzaltenango'),(3,'Mazatenango'),(4,'Escuintla'),(5,'Chimaltenango'),(6,'Huehuetenango'),(7,'Puerto Barrios'),(8,'Jutiapa'),(9,'Peten');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(45) DEFAULT NULL,
  `apellidoCliente` varchar(45) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(100) DEFAULT NULL,
  `clientecol` varchar(45) DEFAULT NULL,
  `pathFoto` varchar(200) DEFAULT NULL,
  `clientecol1` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepuntos`
--

DROP TABLE IF EXISTS `clientepuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientepuntos` (
  `idclientePuntos` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPuntos` date DEFAULT NULL,
  `puntosCompra` int(11) DEFAULT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`idclientePuntos`),
  KEY `fk_clientePuntos_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_clientePuntos_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepuntos`
--

LOCK TABLES `clientepuntos` WRITE;
/*!40000 ALTER TABLE `clientepuntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comisiones`
--

DROP TABLE IF EXISTS `comisiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comisiones` (
  `idComision` int(11) NOT NULL AUTO_INCREMENT,
  `porcentaje` float DEFAULT NULL,
  `inventario_codigoInventario` int(11) NOT NULL,
  `empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idComision`),
  KEY `fk_comisiones_inventario1_idx` (`inventario_codigoInventario`),
  KEY `fk_comisiones_empleado1_idx` (`empleado_idEmpleado`),
  CONSTRAINT `fk_comisiones_empleado1` FOREIGN KEY (`empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comisiones_inventario1` FOREIGN KEY (`inventario_codigoInventario`) REFERENCES `inventario` (`codigoInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comisiones`
--

LOCK TABLES `comisiones` WRITE;
/*!40000 ALTER TABLE `comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `comisiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprasdetalle`
--

DROP TABLE IF EXISTS `comprasdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprasdetalle` (
  `idComprasDetalle` int(11) NOT NULL,
  `id_productos` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  PRIMARY KEY (`idComprasDetalle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprasdetalle`
--

LOCK TABLES `comprasdetalle` WRITE;
/*!40000 ALTER TABLE `comprasdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprasdetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprasencabezado`
--

DROP TABLE IF EXISTS `comprasencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprasencabezado` (
  `idComprasEncabezado` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `idComprasDetalle` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `comprasdetalle_idComprasDetalle` int(11) NOT NULL,
  PRIMARY KEY (`idComprasEncabezado`),
  KEY `fk_comprasencabezado_comprasdetalle1_idx` (`comprasdetalle_idComprasDetalle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprasencabezado`
--

LOCK TABLES `comprasencabezado` WRITE;
/*!40000 ALTER TABLE `comprasencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprasencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conciliacion`
--

DROP TABLE IF EXISTS `conciliacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conciliacion` (
  `CorrConciliacion` int(11) NOT NULL,
  `noTransaccion` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`CorrConciliacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conciliacion`
--

LOCK TABLES `conciliacion` WRITE;
/*!40000 ALTER TABLE `conciliacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `conciliacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `idContrato` int(10) NOT NULL AUTO_INCREMENT,
  `fechaCreacionContrato` varchar(50) DEFAULT NULL,
  `estadoCivil` varchar(45) DEFAULT NULL,
  `lugar` varchar(45) DEFAULT NULL,
  `inicioRelacionTrabajo` varchar(50) DEFAULT NULL,
  `duracionContrato` varchar(45) DEFAULT NULL,
  `serviciosTrabajador` varchar(50) DEFAULT NULL,
  `jornadaTrabajador` varchar(45) DEFAULT NULL,
  `clausulasContrato` varchar(50) DEFAULT NULL,
  `nombreEmpleador` varchar(45) DEFAULT NULL,
  `horasLaboralesDiarias` int(11) DEFAULT NULL,
  `sueldoBase` decimal(9,2) DEFAULT NULL,
  `empleado_idEmpleado` int(11) NOT NULL,
  `horario_idHorario` int(11) NOT NULL,
  `puesto_idPuesto` int(11) NOT NULL,
  PRIMARY KEY (`idContrato`),
  KEY `fk_contrato_empleado1_idx` (`empleado_idEmpleado`),
  KEY `fk_contrato_horario1_idx` (`horario_idHorario`),
  KEY `fk_contrato_puesto1_idx` (`puesto_idPuesto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controldemoras`
--

DROP TABLE IF EXISTS `controldemoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controldemoras` (
  `idControlDemoras` int(11) NOT NULL,
  `fechaInicial` date DEFAULT NULL,
  `fechaPrevistaDeRecibido` date DEFAULT NULL,
  `demora` varchar(45) DEFAULT NULL,
  `ordenedecompra_idOrdenesCompra` int(11) NOT NULL,
  PRIMARY KEY (`idControlDemoras`),
  KEY `fk_controldemoras_ordenedecompra1_idx` (`ordenedecompra_idOrdenesCompra`),
  CONSTRAINT `fk_controldemoras_ordenedecompra1` FOREIGN KEY (`ordenedecompra_idOrdenesCompra`) REFERENCES `ordenedecompra` (`idOrdenesCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controldemoras`
--

LOCK TABLES `controldemoras` WRITE;
/*!40000 ALTER TABLE `controldemoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `controldemoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controldevolucion`
--

DROP TABLE IF EXISTS `controldevolucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controldevolucion` (
  `idControlDevolucion` int(11) NOT NULL,
  `devaluacionAutorizada` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `ordenedecompra_idOrdenesCompra` int(11) NOT NULL,
  PRIMARY KEY (`idControlDevolucion`),
  KEY `fk_controldevolucion_ordenedecompra1_idx` (`ordenedecompra_idOrdenesCompra`),
  CONSTRAINT `fk_controldevolucion_ordenedecompra1` FOREIGN KEY (`ordenedecompra_idOrdenesCompra`) REFERENCES `ordenedecompra` (`idOrdenesCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controldevolucion`
--

LOCK TABLES `controldevolucion` WRITE;
/*!40000 ALTER TABLE `controldevolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `controldevolucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion` (
  `idCotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `productos_idProducto` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fechaCotizacion` varchar(45) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `empleado_idEmpleado` int(11) NOT NULL,
  PRIMARY KEY (`idCotizacion`),
  KEY `fk_cotizacion_productos1_idx` (`productos_idProducto`),
  KEY `fk_cotizacion_empleado1_idx` (`empleado_idEmpleado`),
  CONSTRAINT `fk_cotizacion_empleado1` FOREIGN KEY (`empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotizacion_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentabanco`
--

DROP TABLE IF EXISTS `cuentabanco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentabanco` (
  `noCuenta` varchar(15) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `saldoActual` float DEFAULT NULL,
  `saldoDisponible` float DEFAULT NULL,
  `tipoCuenta` varchar(25) DEFAULT NULL,
  `tipoMoneda` varchar(25) DEFAULT NULL,
  `banco_idBanco` int(11) NOT NULL,
  `moneda_idMoneda` int(11) NOT NULL,
  PRIMARY KEY (`noCuenta`),
  KEY `fk_cuentabanco_banco1_idx` (`banco_idBanco`),
  KEY `fk_cuentabanco_moneda1_idx` (`moneda_idMoneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentabanco`
--

LOCK TABLES `cuentabanco` WRITE;
/*!40000 ALTER TABLE `cuentabanco` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuentabanco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentacontabilidad`
--

DROP TABLE IF EXISTS `cuentacontabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentacontabilidad` (
  `nomenclatura` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `saldo` varchar(9) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `saldoAnterior` double DEFAULT NULL,
  `cargoMes` double DEFAULT NULL,
  `abonoMes` double DEFAULT NULL,
  `saldoActual` double DEFAULT NULL,
  `cargoAcumulado` double DEFAULT NULL,
  `abonoAcumulado` double DEFAULT NULL,
  `presupuestado` double DEFAULT NULL,
  `naturaleza` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`nomenclatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentacontabilidad`
--

LOCK TABLES `cuentacontabilidad` WRITE;
/*!40000 ALTER TABLE `cuentacontabilidad` DISABLE KEYS */;
INSERT INTO `cuentacontabilidad` VALUES (1,'Bancos','500',1,500,500,500,500,500,500,500,'500','cuenta'),(2,'Moviliario y Equipo','500',1,500,500,500,500,500,500,500,'500','cuenta'),(3,'CuentasxCobrar','500',1,500,500,500,500,500,500,500,'500','cuenta');
/*!40000 ALTER TABLE `cuentacontabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(55) NOT NULL,
  `jefeDepartamento` varchar(55) NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depreciacion`
--

DROP TABLE IF EXISTS `depreciacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depreciacion` (
  `totalArticulo` double DEFAULT NULL,
  `fechaCompra` date DEFAULT NULL,
  `totalDepreciado` double DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` int(11) NOT NULL,
  `tipoDepreciacion_idTipoDepreciacion` int(11) NOT NULL,
  `inventario_codigoInventario` int(11) NOT NULL,
  PRIMARY KEY (`cuentacontabilidad_nomenclatura`,`inventario_codigoInventario`),
  KEY `fk_depreciacion_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura`),
  KEY `fk_depreciacion_tipoDepreciacion1_idx` (`tipoDepreciacion_idTipoDepreciacion`),
  KEY `fk_depreciacion_inventario1_idx` (`inventario_codigoInventario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depreciacion`
--

LOCK TABLES `depreciacion` WRITE;
/*!40000 ALTER TABLE `depreciacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `depreciacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despido`
--

DROP TABLE IF EXISTS `despido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despido` (
  `idDespido` int(11) NOT NULL AUTO_INCREMENT,
  `causaDespido` varchar(75) NOT NULL,
  `fechaDespido` datetime NOT NULL,
  `montoIndem` float NOT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`idDespido`),
  KEY `fk_despido_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despido`
--

LOCK TABLES `despido` WRITE;
/*!40000 ALTER TABLE `despido` DISABLE KEYS */;
/*!40000 ALTER TABLE `despido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleaplicacionderecho`
--

DROP TABLE IF EXISTS `detalleaplicacionderecho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleaplicacionderecho` (
  `ingresar` tinyint(4) DEFAULT NULL,
  `modificar` tinyint(4) DEFAULT NULL,
  `eliminar` tinyint(4) DEFAULT NULL,
  `imprimir` tinyint(4) DEFAULT NULL,
  `consultar` tinyint(4) DEFAULT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  `aplicacion_idAplicacion` int(11) NOT NULL,
  KEY `fk_detalleAplicacionDerecho_usuario1_idx` (`usuario_idUsuario`),
  KEY `fk_detalleAplicacionDerecho_aplicacion1_idx` (`aplicacion_idAplicacion`),
  CONSTRAINT `fk_detalleAplicacionDerecho_aplicacion1` FOREIGN KEY (`aplicacion_idAplicacion`) REFERENCES `aplicacion` (`idAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleAplicacionDerecho_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleaplicacionderecho`
--

LOCK TABLES `detalleaplicacionderecho` WRITE;
/*!40000 ALTER TABLE `detalleaplicacionderecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleaplicacionderecho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleasignacionservicio`
--

DROP TABLE IF EXISTS `detalleasignacionservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleasignacionservicio` (
  `idAsignacionHabitacion` int(11) NOT NULL,
  `diasServicio` int(11) NOT NULL,
  `servicio_idServicio` int(11) NOT NULL,
  PRIMARY KEY (`idAsignacionHabitacion`),
  KEY `fk_detalleasignacionservicio_servicio1_idx` (`servicio_idServicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleasignacionservicio`
--

LOCK TABLES `detalleasignacionservicio` WRITE;
/*!40000 ALTER TABLE `detalleasignacionservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleasignacionservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallebodega`
--

DROP TABLE IF EXISTS `detallebodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallebodega` (
  `idDetalleBodega` int(11) NOT NULL AUTO_INCREMENT,
  `productos_idProducto` int(11) NOT NULL,
  `bodega_idBodega` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `tipoMedida_idTipoMedida` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleBodega`),
  KEY `fk_detallebodega_productos1_idx` (`productos_idProducto`),
  KEY `fk_detallebodega_bodega1_idx` (`bodega_idBodega`),
  KEY `fk_detallebodega_tipoMedida1_idx` (`tipoMedida_idTipoMedida`),
  CONSTRAINT `fk_detallebodega_bodega1` FOREIGN KEY (`bodega_idBodega`) REFERENCES `bodega` (`idBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallebodega_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallebodega_tipoMedida1` FOREIGN KEY (`tipoMedida_idTipoMedida`) REFERENCES `tipomedida` (`idTipoMedida`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallebodega`
--

LOCK TABLES `detallebodega` WRITE;
/*!40000 ALTER TABLE `detallebodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallebodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallefactura` (
  `cantidadFacturado` int(11) NOT NULL,
  `precioFacturado` int(11) DEFAULT NULL,
  `factura_idFactura` int(11) NOT NULL,
  `productos_idProducto` int(11) NOT NULL,
  KEY `fk_detallefactura_factura1_idx` (`factura_idFactura`),
  KEY `fk_detallefactura_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_detallefactura_factura1` FOREIGN KEY (`factura_idFactura`) REFERENCES `factura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallefactura_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallehabitacionreservacion`
--

DROP TABLE IF EXISTS `detallehabitacionreservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallehabitacionreservacion` (
  `reservacion_idReservacion` int(11) NOT NULL,
  `habitacion_idHabitacion` int(11) NOT NULL,
  KEY `fk_detalleHabitacionReservacion_reservacion1_idx` (`reservacion_idReservacion`),
  KEY `fk_detalleHabitacionReservacion_habitacion1_idx` (`habitacion_idHabitacion`),
  CONSTRAINT `fk_detalleHabitacionReservacion_habitacion1` FOREIGN KEY (`habitacion_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleHabitacionReservacion_reservacion1` FOREIGN KEY (`reservacion_idReservacion`) REFERENCES `reservacion` (`idReservacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallehabitacionreservacion`
--

LOCK TABLES `detallehabitacionreservacion` WRITE;
/*!40000 ALTER TABLE `detallehabitacionreservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallehabitacionreservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallemantenimientohabitacion`
--

DROP TABLE IF EXISTS `detallemantenimientohabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallemantenimientohabitacion` (
  `fechaUltimoMantenimiento` date NOT NULL,
  `mantenimiento_idMantenimiento` int(11) NOT NULL,
  `habitacion_idHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`mantenimiento_idMantenimiento`,`habitacion_idHabitacion`),
  KEY `fk_detallemantenimientohabitacion_mantenimiento1_idx` (`mantenimiento_idMantenimiento`),
  KEY `fk_detallemantenimientohabitacion_habitacion1_idx` (`habitacion_idHabitacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallemantenimientohabitacion`
--

LOCK TABLES `detallemantenimientohabitacion` WRITE;
/*!40000 ALTER TABLE `detallemantenimientohabitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallemantenimientohabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallemovimiento`
--

DROP TABLE IF EXISTS `detallemovimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallemovimiento` (
  `idDetalleMovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad` int(11) DEFAULT NULL,
  `CostoUnitario` int(11) DEFAULT NULL,
  `CostoTotal` int(11) DEFAULT NULL,
  `movimientoInventario_codigoMovimientoInventario` int(11) NOT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleMovimiento`),
  KEY `fk_DetalleMovimiento_movimientoInventario1_idx` (`movimientoInventario_codigoMovimientoInventario`),
  KEY `fk_DetalleMovimiento_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_DetalleMovimiento_movimientoInventario1` FOREIGN KEY (`movimientoInventario_codigoMovimientoInventario`) REFERENCES `movimientoinventario` (`codigoMovimientoInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleMovimiento_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallemovimiento`
--

LOCK TABLES `detallemovimiento` WRITE;
/*!40000 ALTER TABLE `detallemovimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallemovimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallenomina`
--

DROP TABLE IF EXISTS `detallenomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallenomina` (
  `nominIdNomina` int(11) NOT NULL,
  `contratoIdContrato` int(10) NOT NULL,
  `id_PD` int(11) NOT NULL,
  `valorPDcalculado` float NOT NULL,
  PRIMARY KEY (`nominIdNomina`,`contratoIdContrato`,`id_PD`),
  KEY `fk_detallenomina_nomina1_idx` (`nominIdNomina`),
  KEY `fk_detallenomina_contrato1_idx` (`contratoIdContrato`),
  KEY `fk_detallenomina_percepcion1_idx` (`id_PD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallenomina`
--

LOCK TABLES `detallenomina` WRITE;
/*!40000 ALTER TABLE `detallenomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallenomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepartida`
--

DROP TABLE IF EXISTS `detallepartida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepartida` (
  `numeroDetallePartida` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` int(11) NOT NULL,
  `tipoPartida` varchar(45) NOT NULL,
  `partida_idPartida` varchar(12) NOT NULL,
  PRIMARY KEY (`numeroDetallePartida`,`partida_idPartida`),
  KEY `fk_detallepartida_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura`),
  KEY `fk_detallepartida_partida1_idx` (`partida_idPartida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepartida`
--

LOCK TABLES `detallepartida` WRITE;
/*!40000 ALTER TABLE `detallepartida` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepartida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepedido` (
  `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_idPedido` int(11) NOT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idDetallePedido`),
  KEY `fk_detallepedido_pedido1_idx` (`pedido_idPedido`),
  KEY `fk_detallepedido_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_detallepedido_pedido1` FOREIGN KEY (`pedido_idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallepedido_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedido`
--

LOCK TABLES `detallepedido` WRITE;
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedidobebida`
--

DROP TABLE IF EXISTS `detallepedidobebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepedidobebida` (
  `cantidadBebida` int(11) NOT NULL,
  `pedidoRestaurante_idPedido` int(11) NOT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`pedidoRestaurante_idPedido`,`productos_idProducto`),
  KEY `fk_detallepedidobebida_pedidoRestaurante1_idx` (`pedidoRestaurante_idPedido`),
  KEY `fk_detallepedidobebida_productos1_idx` (`productos_idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedidobebida`
--

LOCK TABLES `detallepedidobebida` WRITE;
/*!40000 ALTER TABLE `detallepedidobebida` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedidobebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedidoplatillo`
--

DROP TABLE IF EXISTS `detallepedidoplatillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallepedidoplatillo` (
  `cantidadPlatillo` int(11) NOT NULL,
  `platillo_idPlatillo` int(11) NOT NULL,
  `pedidoRestaurante_idPedido` int(11) NOT NULL,
  PRIMARY KEY (`platillo_idPlatillo`,`pedidoRestaurante_idPedido`),
  KEY `fk_detallepedidoplatillo_platillo1_idx` (`platillo_idPlatillo`),
  KEY `fk_detallepedidoplatillo_pedidoRestaurante1_idx` (`pedidoRestaurante_idPedido`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedidoplatillo`
--

LOCK TABLES `detallepedidoplatillo` WRITE;
/*!40000 ALTER TABLE `detallepedidoplatillo` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallepedidoplatillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleperfilaplicacion`
--

DROP TABLE IF EXISTS `detalleperfilaplicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleperfilaplicacion` (
  `aplicacion_idAplicacion` int(11) NOT NULL,
  `perfil_idPerfil` int(11) NOT NULL,
  KEY `fk_detallePerfilAplicacion_aplicacion1_idx` (`aplicacion_idAplicacion`),
  KEY `fk_detallePerfilAplicacion_perfil1_idx` (`perfil_idPerfil`),
  CONSTRAINT `fk_detallePerfilAplicacion_aplicacion1` FOREIGN KEY (`aplicacion_idAplicacion`) REFERENCES `aplicacion` (`idAplicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detallePerfilAplicacion_perfil1` FOREIGN KEY (`perfil_idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleperfilaplicacion`
--

LOCK TABLES `detalleperfilaplicacion` WRITE;
/*!40000 ALTER TABLE `detalleperfilaplicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleperfilaplicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallerecetaingrediente`
--

DROP TABLE IF EXISTS `detallerecetaingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallerecetaingrediente` (
  `receta_idReceta` int(11) NOT NULL,
  `pesoOcantidad` varchar(45) NOT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`receta_idReceta`,`productos_idProducto`),
  KEY `fk_detalleRecetaIngrediente_receta1_idx` (`receta_idReceta`),
  KEY `fk_detalleRecetaIngrediente_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_detalleRecetaIngrediente_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleRecetaIngrediente_receta1` FOREIGN KEY (`receta_idReceta`) REFERENCES `receta` (`idReceta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallerecetaingrediente`
--

LOCK TABLES `detallerecetaingrediente` WRITE;
/*!40000 ALTER TABLE `detallerecetaingrediente` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallerecetaingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallereservacionservicio`
--

DROP TABLE IF EXISTS `detallereservacionservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallereservacionservicio` (
  `servicio_idServicio` int(11) NOT NULL,
  `reservacion_idReservacion` int(11) NOT NULL,
  KEY `fk_detallereservacionservicio_servicio1_idx` (`servicio_idServicio`),
  KEY `fk_detallereservacionservicio_reservacion1_idx` (`reservacion_idReservacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallereservacionservicio`
--

LOCK TABLES `detallereservacionservicio` WRITE;
/*!40000 ALTER TABLE `detallereservacionservicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallereservacionservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalletipohuepedreservacion`
--

DROP TABLE IF EXISTS `detalletipohuepedreservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalletipohuepedreservacion` (
  `reservacion_idReservacion` int(11) NOT NULL,
  `tipoHuesped_idTipoHuesped` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  KEY `fk_detalleTipoHuepedReservacion_reservacion1_idx` (`reservacion_idReservacion`),
  KEY `fk_detalleTipoHuepedReservacion_tipoHuesped1_idx` (`tipoHuesped_idTipoHuesped`),
  CONSTRAINT `fk_detalleTipoHuepedReservacion_reservacion1` FOREIGN KEY (`reservacion_idReservacion`) REFERENCES `reservacion` (`idReservacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleTipoHuepedReservacion_tipoHuesped1` FOREIGN KEY (`tipoHuesped_idTipoHuesped`) REFERENCES `tipohuesped` (`idTipoHuesped`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalletipohuepedreservacion`
--

LOCK TABLES `detalletipohuepedreservacion` WRITE;
/*!40000 ALTER TABLE `detalletipohuepedreservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalletipohuepedreservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalletransaccion`
--

DROP TABLE IF EXISTS `detalletransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalletransaccion` (
  `CorrDetTransaccion` int(11) NOT NULL,
  `TipoOperacion` tinyint(4) DEFAULT NULL,
  `transaccion_noTransaccion` int(11) NOT NULL,
  `tipotransaccion_idTipoTransaccion` int(11) NOT NULL,
  PRIMARY KEY (`CorrDetTransaccion`),
  KEY `fk_detalletransaccion_transaccion1_idx` (`transaccion_noTransaccion`),
  KEY `fk_detalletransaccion_tipotransaccion1_idx` (`tipotransaccion_idTipoTransaccion`),
  CONSTRAINT `fk_detalletransaccion_tipotransaccion1` FOREIGN KEY (`tipotransaccion_idTipoTransaccion`) REFERENCES `tipotransaccion` (`idTipoTransaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalletransaccion_transaccion1` FOREIGN KEY (`transaccion_noTransaccion`) REFERENCES `transaccion` (`noTransaccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalletransaccion`
--

LOCK TABLES `detalletransaccion` WRITE;
/*!40000 ALTER TABLE `detalletransaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalletransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleusuarioperfil`
--

DROP TABLE IF EXISTS `detalleusuarioperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleusuarioperfil` (
  `perfil_idPerfil` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  KEY `fk_detalleUsuarioAplicacion_perfil1_idx` (`perfil_idPerfil`),
  KEY `fk_detalleUsuarioAplicacion_usuario1_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_detalleUsuarioAplicacion_perfil1` FOREIGN KEY (`perfil_idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleUsuarioAplicacion_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleusuarioperfil`
--

LOCK TABLES `detalleusuarioperfil` WRITE;
/*!40000 ALTER TABLE `detalleusuarioperfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleusuarioperfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `dpi` varchar(50) DEFAULT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `primerNombre` varchar(50) DEFAULT NULL,
  `segundoNombre` varchar(50) DEFAULT NULL,
  `apellidoPaterno` varchar(50) DEFAULT NULL,
  `apellidoMaterno` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contactoEmergencia` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccionDomicilio` varchar(50) DEFAULT NULL,
  `fechaCreacionEmpleado` varchar(50) DEFAULT NULL,
  `nivelAcedemico` varchar(50) DEFAULT NULL,
  `noCuenta` int(11) DEFAULT NULL,
  `cuentabanco_idBanco` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estrenos`
--

DROP TABLE IF EXISTS `estrenos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estrenos` (
  `idestrenos` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEstreno` date DEFAULT NULL,
  `pelicula_idpelicula` int(11) NOT NULL,
  PRIMARY KEY (`idestrenos`),
  KEY `fk_estrenos_pelicula1_idx` (`pelicula_idpelicula`),
  CONSTRAINT `fk_estrenos_pelicula1` FOREIGN KEY (`pelicula_idpelicula`) REFERENCES `pelicula` (`idpelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estrenos`
--

LOCK TABLES `estrenos` WRITE;
/*!40000 ALTER TABLE `estrenos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estrenos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `nitEmpresa` varchar(45) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `ordenDeCompra_idordenDeCompra` int(11) NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `fk_factura_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_factura_ordenDeCompra1_idx` (`ordenDeCompra_idordenDeCompra`),
  CONSTRAINT `fk_factura_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_ordenDeCompra1` FOREIGN KEY (`ordenDeCompra_idordenDeCompra`) REFERENCES `ordendecompra` (`idordenDeCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formato`
--

DROP TABLE IF EXISTS `formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formato` (
  `idformato` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFormato` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idformato`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formato`
--

LOCK TABLES `formato` WRITE;
/*!40000 ALTER TABLE `formato` DISABLE KEYS */;
INSERT INTO `formato` VALUES (5,'2D','Formato normal de pelicula '),(6,'3D','Formato con efectos 3D'),(7,'Dig','Formato digital con mejor resolucion');
/*!40000 ALTER TABLE `formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `franquisia`
--

DROP TABLE IF EXISTS `franquisia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `franquisia` (
  `idfranquisia` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFranquisia` varchar(45) DEFAULT NULL,
  `pathImagenFranquisia` varchar(100) DEFAULT NULL,
  `productos_idproductos` int(11) NOT NULL,
  PRIMARY KEY (`idfranquisia`),
  KEY `fk_franquisia_productos1_idx` (`productos_idproductos`),
  CONSTRAINT `fk_franquisia_productos1` FOREIGN KEY (`productos_idproductos`) REFERENCES `productos` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `franquisia`
--

LOCK TABLES `franquisia` WRITE;
/*!40000 ALTER TABLE `franquisia` DISABLE KEYS */;
/*!40000 ALTER TABLE `franquisia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funciones` (
  `idfunciones` int(11) NOT NULL AUTO_INCREMENT,
  `fechaHora` datetime DEFAULT NULL,
  `sala_idsala` int(11) NOT NULL,
  `pelicula_idpelicula` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`idfunciones`),
  KEY `fk_funciones_sala1_idx` (`sala_idsala`),
  KEY `fk_funciones_pelicula1_idx` (`pelicula_idpelicula`),
  CONSTRAINT `fk_funciones_pelicula1` FOREIGN KEY (`pelicula_idpelicula`) REFERENCES `pelicula` (`idpelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funciones_sala1` FOREIGN KEY (`sala_idsala`) REFERENCES `sala` (`idsala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES (1,NULL,1,1,'2017-11-06','11:30:00'),(2,NULL,1,1,'2017-11-10','13:00:00'),(3,NULL,9,1,'2017-11-11','15:00:00'),(4,NULL,10,1,'2017-11-11','17:00:00'),(5,NULL,9,2,'2017-11-11','17:00:00'),(6,NULL,10,2,'2017-11-11','17:00:00');
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `idHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `numeroHabitacion` int(4) NOT NULL,
  `estatusHabitacion` varchar(45) NOT NULL,
  `tipohabitacion_idTipoHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`idHabitacion`,`tipohabitacion_idTipoHabitacion`),
  KEY `fk_habitacion_tipohabitacion1_idx` (`tipohabitacion_idTipoHabitacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historial` (
  `idHistorial` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` int(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  KEY `fk_historial_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura`),
  CONSTRAINT `fk_historial_cuentacontabilidad1` FOREIGN KEY (`cuentacontabilidad_nomenclatura`) REFERENCES `cuentacontabilidad` (`nomenclatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial`
--

LOCK TABLES `historial` WRITE;
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialmoneda`
--

DROP TABLE IF EXISTS `historialmoneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialmoneda` (
  `idHistorial` int(11) NOT NULL,
  `idMoneda` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `moneda_idMoneda` int(11) NOT NULL,
  PRIMARY KEY (`idHistorial`),
  KEY `fk_historialmoneda_moneda1_idx` (`moneda_idMoneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialmoneda`
--

LOCK TABLES `historialmoneda` WRITE;
/*!40000 ALTER TABLE `historialmoneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialmoneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaextra`
--

DROP TABLE IF EXISTS `horaextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horaextra` (
  `idHorasExtra` int(11) NOT NULL,
  `fechaHoras` datetime NOT NULL,
  `cantidadHoras` int(11) DEFAULT NULL,
  `personaAutorizo` varchar(45) DEFAULT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`idHorasExtra`,`fechaHoras`),
  KEY `fk_horaextra_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaextra`
--

LOCK TABLES `horaextra` WRITE;
/*!40000 ALTER TABLE `horaextra` DISABLE KEYS */;
/*!40000 ALTER TABLE `horaextra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `horaEntrada` datetime NOT NULL,
  `horaSalida` datetime NOT NULL,
  `diasDescanso` int(11) NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ideoma`
--

DROP TABLE IF EXISTS `ideoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideoma` (
  `idideoma` int(11) NOT NULL AUTO_INCREMENT,
  `nombreIdeoma` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idideoma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideoma`
--

LOCK TABLES `ideoma` WRITE;
/*!40000 ALTER TABLE `ideoma` DISABLE KEYS */;
INSERT INTO `ideoma` VALUES (1,'Castellano',NULL),(2,'Espaniol',NULL),(3,'Ingles',NULL),(4,'Franses',NULL);
/*!40000 ALTER TABLE `ideoma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `codigoInventario` int(11) NOT NULL,
  `unidadMedida` varchar(45) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `precioCompra` int(11) DEFAULT NULL,
  `precioVenta` int(11) DEFAULT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`codigoInventario`),
  KEY `fk_inventario_productos1_idx` (`productos_idProducto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento`
--

DROP TABLE IF EXISTS `mantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mantenimiento` (
  `idMantenimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMantenimiento` varchar(45) NOT NULL,
  `descripcionMantenimiento` varchar(150) NOT NULL,
  PRIMARY KEY (`idMantenimiento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento`
--

LOCK TABLES `mantenimiento` WRITE;
/*!40000 ALTER TABLE `mantenimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `mantenimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercaderiaenvio`
--

DROP TABLE IF EXISTS `mercaderiaenvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercaderiaenvio` (
  `idmercaderiaEnvio` int(11) NOT NULL AUTO_INCREMENT,
  `pesoMercaderia` int(11) DEFAULT NULL,
  `cantidadProducto` varchar(45) DEFAULT NULL,
  `productos_idProducto` int(11) NOT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `viaje_idViaje` int(11) NOT NULL,
  PRIMARY KEY (`idmercaderiaEnvio`),
  KEY `fk_notaEnvio_productos1_idx` (`productos_idProducto`),
  KEY `fk_mercaderiaEnvio_viaje1_idx` (`viaje_idViaje`),
  CONSTRAINT `fk_mercaderiaEnvio_viaje1` FOREIGN KEY (`viaje_idViaje`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notaEnvio_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercaderiaenvio`
--

LOCK TABLES `mercaderiaenvio` WRITE;
/*!40000 ALTER TABLE `mercaderiaenvio` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercaderiaenvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa` (
  `idMesa` int(11) NOT NULL AUTO_INCREMENT,
  `noMesa` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`idMesa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moneda`
--

DROP TABLE IF EXISTS `moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moneda` (
  `idMoneda` int(11) NOT NULL,
  `moneda` varchar(10) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `cuentabanco_idBanco` int(11) NOT NULL,
  PRIMARY KEY (`idMoneda`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moneda`
--

LOCK TABLES `moneda` WRITE;
/*!40000 ALTER TABLE `moneda` DISABLE KEYS */;
/*!40000 ALTER TABLE `moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientoinventario`
--

DROP TABLE IF EXISTS `movimientoinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientoinventario` (
  `codigoMovimientoInventario` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `TipoMovimientoIventario_idTipoMovimientoIventario` int(11) NOT NULL,
  `bodega_idBodegaOrigen` int(11) NOT NULL,
  `bodega_idBodegaDestino` int(11) NOT NULL,
  PRIMARY KEY (`codigoMovimientoInventario`),
  KEY `fk_movimientoInventario_TipoMovimientoIventario1_idx` (`TipoMovimientoIventario_idTipoMovimientoIventario`),
  KEY `fk_movimientoInventario_bodega1_idx` (`bodega_idBodegaOrigen`),
  KEY `fk_movimientoInventario_bodega2_idx` (`bodega_idBodegaDestino`),
  CONSTRAINT `fk_movimientoInventario_TipoMovimientoIventario1` FOREIGN KEY (`TipoMovimientoIventario_idTipoMovimientoIventario`) REFERENCES `tipomovimientoiventario` (`idTipoMovimientoIventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_bodega1` FOREIGN KEY (`bodega_idBodegaOrigen`) REFERENCES `bodega` (`idBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimientoInventario_bodega2` FOREIGN KEY (`bodega_idBodegaDestino`) REFERENCES `bodega` (`idBodega`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientoinventario`
--

LOCK TABLES `movimientoinventario` WRITE;
/*!40000 ALTER TABLE `movimientoinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientoinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_cliente`
--

DROP TABLE IF EXISTS `movimientos_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_cliente` (
  `Id_mov_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `cod_transaccion` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total_cobro` float DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Transacciones_cod_transacciones` int(11) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `fechaVencimiento` date DEFAULT NULL,
  PRIMARY KEY (`Id_mov_cliente`),
  KEY `fk_Movimientos_cliente_Transacciones1_idx` (`Transacciones_cod_transacciones`),
  KEY `fk_Movimientos_cliente_cliente1_idx` (`cliente_idCliente`),
  CONSTRAINT `fk_Movimientos_cliente_Transacciones1` FOREIGN KEY (`Transacciones_cod_transacciones`) REFERENCES `transacciones` (`cod_transacciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_cliente_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_cliente`
--

LOCK TABLES `movimientos_cliente` WRITE;
/*!40000 ALTER TABLE `movimientos_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_proveedor`
--

DROP TABLE IF EXISTS `movimientos_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_proveedor` (
  `Id_mov_proveedor` int(11) NOT NULL,
  `cod_transaccion` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `total_pago` float DEFAULT NULL,
  `saldo` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Transacciones_cod_transacciones` int(11) NOT NULL,
  `proveedores_idProveedores` int(11) NOT NULL,
  PRIMARY KEY (`Id_mov_proveedor`),
  KEY `fk_Movimientos_proveedor_Transacciones1_idx` (`Transacciones_cod_transacciones`),
  KEY `fk_Movimientos_proveedor_proveedores1_idx` (`proveedores_idProveedores`),
  CONSTRAINT `fk_Movimientos_proveedor_Transacciones1` FOREIGN KEY (`Transacciones_cod_transacciones`) REFERENCES `transacciones` (`cod_transacciones`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movimientos_proveedor_proveedores1` FOREIGN KEY (`proveedores_idProveedores`) REFERENCES `proveedores` (`idProveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_proveedor`
--

LOCK TABLES `movimientos_proveedor` WRITE;
/*!40000 ALTER TABLE `movimientos_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nomina` (
  `idNomina` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEmision` datetime NOT NULL,
  `nombreEmpresa` varchar(55) NOT NULL,
  `periodo_idPeriodo` int(11) NOT NULL,
  `totalDeducido` float NOT NULL,
  `totalPercibidoPagar` float NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idNomina`),
  KEY `fk_nomina_periodo1_idx` (`periodo_idPeriodo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordendecompra`
--

DROP TABLE IF EXISTS `ordendecompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordendecompra` (
  `idordenDeCompra` int(11) NOT NULL AUTO_INCREMENT,
  `funciones_idfunciones` int(11) NOT NULL,
  PRIMARY KEY (`idordenDeCompra`),
  KEY `fk_ordenDeCompra_funciones1_idx` (`funciones_idfunciones`),
  CONSTRAINT `fk_ordenDeCompra_funciones1` FOREIGN KEY (`funciones_idfunciones`) REFERENCES `funciones` (`idfunciones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordendecompra`
--

LOCK TABLES `ordendecompra` WRITE;
/*!40000 ALTER TABLE `ordendecompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordendecompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenedecompra`
--

DROP TABLE IF EXISTS `ordenedecompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordenedecompra` (
  `idOrdenesCompra` int(11) NOT NULL,
  `proveedores_idProveedores` int(11) NOT NULL,
  `productos_idProducto` int(11) NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOrdenesCompra`),
  KEY `fk_ordenedecompra_proveedores1_idx` (`proveedores_idProveedores`),
  KEY `fk_ordenedecompra_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_ordenedecompra_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenedecompra_proveedores1` FOREIGN KEY (`proveedores_idProveedores`) REFERENCES `proveedores` (`idProveedores`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenedecompra`
--

LOCK TABLES `ordenedecompra` WRITE;
/*!40000 ALTER TABLE `ordenedecompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenedecompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partida` (
  `idPartida` varchar(12) NOT NULL,
  `numeroPartida` int(11) NOT NULL,
  `definicionPartida` varchar(300) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idPartida`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(45) DEFAULT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_pedido_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidorestaurante`
--

DROP TABLE IF EXISTS `pedidorestaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidorestaurante` (
  `idPedidoRestaurante` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` date NOT NULL,
  `mesa_idMesa` int(11) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idPedidoRestaurante`,`mesa_idMesa`,`cliente_idCliente`),
  KEY `fk_pedido_mesa1_idx` (`mesa_idMesa`),
  KEY `fk_pedido_cliente1_idx` (`cliente_idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidorestaurante`
--

LOCK TABLES `pedidorestaurante` WRITE;
/*!40000 ALTER TABLE `pedidorestaurante` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidorestaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelicula` (
  `idpelicula` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePelicula` varchar(100) DEFAULT NULL,
  `linkTrailer` varchar(500) DEFAULT NULL,
  `linkImagen` varchar(500) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `subtitulos_idsubtitulos` int(11) NOT NULL,
  `formato_idformato` int(11) NOT NULL,
  `ideoma_idideoma` int(11) NOT NULL,
  `categoria_idcategoria` int(11) NOT NULL,
  `duracion` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`idpelicula`),
  KEY `fk_pelicula_subtitulos1_idx` (`subtitulos_idsubtitulos`),
  KEY `fk_pelicula_formato1_idx` (`formato_idformato`),
  KEY `fk_pelicula_ideoma1_idx` (`ideoma_idideoma`),
  KEY `fk_pelicula_categoria1_idx` (`categoria_idcategoria`),
  CONSTRAINT `fk_pelicula_categoria1` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_formato1` FOREIGN KEY (`formato_idformato`) REFERENCES `formato` (`idformato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_ideoma1` FOREIGN KEY (`ideoma_idideoma`) REFERENCES `ideoma` (`idideoma`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_subtitulos1` FOREIGN KEY (`subtitulos_idsubtitulos`) REFERENCES `subtitulos` (`idsubtitulos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Thor: Ragnarok','https://www.youtube.com/watch?v=ue80QwXMRHg','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/24907/1/1/24907.jpg','Thor está preso al otro lado del universo sin su poderoso martillo y se enfrenta a una carrera contra el tiempo. Su objetivo es volver a Asgard y parar el Ragnarok porque significaría la destrucción de su planeta natal y el fin de la civilización Asgardiana a manos de una todopoderosa y nueva amenaza, la implacable Hela. Pero, primero deberá sobrevivir a una competición letal de gladiadores que lo enfrentará a su aliado y compañero en los Vengadores, ¡el Increíble Hulk!.',5,5,1,8,130),(2,'La Liga de la Justicia','https://www.youtube.com/watch?v=WYPw5oQqaOM','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25594/1/1/25594.jpg','Motivado por la fe que había recuperado en la humanidad e inspirado por la acción altruista de Superman, Bruce Wayne recluta la ayuda de su nueva aliada, Diana Prince, para enfrentarse a un enemigo aún mayor. Juntos, Batman y Wonder Woman se mueven rápidamente para encontrar y reclutar un equipo de metahumanos para combatir esta nueva amenaza. Pero a pesar de la formación de esta liga de héroes sin precedentes – Batman, Wonder Woman, Aquaman, Cyborg y Flash—puede que sea demasiado tarde para salvar el planeta de una amenaza de proporciones catastróficas.',5,5,1,10,170),(6,'Coco','https://www.youtube.com/watch?v=awzWdtCezDo','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/24800/1/1/24800.jpg','Miguel es un joven con el sueño de convertirse en leyenda de la música a pesar de la prohibición de su familia. Su pasión le llevará a adentrarse en la Tierra de los Muertos para conocer su verdadero legado familiar.\n',5,5,1,7,109),(7,'Extraordinario','https://www.youtube.com/watch?v=mB0mXW6hHa8','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25702/1/1/25702.jpg','Auggie Pullman es un niÃ±o que naciÃ³ con una deformidad facial. Ahora, tras diez aÃ±os de hospital en hospital y de largos periodos en su casa, tendrÃ¡ que asistir por primera vez a la escuela. Gracias al apoyo de sus padres, Nate e Isabel, Auggie trata de encajar en el nuevo reto al que se enfrenta.',5,5,2,10,113),(8,'Extraordinario','https://www.youtube.com/watch?v=mB0mXW6hHa8','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25702/1/1/25702.jpg','Auggie Pullman es un niÃ±o que naciÃ³ con una deformidad facial. Ahora, tras diez aÃ±os de hospital en hospital y de largos periodos en su casa, tendrÃ¡ que asistir por primera vez a la escuela. Gracias al apoyo de sus padres, Nate e Isabel, Auggie trata de encajar en el nuevo reto al que se enfrenta.',5,5,2,10,113),(9,'Extraordinario','https://www.youtube.com/watch?v=mB0mXW6hHa8','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25702/1/1/25702.jpg','Auggie Pullman es un niÃ±o que naciÃ³ con una deformidad facial. Ahora, tras diez aÃ±os de hospital en hospital y de largos periodos en su casa, tendrÃ¡ que asistir por primera vez a la escuela. Gracias al apoyo de sus padres, Nate e Isabel, Auggie trata de encajar en el nuevo reto al que se enfrenta.',5,5,2,10,113),(10,'Suburbicon','https://www.youtube.com/watch?v=cBezc1S1BAQ','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25701/1/1/25701.jpg','Verano de 1959. La familia Lodge se muda a Suburbicon, una comunidad residencial pacÃ­fica e idÃ­lica con viviendas asequibles y cÃ©spedes impecables... el lugar perfecto para criar una familia. Pero la aparente tranquilidad esconde una realidad perturbadora. El cabeza de familia de los Lodge, Gardner (Matt Damon) se sumergirÃ¡ en el lado oscuro del pueblo, lleno de traiciÃ³n, engaÃ±os y violencia. Este es un cuento de gente imperfecta que toma muy malas decisiones.',1,6,1,10,105),(11,'La estrella de Belen','https://www.youtube.com/watch?v=B-K-9uTW0uI','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25599/1/1/25599.jpg','En La Estrella de BelÃ©n, de Sony Pictures Animation, un burro pequeÃ±o pero valiente llamado Bo anhela una vida mÃ¡s allÃ¡ de su trabajo diario en el molino de la villa. Un dÃ­a encuentra el valor para liberarse y por fin emprende la aventura de sus sueÃ±os. En su viaje se reÃºne con Ruth, una adorable oveja que perdiÃ³ su rebaÃ±o, y Dave, una paloma con aspiraciones elevadas. Junto con tres graciosos camellos y otros excÃ©ntricos animales de establo, Bo y sus nuevos amigos siguen la Estrella y se convierten en los improbables hÃ©roes de la mÃ¡s grande historia jamÃ¡s contada.',1,5,1,7,98),(12,'Thomas Y Friends EL viaje mas alla de Sodor','https://www.youtube.com/watch?v=LHGxjOdklKY','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25727/1/1/25727.jpg','Decidido a probar su importancia en Sodor, Thomas coge los camiones de James y parte a una gran aventura al Continente. En el camino se hace amigo de los alegres y Ãºtiles \"Motores Experimentales\" pero, despuÃ©s de un mal giro, se pierde perdido en las fÃ¡bricas de acero. AllÃ­, Thomas se encuentra con dos motores misteriosos que instantÃ¡neamente lo hacen sentir bienvenido, pero no todo es lo que parece... DespuÃ©s de que Thomas no vuelva, James se dirige al Continente, pero se encuentra con problemas y depende de Thomas y los Motores Experimentales para salvar el dÃ­a. Ãšnete a Thomas y a sus amigos en esta aventura emocionante al Continente, que nos muestra que la amistad es mÃ¡s importante que ser el motor favorito. Â¿PodrÃ¡ Thomas y los nuevos motores experimentales salvar a James y ayudarlo a traerlo de vuelta a la Isla de Sodor?',1,5,1,7,110),(13,'Geo-Tormenta','https://www.youtube.com/watch?v=APBDcmrUNe0','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25432/1/1/25432.jpg','Butler interpretarÃ¡ a un \"testarudo pero encantador\" diseÃ±ador de satÃ©lites que, tras un fallo en cadena de la mayor parte de los satÃ©lites meteorolÃ³gicos de la Tierra, deberÃ¡ formar equipo con su hermano, con quien hace aÃ±os que no se habla, para viajar al espacio y salvar al planeta de una tormenta artificial de proporciones Ã©picas... todo ello mientras en la superficie del planeta se estÃ¡ gestando un complot para asesinar al presidente de Estados Unidos.',1,6,1,8,109),(14,'Hazlo como hombre','https://www.youtube.com/watch?v=gkxgtPIUuGg','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/24626/1/1/24626.jpg','RaÃºl, Eduardo y Santiago han llevado una feliz y â€œmasculinaâ€ vida desde su infancia, hasta que, un dÃ­a, Santiago les confiesa que es gay. Impactado, RaÃºl, el idiota macho alfa homofÃ³bico, intentarÃ¡ convencer a su amigo de que lo suyo no es mÃ¡s que una simple confusiÃ³n sexual, hasta que, cuando la situaciÃ³n se torna insostenible, RaÃºl dejarÃ¡ de lado sus prejuicios y decidirÃ¡ ayudar a Santiago a incursionar en su nueva vida.',1,5,1,10,109),(15,'Un papa singular','https://www.youtube.com/watch?v=jKBq4PYQUsY','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25698/1/1/25698.jpg','Brad Sloan emprende un viaje a Boston junto a su hijo quiÃ©n estÃ¡ en la bÃºsqueda de una Universidad para continuar sus estudios de mÃºsica. El comienzo de esta nueva etapa en la vida de su hijo desencadena en Brad una crisis de confianza que lo lleva a replantearse sus propias elecciones de vida.',5,5,1,9,109),(16,'60 Minutos para morir','https://www.youtube.com/watch?v=5u9z3RcGKoI','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25704/1/1/25704.jpg','Seis amigos prueban su inteligencia en un cuarto de escape, pero el juego toma un giro oscuro y ahora tienen una hora para resolver los acertijos necesarios para lograr escapar de la habitaciÃ³n con vida.',5,5,1,10,140),(17,'Pokemon: Te elijo a ti!','https://www.youtube.com/watch?v=yz6ISPKdLZ4','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/24743/1/1/24743.jpg','La pelicula PokÃ©mon Â¡te elijo a ti!, es una historia sobre los orÃ­genes del primer encuentro de Ash y Pikachu, asÃ­ como sus aventuras mientras buscan al PokÃ©mon legendario Ho- Oh. Durante su travesÃ­a, el icÃ³nico par se encuentra con caras conocidas y con personajes nuevos, como los Entrenadores VerÃ³nica y Samuel, e incluso se cruza con un nuevo y misterioso PokÃ©mon singular, Marshadow. Esta nueva y original historia sobre los comienzos de una de las mÃ¡s queridas amistades de la cultura popular estÃ¡ repleta de desafÃ­os y Ã©picos combates PokÃ©mon.',5,6,1,8,160),(18,'El pequeÃ±o vampiro','https://www.youtube.com/watch?v=N9eT6WlD7D4','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25359/1/1/25359.jpg','Rudolph es un chico de trece aÃ±os que ademÃ¡s es vampiro. La vida del joven se complica en el momento en el que un prestigioso cazavampiros comienza a perseguirles a Ã©l y al resto de su clan.',5,5,1,7,109),(19,'Los superhÃ©roes','https://www.youtube.com/watch?v=gCHGKLgtaeI','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25669/1/1/25669.jpg','En un parque temÃ¡tico, Sam y sus amigos con sÃºper poderes deben enfrentarse a una aventura disparatada para frenar a un sÃºper villano, Oscar. En el desfile de los enamorados, Sam y sus amigos se encuentran con un ejÃ©rcito de robots controlados por Oscar.',5,5,1,7,140),(20,'Spark: Un mono espacial','https://www.youtube.com/watch?v=ivHPCkKz2wo','http://dsoh5jykc8zh3.cloudfront.net/img/peliculas/25571/1/1/25571.jpg','Un mono decide convertirse en el hÃ©roe de su comunidad al defenderlos de unos extraterrestres invasores.',5,5,1,7,140);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percepciondeduccion`
--

DROP TABLE IF EXISTS `percepciondeduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `percepciondeduccion` (
  `id_PD` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePD` varchar(10) NOT NULL,
  `valorPorcentaje` float DEFAULT NULL,
  `descripcionPD` varchar(128) DEFAULT NULL,
  `flagOperacion` int(11) NOT NULL,
  PRIMARY KEY (`id_PD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percepciondeduccion`
--

LOCK TABLES `percepciondeduccion` WRITE;
/*!40000 ALTER TABLE `percepciondeduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `percepciondeduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePerfil` varchar(45) DEFAULT NULL,
  `descripcionPerfil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodo` (
  `idPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`idPeriodo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piloto` (
  `idpiloto` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `dpi` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpiloto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillo`
--

DROP TABLE IF EXISTS `platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platillo` (
  `idPlatillo` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePlatillo` varchar(45) NOT NULL,
  `descripcionPlatillo` varchar(200) NOT NULL,
  `costoPlatillo` float NOT NULL,
  `receta_idReceta` int(11) NOT NULL,
  PRIMARY KEY (`idPlatillo`),
  KEY `fk_platillo_receta1_idx` (`receta_idReceta`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillo`
--

LOCK TABLES `platillo` WRITE;
/*!40000 ALTER TABLE `platillo` DISABLE KEYS */;
/*!40000 ALTER TABLE `platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polizainventario`
--

DROP TABLE IF EXISTS `polizainventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polizainventario` (
  `codigoPolizaInventario` int(11) NOT NULL AUTO_INCREMENT,
  `periodo` varchar(50) DEFAULT NULL,
  `fechainicial` date DEFAULT NULL,
  `fechafinal` date DEFAULT NULL,
  `concepto` varchar(50) DEFAULT NULL,
  `fechapoliza` date DEFAULT NULL,
  `transaccionesinventario_idTransaccionesInventario` int(11) NOT NULL,
  PRIMARY KEY (`codigoPolizaInventario`),
  KEY `fk_polizainventario_transaccionesinventario1_idx` (`transaccionesinventario_idTransaccionesInventario`),
  CONSTRAINT `fk_polizainventario_transaccionesinventario1` FOREIGN KEY (`transaccionesinventario_idTransaccionesInventario`) REFERENCES `transaccionesinventario` (`idTransaccionesInventario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polizainventario`
--

LOCK TABLES `polizainventario` WRITE;
/*!40000 ALTER TABLE `polizainventario` DISABLE KEYS */;
INSERT INTO `polizainventario` VALUES (100,'1','2017-11-19','2017-11-19','Concepto','2017-11-19',2),(101,'Periodo1','2017-11-11','2017-11-19','concepto vario','2017-11-19',3);
/*!40000 ALTER TABLE `polizainventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porcentajecompra`
--

DROP TABLE IF EXISTS `porcentajecompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `porcentajecompra` (
  `idPorcentaje` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `dato` double DEFAULT NULL,
  PRIMARY KEY (`idPorcentaje`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porcentajecompra`
--

LOCK TABLES `porcentajecompra` WRITE;
/*!40000 ALTER TABLE `porcentajecompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `porcentajecompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL,
  `nombreProveedor` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `representante` varchar(45) DEFAULT NULL,
  `nit_proveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProveedores`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `idPuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePuesto` varchar(55) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `departamentoIdDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idPuesto`),
  KEY `fk_puesto_departamento1_idx` (`departamentoIdDepartamento`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta` (
  `idReceta` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Procedimiento` longtext,
  `tiempoPreparacion` varchar(12) DEFAULT NULL,
  `numeroPersonas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReceta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroigss`
--

DROP TABLE IF EXISTS `registroigss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registroigss` (
  `noCarnetIgss` int(11) NOT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`noCarnetIgss`),
  KEY `fk_registroigss_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroigss`
--

LOCK TABLES `registroigss` WRITE;
/*!40000 ALTER TABLE `registroigss` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroigss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registroirtra`
--

DROP TABLE IF EXISTS `registroirtra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registroirtra` (
  `carneIrtra` int(11) NOT NULL AUTO_INCREMENT,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`carneIrtra`),
  KEY `fk_registroirtra_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registroirtra`
--

LOCK TABLES `registroirtra` WRITE;
/*!40000 ALTER TABLE `registroirtra` DISABLE KEYS */;
/*!40000 ALTER TABLE `registroirtra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporte` (
  `id_reporte` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_reporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporteador`
--

DROP TABLE IF EXISTS `reporteador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporteador` (
  `idReporte` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `path` varchar(45) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idReporte`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporteador`
--

LOCK TABLES `reporteador` WRITE;
/*!40000 ALTER TABLE `reporteador` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporteador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservacion` (
  `idReservacion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicioReservacion` date NOT NULL,
  `fechaFinalReservacion` date NOT NULL,
  `costoReservacion` float NOT NULL,
  `estadoReserva` varchar(45) NOT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idReservacion`,`cliente_idCliente`),
  KEY `fk_reservacion_cliente1_idx` (`cliente_idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion`
--

LOCK TABLES `reservacion` WRITE;
/*!40000 ALTER TABLE `reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `nombreServicio` varchar(50) NOT NULL,
  `costo_servicio` float NOT NULL,
  `descripcionServicio` varchar(150) DEFAULT NULL,
  `tipohabitacion_idTipoHabitacion` int(11) NOT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `fk_servicio_tipohabitacion1_idx` (`tipohabitacion_idTipoHabitacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspension`
--

DROP TABLE IF EXISTS `suspension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suspension` (
  `idregistroSuspension` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicioSuspencion` datetime DEFAULT NULL,
  `fechaCulminacionSuspension` datetime DEFAULT NULL,
  `motivoSuspension` varchar(45) DEFAULT NULL,
  `cantidadDiasSuspension` int(11) DEFAULT NULL,
  `autorizo` varchar(45) DEFAULT NULL,
  `estadoSus` int(11) DEFAULT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`idregistroSuspension`),
  KEY `fk_suspension_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspension`
--

LOCK TABLES `suspension` WRITE;
/*!40000 ALTER TABLE `suspension` DISABLE KEYS */;
/*!40000 ALTER TABLE `suspension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodepreciacion`
--

DROP TABLE IF EXISTS `tipodepreciacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodepreciacion` (
  `idTipoDepreciacion` int(11) NOT NULL,
  `descripcion` varchar(75) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`idTipoDepreciacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodepreciacion`
--

LOCK TABLES `tipodepreciacion` WRITE;
/*!40000 ALTER TABLE `tipodepreciacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipodepreciacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipohabitacion`
--

DROP TABLE IF EXISTS `tipohabitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipohabitacion` (
  `idTipoHabitacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoHabitacion` varchar(50) NOT NULL,
  `costoTipoHabitacion` float NOT NULL,
  `capacidadTipoHabitacion` int(11) NOT NULL,
  `descripcionTipoHabitacion` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idTipoHabitacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipohabitacion`
--

LOCK TABLES `tipohabitacion` WRITE;
/*!40000 ALTER TABLE `tipohabitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipohabitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipohuesped`
--

DROP TABLE IF EXISTS `tipohuesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipohuesped` (
  `idTipoHuesped` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipoHuesped`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipohuesped`
--

LOCK TABLES `tipohuesped` WRITE;
/*!40000 ALTER TABLE `tipohuesped` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipohuesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomedida`
--

DROP TABLE IF EXISTS `tipomedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomedida` (
  `idTipoMedida` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomedida`
--

LOCK TABLES `tipomedida` WRITE;
/*!40000 ALTER TABLE `tipomedida` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipomovimientoiventario`
--

DROP TABLE IF EXISTS `tipomovimientoiventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipomovimientoiventario` (
  `idTipoMovimientoIventario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipoMovimiento` varchar(45) DEFAULT NULL,
  `Ingresoosalida` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTipoMovimientoIventario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipomovimientoiventario`
--

LOCK TABLES `tipomovimientoiventario` WRITE;
/*!40000 ALTER TABLE `tipomovimientoiventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipomovimientoiventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopago`
--

DROP TABLE IF EXISTS `tipopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipopago` (
  `idTipoPago` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTipoPago`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopago`
--

LOCK TABLES `tipopago` WRITE;
/*!40000 ALTER TABLE `tipopago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoproducto` (
  `idTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotransaccion`
--

DROP TABLE IF EXISTS `tipotransaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipotransaccion` (
  `idTipoTransaccion` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idTipoTransaccion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotransaccion`
--

LOCK TABLES `tipotransaccion` WRITE;
/*!40000 ALTER TABLE `tipotransaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipotransaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `noTransaccion` int(11) NOT NULL,
  `valor` float DEFAULT NULL,
  `idCuenta` int(11) DEFAULT NULL,
  `banco_idBanco` int(11) NOT NULL,
  `cuentabanco_idBanco` int(11) NOT NULL,
  `tipopago_idTipoPago` int(11) NOT NULL,
  `Conciliacion_CorrConciliacion` int(11) NOT NULL,
  PRIMARY KEY (`noTransaccion`),
  KEY `fk_transaccion_banco1_idx` (`banco_idBanco`),
  KEY `fk_transaccion_tipopago1_idx` (`tipopago_idTipoPago`),
  KEY `fk_transaccion_Conciliacion1_idx` (`Conciliacion_CorrConciliacion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacciones` (
  `cod_transacciones` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `cod_cuenta` int(11) DEFAULT NULL,
  `accion` varchar(45) DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` int(11) NOT NULL,
  PRIMARY KEY (`cod_transacciones`),
  KEY `fk_Transacciones_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura`),
  CONSTRAINT `fk_Transacciones_cuentacontabilidad1` FOREIGN KEY (`cuentacontabilidad_nomenclatura`) REFERENCES `cuentacontabilidad` (`nomenclatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccionesinventario`
--

DROP TABLE IF EXISTS `transaccionesinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccionesinventario` (
  `idTransaccionesInventario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `efecto` varchar(45) DEFAULT NULL,
  `estatus` varchar(45) DEFAULT NULL,
  `fechaTransaccion` date DEFAULT NULL,
  `cuentacontabilidad_nomenclatura` int(11) NOT NULL,
  PRIMARY KEY (`idTransaccionesInventario`),
  KEY `fk_transaccionesinventario_cuentacontabilidad1_idx` (`cuentacontabilidad_nomenclatura`),
  CONSTRAINT `fk_transaccionesinventario_cuentacontabilidad1` FOREIGN KEY (`cuentacontabilidad_nomenclatura`) REFERENCES `cuentacontabilidad` (`nomenclatura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccionesinventario`
--

LOCK TABLES `transaccionesinventario` WRITE;
/*!40000 ALTER TABLE `transaccionesinventario` DISABLE KEYS */;
INSERT INTO `transaccionesinventario` VALUES (1,'Prueba1','Debe','Activo','2017-11-08',2),(2,'Prueba2','Debe','Activo','2017-11-01',2),(3,'Prueba3','Debe','Activo','2017-11-02',2),(4,'Prueba4','Debe','Pasivo','2017-11-08',2),(5,'Prueba5','Debe','Activo','2017-11-19',1);
/*!40000 ALTER TABLE `transaccionesinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trasladobodega`
--

DROP TABLE IF EXISTS `trasladobodega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trasladobodega` (
  `idTraslado` int(11) NOT NULL AUTO_INCREMENT,
  `bodegaEntra` varchar(45) DEFAULT NULL,
  `bodegaSale` varchar(45) DEFAULT NULL,
  `productos_idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idTraslado`),
  KEY `fk_trasladobodega_productos1_idx` (`productos_idProducto`),
  CONSTRAINT `fk_trasladobodega_productos1` FOREIGN KEY (`productos_idProducto`) REFERENCES `productos` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trasladobodega`
--

LOCK TABLES `trasladobodega` WRITE;
/*!40000 ALTER TABLE `trasladobodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `trasladobodega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `apellidoUsuario` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `correoUsuario` varchar(45) DEFAULT NULL,
  `telefonoUsuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacaciones`
--

DROP TABLE IF EXISTS `vacaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacaciones` (
  `idVacaciones` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicioVacaciones` datetime DEFAULT NULL,
  `fechaCulminacionVacaciones` datetime DEFAULT NULL,
  `mesSolicitado` int(11) DEFAULT NULL,
  `cantidadDiasHabiles` int(11) DEFAULT NULL,
  `estadoVacaciones` int(11) DEFAULT NULL,
  `encargadoAutorizacion` varchar(45) DEFAULT NULL,
  `contrato_idContrato` int(10) NOT NULL,
  PRIMARY KEY (`idVacaciones`),
  KEY `fk_vacaciones_contrato1_idx` (`contrato_idContrato`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacaciones`
--

LOCK TABLES `vacaciones` WRITE;
/*!40000 ALTER TABLE `vacaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehiculo` (
  `idVehiculo` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `capacidad` varchar(45) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viaje` (
  `idViaje` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPrevistaOperacion` varchar(45) DEFAULT NULL,
  `observaciones` varchar(45) DEFAULT NULL,
  `vehiculo_idVehiculo` int(11) NOT NULL,
  `bodegaProcedencia` varchar(45) DEFAULT NULL,
  `bodegaDestino` varchar(45) DEFAULT NULL,
  `piloto_idpiloto` int(11) NOT NULL,
  PRIMARY KEY (`idViaje`),
  KEY `fk_viaje_vehiculo1_idx` (`vehiculo_idVehiculo`),
  KEY `fk_viaje_piloto1_idx` (`piloto_idpiloto`),
  CONSTRAINT `fk_viaje_piloto1` FOREIGN KEY (`piloto_idpiloto`) REFERENCES `piloto` (`idpiloto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaje_vehiculo1` FOREIGN KEY (`vehiculo_idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-30 10:47:06
