CREATE DATABASE  IF NOT EXISTS `proy_cuidate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proy_cuidate`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proy_cuidate
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `codigo_cat` varchar(15) NOT NULL,
  `nombre_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('1101','CUIDADO DEL CABELLO'),('1102','CUIDADO DE LA PIEL'),('1103','CIUDAD BUCAL'),('1104','HIGIENE PERSONAL');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `codigo_ciu` varchar(15) NOT NULL,
  `nombre_ciu` varchar(30) NOT NULL,
  `codigo_dep` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_ciu`),
  KEY `Departamento_codigo_dep_fk` (`codigo_dep`),
  CONSTRAINT `Departamento_codigo_dep_fk` FOREIGN KEY (`codigo_dep`) REFERENCES `departamento` (`codigo_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('10','BOGOTÁ','1'),('20','MEDELLIN','3'),('30','BUCARAMANGA','5'),('40','CALI','4');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo_clien` varchar(15) NOT NULL,
  `nombre_clien` varchar(50) NOT NULL,
  `email_clien` varchar(50) NOT NULL,
  `genero_clien` varchar(1) NOT NULL,
  `fecha_nac` date NOT NULL,
  PRIMARY KEY (`codigo_clien`),
  CONSTRAINT `Cliente_genero_clien_ck` CHECK (((`genero_clien` = _utf8mb4'M') or (`genero_clien` = _utf8mb4'F') or (`genero_clien` = _utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('201010','Julieth Andrea Murte Tavera','jamt1507@gmail.com','F','1994-07-15'),('201011','Carmen Zoraida Rozo Rojas','carmen_rozo@gmail.com','F','1990-02-23'),('201012','Sebastian Bedoya Castaño','sebastian_castano@gmail.com','M','2000-07-03'),('201013','Cristian David Ramirez','cristian_ramirez@gmail.com','M','1994-06-06'),('201014','Luisa Fernanda Palacios','luisa_palacios@gmail.com','F','1994-01-01'),('201015','David Santiago Beltran Galeano','david_beltran@gmail.com','M','1985-03-20'),('201016','Pablo Rodriguez','pablo_rodriguez@gmail.com','N','1967-09-27');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `codigo_dep` varchar(15) NOT NULL,
  `nombre_dep` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo_dep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('1','CUNDINAMARCA'),('2','BOYACÁ'),('3','ANTIOQUIA'),('4','VALLE DEL CAUCA'),('5','SANTANDER');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `codigo_pag` varchar(15) NOT NULL,
  `codigo_clien` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_pag`),
  KEY `Cliente_codigo_clien_fk` (`codigo_clien`),
  CONSTRAINT `Cliente_codigo_clien_fk` FOREIGN KEY (`codigo_clien`) REFERENCES `cliente` (`codigo_clien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES ('REF03082022','201010');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `codigo_prod` varchar(15) NOT NULL,
  `nombre_prod` varchar(5000) NOT NULL,
  `descrip_prod` varchar(5000) NOT NULL,
  `cantidad_prod` double DEFAULT NULL,
  `precio_prod` double DEFAULT NULL,
  `codigo_prov` varchar(15) NOT NULL,
  `codigo_scat` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_prod`),
  KEY `Proveedor_codigo_cat_fk` (`codigo_prov`),
  KEY `Sub_categoria_codigo_scat_fk` (`codigo_scat`),
  CONSTRAINT `Proveedor_codigo_cat_fk` FOREIGN KEY (`codigo_prov`) REFERENCES `proveedor` (`codigo_prov`),
  CONSTRAINT `Sub_categoria_codigo_scat_fk` FOREIGN KEY (`codigo_scat`) REFERENCES `sub_categoria` (`codigo_scat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('2021005003','Protector Solar Nude Spf 50 Crema Facial con Color x50ml','Primer perfeccionador Facial con color SPF 50 con filtros UVA y UVB. Hidrata, suaviza y calma la piel: Humecta la piel mientras la protege.',50,36900,'80001004','110201'),('2021006003','Crema NIVEA Milk Nutritiva Corporal Hydra IQ x1000Ml','Tiene una combinación única de hidratantes que existen de forma natural en la piel. Con su cremosa fórmula, la piel extra seca queda protegida de la deshidratación, ya que se reduce la pérdida de agua y aumenta su nivel de humectación. Una piel profundamente hidratada es una piel suave y linda por más tiempo, ahora por 48hs con Nivea Milk Nutritiva. Después de 2 semanas de uso regular. Comparado con la fórmula anterior.',15,41800,'80001004','110202'),('2021007003','CREMA NIVEA CORPORAL REAFIRMANTE Q10 PLUS X1000ML','Crema Corporal Reafirmante Q10 Nivea, ideal para humectar y reafirmar tu piel. Fórmula con Q10 y Vitamina C, perfectos para una piel más firme y con mejor elasticidad. Absorción rápida sin sensación grasosa. Piel más firme y lisa después de 10 días de uso.',15,52500,'80001004','110202'),('2022001003','Shampoo Loreal Elvive Hidra Hialurónico x370ml','Shampoo Hidra Rellenador, con Ácido Hialurónico y con efecto Anti-Sal°. Recarga la fibra con una hidratación intensa hasta por 72 horas en un sólo uso. Cabello intensamente hidratado y limpio por más tiempo. Cabello suave, ligero y brillante. 100% Botella Reciclada.',100,22500,'80001002','110101'),('2022002003','Shampoo Capilar Tío Nacho Engrosador 415 ML','ENGROSADOR Aumenta el diámetro de cada cabello dando una apariencia de hasta 33,000 cabellos más.Para mejores resultados, usa la línea completa Shampoo + Acondicionador + Tratamiento.',10,28500,'80001003','110101'),('2022002004','ACONDICIONADOR PANTENE 3 MINUTE MIRACLE RESTAURACION X170ML','El nuevo acondicionador diario 3 Minute Miracle brinda suavidad y brillo superior al cabello***. Reforzado con el poder de una ampolla, repara el daño extremo en 3 minutos, dejando el cabello con libertad de movimiento y volumen durante mayor tiempo***. El acondicionador diario 3 Minute Miracle tiene hasta un 100 %* más de ingredientes acondicionadores que los acondicionadores tradicionales Pantene',100,22500,'80001006','110102'),('2022003004','Acondicionador Loreal Elvive Hidra Hialurónico x370ml','Acondicionador Hidra Rellenador, con Ácido Hialurónico y sin sal. Recarga la fibra con una hidratación intensa hasta por 72 horas en un sólo uso. Cabello intensamente hidratado y limpio por más tiempo. Cabello suave, ligero y brillante. 100% Botella Reciclada.',150,20750,'80001002','110102'),('2023006003','Jabón Liquido Dove Body Karite X650ml','',200,31850,'80001005','110401'),('2023007003','JABÓN DOVE BEAUTY HUMECTANTE X90G. X3UND.','',5000,15300,'80001005','110401'),('2025001001','Desodorante Antitranspirante Barra Crema Mujer Rexona Clinical Classic x48G','Desodorante rexona women clinical x48g.',2000,22350,'80001003','110402');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `codigo_prov` varchar(15) NOT NULL,
  `nombre_prov` varchar(50) NOT NULL,
  `direccion_prov` varchar(150) NOT NULL,
  `telefono_prov` varchar(10) NOT NULL,
  `codigo_ciu` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_prov`),
  KEY `Ciudad_codigo_ciu_fk` (`codigo_ciu`),
  CONSTRAINT `Ciudad_codigo_ciu_fk` FOREIGN KEY (`codigo_ciu`) REFERENCES `ciudad` (`codigo_ciu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('80001002','L Oreal Colombia S A S','CALLE 90 11 13','6016511300','10'),('80001003','Genomma Lab Colombia Ltda','CARRERA 9 115 30 OF 502','6017468989','10'),('80001004','NUDE','Transversal 60 ) # 100 – 33','6015333800','30'),('80001005','DOVE','CALLE 90 11 13','6016511300','10'),('80001006','PANTENE','Cl. 106 # 57 - 23','6014926363','20');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categoria`
--

DROP TABLE IF EXISTS `sub_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_categoria` (
  `codigo_scat` varchar(15) NOT NULL,
  `nombre_scat` varchar(50) NOT NULL,
  `codigo_cat` varchar(15) NOT NULL,
  PRIMARY KEY (`codigo_scat`),
  KEY `Categoria_codigo_cat_fk` (`codigo_cat`),
  CONSTRAINT `Categoria_codigo_cat_fk` FOREIGN KEY (`codigo_cat`) REFERENCES `categoria` (`codigo_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categoria`
--

LOCK TABLES `sub_categoria` WRITE;
/*!40000 ALTER TABLE `sub_categoria` DISABLE KEYS */;
INSERT INTO `sub_categoria` VALUES ('110101','SHAMPOO','1101'),('110102','ACONDICIONADOR','1101'),('110201','CIUDADO SOLAR','1102'),('110202','CIUDADO CORPORAL','1102'),('110401','JABONES','1104'),('110402','DESODORANTES','1104');
/*!40000 ALTER TABLE `sub_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `codigo_venta` varchar(15) NOT NULL,
  `codigo_clien` varchar(15) NOT NULL,
  `fecha_venta` date NOT NULL,
  `codigo_prod` varchar(15) NOT NULL,
  `cantidad_venta` double DEFAULT NULL,
  PRIMARY KEY (`codigo_venta`),
  KEY `Producto_codigo_prod_fk` (`codigo_prod`),
  KEY `ClienteV_codigo_clien_fk` (`codigo_clien`),
  CONSTRAINT `ClienteV_codigo_clien_fk` FOREIGN KEY (`codigo_clien`) REFERENCES `cliente` (`codigo_clien`),
  CONSTRAINT `Producto_codigo_prod_fk` FOREIGN KEY (`codigo_prod`) REFERENCES `producto` (`codigo_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES ('FAC1','201010','2022-08-02','2022001003',1);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proy_cuidate'
--

--
-- Dumping routines for database 'proy_cuidate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 23:59:40
