-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: dentalsmile_bdv2
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
-- Table structure for table `administrador_tbl`
--

DROP TABLE IF EXISTS `administrador_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador_tbl` (
  `id_administrador` int NOT NULL,
  `pass_admin` blob NOT NULL,
  `date_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_administrador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador_tbl`
--

LOCK TABLES `administrador_tbl` WRITE;
/*!40000 ALTER TABLE `administrador_tbl` DISABLE KEYS */;
INSERT INTO `administrador_tbl` VALUES (1,_binary '\�{�O1L)\�l���\�<JlS\�A(c�\�ֆ�','2023-06-18 06:29:09','2023-06-19 07:23:12');
/*!40000 ALTER TABLE `administrador_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedente_tbl`
--

DROP TABLE IF EXISTS `antecedente_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `antecedente_tbl` (
  `id_antecedente` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `tip_antecedente` enum('Alergia antibiótica','Alergia anestesia','Hemorragia','VIH/sida','Tuberculosis','Asma','Diabetes','Hipertensión','Enfermedad Cardiaca','Otro') NOT NULL,
  `par_antecedente` varchar(50) DEFAULT NULL,
  `des_antecedente` tinytext,
  PRIMARY KEY (`id_antecedente`),
  KEY `fkn_paciente_antecedente_idx` (`id_paciente`),
  CONSTRAINT `fk_paciente_antecedente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente_tbl` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedente_tbl`
--

LOCK TABLES `antecedente_tbl` WRITE;
/*!40000 ALTER TABLE `antecedente_tbl` DISABLE KEYS */;
INSERT INTO `antecedente_tbl` VALUES (1,1,'Alergia antibiótica',NULL,'Alergia a la amoxicilina'),(2,1,'Alergia anestesia',NULL,' actual Alergia a la anestesia'),(4,1,'Hipertensión','Abuela','Problema en el corazon'),(5,3,'Alergia antibiótica',NULL,'Alergia a la amoxicilina'),(6,3,'Diabetes','Tia','actualizado Diabetes tipo 3'),(30,222,'Asma',NULL,''),(31,222,'Diabetes','Mamá','');
/*!40000 ALTER TABLE `antecedente_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citaagendada_tbl`
--

DROP TABLE IF EXISTS `citaagendada_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citaagendada_tbl` (
  `fecha_citaAgen` date NOT NULL,
  `horaIni_citaAgen` time NOT NULL,
  `horaFin_citaAgen` time NOT NULL,
  `id_paciente` int NOT NULL,
  `moti_citaAgen` text,
  `esta_citaAgen` enum('Pendiente','Atendida','Perdida') NOT NULL,
  `id_consulta_tratam` int DEFAULT NULL,
  PRIMARY KEY (`fecha_citaAgen`,`horaIni_citaAgen`),
  KEY `fkn_citasAgendadas_pacien_idx` (`id_paciente`) /*!80000 INVISIBLE */,
  CONSTRAINT `fkn_citasAgendadas_pacien` FOREIGN KEY (`id_paciente`) REFERENCES `paciente_tbl` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citaagendada_tbl`
--

LOCK TABLES `citaagendada_tbl` WRITE;
/*!40000 ALTER TABLE `citaagendada_tbl` DISABLE KEYS */;
INSERT INTO `citaagendada_tbl` VALUES ('2023-01-10','14:30:00','15:30:00',2,'Diente flojo','Perdida',NULL),('2023-02-13','08:30:00','10:00:00',2,'Op dental','Perdida',NULL),('2023-02-13','16:30:00','18:00:00',2,'Op dental','Perdida',NULL),('2023-02-14','16:30:00','18:00:00',2,'cita de mañana','Perdida',NULL),('2023-02-17','08:30:00','10:00:00',2,'Op dental v2','Perdida',NULL),('2023-02-28','08:30:00','10:30:00',8,'Limpieza','Perdida',NULL),('2023-05-20','11:00:00','11:15:00',1,'actualizacion consulta','Perdida',NULL),('2023-05-20','15:00:00','16:00:00',222,'Primera cita de valeria ACT','Perdida',NULL),('2023-05-20','18:00:00','19:25:00',222,'cita de Valeria actualizada','Perdida',NULL),('2023-05-26','07:30:00','09:30:00',6,'Limpieza dental de los viernes v2','Perdida',NULL),('2023-05-26','10:00:00','13:00:00',1,'Limpieza','Perdida',NULL),('2023-05-26','15:45:00','17:15:00',222,'Arreglo de brackets','Perdida',NULL),('2023-05-27','14:30:00','15:50:00',1,'Cita de forty','Perdida',NULL),('2023-05-28','07:45:00','09:45:00',2,'rferf','Perdida',NULL),('2023-05-28','12:45:00','14:45:00',2,'Diente flojo cita 2','Perdida',NULL),('2023-05-28','15:45:00','17:15:00',7,'v3 Limpieza de rutina','Perdida',NULL),('2023-06-02','08:15:00','09:15:00',222,' Limpieza Dental','Perdida',NULL),('2023-06-02','14:00:00','16:15:00',222,'dewdwede','Perdida',NULL),('2023-06-04','08:00:00','09:31:00',222,'dwdwdwd','Perdida',NULL),('2023-06-17','08:15:00','10:15:00',2,'Limpieza','Perdida',NULL),('2023-06-17','11:15:00','14:15:00',7,'Colocacion de brackets','Perdida',NULL),('2023-07-04','09:00:00','13:00:00',222,'Cita de valeria actualizada ','Pendiente',NULL),('2023-08-09','07:15:00','08:15:00',222,'cita de Agosto','Pendiente',NULL),('2023-08-09','08:45:00','09:45:00',222,'segunda cita de agosto','Pendiente',NULL),('2023-09-07','10:30:00','13:15:00',222,'septiembre cita','Pendiente',NULL),('2023-12-12','08:30:00','10:30:00',7,'Dolor de muela en el lateral derecho \ndesde hace 3 días, dificultad para masticar a causa del dolor','Pendiente',NULL),('2024-01-20','18:32:00','19:59:00',222,'aaaaaaaaaaaaaaaaaa','Pendiente',NULL),('2024-06-13','07:30:00','09:30:00',222,'cita de Prueba','Pendiente',NULL);
/*!40000 ALTER TABLE `citaagendada_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complicaciones_tbl`
--

DROP TABLE IF EXISTS `complicaciones_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complicaciones_tbl` (
  `id_compli` int NOT NULL AUTO_INCREMENT,
  `id_tratam` int NOT NULL,
  `txt_compli` text NOT NULL,
  PRIMARY KEY (`id_compli`),
  KEY `fk_tratamiento_complicaciones_idx` (`id_tratam`),
  CONSTRAINT `fk_tratamiento_complicaciones` FOREIGN KEY (`id_tratam`) REFERENCES `tratamiento_tbl` (`id_tratam`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complicaciones_tbl`
--

LOCK TABLES `complicaciones_tbl` WRITE;
/*!40000 ALTER TABLE `complicaciones_tbl` DISABLE KEYS */;
INSERT INTO `complicaciones_tbl` VALUES (2,1,'Dolor al masticar'),(8,8,'Complicacion tratamiento Amelia 1'),(9,8,'Complicacion tratamiento Amelia 2'),(10,8,'Complicacion tratamiento Amelia 3'),(11,8,'Complicacion tratamiento Amelia 4'),(243,69,'comp1'),(247,69,'comp2'),(248,69,'comp3'),(251,79,'AAAA'),(252,79,'BBBB'),(253,79,'CCCC'),(254,82,'AAAAA'),(255,82,'VBBBBBB'),(256,83,'Comp1'),(257,83,'Comp2');
/*!40000 ALTER TABLE `complicaciones_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta_tbl`
--

DROP TABLE IF EXISTS `consulta_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta_tbl` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `id_paciente` int NOT NULL,
  `mot_consulta` text NOT NULL,
  `probleAct_consulta` text,
  `fecha_consulta` date NOT NULL,
  `hora_consulta` time NOT NULL,
  `id_tipoConsul` int NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `fkn_consulta_paciente_idx` (`id_paciente`),
  KEY `fk_tipoConsulta_idx` (`id_tipoConsul`),
  FULLTEXT KEY `full_index_motivo` (`mot_consulta`),
  FULLTEXT KEY `full_index_proble` (`probleAct_consulta`),
  CONSTRAINT `fk_tipoConsulta` FOREIGN KEY (`id_tipoConsul`) REFERENCES `tipoconsulta_tbl` (`id_tipoConsul`),
  CONSTRAINT `fkn_consulta_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente_tbl` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_tbl`
--

LOCK TABLES `consulta_tbl` WRITE;
/*!40000 ALTER TABLE `consulta_tbl` DISABLE KEYS */;
INSERT INTO `consulta_tbl` VALUES (2,3,'Extraccion dientes de leche','OD 2 listo para remover','2023-02-14','13:00:00',4),(3,5,'Dolor dolor 3','caries en op.32','2023-02-14','13:00:00',3),(4,2,'Dolor dolor','caries en op.32','2023-02-14','13:00:00',3),(5,1,'Dolor de muela','Pieza dental #43 rota parcialmente, posiblemente por caries','2023-02-14','10:00:00',4),(6,1,'Dolor de muela en el lateral derecho desde hace 3 días, dificultad para masticar a causa del dolor','Pieza dental #45 rota parcialmente, posiblemente por caries','2023-02-14','10:00:00',4),(7,1,'Arreglo de brackets','Arreglo de brackets','2023-02-14','11:00:00',2),(8,5,'Extracción dientes de leche','Diente de leche','2023-02-14','13:00:00',4),(9,5,'cita Marzo 01','Diente de leche','2023-03-14','13:00:00',4),(10,5,'cita Marzo 02','Diente de leche','2023-03-17','13:00:00',4),(11,5,'cita Marzo 033','Diente de leche','2023-03-27','13:00:00',4),(12,5,'cita Marzo 04','Diente de leche','2023-03-30','13:00:00',4),(13,5,'cita Abril 01','Diente de leche','2023-04-05','13:00:00',4),(14,5,'cita Abril 02','Diente de leche','2023-04-06','13:00:00',4),(15,5,'cita Abril 03','Diente de leche','2023-04-16','13:00:00',4),(23,5,'cita ahora now','que te valga vrg','2023-02-22','16:00:00',4),(24,5,'cita esta semana now','que te valga vrg','2023-02-25','16:00:00',4),(41,8,'xxxxxxxxxxxxxxxxxxxxxxxxxx','ccccccccccccccccccccccccc','2023-06-01','17:10:00',1),(44,222,'La actividad diaria en una clínica dental suele ser muy intensa. Los pacientes van siendo atendidos y van pasando a gabinete continuamente. Mucha gente entra y sale de la clínica al cabo de la jornada. En infinidad de ocasiones el día a día nos consume y no nos paramos a analiza','Muela podrida Muela podrida Muela podrida En infinidad de ocasiones el día a día nos consume y no nos paramos a analizar algunos indicadores que nos están advirtiendo de que algo no va bien.','2023-06-03','14:05:00',1),(45,6,'Cambio de ligas de brackets','','2023-06-05','11:00:00',17),(46,6,'34r34r3r','34r34r34r','2023-06-05','11:07:00',1),(47,222,'nueva cita agregada para Junio 15 ','dscscsc','2023-06-15','14:30:00',3),(55,1,'arreglar brackets','','2023-06-10','18:29:00',17),(56,6,'eeeeeeeeeee','','2023-06-10','18:44:00',4),(57,264,'Primera cita de JC Forty','','2023-06-12','09:00:00',3),(58,6,'aaaaaaaaa','QQQQQQ','2023-06-11','00:02:00',2),(59,5,'Extracción de pieza dental','Extracción de pieza dental','2023-06-12','09:00:00',4),(60,4,'Primera consulta','','2023-06-13','00:20:00',3),(61,6,'AAAAAAAAA','VVVVVVVVVVV','2023-06-14','10:00:00',4),(62,1,'Chequeo trimestral ','','2023-06-16','14:50:00',1);
/*!40000 ALTER TABLE `consulta_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostico_tbl`
--

DROP TABLE IF EXISTS `diagnostico_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostico_tbl` (
  `id_diag` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `tipo_diag` enum('Definitivo','Presuntivo') NOT NULL,
  `codigoCIE` char(4) DEFAULT NULL,
  `desc_diag` text,
  PRIMARY KEY (`id_diag`),
  KEY `fk_diagnostico_idx` (`id_consulta`),
  KEY `fk_codigoCIE_diagnostico_idx` (`codigoCIE`),
  CONSTRAINT `fk_codigoCIE_diagnostico` FOREIGN KEY (`codigoCIE`) REFERENCES `enfermedades_cie.10` (`codigoCIE`),
  CONSTRAINT `fk_diagnostico` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostico_tbl`
--

LOCK TABLES `diagnostico_tbl` WRITE;
/*!40000 ALTER TABLE `diagnostico_tbl` DISABLE KEYS */;
INSERT INTO `diagnostico_tbl` VALUES (2,8,'Definitivo','K031','K031 ABRASION DE LOS DIENTES K031 ABRASION DE LOS DIENTES K031 ABRASION DE LOS DIENTESK031 ABRASION DE LOS DIENTES'),(3,8,'Definitivo','K021','K021 CARIES DE LA DENTINA K021 CARIES DE LA DENTINA K021 CARIES DE LA DENTINA K021 CARIES DE LA DENTINA'),(4,3,'Definitivo','K021',NULL),(5,3,'Definitivo','K021',NULL),(6,8,'Presuntivo','K118','DESC DESC DESC DESC DESC DESC DESC DESC'),(9,23,'Presuntivo','K003','AAAAAAAAAAAAAAA'),(10,23,'Definitivo','K102','BBBBBBBBBBBBBBBB'),(14,56,'Definitivo','B002','rrrrrrrrrr'),(22,59,'Definitivo','K021',NULL),(23,57,'Definitivo','B084','AAAAAAAAAAA'),(24,58,'Presuntivo','K021','AAAAAAAA');
/*!40000 ALTER TABLE `diagnostico_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades_cie.10`
--

DROP TABLE IF EXISTS `enfermedades_cie.10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermedades_cie.10` (
  `codigoCIE` char(4) NOT NULL,
  `nombre_enfermedad` varchar(400) NOT NULL,
  PRIMARY KEY (`codigoCIE`),
  FULLTEXT KEY `fullindex_enfermedad` (`nombre_enfermedad`,`codigoCIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades_cie.10`
--

LOCK TABLES `enfermedades_cie.10` WRITE;
/*!40000 ALTER TABLE `enfermedades_cie.10` DISABLE KEYS */;
INSERT INTO `enfermedades_cie.10` VALUES ('A422',' ACTINOMICOSIS CERVICOFACIAL'),('B002',' GINGIVOESTOMATITIS Y FARINGOAMIGDALITIS HERPETICA'),('B009',' INFECCION DEBIDA A EL VIRUS DEL HERPES, NO ESPECIFICADA'),('B084',' ESTOMATITIS VESICULAR ENTEROVIRAL CON EXANTEMA'),('B370','ESTOMATITIS CANDIDIASICA'),('B378','CANDIDIASIS DE OTROS SITIOS'),('B99',' OTRAS ENFERMEDADES INFECCIOSAS Y LAS NO ESPECIFICADAS'),('C000',' TUMOR MALIGNO DEL LABIO SUPERIOR, CARA EXTERNA'),('C001',' TUMOR MALIGNO DEL LABIO INFERIOR, CARA EXTERNA'),('C002',' TUMOR MALIGNO DEL LABIO, CARA EXTERNA, SIN OTRA ESPECIFICACIÓN'),('C003',' TUMOR MALIGNO DEL LABIO SUPERIOR, CARA INTERNA'),('C004',' TUMOR MALIGNO DEL LABIO INFERIOR, CARA INTERNA'),('C005',' TUMOR MALIGNO DEL LABIO, CARA INTERNA, SIN OTRA ESPECIFICACION'),('C006',' TUMOR MALIGNO DE LA COMISURA LABIAL'),('C008',' LESION DE SITIOS CONTIGUOS DEL LABIO'),('C009',' TUMOR MALIGNO DEL LABIO, PARTE NO ESPECIFICADA'),('C01',' TUMOR MALIGNO DE LA BASE DE LA LENGUA'),('C020',' TUMOR MALIGNO DE LA CARA DORSAL DE LA LENGUA'),('C021',' TUMOR MALIGNO DEL BORDE DE LA LENGUA'),('C022',' TUMOR MALIGNO DE LA CARA VENTRAL DE LA LENGUA'),('C023',' TUMOR MALIGNO DE LOS DOS TERCIOS ANTERIORES DE LA LENGUA, PARTE NO ESPECIFICADA'),('C024',' TUMOR MALIGNO DE LA AMIGDALA LINGUAL'),('C028',' LESION DE SITIOS CONTIGUOS DE LA LENGUA'),('C029',' TUMOR MALIGNO DE LA LENGUA, PARTE NO ESPECIFICADA'),('C030',' TUMOR MALIGNO DE LA ENCIA SUPERIOR'),('C040',' TUMOR MALIGNO DE LA PARTE ANTERIOR DEL PISO DE LA BOCA'),('C041',' TUMOR MALIGNO DE LA PARTE LATERAL DEL PISO DE LA BOCA'),('C048',' LESION DE SITIOS CONTIGUOS DEL PISO DE LA BOCA'),('C049',' TUMOR MALIGNO DEL PISO DE LA BOCA, PARTE NO ESPECIFICADA'),('C050',' TUMOR MALIGNO DEL PALADAR DURO'),('C051',' TUMOR MALIGNO DEL PALADAR BLANDO'),('C052','TUMOR MALIGNO DE LA UVULA'),('C058','LESION DE SITIOS CONTIGUOS DEL PALADAR'),('C059','TUMOR MALIGNO DEL PALADAR, PARTE NO ESPECIFICADA'),('C060','TUMOR MALIGNO DE LA MUCOSA DE LA MEJILLA'),('C061','TUMOR MALIGNO DEL VESTIBULO DE LA BOCA'),('C062','TUMOR MALIGNO DEL AREA RETROMOLAR'),('C068','LESION DE SITIOS CONTIGUOS DE OTRAS PARTES Y DE LAS NO ESPECIFICADAS DE LA BOCA'),('C069','TUMOR MALIGNO DE LA BOCA, PARTE NO ESPECIFICADA'),('C07','TUMOR MALIGNO DE LA GLANDULA PAROTIDA'),('C080','TUMOR MALIGNO DE LA GLANDULA SUBMAXILAR'),('C081','TUMOR MALIGNO DE LA GLANDULA SUBLINGUAL'),('C088','LESION DE SITIOS CONTIGUOS DE LAS GLANDULAS SALIVALES MAYORES'),('C089','TUMOR MALIGNO DE GLANDULA SALIVAL MAYOR, NO ESPECIFICADA'),('C098','LESION DE SITIOS CONTIGUOS DE LA AMIGDALA'),('C109','TUMOR MALIGNO DE LA OROFARINGE, PARTE NO ESPECIFICADA'),('C148','LESION DE SITIOS CONTIGUOS DEL LABIO, DE LA CAVIDAD BUCAL Y DE LA LARINGE'),('C310','TUMOR MALIGNO DEL SENO MAXILAR'),('C318','LESION DE SITIOS CONTIGUOS DE LOS SENOS PARANASALES'),('C319','TUMOR MALIGNO DEL SENO PARANASAL NO ESPECIFICADO'),('C410','TUMOR MALIGNO DE LOS HUESOS DEL CRANEO Y DE LA CARA'),('C411','TUMOR MALIGNO DEL HUESO DEL MAXILAR INFERIOR'),('C430','MELANOMA MALIGNO DEL LABIO'),('C440','TUMOR MALIGNO DE LA PIEL DEL LABIO'),('C462','SARCOMA DE KAPOSI DEL PALADAR'),('C760','TUMOR MALIGNO DE LA CABEZA, CARA Y CUELLO'),('D030','MELANOMA IN SITU DEL LABIO'),('D040','CARCINOMA IN SITU DE LA PIEL DEL LABIO'),('D100','TUMOR BENIGNO DEL LABIO'),('D101','TUMOR BENIGNO DE LA LENGUA'),('D102','TUMOR BENIGNO DEL PISO DE LA BOCA'),('D103','TUMOR BENIGNO DE OTRAS PARTES Y DE LAS NO ESPECIFICADAS DE LA BOCA'),('D164','TUMOR BENIGNO DE LOS HUESOS DEL CRANEO Y DE LA CARA'),('D165','TUMOR BENIGNO DEL MAXILAR INFERIOR'),('D220','NEVO MELANOCITICO DEL LABIO'),('D230','TUMOR BENIGNO DE LA PIEL DEL LABIO'),('D370','TUMOR DE COMPORTAMIENTO INCIERTO O DESCONOCIDO DEL LABIO, DE LA CAVIDAD BUCAL Y DE LA FARINGE'),('D433','TUMOR DE COMPORTAMIENTO INCIERTO O DESCONOCIDO DE LOS NERVIOS CRANEALES'),('F808','OTROS TRASTORNOS DEL DESARROLLO DEL HABLA Y DEL LENGUAJE'),('F809','TRASTORNO DEL DESARROLLO DEL HABLA Y DEL LENGUAJE NO ESPECIFICADO'),('F988','OTROS TRASTORNOS EMOCIONALES Y DEL COMPORTAMIENTO QUE APARECEN HABITUALMENTE EN LA NIÑEZ Y EN LA ADOLESCENCIA'),('G500','NEURALGIA DEL TRIGEMINO'),('G501','DOLOR FACIAL ATIPICO'),('G508','OTROS TRASTORNOS DEL TRIGEMINO'),('G509','TRASTORNOS DEL TRIGEMINO, NO ESPECIFICADO'),('G510','PARALISIS DE BELL'),('G513','ESPASMO HEMIFACIAL CLONICO'),('G518','OTROS TRASTORNOS DEL NERVIO FACIAL'),('G519','TRASTORNOS DEL NERVIO FACIAL, NO ESPECIFICADO'),('G530','NEURALGIA POSTHERPES ZOSTER (B02.2†)'),('J320','SINUSITIS MAXILAR CRONICA'),('K000','ANODONCIA'),('K001','DIENTES SUPERNUMERARIOS'),('K002','ANOMALIAS DEL TAMAÑO Y DE LA FORMA DEL DIENTE'),('K003','DIENTES MOTEADOS'),('K004','ALTERACIONES EN LA FORMACION DENTARIA'),('K005','ALTERACIONES HEREDITARIAS DE LA ESTRUCTURA DENTARIA, NO CLASIFICADAS EN OTRA PARTE'),('K006','ALTERACIONES EN LA ERUPCION DENTARIA'),('K007','SINDROME DE LA ERUPCION DENTARIA'),('K008','OTROS TRASTORNOS DEL DESARROLLO DE LOS DIENTES'),('K009','TRASTORNO DEL DESARROLLO DE LOS DIENTES, NO ESPECIFICADO'),('K010','DIENTES INCLUIDOS'),('K011','DIENTES IMPACTADOS'),('K020','CARIES LIMITADA AL ESMALTE'),('K021','CARIES DE LA DENTINA'),('K022','CARIES DEL CEMENTO'),('K023','CARIES DENTARIA DETENIDA'),('K024','ODONTOCLASIA'),('K028','OTRAS CARIES DENTALES'),('K029','CARIES DENTAL, NO ESPECIFICADA'),('K030','ATRICION EXCESIVA DE LOS DIENTES'),('K031','ABRASION DE LOS DIENTES'),('K032','EROSION DE LOS DIENTES'),('K033','REABSORCION PATOLOGICA DE LOS DIENTES'),('K034','HIPERCEMENTOSIS'),('K035','ANQUILOSIS DENTAL'),('K036','DEPOSITOS [ACRECIONES] EN LOS DIENTES'),('K037','CAMBIOS POSTERUPTIVOS DEL COLOR DE LOS TEJIDOS DENTALES DUROS'),('K038','OTRAS ENFERMEDADES ESPECIFICADAS DE LOS TEJIDOS DUROS DE LOS DIENTES'),('K039','ENFERMEDAD NO ESPECIFICADA DE LOS TEJIDOS DENTALES DUROS'),('K040','PULPITIS'),('K041','NECROSIS DE LA PULPA'),('K042','DEGENERACION DE LA PULPA'),('K043','FORMACION ANORMAL DE TEJIDO DURO EN LA PULPA'),('K044','PERIODONTITIS APICAL AGUDA ORIGINADA EN LA PULPA'),('K045','PERIODONTITIS APICAL CRONICA'),('K046','ABSCESO PERIAPICAL CON FISTULA'),('K047','ABSCESO PERIAPICAL SIN FISTULA'),('K048','QUISTE RADICULAR'),('K049','OTRAS ENFERMEDADES Y LAS NO ESPECIFICADAS DE LA PULPA Y DEL TEJIDO PERIAPICAL'),('K050','GINGIVITIS AGUDA'),('K051','GINGIVITIS CRONICA'),('K052','PERIODONTITIS AGUDA'),('K053','PERIODONTITIS CRONICA'),('K054','PERIODONTOSIS'),('K055','OTRAS ENFERMEDADES PERIODONTALES'),('K056','ENFERMEDAD DE PERIODONTO, NO ESPECIFICADA'),('K060','RETRACCION GINGIVAL'),('K061','HIPERPLASIA GINGIVAL'),('K062','LESIONES DE LA ENCIA Y DE LA ZONA EDENTULA ASOCIADAS CON TRAUMATISMO'),('K068','OTROS TRASTORNOS ESPECIFICADOS DE LA ENCIA Y DE LA ZONA EDENTULA'),('K069','TRASTORNO NO ESPECIFICADO DE LA ENCIA Y DE LA ZONA EDENTULA'),('K070','ANOMALIAS EVIDENTES DEL TAMAÑO DE LOS MAXILARES'),('K071','ANOMALIAS DE LA RELACION MAXILOBASILAR'),('K072','ANOMALIAS DE LA RELACION ENTRE LOS ARCOS DENTARIOS'),('K073','ANOMALIAS DE LA POSICION DEL DIENTE'),('K074','MALOCLUSION DE TIPO NO ESPECIFICADO'),('K075','ANOMALIAS DENTOFACIALES FUNCIONALES'),('K076','TRASTORNOS DE LA ARTICULACION TEMPOROMAXILAR'),('K078','OTRAS ANOMALIAS DENTOFACIALES'),('K079','ANOMALIA DENTOFACIAL, NO ESPECIFICADA'),('K080','EXFOLIACION DE LOS DIENTES DEBIDA A CAUSAS SISTEMICAS'),('K081','PERDIDA DE DIENTES DEBIDA A ACCIDENTE, EXTRACCION O ENFERMEDAD PERIODONTAL LOCAL'),('K082','ATROFIA DE REBORDE ALVEOLAR DESDENTADO'),('K083','RAIZ DENTAL RETENIDA'),('K088','OTRAS AFECCIONES ESPECIFICADAS DE LOS DIENTES Y DE SUS ESTRUCTURAS DE SOSTEN'),('K089','TRASTORNO DE LOS DIENTES Y DE SUS ESTRUCTURAS DE SOSTEN, NO ESPECIFICADO'),('K090','QUISTES DE LAS FISURAS (NO ODONTOGENICOS)'),('K092','OTROS QUISTES DE LOS MAXILARES'),('K098','OTROS QUISTES DE LA REGION BUCAL, NO CLASIFICADOS EN OTRA PARTE'),('K099','QUISTE DE LA REGION BUCAL, SIN OTRA ESPECIFICACION'),('K100','TRASTORNOS DEL DESARROLLO DE LOS MAXILARES'),('K101','GRANULOMA CENTRAL DE CELULAS GIGANTES'),('K102','AFECCIONES INFLAMATORIAS DE LOS MAXILARES'),('K103','ALVEOLITIS DEL MAXILAR'),('K108','OTRAS ENFERMEDADES ESPECIFICADAS DE LOS MAXILARES'),('K109','ENFERMEDAD DE LOS MAXILARES, NO ESPECIFICADA'),('K110','ATROFIA DE GLANDULA SALIVAL'),('K111','HIPERTROFIA DE GLANDULA SALIVAL'),('K112','SIALADENITIS'),('K113','ABSCESO DE GLANDULA SALIVAL'),('K114','FISTULA DE GLANDULA SALIVAL'),('K115','SIALOLITIASIS'),('K116','MUCOCELE DE GLANDULA SALIVAL'),('K117','ALTERACIONES DE LA SECRECION SALIVAL'),('K118','OTRAS ENFERMEDADES DE LAS GLANDULAS SALIVALES'),('K119','ENFERMEDAD DE GLANDULA SALIVAL. NO ESPECIFICADA'),('K120','ESTOMATITIS AFTOSA RECURRENTE'),('K121','OTRAS FORMAS DE ESTOMATITIS'),('K122','CELULITIS Y ABSCESO DE BOCA'),('K130','ENFERMEDADES DE LOS LABIOS'),('K131','MORDEDURA DEL LABIO Y DE LA MEJILLA'),('K132','LEUCOPLASIA Y OTRAS ALTERACIONES DEL EPITELIO BUCAL, INCLUYENDO LA LENGUA'),('K133','LEUCOPLASIA PILOSA'),('K134','GRANULOMA Y LESIONES SEMEJANTES DE LA MUCOSA BUCAL'),('K135','FIBROSIS DE LA SUBMUCOSA BUCAL'),('K136','HIPERPLASIA IRRITATIVA DE LA MUCOSA BUCAL'),('K137','OTRAS LESIONES Y LAS NO ESPECIFICADAS DE LA MUCOSA BUCAL'),('K140','GLOSITIS'),('K141','LENGUA GEOGRAFICA'),('K142','GLOSITIS ROMBOIDEA MEDIANA'),('K143','HIPERTROFIA DE LAS PAPILAS LINGUALES'),('K144','ATROFIA DE LAS PAPILAS LINGUALES'),('K145','LENGUA PLEGADA'),('K146','GLOSODINIA'),('K148','OTRAS ENFERMEDADES DE LA LENGUA'),('K149','ENFERMEDAD DE LA LENGUA, NO ESPECIFICADA'),('L032','CELULITIS DE LA CARA'),('O293','FISURA DEL PALADAR DURO'),('Q353','FISURA DEL PALADAR BLANDO'),('Q355','FISURA DEL PALADAR DURO Y DEL PALADAR BLANDO'),('Q356','FISURA DEL PALADAR, LINEA MEDIA'),('Q357','FISURA DE LA UVULA'),('Q359','FISURA DEL PALADAR, SIN OTRA ESPECIFICACION'),('Q360','LABIO LEPORINO, BILATERAL'),('Q361','LABIO LEPORINO, LINEA MEDIA'),('Q369','LABIO LEPORINO, UNILATERAL'),('Q370','FISURA DEL PALADAR DURO CON LABIO LEPORINO BILATERAL'),('Q371','FISURA DEL PALADAR DURO CON LABIO LEPORINO, UNILATERAL'),('Q372','FISURA DEL PALADAR BLANDO CON LABIO LEPORINO BILATERAL'),('Q373','FISURA DEL PALADAR BLANDO CON LABIO LEPORINO UNILATERAL'),('Q374','FISURA DEL PALADAR DURO Y DEL PALADAR BLANDO CON LABIO LEPORINO BILATERAL'),('Q375','FISURA DEL PALADAR DURO Y DEL PALADAR BLANDO CON LABIO LEPORINO UNILATERAL'),('Q378','FISURA DEL PALADAR CON LABIO LEPORINO BILATERAL, SIN OTRA ESPECIFICACION'),('Q379','FISURA DEL PALADAR CON LABIO LEPORINO UNILATERAL, SIN OTRA ESPECIFICACION'),('Q380','MALFORMACIONES CONGENITAS DE LOS LABIOS, NO CLASIFICADAS EN OTRA PARTE'),('Q381','ANQUILOGLOSIA'),('Q382','MACROGLOSIA'),('Q383','OTRAS MALFORMACIONES CONGENITAS DE LA LENGUA'),('Q384','MALFORMACIONES CONGENITAS DE LAS GLANDULAS Y DE LOS CONDUCTOS SALIVALES'),('Q385','MALFORMACIONES CONGENITAS DEL PALADAR, NO CLASIFICADAS EN OTRA PARTE'),('Q386','OTRAS MALFORMACIONES CONGENITAS DE LA BOCA'),('Q754','DISOSTOSIS MAXILOFACIAL'),('Q758','OTRAS MALFORMACIONES CONGENITAS ESPECIFICADAS DE LOS HUESOS DEL CRANEO Y DE LA CARA'),('Q759','MALFORMACION CONGENITA NO ESPECIFICADA DE LOS HUESOS DEL CRANEO Y DE LA CARA'),('R040','EPISTAXIS'),('S014','HERIDA DE LA MEJILLA Y DE LA REGION TEMPOROMANDIBULAR'),('S015','HERIDA DEL LABIO Y DE LA CAVIDAD BUCAL'),('S023','FRACTURA DEL SUELO DE LA ORBITA'),('S024','FRACTURA DEL MALAR Y DEL HUESO MAXILAR SUPERIOR'),('S025','FRACTURA DE LOS DIENTES'),('S026','FRACTURA DEL MAXILAR INFERIOR'),('S027','FRACTURAS MULTIPLES QUE COMPROMETEN EL CRANEO Y LOS HUESOS DE LA CARA'),('S028','FRACTURA DE OTROS HUESOS DEL CRANEO Y DE LA CARA'),('S030','LUXACION DEL MAXILAR'),('S032','LUXACION DE DIENTE'),('S034','ESGUINCES Y TORCEDURAS DEL MAXILAR'),('S043','TRAUMATISMO DEL NERVIO TRIGEMINO [V PAR]'),('S045','TRAUMATISMO DEL NERVIO FACIAL [VII PAR]'),('S049','TRAUMATISMO DEL NERVIOS CRANEALES, NO ESPECIFICADO'),('T170','CUERPO EXTRAÑO EN SENO PARANASAL'),('T180','CUERPO EXTRAÑO EN LA BOCA'),('T490','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS \n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: DROGAS LOCALES ANTIMICOTICAS, \n	ANTIINFECCIOSAS Y ANTIINFLAMATORIAS, NO CLASIFICADAS EN OTRA PARTE'),('T491','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS \n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: ANTIPRURITICOS'),('T492','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS \n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: ASTRINGENTES Y DETERGENTES LOCALES'),('T493','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS \n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: EMOLIENTES, DEMULCENTES Y PROTECTORES'),('T494','ENVENENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS\n	MEMBRANAS MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES:\n	QUERATOLITICOS, QUERATOPLASTICOS, DROGAS Y OTRAS PREPARACIONES PARA EL TRATAMIENTO\n	DEL CABELLO'),('T495','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS\n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: DROGAS Y\n	PREPARACIONES OFTALMOLOGICAS'),('T496','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS\n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: DROGAS Y\n	PREPARACIONES OTORRINOLARINGOLOGICAS'),('T497','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS\n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: DROGAS\n	DENTALES, APLICADAS TOPICAMENTE'),('T498','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS\n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: OTROS AGENTES TOPICOS'),('T499','ENVENENAMIENTO POR AGENTES TOPICOS QUE AFECTAN PRINCIPALMENTE LA PIEL Y LAS MEMBRANAS\n	MUCOSAS Y POR DROGAS OFTALMOLOGICAS, OTORRINOLARINGOLOGICAS Y DENTALES: AGENTES TOPICOS, NO ESPECIFICADOS'),('T784','ALERGIA NO ESPECIFICADA'),('T882','CHOQUE DEBIDA A ANESTESIA'),('T883','HIPERTERMIA MALIGNA DEBIDA A ANESTESIA'),('T885','OTRAS COMPLICACIONES DE LA ANESTESIA'),('T886','CHOQUE ANAFILACTICO DEBIDO A EFECTO ADVERSO DE DROGA O MEDICAMENTO CORRECTO ADMINISTRADO APROPIADAMENTE'),('Y400','EFECTOS ADVERSOS DE PENICILINAS'),('Y401','EFECTOS ADVERSOS DE CEFALOSPORINAS Y OTROS ANTIBIOTICOS BETALACTAMICOS'),('Y403','EFECTOS ADVERSOS DE LOS MACROLIDOS'),('Y404','EFECTOS ADVERSOS DE TETRACICLINAS'),('Y405','EFECTOS ADVERSOS DE AMINOGLICOSIDOS'),('Y406','EFECTOS ADVERSOS DE RIFAMICINAS'),('Y407','EFECTOS ADVERSOS DE ANTIBIOTICOS ANTIMICOTICOS USADOS SISTEMATICAMENTE'),('Y408','EFECTOS ADVERSOS DE OTROS ANTIBIOTICOS SISTEMICOS'),('Y409','EFECTOS ADVERSOS DE ANTIBIOTICO SISTEMICO NO ESPECIFICADO'),('Y410','EFECTOS ADVERSOS DE SULFONAMIDAS'),('Y411','EFECTOS ADVERSOS DE DROGAS ANTIMICOBACTERIANAS'),('Y458','EFECTOS ADVERSOS DE OTROS ANALGESICOS Y ANTIPIRETICOS'),('Y459','EFECTOS ADVERSOS DE DROGAS ANALGESICAS, ANTIPIRETICAS Y ANTIINFLAMATORIAS NO ESPECIFICADAS'),('Y483','EFECTOS ADVERSOS DE GASES ANESTESICOS LOCALES'),('Y484','EFECTOS ADVERSOS DE ANESTESICOS NO ESPECIFICADOS'),('Y850','SECUELAS DE ACCIDENTE DE VEHICULO DE MOTOR'),('Y859','SECUELAS DE OTROS ACCIDENTES DE TRANSPORTE, Y LOS NO ESPECIFICADOS'),('Y86','SECUELAS DE OTROS ACCIDENTES'),('Y870','SECUELAS DE LESIONES AUTOINFLIGIDAS'),('Y871','SECUELAS DE AGRESIONES'),('Y872','SECUELAS DE EVENTOS DE INTENCION NO DETERMINADA'),('Y880','SECUELAS DE EFECTOS ADVERSOS CAUSADOS POR DROGAS, MEDICAMENTOS Y SUSTANCIAS BIOLOGICAS EN SU USO TERAPEUTICO'),('Y881','SECUELAS DE INCIDENTES OCURRIDOS AL PACIENTE DURANTE PROCEDIMIENTOS MEDICOS Y QUIRURGICOS'),('Y882','SECUELAS DE INCIDENTES ADVERSOS ASOCIADOS CON DISPOSITIVOS MEDICOS EN USO DIAGNOSTICO Y TERAPEUTICO'),('Y883','SECUELAS DE PROCEDIMIENTOS MEDICOS Y QUIRURGICOS COMO LA CAUSA DE REACCION ANORMAL DEL PACIENTE O DE COMPLICACION \n	POSTERIOR, SIN MENCION DE INCIDENTE EN EL MOMENTO DE EFECTUAR EL PROCEDIMIENTO'),('Y890','SECUELAS DE INTERVENCION LEGAL'),('Y891','SECUELAS DE OPERACIONES DE GUERRA'),('Y899','SECUELAS DE CAUSA EXTERNA NO ESPECIFICADA'),('Z012','EXAMEN ODONTOLOGICO'),('Z463','PRUEBA Y AJUSTE DE PROTESIS DENTAL'),('Z464','PRUEBA Y AJUSTE DE DISPOSITIVO ORTODONCICO'),('Z965','PRESENCIA DE IMPLANTES DE RAIZ DE DIENTE Y DE MANDIBULA');
/*!40000 ALTER TABLE `enfermedades_cie.10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examenestomatonagtico_tlb`
--

DROP TABLE IF EXISTS `examenestomatonagtico_tlb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examenestomatonagtico_tlb` (
  `id_examEst` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `regionAfec_examEst` enum('Labios','Mejillas','Maxilar Superior','Maxilar Inferior','Lengua','Paladar','Piso','Carillos','Glándulas salivales','Oro Faringe','A.T.M','Ganglios') NOT NULL,
  `codigoCIE` char(4) DEFAULT NULL,
  `desc_examEst` text,
  PRIMARY KEY (`id_examEst`),
  KEY `fk_examenEstomato_idx` (`id_consulta`),
  KEY `fk_codigoCIE_idx` (`codigoCIE`),
  CONSTRAINT `fk_codigoCIE` FOREIGN KEY (`codigoCIE`) REFERENCES `enfermedades_cie.10` (`codigoCIE`),
  CONSTRAINT `fk_examenEstomato` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examenestomatonagtico_tlb`
--

LOCK TABLES `examenestomatonagtico_tlb` WRITE;
/*!40000 ALTER TABLE `examenestomatonagtico_tlb` DISABLE KEYS */;
INSERT INTO `examenestomatonagtico_tlb` VALUES (1,8,'Labios','K116','Mucocele de glándula saliva. Mucocele de aproximadamente 3mm sobre la glándula'),(3,8,'Lengua','K022','(Actualizado) Caries del cemento en la cara central y lingual de la pieza #45'),(13,44,'Glándulas salivales','B084',NULL),(14,47,'Labios','C148',NULL);
/*!40000 ALTER TABLE `examenestomatonagtico_tlb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gasto_tbl`
--

DROP TABLE IF EXISTS `gasto_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasto_tbl` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `desc_gasto` text,
  `monto_gasto` decimal(10,2) DEFAULT NULL,
  `fecha_gasto` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updfecha_gasto` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_gasto`),
  FULLTEXT KEY `fulltext desc_gasto` (`desc_gasto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto_tbl`
--

LOCK TABLES `gasto_tbl` WRITE;
/*!40000 ALTER TABLE `gasto_tbl` DISABLE KEYS */;
INSERT INTO `gasto_tbl` VALUES (3,'Pago de luz',40.32,'2023-02-21 08:32:23','2023-02-21 08:32:23'),(4,'Arriendo',140.56,'2023-02-21 10:15:07','2023-06-17 21:43:53'),(11,'Productos de limpieza',20.00,'2022-02-23 05:00:00','2023-02-21 11:33:28'),(12,'gasto bla bla bla',50.00,'2023-06-16 18:39:16','2023-06-16 18:39:16'),(13,'Pago por arriendo Junio 2023',90.00,'2023-06-17 21:44:40','2023-06-17 21:53:00');
/*!40000 ALTER TABLE `gasto_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso_tbl`
--

DROP TABLE IF EXISTS `ingreso_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingreso_tbl` (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int DEFAULT NULL,
  `text_ingreso` text NOT NULL,
  `desc_ingreso` text,
  `monto_ingreso` decimal(10,2) NOT NULL,
  `fecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updfecha_ingreso` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_tratam_proced` int DEFAULT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `fk_consulta_pago_idx` (`id_consulta`),
  FULLTEXT KEY `index_fulltext_comment_desc` (`text_ingreso`,`desc_ingreso`),
  CONSTRAINT `fk_consulta_pago` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso_tbl`
--

LOCK TABLES `ingreso_tbl` WRITE;
/*!40000 ALTER TABLE `ingreso_tbl` DISABLE KEYS */;
INSERT INTO `ingreso_tbl` VALUES (16,8,'Pago por Consulta - Extracción de pieza dental','',15.00,'2023-06-12 10:14:09','2023-06-12 10:14:09',0),(17,57,'Pago por Consulta - Primera consulta','',15.00,'2023-06-12 21:23:06','2023-06-12 21:23:06',0),(18,57,'Pago por procedimiento - XII. Coadyuvante de Servicios Generales - Consulta Profesional - consulta de servicio de diagnóstico proporcionado por el dentista u otro médico que solicita dentista o médico','',15.00,'2023-06-12 21:23:10','2023-06-12 21:23:10',64),(19,58,'Pago por Consulta - Revisión de rutina v4','',28.00,'2023-06-13 01:39:31','2023-06-13 01:39:31',0),(20,58,'Pago por Procedimiento - IV. Endodoncia - Pulpotomía - pulpar, desbridamiento los dientes primarios y permanentes','',25.00,'2023-06-13 01:39:36','2023-06-13 01:39:36',67),(29,59,'Pago por Consulta - Extracción de pieza dental','',15.20,'2023-06-13 16:17:15','2023-06-13 16:17:47',0),(30,59,'Pago por procedimiento - III. Restaurativo - A base de resina compuesta Restauraciones – Directo - a base de resina compuesta - una superficie, anterior','Descuento 7%',40.35,'2023-06-13 16:17:17','2023-06-13 16:17:54',61),(31,58,'Pago por Procedimiento - II. Preventivo (Profilaxis Dental) - Profilaxis - profilaxis infantil','',20.00,'2023-06-13 16:19:12','2023-06-13 16:19:12',52),(33,47,'Pago por Consulta - Primera consulta','',15.00,'2023-06-15 18:46:36','2023-06-15 18:46:36',0),(34,47,'Venta de enjuage bucal oral B','Venta de enjuage bucal oral B',7.50,'2023-06-15 18:46:48','2023-06-16 04:12:02',NULL),(35,58,'Pago por Procedimiento - XI. Ortodoncia - Tratamiento de ortodoncia - limitado tratamiento ortodóncico de la dentición adulta','',35.00,'2023-06-16 00:12:42','2023-06-16 00:12:42',53),(37,58,'Venta de enjuage bucal oral B','',7.50,'2023-06-16 00:14:11','2023-06-16 00:14:11',NULL),(61,NULL,'INGRESOS POR CONSULTORIA A EMILIA GONZALES','',60.00,'2023-06-16 08:00:03','2023-06-16 08:03:07',NULL),(62,NULL,'VENTA DE MICROMOTOR ','',70.00,'2023-06-16 08:02:41','2023-06-16 08:04:39',NULL),(83,47,'Venta de enjuage bucal oral B','',7.50,'2023-06-17 21:38:02','2023-06-17 21:38:02',NULL),(84,2,'Pago por Consulta - Extracción de pieza dental','',15.00,'2023-06-18 08:48:57','2023-06-18 08:48:57',0);
/*!40000 ALTER TABLE `ingreso_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomprocedimiento_tbl`
--

DROP TABLE IF EXISTS `nomprocedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomprocedimiento_tbl` (
  `cod_nomProced` char(5) NOT NULL,
  `nombre_nomProced` varchar(500) NOT NULL,
  `id_Proce` tinyint unsigned NOT NULL,
  PRIMARY KEY (`cod_nomProced`),
  KEY `fk_Nomenclatura_proced_idx` (`id_Proce`),
  KEY `index_proced` (`cod_nomProced`),
  FULLTEXT KEY `index_nomPro` (`nombre_nomProced`),
  CONSTRAINT `fk_Nomenclatura_proced` FOREIGN KEY (`id_Proce`) REFERENCES `subtiprocedimiento_tbl` (`id_Proce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomprocedimiento_tbl`
--

LOCK TABLES `nomprocedimiento_tbl` WRITE;
/*!40000 ALTER TABLE `nomprocedimiento_tbl` DISABLE KEYS */;
INSERT INTO `nomprocedimiento_tbl` VALUES ('D0120','periódica evaluación oral – paciente subsecuente',1),('D0140','limitada evaluación oral - problema centrado',1),('D0145','Evaluación oral a un paciente menor de tres años de edad y asesoramiento, con primaria o cuidador-',1),('D0150','completa evaluación oral - o establecidos nuevo paciente',1),('D0160',' extensa evaluación detallada y oral - problema se centró, en el informe',1),('D0170',' re-evaluación - limitada, el problema se centró (paciente establecido, no-operatorio visita post)',1),('D0180','evaluación periodontal completa - o establecidos nuevo paciente',1),('D0210',' Serie completa (incluyendo proyecciones de mordida)',2),('D0220',' intraoral - primera película periapical intraoral',2),('D0230',' cada radiografía periapical adicional intraoral',2),('D0240',' oclusal película extraoral',2),('D0250',' primera película',2),('D0260',' extraoral - cada película adicional mordida',2),('D0270',' sola película mordida',2),('D0272',' dos películas mordida',2),('D0273',' tres películas',2),('D0274',' mordida - cuatro películas',2),('D0277',' mordida vertical - 7 a 8 películas',2),('D0290',' postero-anterior o lateral del cráneo y los huesos faciales encuesta película',2),('D0310',' sialografía',2),('D0320',' -temporomandibular artrograma conjunta, incluyendo la inyección',2),('D0321',' otra articulación temporomandibular películas, por el informe encuesta tomográfica',2),('D0322',' encuesta tomográfica',2),('D0330',' panorámicas de cine',2),('D0340',' cefalométrico película',2),('D0350',' oral / facial imágenes fotográficas TC de haz cónico',2),('D0360',' TC de haz cónico- los datos de captura craneofacial haz de cono',2),('D0362',' - reconstrucción de la imagen tridimensional y dos a partir de datos existentes, incluye múltiples imágenes haz de cono',2),('D0363','- reconstrucción de la imagen tridimensional y tres a partir de datos existentes, incluye múltiples imágenes.',2),('D0415','colección de microorganismos para la cultura y la sensibilidad',3),('D0416','cultivo viral',3),('D0417','recogida y preparación de muestra de saliva para ensayos de laboratorio de diagnóstico ',3),('D0418','análisis de muestras de saliva',3),('D0421','prueba genética para la susceptibilidad a las enfermedades bucodentales',3),('D0425','pruebas de susceptibilidad a la caries ',3),('D0431','pre-prueba de diagnóstico complementario que ayuda en la detección de anomalías \n		de la mucosa como y malignas las lesiones premalignas, que no incluyen la citología o biopsia procedimientos',3),('D0460','Pruebas de vitalidad pulpar',3),('D0470','modelos de diagnóstico',3),('D0472',' adhesión del tejido, el examen macroscópico, la preparación y la transmisión del informe escrito',4),('D0473',' adhesión del tejido, y el examen microscópico bruto, la preparación y transmisión de informe escrito ',4),('D0474',' adhesión del tejido, y el examen microscópico bruto, incluida la evaluación de cirugía márgenes para la \n		presencia de la enfermedad, la preparación y la transmisión del informe escrito ',4),('D0475',' procedimiento de descalcificación',4),('D0476',' tinciones especiales para microorganismos',4),('D0477',' tinciones especiales, no para los microorganismos ',4),('D0478',' inmunohistoquímica manchas ',4),('D0479',' tejido situ hibridación in, incluida la interpretación ',4),('D0480',' adhesión de frotis citológico exfoliativa, el examen microscópico, preparación y la transmisión del informe escrito',4),('D0481',' microscopía electrónica - de diagnóstico ',4),('D0482',' inmunofluorescencia directa ',4),('D0483',' inmunofluorescencia indirecta ',4),('D0484',' consulta en láminas en otros lugares ',4),('D0485',' consulta, incluida la preparación de los portaobjetos de material de biopsia facilitada por referencia fuente',4),('D0486',' laboratorio de la adhesión de la biopsia Muestra de cepillado, el examen microscópico, preparación y la \n		transmisión del informe escrito ',4),('D0502',' procedimientos orales otra patología, por el informe ',4),('D0999',' sin especificar procedimiento de diagnóstico, el informe',4),('D1110','profilaxis adultos',5),('D1120','profilaxis infantil',5),('D1203','La aplicación tópica de fluoruro-infantil',6),('D1204','aplicación tópica de fluoruro - adultos',6),('D1206','topicación de fluoruro barniz, la aplicación terapéutica de moderado a la caries   pacientes de alto riesgo',6),('D1310',' dietéticas específicas para el control de la enfermedad dental',7),('D1320',' asesoramiento del tabaco para el control y la prevención de las enfermedades bucodentales',7),('D1330',' instrucciones de higiene oral',7),('D1351',' Sellador - por diente ',7),('D1510',' mantenedor de espacio - fijo - unilaterales ',7),('D1515',' mantenedor de espacio - fijo - bilaterales',7),('D1520','mantenedor de espacio - extraíble - unilaterales',7),('D1525','mantenedor de espacio - extraíble - bilaterales',7),('D1550','volver a la cementación del espacio mantenedor',7),('D1555','eliminación de mantenedor de espacio fijo ',7),('D2140','– amalgama superficie una, primaria o permanente',8),('D2150','amalgama- dos superficies, primaria o permanente',8),('D2160','amalgama- tres superficies, primaria o permanente',8),('D2161','Amalgama - cuatro o más superficies, primarios o permanentes',8),('D2330',' a base de resina compuesta - una superficie, anterior',9),('D2331','-a base de resinas compuestas - dos superficies, anterior',9),('D2332','-a base de resinas compuestas - tres superficies, anterior',9),('D2335','-a base de resinas compuestas - cuatro o más superficies o en relación con el ángulo incisal (anterior)',9),('D2390',' base compuesta corona con resina, anterior',9),('D2391',' a base de resina compuesta - una superficie, posterior',9),('D2392','-a base de resinas compuestas - dos superficies, posterior',9),('D2393','-a base de resinas compuestas - tres superficies, posterior',9),('D2394','-compuesto base - cuatro o más superficies de resina, posterior',9),('D2410','lámina de oro - una superficie',10),('D2420','lámina de oro - dos superficies',10),('D2430','lámina de oro - tres superficies',10),('D2510',' Inlay - metálica - una superficie',11),('D2520',' Inlay - metálica - dos superficies',11),('D2530',' Inlay - metálica - tres o más superficies',11),('D2542',' onlay- metálicos - dos superficies',11),('D2543',' onlay- metálica - tres superficies',11),('D2544',' onlay- metálico - cuatro o más superficies',11),('D2610',' inscrustación- porcelana / cerámica - una superficie',11),('D2620',' incrustación - porcelana / cerámica - dos superficies',11),('D2630',' incrustación - porcelana / cerámica - tres o más superficies',11),('D2642',' onlay - porcelana / cerámica - dos superficies',11),('D2643',' onlay - porcelana / cerámica - tres superficies ',11),('D2644',' onlay - porcelana / cerámica - cuatro o más superficies',11),('D2650',' Inlay - compuesto a base de resina - una superficie',11),('D2651',' Inlay - compuesto a base de resina - dos superficies',11),('D2652',' Inlay - compuesto a base de resina - tres o más superficies',11),('D2662',' onlay - a base de resina compuesta - dos superficies',11),('D2663',' onlay - a base de resina compuesta - tres superficies',11),('D2664',' onlay - basado en compuestos - cuatro o más superficies de resina',11),('D2710',' Corona - basado en resina compuesta (indirecta)',12),('D2712',' Corona - 3.4 basado en resina compuesta (indirecta)',12),('D2720',' Corona - resina con metal muy noble',12),('D2721',' Corona - resina con metal predominantemente',12),('D2722',' Corona - resina con metal noble',12),('D2740',' Corona - porcelana / sustrato cerámico',12),('D2750',' Corona - porcelana fundida sobre metal muy noble',12),('D2751',' Corona - porcelana fundida sobre metal común predominantemente',12),('D2752',' Corona - porcelana fundida sobre metal noble',12),('D2780',' Corona - 3 / 4 fundido de metales nobles de alto',12),('D2781','Corona - 3 / 4 fundido de metal base predominantemente',12),('D2782','Corona - 3 / 4 fundido de metales nobles',12),('D2783','Corona - 3 / 4 de porcelana / cerámica',12),('D2790','Corona - elenco completo de metales nobles de alto',12),('D2791','Corona - elenco completo de metal base predominantemente',12),('D2792','Corona - elenco completo de metales nobles',12),('D2794','Corona - titanio',12),('D2799','Corona provisional',12),('D2910',' Recementación incrustaciones onlay, restauración o la cobertura parcial',13),('D2915',' Recementación, colados o prefabricados posterior y el núcleo',13),('D2920',' Corona Recementación',13),('D2930',' prefabricados corona de acero inoxidable - dientes primarios',13),('D2931',' Corona de acero inoxidable prefabricados - diente permanente',13),('D2932',' Corona de resina prefabricada',13),('D2933',' Corona de acero inoxidable prefabricada con ventana de resina',13),('D2934',' prefabricados estética inoxidable corona de acero recubiertos - diente primario ',13),('D2940',' llenado con sellantes ',13),('D2950',' acumulación básico, incluidos los pines',13),('D2951',' clavija de retención - por diente, además de la restauración ',13),('D2952',' post y el núcleo, además de la corona, de manera indirecta fabricado',13),('D2953',' indirecta fabricados después de cada adicional- mismo diente',13),('D2954',' prefabricados post y el núcleo, además de la corona',13),('D2955',' eliminación después (y no en relación con el tratamiento de endodoncia)',13),('D2957',' prefabricados cada puesto adicional - el mismo diente',13),('D2960',' labial chapa (laminado de resina) - sillón',13),('D2961',' chapa labial (laminado de resina) - El laboratorio ',13),('D2962','labial chapas (laminados de porcelana) - El laboratorio ',13),('D2970','temporal corona (diente fracturado)',13),('D2971','procedimientos adicionales para la construcción de una nueva corona en estructura de la prótesis parcial existente',13),('D2975','afrontamiento',13),('D2980','reparación de la corona, en el informe',13),('D2999','sin especificar procedimiento de restauración, en el informe',13),('D3110','recubrimiento pulpar - directa (excluyendo la reconstrucción final)',14),('D3120','recubrimiento pulpar - indirectos (excluyendo la reconstrucción final)',14),('D3220','pulpotomía terapéutica (excluyendo la reconstrucción final) - retirada de la pulpa coronal a la \n		dentinocemental unión y la aplicación de la medicación',15),('D3221','pulpar, desbridamiento los dientes primarios y permanentes',15),('D3222','pulpotomía parcial para apexogénesis - diente permanente con el desarrollo radicular incompleta',15),('D3230','pulpar terapia (reabsorbible llenado) - anterior, diente primario (excluyendo la reconstrucción final) ',16),('D3240','pulpar terapia (reabsorbible llenado) - posterior, diente primario (excluyendo la reconstrucción final)',16),('D3310','endodoncia terapia, diente anterior (excluyendo la reconstrucción final)',17),('D3320','terapia endodóntica, diente bicúspide (excluyendo la reconstrucción final)',17),('D3330','endodoncia terapia, molar (excluyendo la reconstrucción final)',17),('D3331','tratamiento de la obstrucción del conducto radicular; quirúrgico acceso no',17),('D3332','incompleta terapia endodóntica;, sin posibilidad de restauración del diente fracturado o inoperables',17),('D3333','perforación internas de reparación de defectos de raíz',17),('D3346','retratamiento de tratamiento de conducto anterior - anterior',18),('D3347','retratamiento de tratamiento de conducto anterior - bicúspide',18),('D3348','retratamiento de tratamiento de conducto anterior - molar',18),('D3351','apicoformación / recalcificación - visita inicial (cierre apical / reparación cálcica de perforaciones, la raíz \n		reabsorción, etc)',19),('D3352','apicoformación / recalcificación - sustitución de medicamentos provisional (cierre apical / reparación \n		cálcica de perforaciones, reabsorción  radicular, etc',19),('D3353','apicoformación/ recalcificación - visita final (incluye completado la terapia del canal radicular –  apical \n		cierre o reparación cálcica de perforaciones, reabsorción radicular, etc)',19),('D3410','apicectomía/ cirugía perirradicular - anterior',20),('D3421','Apicectomía / cirugía perirradicular - bicúspide (primera raíz)',20),('D3425','Apicectomía / cirugía perirradicular - molar (primera raíz)',20),('D3426','Apicectomía / cirugía perirradicular (cada raíz adicional)',20),('D3430','obturación retrógrada - por raíz',20),('D3450','amputación radicular - por raíz',20),('D3460','implante endodóntico endoóseo',20),('D3470','reimplante intencional (incluyendo ferulización es necesario)',20),('D3910','procedimiento quirúrgico para el aislamiento del diente con dique de goma',21),('D3920','hemisección (incluyendo cualquier extracción de raíz), sin incluir la terapia de conducto radicular',21),('D3950','preparación del conducto y la instalación de pasador preformado o post',21),('D3999','sin especificar procedimiento de endodoncia, el informe',21),('D4210',' gingivectomía o gingivoplastia - cuatro o más dientes contiguos o un diente delimitadas espacios por \n		cuadrante.',22),('D4211',' gingivectomía o gingivoplastia - uno a tres dientes contiguos o un diente delimitadas espacios por \n		cuadrante.',22),('D4230',' exposición corona anatómica - cuatro o más dientes contiguos por cuadrante',22),('D4231',' exposición corona anatómica - uno a tres dientes por cuadrante',22),('D4240',' Procedimiento de colgajo gingival, incluyendo alisado radicular - cuatro o más dientes o dientes \n		contiguos espacios delimitados por cuadrante',22),('D4241',' Procedimiento de colgajo gingival, incluyendo alisado radicular - uno a tres dientes contiguos o un \n		diente espacios delimitados por cuadrante',22),('D4245',' apical colgajo',22),('D4249',' alargamiento de corona clínica - los tejidos duros',22),('D4260',' ósea cirugía (incluyendo la entrada y el cierre del colgajo) - cuatro o más dientes o dientes contiguos \n		espacios delimitados por cuadrante',22),('D4261',' cirugía ósea (incluida la inscripción y el cierre del colgajo) - uno a tres dientes contiguos o un diente \n		espacios delimitados por cuadrante',22),('D4263',' de injerto óseo de reemplazo - primer sitio en el cuadrante',22),('D4264',' sustitución del injerto óseo - cada sitio adicional en el cuadrante',22),('D4265',' materiales biológicos para ayudar en la regeneración de tejidos óseos y blandos ',22),('D4266',' regeneración tisular guiada - barrera reabsorbible, el sitio por ',22),('D4267',' la regeneración tisular guiada - barrera no reabsorbible, sitio por (incluye retiro de la membrana)',22),('D4268',' procedimiento de revisión quirúrgica, por diente',22),('D4270',' pedículo de tejido blando del procedimiento de injerto ',22),('D4271',' libre tejidos blandos del procedimiento de injerto (incluyendo sitio de la cirugía del donante)',22),('D4273',' injerto subepitelial del tejido procedimientos, por diente',22),('D4274',' o proximal distal procedimiento de cuña (cuando no se realiza conjuntamente con cirugía procedimientos \n		 en la misma área anatómica)',22),('D4275',' injerto de tejido blando',22),('D4276',' combinadas del tejido conectivo y el doble injerto pediculado, por diente',22),('D4320','provisional ferulización - intracoronales',23),('D4321','férula provisional - extracoronal',23),('D4341','escalamiento periodontal y alisado radicular - cuatro o más dientes por cuadrante ',23),('D4342','escalamiento periodontal y alisado radicular - uno a tres dientes por cuadrante',23),('D4355','desbridamiento para permitir una evaluación integral y el diagnóstico',23),('D4381','distribución localizada de los agentes antimicrobianos a través de un vehículo de liberación controlada \n		en enfermos tejido crevicular, por diente, por el informe',23),('D4910','mantenimiento periodontal',24),('D4920','imprevisto cambio de apósito (por alguien que no sea el tratamiento de dentista)',24),('D4999','sin especificar procedimiento periodontal, por el informe',24),('D5110','prótesis completa - maxilar',25),('D5120','prótesis completa - mandibular',25),('D5130','prótesis inmediata - maxilar',25),('D5140','prótesis inmediata - mandibular',25),('D5211','prótesis parcial maxilar - base de resina (incluye cualquier gancho convencional, descansa y dientes)',26),('D5212','prótesis parcial mandibular - base de resina (incluye cualquier gancho convencional, descansa y dientes',26),('D5213','prótesis parcial maxilar - armazón de metal fundido con bases de resina (incluyendo cualquier cierres \n		convencionales, descansa y dientes)',26),('D5214','prótesis parcial mandibular - armazón colado de metal con bases de resina (incluyendo cualquier cierres \n		convencionales, descansa y dientes)',26),('D5225','prótesis parcial maxilar - base flexible (incluyendo cualquier gancho, descansa y dientes)',26),('D5226','mandibular prótesis parcial - base flexible (incluyendo cualquier gancho, descansa y dientes)',26),('D5281','prótesis parcial removible unilateral - una pieza de metal fundido (incluidos los cierres y los dientes)',26),('D5410','ajustar prótesis completa - maxilar',27),('D5411','ajustar prótesis completa - mandibular',27),('D5421','ajustar la prótesis parcial - maxilar',27),('D5422','ajustar la prótesis parcial - mandibular',27),('D5510','reparación de rotos base de la prótesis completa',28),('D5520','reemplazar los faltantes o dientes rotos - prótesis completa (cada diente)',28),('D5610','reparación base de resina',29),('D5620','reparación de colado',29),('D5630','reparar o reemplazar broche roto',29),('D5640','reemplazar dientes rotos - por diente',29),('D5650','añadir diente para prótesis parcial existente',29),('D5660','añadir broche a prótesis parcial existente',29),('D5670','reemplazar todos los dientes de metal y acrílico sobre armazón colado (maxilar)',29),('D5671','reemplazar todos los dientes de metal y acrílico sobre armazón colado (mandibular)',29),('D5710','rebase prótesis completa superior',30),('D5711','rebase prótesis mandibular completa',30),('D5720','rebase la prótesis parcial superior',30),('D5721','rebase prótesis parcial inferior ',30),('D5730','rectificación prótesis superior completa (sillón)',31),('D5731','rectificación dentadura mandibular completa (sillón)',31),('D5740','rectificación maxilar prótesis parcial (sillón)',31),('D5741','rectificación prótesis parcial inferior (sillón)',31),('D5750','rectificación prótesis superior completa (laboratorio)',31),('D5751','rectificación dentadura mandibular completa (laboratorio)',31),('D5760','rectificación maxilar prótesis parcial (laboratorio)',31),('D5761','rectificación prótesis parcial inferior (laboratorio)',31),('D5810','provisionales prótesis completa (superior)',32),('D5811','completa prótesis provisionales (mandibular)',32),('D5820','provisionales prótesis parcial (maxilar)',32),('D5821','prótesis parcial provisional (mandibular)',32),('D5850','acondicionamiento de los tejidos, maxilar',33),('D5851','tejido acondicionado, mandibular',33),('D5860','sobredentadura - completo, en el informe',33),('D5861','sobredentadura - parcial, en el informe',33),('D5862','accesorio de precisión, por el informe',33),('D5867','reemplazo de una pieza sustituible de semi-precisión o accesorio de precisión (hombre o mujer componente)',33),('D5875','modificación de prótesis removibles después de la cirugía de implantes',33),('D5899','sin especificar prótesis removible procedimiento, en el informe',33),('D5911','moulage facial (sección)',34),('D5912','(completo) faciales moulage',34),('D5913','prótesis nasal',34),('D5914','prótesis auricular',34),('D5915','orbital prótesis',34),('D5916','prótesis oculares',34),('D5919','prótesis faciales',34),('D5922','prótesis del tabique nasal',34),('D5923','prótesis oculares, con carácter interino',34),('D5924','prótesis craneal',34),('D5925','aumento facial prótesis sobre implantes',34),('D5926','nasal prótesis, la sustitución',34),('D5927','prótesis auricular, la sustitución',34),('D5928','prótesis orbital, la sustitución',34),('D5929','faciales prótesis, la sustitución',34),('D5931','obturador prótesis, cirugía',34),('D5932','prótesis obturatriz, definitiva',34),('D5933','prótesis obturatriz, modificación',34),('D5934','prótesis de resección mandibular con brida guía',34),('D5935','prótesis mandibular resección sin brida de la guía',34),('D5936','prótesis obturatriz, con carácter interino',34),('D5937','abrebocas de goma (no para el tratamiento de TTM)',34),('D5951','alimentación de las ayudas',34),('D5952','discursor prótesis ayuda, pediátrica',34),('D5953','discursor prótesis ayuda de un adulto',34),('D5954','prótesis de aumento del paladar',34),('D5955','prótesis elevación del paladar, definitiva',34),('D5958','prótesis elevación del paladar, con carácter interino',34),('D5959','prótesis elevación del paladar, la modificación',34),('D5960',' discursor ayudas de prótesis, la modificación',34),('D5982',' apósito quirúrgico',34),('D5983',' compañía de radiación',34),('D5984',' escudo contra la radiación',34),('D5985',' radiación cono localizador',34),('D5986',' de soporte del gel de flúor',34),('D5987',' comisura férula',34),('D5988',' férula quirúrgica',34),('D5991',' compañía medicamento tópico',34),('D5999',' sin especificar prótesis maxilofacial, en el informe',34),('D6010','quirúrgica de colocación del cuerpo del implante: implante endoóseo',36),('D6012','la colocación quirúrgica de implantes órgano provisional para prótesis de transición: implante endoóseo',36),('D6040','colocación quirúrgica de implante eposteal',36),('D6050','colocación quirúrgica de implante transóseo',36),('D6053','implante / pilar apoyado prótesis removible para desdentados arco completo',38),('D6054','implante / pilar apoyado prótesis removible para desdentados arcada parcialmente',38),('D6055','implantes dentales apoyado la barra de conexión',37),('D6056','prefabricados pilar - incluye la colocación',37),('D6057','Colocar las piezas en - incluye la colocación',37),('D6058','pilar apoyado porcelana / corona de cerámica',40),('D6059','pilar apoyo a la corona de porcelana fundida sobre metal (metal noble de alto)',40),('D6060','pilar apoyo a la corona de porcelana fundida sobre metal (metal predominantemente)',40),('D6061','pilar apoyo a la corona de porcelana fundida sobre metal (metal noble)',40),('D6062','pilar apoyo corona de metal fundido (metal noble de alto)',40),('D6063','pilar apoyo corona de metal fundido (metal predominantemente)',40),('D6064','pilar apoyo corona de metal fundido (metal noble)',40),('D6065','implantosoportado porcelana / corona de cerámica',41),('D6066','implante apoyo porcelana fundida sobre corona de metal (titanio, aleación de titanio, noble de alto metal',41),('D6067','implante metálico apoyado corona (de titanio, aleación de titanio, metal muy noble)',41),('D6068','pilar apoyo de retención para la porcelana / cerámica FPD',42),('D6069','pilar apoyo de retención para la porcelana fundida sobre metal FPD (metal noble de alto)',42),('D6070','pilar apoyo de retención para la porcelana fundida sobre metal FPD (base de metal predominantemente)',42),('D6071','pilar apoyo de retención para la porcelana fundida sobre metal FPD (metal noble)',42),('D6072','pilar apoyo de retención para el metal fundido FPD (metal noble de alto)',42),('D6073','pilar apoyo de retención para el metal fundido FPD (base de metal predominantemente)',42),('D6074','pilar apoyo de retención para el metal fundido FPD (metal noble)',42),('D6075','implante apoyo de retención de cerámica FPD',43),('D6076','implante apoyo de retención para la porcelana fundida sobre metal FPD (titanio,   aleaciones de titanio \n		de metales nobles)',43),('D6077','apoyo de retención del implante de metal fundido FPD (titanio, aleación de titanio, o de metales nobles)',43),('D6078','implante / pilar apoyado prótesis fija para desdentados arco completo',39),('D6079','implante /pilar apoyado prótesis fija de arcada parcialmente edéntula',39),('D6080','mantenimiento de los procedimientos de implantes, incluyendo la remoción de la prótesis, la limpieza de \n		prótesis y los pilares y la reinserción de prótesis',44),('D6090','reparación de prótesis de implantes',44),('D6091','sustitución de semi-precisión o accesorio de precisión (hombre o mujer de componentes) de implante / \n		pilar apoyado prótesis, por archivo adjunto',44),('D6092','implante Recementación / pilar apoyado corona',44),('D6093','implante Recementación / pilar apoyado prótesis parcial fija',44),('D6094','pilar apoyo corona - (titanio)',40),('D6095','reparación pilar del implante',44),('D6100','Extracción del implante',36),('D6190','radiografía / índice de implante quirúrgico',35),('D6194','pilar apoyo corona de retención para FPD - (titanio)',42),('D6199','procedimiento de implante no se especifica, en el informe',44),('D6205','póntico - resina compuesta indirecta por razón',45),('D6210','póntico fundido de metales nobles de alto',45),('D6211','póntico - base de metal fundido predominantemente',45),('D6212','póntico - fundido de metales nobles',45),('D6214','póntico - titanio',45),('D6240','póntico - porcelana fundida sobre metal muy noble ',45),('D6241','póntico - porcelana fundida sobre metal común predominantemente',45),('D6242','póntico porcelana fundida sobre metal noble',45),('D6245','póntico - porcelana / cerámica',45),('D6250','póntico resina con metal muy noble',45),('D6251','póntico - resina con metal predominantemente',45),('D6252','póntico resina con metal noble',45),('D6253','provisional póntico',45),('D6545','retenedor - metal fundido de la resina en condiciones de servidumbre prótesis fija',46),('D6548','retenedor - porcelana / cerámica para la resina de prótesis fija en condiciones de servidumbre',46),('D6600','incrustación- porcelana / cerámica, dos superficies',46),('D6601','Inlay - porcelana / cerámica, tres o más superficies',46),('D6602','Inlay - fundido de metales nobles de alto, dos superficies',46),('D6603','Inlay - fundido de metales nobles de alto, tres o más superficies',46),('D6604','Inlay - base de metal fundido sobre todo, dos superficies',46),('D6605','incrustación - base de metal fundido sobre todo, tres o más superficies',46),('D6606','incrustación - fundido de metales nobles, dos superficies',46),('D6607','Inlay - metal colado noble, tres o más superficies',46),('D6608','onlay - porcelana / cerámica, dos superficies',46),('D6609','onlay - porcelana / cerámica, tres o más superficies',46),('D6610','onlay - fundido de metales nobles de alto, dos superficies',46),('D6611','onlay - fundido de metales nobles de alto, tres o más superficies ',46),('D6612','onlay - base de metal fundido sobre todo, dos superficies',46),('D6613','onlay - base de metal fundido sobre todo, tres o más superficies',46),('D6614','onlay - fundido de metales nobles, dos superficies',46),('D6615','onlay - fundido de metales nobles, tres o más superficies',46),('D6624','Inlay - titanio',46),('D6634','onlay - titanio',46),('D6710','Corona - resina compuesta indirecta por razón',47),('D6720','Corona - resina con metal muy noble',47),('D6721','Corona - resina con metal predominantemente',47),('D6722','Corona - resina con metal noble',47),('D6740','Corona - porcelana / cerámica',47),('D6750','Corona - porcelana fundida sobre metal muy noble',47),('D6751','Corona - porcelana fundida sobre metal común predominantemente',47),('D6752','Corona - porcelana fundida sobre metal noble',47),('D6780','Corona - 3 / 4 fundido de metales nobles de alto',47),('D6781','Corona - 3 / 4 fundido de metal base predominantemente',47),('D6782','Corona - 3 / 4 fundido de metales nobles',47),('D6783','Corona - 3 / 4 de porcelana / cerámica',47),('D6790','Corona - elenco completo de metales nobles de alto',47),('D6791','Corona - elenco completo de metal base predominantemente',47),('D6792','Corona - elenco completo de metales nobles',47),('D6793','corona provisional de retención',47),('D6794','Corona - titanio',47),('D6920','barra de conexión',48),('D6930','recementación prótesis parcial fija',48),('D6940','rompefuerzas',48),('D6950','accesorio de precisión',48),('D6970','posterior y el núcleo, además de parcial de retención de prótesis fijas, de manera indirecta fabricado',48),('D6972','prefabricados post y el núcleo, además de retención parcial prótesis fija',48),('D6973','reconstrucción de muñones para retenedor, incluidos los apoyos',48),('D6975','afrontamiento - metal',48),('D6976','cada adicional fabricado indirectamente post - mismo diente',48),('D6977','prefabricados cada puesto adicional - el mismo diente',48),('D6980','fijo de reparación de prótesis parciales, en el informe',48),('D6985','pediátrica prótesis parcial, fijo',48),('D6999','sin especificar prostodóncico procedimiento fijo, por el informe',48),('D7111','Extracción, remanentes coronal - diente temporal',49),('D7140','Extracción del diente o raíz expuesta',49),('D7210','Extracción quirúrgica de diente erupcionado que requieren la elevación del colgajo mucoperióstico y la \n		extracción ósea y / o sección de un diente',50),('D7220','Extracción de diente impactado - los tejidos blandos',50),('D7230','Extracción de diente impactado - parcialmente óseo',50),('D7240','Extracción de diente impactado - completamente óseo',50),('D7241','Extracción de diente impactado - completamente óseo, con inusual complicaciones quirúrgicas',50),('D7250','Extracción quirúrgica de raíces de los dientes residuales (procedimiento de corte)',50),('D7260','cierre de la fístula oroantrales',51),('D7261','cierre primario de una perforación del seno',51),('D7270','reimplante del diente y / o estabilización de forma accidental o desplazados avulseonado.',51),('D7272','trasplante de dientes (incluye reimplante de un sitio a otro y férulas y / o estabilización)',51),('D7280','acceso quirúrgico de un diente erupcionado',51),('D7282','movilización de erupción del diente o mal posicionados para ayudar a la erupción',51),('D7283','colocación del dispositivo para facilitar la erupción del diente impactado',51),('D7285','biopsia de tejido oral - (hueso duro, diente)',51),('D7286','biopsia de tejido oral - suave',51),('D7287','citología exfoliativa recogida de muestras',51),('D7288','biopsia por cepillado - toma de muestra transepitelial',51),('D7290','reposicionamiento quirúrgico de los dientes',51),('D7291','fibrotomía transeptal / cresta fibrotomía supra, el informe',51),('D7292','colocación quirúrgica: anclaje [dispositivo de husillo temporal conservaron] placa que requieren cirugía',51),('D7293','colocación quirúrgica: dispositivo de anclaje temporal que requieren colgajo quirúrgico',51),('D7294','quirúrgica de colocación: dispositivo de anclaje temporal sin colgajo quirúrgico',51),('D7310','alveoloplastia junto con extracciones - cuatro o más dientes o espacios dentales, por \n		cuadrante',52),('D7311','alveoloplastia junto con extracciones - uno a tres dientes o espacios dentales, por \n		cuadrante',52),('D7320','alveoloplastia no junto con extracciones - cuatro o más dientes o espacios dentales, por cuadrante.',52),('D7321','alveoloplastia no junto con extracciones - uno a tres dientes o espacios dentales, por \n		cuadrante',52),('D7340','vestibuloplastia - la extensión del reborde (epitelización secundaria)',53),('D7350','vestibuloplastia - la extensión del reborde (incluyendo los injertos de tejidos blandos, músculos \n		reinserción, revisión de los datos adjuntos de tejidos blandos y la gestión de hipertrofia y hiperplasia \n		tejido)',53),('D7410','escisión de lesión benigna hasta 1,25 cm',54),('D7411','escisión de lesión benigna mayor de 1,25 cm',54),('D7412','escisión de lesión benigna, complicada',54),('D7413','escisión de lesión maligna de hasta 1,25 cm',54),('D7414','escisión de lesión maligna superior a 1,25 cm',54),('D7415','escisión de lesión maligna, complicado',54),('D7440','extirpación de un tumor maligno - diámetro de la lesión hasta 1,25 cm',55),('D7441','extirpación de un tumor maligno - diámetro de la lesión superior a 1,25 cm',55),('D7450','eliminación de odontogénico quiste benigno o un tumor - diámetro de la lesión hasta 1,25 cm',55),('D7451','eliminación de odontogénico quiste benigno o un tumor - diámetro de la lesión superior a 1,25 cm',55),('D7460','eliminación de los no odontogénico quiste benigno o un tumor - diámetro de la lesión hasta 1,25 cm',55),('D7461','eliminación de los no odontogénico quiste benigno o un tumor - diámetro de la lesión superior a 1,25 cm',55),('D7465','destrucción de la lesión (s) por el método físico o químico, en el informe',54),('D7471','eliminación de exostosis lateral (maxilar o mandíbula)',56),('D7472','eliminación del torus palatino',56),('D7473','eliminación de torus mandibular',56),('D7485','reducción quirúrgica de la tuberosidad ósea',56),('D7490','resección radical del maxilar o la mandíbula',56),('D7510','incisión y drenaje de absceso - tejido blando intraoral',57),('D7511','incisión y drenaje de absceso - tejido blando intrabucal - complicado (incluye drenaje de múltiples \n		espacios faciales)',57),('D7520','incisión y drenaje de absceso - tejidos blandos extraorales',57),('D7521','incisión y drenaje de absceso - tejidos blandos extraorales - complicado (incluye drenaje de múltiples \n		espacios faciales)',57),('D7530','extracción de cuerpo extraño de la mucosa, la piel o tejido alveolar subcutáneo \n		la eliminación de la reacción D7540 producir cuerpos extraños, sistema musculoesquelético',57),('D7550','ostectomía parcial / secuestrectomía para la remoción de hueso no vital-',57),('D7560','maxilar sinusotomía para la separación de los fragmentos del diente o cuerpo extraño',57),('D7610','reducción maxilar abierta (dientes de inmovilizado, si está presente)',58),('D7620','reducción maxilar cerrada (dientes de inmovilizado, si está presente)',58),('D7630','reducción mandibular abierta (dientes de inmovilizado, si está presente)',58),('D7640','reducción mandibular cerrada (dientes de inmovilizado, si está presente)',58),('D7650','malar y / o arco cigomático - reducción abierta',58),('D7660','malar y / o arco cigomático - la reducción cerrada',58),('D7670','reducción alveolar cerrada, puede incluir la estabilización de los dientes',58),('D7671','reducción alveolar abierta, puede incluir la estabilización de los dientes',58),('D7680','huesos faciales - la reducción de la fijación y complicada con múltiples abordajes quirúrgicos ',58),('D7710','reducción abierta de maxilar',59),('D7720','reducción cerrada  de maxilar',59),('D7730','reducción abierta  de mandíbula',59),('D7740','reducción cerrada de mandíbula',59),('D7750','malar y / o arco cigomático - reducción abierta',59),('D7760','malar y / o arco cigomático - la reducción cerrada',59),('D7770','estabilización del alveolo- reducción abierta de los dientes',59),('D7771','estabilización de alveolo- reducción cerrada de los dientes',59),('D7780','reducción y  fijación de los huesos faciales-complicada con múltiples abordajes quirúrgicos',59),('D7810','reducción abierta de la luxación',60),('D7820','reducción cerrada de la luxación',60),('D7830','manipulación bajo anestesia',60),('D7840','condilectomía',60),('D7850','discectomía quirúrgica, con o sin implan',60),('D7852','reparación de discos',60),('D7854','sinovectomía',60),('D7856','miotomía',60),('D7858','reconstrucción de articulaciones',60),('D7860','artrotomía',60),('D7865','artroplastia',60),('D7870','artrocentesis',60),('D7871','Lisis artroscópica con/sin lavado',60),('D7872','artroscopia - diagnóstico, con o sin biopsia',60),('D7873','artroscopia - quirúrgica: lavado y lisis de adherencias',60),('D7874','artroscopia - quirúrgico: disco de reposicionamiento y la estabilización',60),('D7875','artroscopia - quirúrgico: sinovectomía',60),('D7876','artroscopia - quirúrgico: discectomía',60),('D7877','artroscopia - quirúrgico: desbridamiento',60),('D7880','dispositivo ortopédico oclusal, por informe',60),('D7899','sin especificar la terapia de la DM, en el informe',60),('D7910','sutura de heridas pequeñas recientes de hasta 5 cm',61),('D7911','sutura complicado - hasta 5 cm',62),('D7912','sutura complicado - superior a 5 cm',62),('D7920','injertos de piel (identificar defecto cubierto, la ubicación y el tipo de injerto)',63),('D7940','osteoplastia - de las deformidades ortognática',63),('D7941','osteotomía - ramas de la mandíbula',63),('D7943','osteotomía - ramas de la mandíbula con injerto óseo',63),('D7944','osteotomía - segmentado o subapical',63),('D7945','osteotomia-cuerpo de la mandíbula',63),('D7946','LeFort I (maxilar - total)',63),('D7947','LeFort I (maxilar - segmentada)',63),('D7948','de LeFort II o III de LeFort (osteoplastia de los huesos faciales de la hipoplasia del tercio medio facial o retrusión) - sin injerto óseo',63),('D7949','LeFort II o III de LeFort - con injerto óseo',63),('D7950','injerto osteoperiosteal, óseo o de cartílago de la mandíbula o el maxilar - autógeno o no autógeno.',63),('D7951','elevaciones de seno con hueso o sucedáneos',63),('D7953','injerto óseo de reemplazo para la preservación de cresta - por sitio',63),('D7955','reparación de suave maxilofacial y / o defecto de los tejidos duros',63),('D7960','frenectomía (o frenotomía) - procedimiento separado',63),('D7963','frenectoplastía',63),('D7970','extirpación de tejido hiperplásico - por arco',63),('D7971','excisión de la encía pericoronarios',63),('D7972','reducción quirúrgica de la tuberosidad fibrosa',63),('D7980','sialolithotomy',63),('D7981','excisión de las glándulas salivales',63),('D7982','sialodochoplasty',63),('D7983','cierre de fístula salival',63),('D7990','traqueotomía de emergencia',63),('D7991','coronoidectomía',63),('D7995','injerto sintético - huesos de la mandíbula o la cara',63),('D7996','implante mandibular con fines de aumento (con exclusión de reborde alveolar)',63),('D7997','retirar el aparato (no por el dentista que colocó aparato), incluye la eliminación de archbar',63),('D7998','colocación intraoral de un dispositivo de fijación no en relación con una fractura',63),('D7999','sin especificar procedimiento de cirugía oral, en el informe',63),('D8010','limitado tratamiento ortodóncico de la dentición primaria',64),('D8020','limitado tratamiento ortodóncico de la dentición de transición',64),('D8030','limitado tratamiento ortodóncico de la dentición adolescente',64),('D8040','limitado tratamiento ortodóncico de la dentición adulta',64),('D8050','tratamiento interceptivo ortodóncico de la dentición primaria',65),('D8060','tratamiento interceptiv ortodóncico de la dentición de transición',65),('D8070','tratamiento completo ortodóncico de la dentición de transición',66),('D8080','tratamiento completo ortodóncico de la dentición adolescente',66),('D8090','tratamiento completo ortodóncico de la dentición adulta',66),('D8210','terapia aparato removible',67),('D8220','tratamiento con aparatos fijos',67),('D8660','tratamiento previo a la visita de ortodoncia',68),('D8670','visita periódica del tratamiento de ortodoncia (como parte del contrato)',68),('D8680','ortodoncia de retención (eliminación de los aparatos, la construcción y colocación de retención (s))',68),('D8690','tratamiento de ortodoncia (facturación alternativa a una tarifa de contrato)',68),('D8691','reparación del aparato de ortodoncia',68),('D8692','reemplazo de bracket roto o perdido',68),('D8693','recidimentación  o recementación, y / o reparación, según sea necesario, de los retenedores fijos',68),('D8999','sin especificar el procedimiento de ortodoncia',68),('D9110','paliativo (de emergencia) el tratamiento del dolor dental - procedimiento de menores',69),('D9120','prótesis parcial fija de seccionamiento',69),('D9210','anestesia local, no en relación con procedimientos quirúrgicos o quirúrgicos',70),('D9211','anestesia regional',70),('D9212','división del trigémino bloqueo anestésico',70),('D9215','anestesia local',70),('D9220','sedación profunda / anestesia general - primeros 30 minutos',70),('D9221','sedación profunda / anestesia general - cada 15 minutos adicionales',70),('D9230','analgesia, ansiolisis, la inhalación de óxido nitroso',70),('D9241','sedación intravenosa consciente / analgesia - primeros 30 minutos',70),('D9242','sedación consciente intravenosa / analgesia - cada 15 minutos adicionales',70),('D9248','sedación consciente intravenosa no',70),('D9310','consulta de servicio de diagnóstico proporcionado por el dentista u otro médico que solicita dentista o médico',71),('D9410','casa / llamada ampliado centro de atención',72),('D9420','llamada del hospital',72),('D9430','visita al consultorio para observación (durante el horario regular) - no hay otros servicios regulares',72),('D9440','visita al consultorio - después de las horas regulares',72),('D9450','presentación del caso, la planificación del tratamiento detallado y extenso',72),('D9610','terapéutica drogas por vía parenteral, administración única',73),('D9612','drogas terapéuticas parenteral, administración de dos o más medicamentos diferentes',73),('D9630','otras drogas y / o medicamentos',73),('D9910','aplicación del medicamento de sensibilización',74),('D9911','aplicación de resina de sensibilización de la superficie del cuello / o de la raíz, por diente',74),('D9920','manejo de la conducta',74),('D9930','tratamiento de las complicaciones (post-quirúrgico) - circunstancias excepcionales',74),('D9940','ajuste oclusal',74),('D9941','fabricación de protectores bucales deportivos',74),('D9942','reparación y / o rectificación de ajuste oclusal',74),('D9950','análisis de la oclusión – mordida profunda',74),('D9951','ajuste oclusal - limitada',74),('D9952','ajuste oclusal- completa',74),('D9970','microabrasión del esmalte',74),('D9971','odontoplastía 1-2 dientes; incluye la eliminación de las proyecciones del esmalte',74),('D9972','blanqueamiento externos - por arco',74),('D9973','blanqueamientos externos - por diente',74),('D9974','blanqueamiento interno - por diente',74),('D9999','sin especificar procedimiento complementario',74);
/*!40000 ALTER TABLE `nomprocedimiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_tbl`
--

DROP TABLE IF EXISTS `paciente_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_tbl` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `ced_paciente` char(10) NOT NULL,
  `priNom_paciente` varchar(30) NOT NULL,
  `segNom_paciente` varchar(30) DEFAULT NULL,
  `priApe_paciente` varchar(30) NOT NULL,
  `segApe_paciente` varchar(30) DEFAULT NULL,
  `eda_paciente` tinyint unsigned NOT NULL,
  `sex_paciente` enum('Masculino','Femenino') NOT NULL,
  `ema_paciente` varchar(150) DEFAULT NULL,
  `tel_paciente` char(10) DEFAULT NULL,
  `nomRes_paciente` varchar(30) DEFAULT NULL,
  `parRes_paciente` varchar(30) DEFAULT NULL,
  `telRes_paciente` char(10) DEFAULT NULL,
  `create_paciente` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_paciente` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `ced_paciente_UNIQUE` (`ced_paciente`),
  FULLTEXT KEY `priNom_paciente_Index` (`priNom_paciente`,`segNom_paciente`,`priApe_paciente`,`segApe_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_tbl`
--

LOCK TABLES `paciente_tbl` WRITE;
/*!40000 ALTER TABLE `paciente_tbl` DISABLE KEYS */;
INSERT INTO `paciente_tbl` VALUES (1,'1315354298','Ronny','Bryan','Forty','Palma',23,'Masculino','rbfp90@gmail.com','0985542964',NULL,NULL,NULL,'2023-02-13 02:52:31','2023-05-19 04:59:07'),(2,'1304785425','Marcos','Antonio','Lopes','Palma',27,'Masculino','marcosAnton@gmail.com','0948563212',NULL,NULL,NULL,'2023-02-13 02:52:31','2023-05-10 11:08:20'),(3,'1386975232','Mario',NULL,'Giler',NULL,13,'Masculino','gilermario04@gmail.com',NULL,'Mario Giler','Padre','0985445221','2023-02-13 02:52:31','2023-06-04 12:26:38'),(4,'1305219661','Maria','Angelica','Forty','Benitez',34,'Masculino','mariaAngelical@gmail.com','0984654645','Rosa Santos','Mamá','06556556','2023-02-13 02:52:31','2023-05-13 12:19:54'),(5,'1315127896','Amelia',NULL,'Forty','Cedeño',6,'Femenino',NULL,NULL,'Juan Carlos Forty Palma','Padre','0945236547','2023-02-13 02:52:31','2023-05-12 04:50:47'),(6,'1313327855','Sofía',NULL,'Forty',NULL,4,'Femenino',NULL,NULL,'Javier Forty Palma','Padre','0962351424','2023-02-13 02:52:31','2023-06-04 12:23:30'),(7,'1314783254','Jaynner',NULL,'Forty',NULL,12,'Masculino',NULL,NULL,'Marianela Cedeño','Madre','0955215871','2023-02-13 02:52:31','2023-05-14 02:50:38'),(8,'1305458528','Ana','María','Moreno','Salgado',27,'Femenino','puedeserpa@gmail.com','0985542964',NULL,NULL,NULL,'2023-02-13 03:53:11','2023-05-13 02:42:07'),(10,'1305343335','Ana','Elizabeth','Cedeño',NULL,27,'Femenino','asaxc@gmail.com','0985542964',NULL,NULL,NULL,'2023-02-21 23:32:34','2023-05-12 09:43:24'),(222,'1204533421','Valeria','Fernanda','Gomez','Perez',15,'Femenino','vale14@gmail.com','0985412265','Ana MarÍa Gonzales Perez','Mamá','0655565935','2023-05-12 11:40:02','2023-06-04 18:36:57'),(264,'3434352223','Juan','Carlos','Forty','Palma',33,'Masculino','juancarlosforty@hotmail.com','0656564658',NULL,NULL,NULL,'2023-05-23 12:00:36','2023-06-14 04:50:01'),(286,'1315442454','Carolina',NULL,'Herrera',NULL,22,'Femenino',NULL,NULL,NULL,NULL,NULL,'2023-06-17 21:48:30','2023-06-17 21:48:30');
/*!40000 ALTER TABLE `paciente_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plandiagnostico_tbl`
--

DROP TABLE IF EXISTS `plandiagnostico_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plandiagnostico_tbl` (
  `id_planDiag` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `tipo_planDiag` enum('Diagnóstico','Terapéutico','Educacional') NOT NULL,
  `exam_planDiag` enum('Rayos X','Biometria','Química Sanguinea','Otro') DEFAULT NULL,
  `id_tipoTratam` int DEFAULT NULL,
  `desc_planDiag` text,
  PRIMARY KEY (`id_planDiag`),
  KEY `fk_planes_Diagnostico_consulta_tbl1_idx` (`id_consulta`),
  KEY `fk_procedimiento_plan_diagnostico_idx` (`id_tipoTratam`),
  CONSTRAINT `fk_planes_Diagnostico_consulta_tbl1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE,
  CONSTRAINT `fk_tratamiento_planTerapeutico` FOREIGN KEY (`id_tipoTratam`) REFERENCES `tipotratamiento_tbl` (`id_tipoTratam`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plandiagnostico_tbl`
--

LOCK TABLES `plandiagnostico_tbl` WRITE;
/*!40000 ALTER TABLE `plandiagnostico_tbl` DISABLE KEYS */;
INSERT INTO `plandiagnostico_tbl` VALUES (2,8,'Diagnóstico','Otro',NULL,NULL),(4,8,'Terapéutico',NULL,4,'Descripcion generica 2'),(5,8,'Educacional',NULL,NULL,'v2 Técnica de cepillado de Bass, uso de hilo dental y enjuagues con clorhexidina al 0.12%'),(6,8,'Educacional',NULL,NULL,'v3 Técnica de cepillado de Bass, uso de hilo dental y enjuagues con clorhexidina al 0.12%'),(7,8,'Educacional',NULL,NULL,'v4 Técnica de cepillado de Bass, uso de hilo dental y enjuagues con clorhexidina al 0.12%'),(8,8,'Diagnóstico','Química Sanguinea',NULL,'nuevo plan de diagnostico v2'),(10,8,'Terapéutico',NULL,1,'profilaxis profilaxis profilaxis profilaxis profilaxis profilaxis profilaxis profilaxis profilaxis profilaxis'),(11,8,'Diagnóstico','Rayos X',NULL,'bbbbbbbbbbbbbb'),(12,8,'Terapéutico',NULL,11,'Aplicar crema en las encías Aplicar crema en las encías Aplicar crema en las encías'),(13,8,'Terapéutico',NULL,5,'Endodoncia Endodoncia Endodoncia Endodoncia Endodoncia Endodoncia'),(17,47,'Diagnóstico','Biometria',NULL,'AAAAAAAAAA');
/*!40000 ALTER TABLE `plandiagnostico_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescripciones_tbl`
--

DROP TABLE IF EXISTS `prescripciones_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescripciones_tbl` (
  `id_presc` int NOT NULL AUTO_INCREMENT,
  `id_tratam` int NOT NULL,
  `desc_presc` text NOT NULL,
  `dosi_presc` text,
  PRIMARY KEY (`id_presc`),
  KEY `fk_tratamiento_presc_idx` (`id_tratam`),
  CONSTRAINT `fk_tratamiento_presc` FOREIGN KEY (`id_tratam`) REFERENCES `tratamiento_tbl` (`id_tratam`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescripciones_tbl`
--

LOCK TABLES `prescripciones_tbl` WRITE;
/*!40000 ALTER TABLE `prescripciones_tbl` DISABLE KEYS */;
INSERT INTO `prescripciones_tbl` VALUES (2,1,'No ingerir alimentos en 5 horas',NULL),(3,1,'Crema Dentacure','Aplicar cada 6 horas '),(4,1,'Paracetamol','500g cada 6 horas '),(8,8,'Paracetamol v1','500g cada 6 horas '),(9,8,'Paracetamol v2','500g cada 6 horas '),(10,8,'aaaaaaaa','bbbbbbbbb '),(21,69,'presc1','dosis1'),(23,69,'presc2',''),(24,82,'AA','A2'),(25,82,'BB','B2');
/*!40000 ALTER TABLE `prescripciones_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimiento_tbl`
--

DROP TABLE IF EXISTS `procedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedimiento_tbl` (
  `id_proced` int NOT NULL AUTO_INCREMENT,
  `cod_proced` char(5) DEFAULT NULL,
  `nom_proced` varchar(500) DEFAULT NULL,
  `desc_proced` text,
  PRIMARY KEY (`id_proced`),
  UNIQUE KEY `index_codigoProced` (`cod_proced`),
  UNIQUE KEY `nom_proced_UNIQUE` (`nom_proced`),
  FULLTEXT KEY `index_nom_proced` (`nom_proced`),
  CONSTRAINT `fk_nomenclatura_procedimiento` FOREIGN KEY (`cod_proced`) REFERENCES `nomprocedimiento_tbl` (`cod_nomProced`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimiento_tbl`
--

LOCK TABLES `procedimiento_tbl` WRITE;
/*!40000 ALTER TABLE `procedimiento_tbl` DISABLE KEYS */;
INSERT INTO `procedimiento_tbl` VALUES (3,'D1110','II. Preventivo (Profilaxis Dental) - Profilaxis - profilaxis adultos','La profilaxis dental es el procedimiento de higiene dental cuyo objetivo es limpiar las superficies dentarias, retirando el sarro dental o placa calcificada que se encuentra adherido y acumulado en aquellas zonas de los dientes que no son accesibles con el cepillado dental.'),(4,'D2330','III. Restaurativo - A base de resina compuesta Restauraciones – Directo - a base de resina compuesta - una superficie, anterior','descripcion general'),(30,'D1120','II. Preventivo (Profilaxis Dental) - Profilaxis - profilaxis infantil',NULL),(31,'D8040','XI. Ortodoncia - Tratamiento de ortodoncia - limitado tratamiento ortodóncico de la dentición adulta',NULL),(32,'D2712','III. Restaurativo - Coronas - Restauraciones individual sólo -  Corona - 3.4 basado en resina compuesta (indirecta)',NULL),(33,'D9310','XII. Coadyuvante de Servicios Generales - Consulta Profesional - consulta de servicio de diagnóstico proporcionado por el dentista u otro médico que solicita dentista o médico',NULL),(34,NULL,'Profilaxis Especial',NULL),(35,'D3221','IV. Endodoncia - Pulpotomía - pulpar, desbridamiento los dientes primarios y permanentes',NULL);
/*!40000 ALTER TABLE `procedimiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signovital_tbl`
--

DROP TABLE IF EXISTS `signovital_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signovital_tbl` (
  `id_signoVital` int NOT NULL AUTO_INCREMENT,
  `temp_signoVital` varchar(30) DEFAULT NULL,
  `presArt_signoVital` varchar(30) DEFAULT NULL,
  `freCar_signoVital` varchar(30) DEFAULT NULL,
  `freRes_signoVital` varchar(30) DEFAULT NULL,
  `id_consulta` int NOT NULL,
  PRIMARY KEY (`id_signoVital`),
  UNIQUE KEY `id_consulta_UNIQUE` (`id_consulta`),
  KEY `fk_signoVital_tbl_consulta_tbl1_idx` (`id_consulta`),
  CONSTRAINT `fk_signoVital_tbl_consulta_tbl1` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signovital_tbl`
--

LOCK TABLES `signovital_tbl` WRITE;
/*!40000 ALTER TABLE `signovital_tbl` DISABLE KEYS */;
INSERT INTO `signovital_tbl` VALUES (3,'24','120/80','','',8),(4,'25','120/60','60','50',44),(5,'27','120/81','857','35',3),(6,'23','120/70','','',11),(7,'21','120/80','12','',5),(8,'26','','','',45),(11,'31','','','',46),(12,'24','','','',12),(13,'26','','','',14);
/*!40000 ALTER TABLE `signovital_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subtiprocedimiento_tbl`
--

DROP TABLE IF EXISTS `subtiprocedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtiprocedimiento_tbl` (
  `id_Proce` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `id_tituloProced` tinyint NOT NULL,
  `subti_Proce` varchar(400) NOT NULL,
  PRIMARY KEY (`id_Proce`),
  KEY `fk_tituloProced_idx` (`id_tituloProced`),
  CONSTRAINT `fk_tituloProced` FOREIGN KEY (`id_tituloProced`) REFERENCES `tituloprocedimiento_tbl` (`id_tituloProced`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subtiprocedimiento_tbl`
--

LOCK TABLES `subtiprocedimiento_tbl` WRITE;
/*!40000 ALTER TABLE `subtiprocedimiento_tbl` DISABLE KEYS */;
INSERT INTO `subtiprocedimiento_tbl` VALUES (1,1,'Evaluaciones clínicas orales'),(2,1,'Radiografías / Diagnóstico por la Imagen (incluidos los de interpretación) intraoral'),(3,1,'Pruebas y exámenes'),(4,1,'Laboratorio de Patología Bucal'),(5,2,'Profilaxis'),(6,2,'Tratamiento tópico de fluoruro (procedimiento en el consultorio)'),(7,2,'Otros Servicios Preventivos'),(8,3,'Restauraciones de Amalgama (incluyendo pulido)'),(9,3,'A base de resina compuesta Restauraciones – Directo'),(10,3,'Restauraciones de oro de lámina'),(11,3,'Inlay / Onlay Restauraciones'),(12,3,'Coronas - Restauraciones individual sólo'),(13,3,'Servicios de restauración'),(14,4,'Recubrimiento de la Pulpa'),(15,4,'Pulpotomía'),(16,4,'Terapia de Endodoncia en dientes temporales'),(17,4,'La terapia endodóntica (incluido el plan de tratamiento, procedimientos   clínicos y Atención de seguimiento)'),(18,4,'Retratamiento de endodoncia'),(19,4,'Apexificación / Procedimiento recalcificación'),(20,4,'Apicectomía / Servicios perirradicular'),(21,4,'Otros procedimientos de endodoncia'),(22,5,'Servicios de Cirugía (incluida la atención postoperatoria usual)'),(23,5,'Servicio de Cirugía no periodontal'),(24,5,'Otros Servicios periodontal'),(25,6,'Las dentaduras completas'),(26,6,'Las dentaduras parciales (ejemplo de rutina después de la entrega de atención)'),(27,6,'Las adaptaciones de prótesis dentales'),(28,6,'Las reparaciones de prótesis completa'),(29,6,'Las reparaciones de dentaduras parciales'),(30,6,'Procedimientos prótesis Rebase'),(31,6,'Procedimientos prótesis Rectificación'),(32,6,'Prótesis provisional'),(33,6,'Otros servicios de prótesis removibles'),(34,7,'Prótesis Maxilofacial'),(35,8,'Servicios de Pre-Quirúrgico'),(36,8,'Servicios de Cirugía'),(37,8,'Implantes para prótesis Estructuras de soporte'),(38,8,'Implante / pilar compatibles prótesis removibles'),(39,8,'Implante / pilar compatibles fija prótesis (prótesis híbrida)'),(40,8,'Coronas individuales, el apoyo del pilar'),(41,8,'Coronas individuales, el apoyo del implante'),(42,8,'Prótesis parcial fija, Pilar compatibles'),(43,8,'Prótesis fijas, implantes compatibles'),(44,8,'Otros Servicios del implante'),(45,9,'Parcial Pónticos prótesis fija'),(46,9,'Los retenedores fijos dentadura parcial - Embutidos / sobrepuestos'),(47,9,'Los retenedores fijos dentadura parcial – Coronas'),(48,9,'Otros Servicios de prótesis parcial fija'),(49,10,'Extracciones (incluye anestesia local, sutura, si es necesario, y el cuidado postoperatorio de rutina)'),(50,10,'Extracciones quirúrgicas (incluye anestesia local, sutura, si es necesario, y cuidados postoperatorios)'),(51,10,'Otros Procedimientos Quirúrgicos'),(52,10,'Alveoloplastia - Preparación quirúrgica de Ridge para prótesis'),(53,10,'Vestibuloplastia'),(54,10,'Excisión quirúrgica de las lesiones de tejido blando'),(55,10,'Excisión quirúrgica de las lesiones intra-óseo'),(56,10,'Extirpación de tejido óseo'),(57,10,'Incisión quirúrgica'),(58,10,'El tratamiento de las fracturas – Simple'),(59,10,'Tratamiento de las fracturas – Compuestas'),(60,10,'Reducción de la luxación y gestión de las otras disfunciones de la Articulación Temporomandibular'),(61,10,'La reparación de heridas traumáticas'),(62,10,'Suturas complicadas (Reconstrucción que requieren un tratamiento delicado de los tejidos y Wide'),(63,10,'Reparación de otros procedimientos'),(64,11,'Tratamiento de ortodoncia'),(65,11,'Tratamiento de ortodoncia interceptiva'),(66,11,'Integral de Ortodoncia'),(67,11,'Tratamiento de Menores para control de hábitos nocivos'),(68,11,'Servicios de ortodoncia'),(69,12,'El tratamiento no clasificados'),(70,12,'Anestesia'),(71,12,'Consulta Profesional'),(72,12,'Las visitas profesionales'),(73,12,'Drogas'),(74,12,'Varios Servicios');
/*!40000 ALTER TABLE `subtiprocedimiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoconsulta_tbl`
--

DROP TABLE IF EXISTS `tipoconsulta_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoconsulta_tbl` (
  `id_tipoConsul` int NOT NULL AUTO_INCREMENT,
  `tipo_tipoConsul` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipoConsul`),
  UNIQUE KEY `tipo_consulta_UNIQUE` (`tipo_tipoConsul`),
  FULLTEXT KEY `full_index_desc` (`tipo_tipoConsul`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoconsulta_tbl`
--

LOCK TABLES `tipoconsulta_tbl` WRITE;
/*!40000 ALTER TABLE `tipoconsulta_tbl` DISABLE KEYS */;
INSERT INTO `tipoconsulta_tbl` VALUES (17,'Cambio o arreglo de aparato de ortondoncia'),(1,'Chequeo trimestral'),(4,'Extraccion de pieza dental'),(3,'Primera consulta'),(2,'Revisión de rutina v4');
/*!40000 ALTER TABLE `tipoconsulta_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipopago_tbl`
--

DROP TABLE IF EXISTS `tipopago_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipopago_tbl` (
  `id_tipPago` int NOT NULL AUTO_INCREMENT,
  `desc_tipPago` varchar(500) NOT NULL,
  `prec_tipPago` decimal(10,2) NOT NULL,
  `id_proced` int DEFAULT NULL,
  `id_tipoConsul` int DEFAULT NULL,
  PRIMARY KEY (`id_tipPago`),
  UNIQUE KEY `desc_tipPago_UNIQUE` (`desc_tipPago`),
  KEY `fk_tipoPago_tbl_procedimiento_tbl1_idx` (`id_proced`),
  KEY `fk_tipoPago_tbl_tipoConsulta_tbl1_idx` (`id_tipoConsul`),
  FULLTEXT KEY `index_desctipoPago` (`desc_tipPago`),
  CONSTRAINT `fk_tipoPago_tbl_procedimiento_tbl1` FOREIGN KEY (`id_proced`) REFERENCES `procedimiento_tbl` (`id_proced`) ON DELETE CASCADE,
  CONSTRAINT `fk_tipoPago_tbl_tipoConsulta_tbl1` FOREIGN KEY (`id_tipoConsul`) REFERENCES `tipoconsulta_tbl` (`id_tipoConsul`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipopago_tbl`
--

LOCK TABLES `tipopago_tbl` WRITE;
/*!40000 ALTER TABLE `tipopago_tbl` DISABLE KEYS */;
INSERT INTO `tipopago_tbl` VALUES (1,'Pago por Consulta - Chequeo trimestral',20.00,NULL,1),(2,'Pago por Consulta - Revisión de rutina v4',28.00,NULL,2),(3,'Pago por Consulta - Primera consulta',15.00,NULL,3),(5,'Pago por procedimiento - II. Preventivo (Profilaxis Dental) - Profilaxis - profilaxis adultos',25.43,3,NULL),(6,'Pago por Consulta - Extracción de pieza dental',15.00,NULL,4),(7,'Pago por procedimiento - III. Restaurativo - A base de resina compuesta Restauraciones – Directo - a base de resina compuesta - una superficie, anterior',45.80,4,NULL),(11,'Venta de enjuage bucal oral B',7.50,NULL,NULL),(45,'Pago por Procedimiento - II. Preventivo (Profilaxis Dental) - Profilaxis - profilaxis infantil',20.00,30,NULL),(46,'Pago por Procedimiento - XI. Ortodoncia - Tratamiento de ortodoncia - limitado tratamiento ortodóncico de la dentición adulta',35.00,31,NULL),(47,'Pago por Procedimiento - III. Restaurativo - Coronas - Restauraciones individual sólo -  Corona - 3.4 basado en resina compuesta (indirecta)',35.00,32,NULL),(48,'Pago por procedimiento - XII. Coadyuvante de Servicios Generales - Consulta Profesional - consulta de servicio de diagnóstico proporcionado por el dentista u otro médico que solicita dentista o médico',15.00,33,NULL),(49,'Pago por Consulta - Cambio o arreglo de aparato de ortondoncia',15.00,NULL,17),(50,'Pago por Procedimiento - Profilaxis Especial',20.00,34,NULL),(51,'Pago por Procedimiento - IV. Endodoncia - Pulpotomía - pulpar, desbridamiento los dientes primarios y permanentes',25.00,35,NULL);
/*!40000 ALTER TABLE `tipopago_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotratamiento_tbl`
--

DROP TABLE IF EXISTS `tipotratamiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipotratamiento_tbl` (
  `id_tipoTratam` int NOT NULL AUTO_INCREMENT,
  `tipo_tipoTratam` enum('Clínico','Preventivo','Curativo') NOT NULL,
  `tratam_tipoTratam` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tipoTratam`),
  FULLTEXT KEY `full_index_desc` (`tratam_tipoTratam`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotratamiento_tbl`
--

LOCK TABLES `tipotratamiento_tbl` WRITE;
/*!40000 ALTER TABLE `tipotratamiento_tbl` DISABLE KEYS */;
INSERT INTO `tipotratamiento_tbl` VALUES (1,'Preventivo','Profilaxis'),(2,'Clínico','Operatoria Dental'),(4,'Clínico','Sellante'),(5,'Clínico','Endodoncia'),(11,'Curativo','Aplicar crema en las encías ');
/*!40000 ALTER TABLE `tipotratamiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tituloprocedimiento_tbl`
--

DROP TABLE IF EXISTS `tituloprocedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tituloprocedimiento_tbl` (
  `id_tituloProced` tinyint NOT NULL AUTO_INCREMENT,
  `nom_tituloProced` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_tituloProced`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tituloprocedimiento_tbl`
--

LOCK TABLES `tituloprocedimiento_tbl` WRITE;
/*!40000 ALTER TABLE `tituloprocedimiento_tbl` DISABLE KEYS */;
INSERT INTO `tituloprocedimiento_tbl` VALUES (1,'I. Exploración y Diagnóstico'),(2,'II. Preventivo (Profilaxis Dental)'),(3,'III. Restaurativo'),(4,'IV. Endodoncia'),(5,'V. Periodoncia'),(6,'VI. Prótesis (extraíble)'),(7,'VII. Prótesis Maxilofacial'),(8,'VIII. Implantes'),(9,'IX. Prótesis dentales, fija'),(10,'X. Cirugía Oral y Maxilofacial'),(11,'XI. Ortodoncia'),(12,'XII. Coadyuvante de Servicios Generales');
/*!40000 ALTER TABLE `tituloprocedimiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento_procedimiento_tbl`
--

DROP TABLE IF EXISTS `tratamiento_procedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento_procedimiento_tbl` (
  `id_tratam_proced` int NOT NULL AUTO_INCREMENT,
  `id_tratam` int NOT NULL,
  `id_proced` int NOT NULL,
  `fecha_tratam_proced` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tratam_proced`),
  KEY `fk_Tratamiento_has_procedimiento_procedimiento1_idx` (`id_proced`),
  KEY `fk_Tratamiento_has_procedimiento_Tratamiento1_idx` (`id_tratam`),
  CONSTRAINT `fk_Tratamiento_has_procedimiento_procedimiento1` FOREIGN KEY (`id_proced`) REFERENCES `procedimiento_tbl` (`id_proced`),
  CONSTRAINT `fk_Tratamiento_has_procedimiento_Tratamiento1` FOREIGN KEY (`id_tratam`) REFERENCES `tratamiento_tbl` (`id_tratam`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento_procedimiento_tbl`
--

LOCK TABLES `tratamiento_procedimiento_tbl` WRITE;
/*!40000 ALTER TABLE `tratamiento_procedimiento_tbl` DISABLE KEYS */;
INSERT INTO `tratamiento_procedimiento_tbl` VALUES (3,1,4,'2023-02-19 21:03:21'),(4,1,3,'2023-02-19 21:03:21'),(8,6,3,'2023-02-19 21:03:21'),(9,6,3,'2023-02-19 21:03:21'),(12,8,4,'2023-02-22 11:25:15'),(13,8,3,'2023-02-22 11:25:21'),(47,69,32,'2023-06-11 02:04:37'),(49,69,31,'2023-06-11 02:10:06'),(50,69,33,'2023-06-11 02:10:06'),(52,78,30,'2023-06-11 05:03:35'),(53,78,31,'2023-06-11 05:03:35'),(61,81,4,'2023-06-12 09:15:55'),(64,82,33,'2023-06-12 21:23:01'),(65,83,3,'2023-06-13 00:20:30'),(66,84,34,'2023-06-13 00:41:40'),(67,85,35,'2023-06-13 01:39:21'),(68,79,32,'2023-06-13 07:48:47');
/*!40000 ALTER TABLE `tratamiento_procedimiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento_tbl`
--

DROP TABLE IF EXISTS `tratamiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento_tbl` (
  `id_tratam` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `codigoCIE` char(4) DEFAULT NULL,
  `fecha_tratam` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tratam`),
  KEY `fk_consulta_tratamiento_idx` (`id_consulta`),
  KEY `fk_enfermedad_CIE_idx` (`codigoCIE`),
  CONSTRAINT `fk_consulta_tratamiento` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE,
  CONSTRAINT `fk_enfermedad_CIE` FOREIGN KEY (`codigoCIE`) REFERENCES `enfermedades_cie.10` (`codigoCIE`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento_tbl`
--

LOCK TABLES `tratamiento_tbl` WRITE;
/*!40000 ALTER TABLE `tratamiento_tbl` DISABLE KEYS */;
INSERT INTO `tratamiento_tbl` VALUES (1,8,'K031','2023-02-18 01:19:17'),(6,3,NULL,'2023-02-18 17:42:53'),(8,5,'K028','2023-02-22 11:24:47'),(51,56,'B002','2023-06-10 23:44:53'),(69,8,'K021','2023-06-11 02:04:37'),(78,58,'K021','2023-06-11 05:03:35'),(79,59,'K021','2023-06-12 02:45:59'),(81,59,'K021','2023-06-12 09:00:20'),(82,57,'B084','2023-06-12 21:23:01'),(83,60,NULL,'2023-06-13 00:20:30'),(84,60,NULL,'2023-06-13 00:41:40'),(85,58,'K021','2023-06-13 01:39:21');
/*!40000 ALTER TABLE `tratamiento_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19  2:26:40
