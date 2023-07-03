-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: containers-us-west-107.railway.app    Database: railway
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citaAgendada_tbl`
--

DROP TABLE IF EXISTS `citaAgendada_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citaAgendada_tbl` (
  `fecha_citaAgen` date NOT NULL,
  `horaIni_citaAgen` time NOT NULL,
  `horaFin_citaAgen` time NOT NULL,
  `id_paciente` int NOT NULL,
  `moti_citaAgen` text,
  `esta_citaAgen` enum('Pendiente','Atendida','Perdida') NOT NULL,
  PRIMARY KEY (`fecha_citaAgen`,`horaIni_citaAgen`),
  KEY `fkn_citasAgendadas_pacien_idx` (`id_paciente`),
  CONSTRAINT `fkn_citasAgendadas_pacien` FOREIGN KEY (`id_paciente`) REFERENCES `paciente_tbl` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `fecha_consulta` timestamp NOT NULL,
  `hora_consulta` time NOT NULL,
  `id_tipoConsul` int NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `fkn_consulta_paciente_idx` (`id_paciente`),
  KEY `fk_tipoConsulta_idx` (`id_tipoConsul`),
  FULLTEXT KEY `full_index_motivo` (`mot_consulta`),
  FULLTEXT KEY `full_index_proble` (`probleAct_consulta`),
  CONSTRAINT `fk_tipoConsulta` FOREIGN KEY (`id_tipoConsul`) REFERENCES `tipoConsulta_tbl` (`id_tipoConsul`),
  CONSTRAINT `fkn_consulta_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente_tbl` (`id_paciente`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_codigoCIE_diagnostico` FOREIGN KEY (`codigoCIE`) REFERENCES `enfermedades_cie10` (`codigoCIE`),
  CONSTRAINT `fk_diagnostico` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enfermedades_cie10`
--

DROP TABLE IF EXISTS `enfermedades_cie10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermedades_cie10` (
  `codigoCIE` char(4) NOT NULL,
  `nombre_enfermedad` varchar(400) NOT NULL,
  PRIMARY KEY (`codigoCIE`),
  FULLTEXT KEY `fullindex_enfermedad` (`nombre_enfermedad`,`codigoCIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examenEstomatonagtico_tlb`
--

DROP TABLE IF EXISTS `examenEstomatonagtico_tlb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examenEstomatonagtico_tlb` (
  `id_examEst` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `regionAfec_examEst` enum('Labios','Mejillas','Maxilar Superior','Maxilar Inferior','Lengua','Paladar','Piso','Carillos','Glándulas salivales','Oro Faringe','A.T.M','Ganglios') NOT NULL,
  `codigoCIE` char(4) DEFAULT NULL,
  `desc_examEst` text,
  PRIMARY KEY (`id_examEst`),
  KEY `fk_examenEstomato_idx` (`id_consulta`),
  KEY `fk_codigoCIE_idx` (`codigoCIE`),
  CONSTRAINT `fk_codigoCIE` FOREIGN KEY (`codigoCIE`) REFERENCES `enfermedades_cie10` (`codigoCIE`),
  CONSTRAINT `fk_examenEstomato` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotografias_tbl`
--

DROP TABLE IF EXISTS `fotografias_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotografias_tbl` (
  `id_fotografia` varchar(150) NOT NULL,
  `id_recurso` int NOT NULL,
  `url_foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fotografia`),
  KEY `fk_recurso_fotografia_idx` (`id_recurso`),
  CONSTRAINT `fk_recurso_fotografia` FOREIGN KEY (`id_recurso`) REFERENCES `recursoFoto_tbl` (`id_recurso`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nomProcedimiento_tbl`
--

DROP TABLE IF EXISTS `nomProcedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomProcedimiento_tbl` (
  `cod_nomProced` char(5) NOT NULL,
  `nombre_nomProced` varchar(500) NOT NULL,
  `id_Proce` tinyint unsigned NOT NULL,
  PRIMARY KEY (`cod_nomProced`),
  KEY `fk_Nomenclatura_proced_idx` (`id_Proce`),
  KEY `index_proced` (`cod_nomProced`),
  FULLTEXT KEY `index_nomPro` (`nombre_nomProced`),
  CONSTRAINT `fk_Nomenclatura_proced` FOREIGN KEY (`id_Proce`) REFERENCES `subtiProcedimiento_tbl` (`id_Proce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `odontograma_tbl`
--

DROP TABLE IF EXISTS `odontograma_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odontograma_tbl` (
  `id_odontograma` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `fecha_odontograma` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_odontograma`),
  KEY `fk_odontograma_consulta_tbl_idx` (`id_consulta`),
  CONSTRAINT `fk_odontograma_consulta_tbl` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `piezaDental_tbl`
--

DROP TABLE IF EXISTS `piezaDental_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piezaDental_tbl` (
  `id_dent` int NOT NULL AUTO_INCREMENT,
  `id_odontograma` int NOT NULL,
  `num_dent` int NOT NULL,
  `mov_dent` int DEFAULT NULL,
  `rec_dent` int DEFAULT NULL,
  `oclusal_dent` int DEFAULT NULL,
  `vestibular_dent` int DEFAULT NULL,
  `mesial_dent` int DEFAULT NULL,
  `lingual_dent` int DEFAULT NULL,
  `distal_dent` int DEFAULT NULL,
  `nota_dent` text,
  PRIMARY KEY (`id_dent`),
  KEY `fk_piezadental_odontograma_idx` (`id_odontograma`),
  CONSTRAINT `fk_piezadental_odontograma` FOREIGN KEY (`id_odontograma`) REFERENCES `odontograma_tbl` (`id_odontograma`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `piezaSaludB_tbl`
--

DROP TABLE IF EXISTS `piezaSaludB_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piezaSaludB_tbl` (
  `id_pzaSaludB` int NOT NULL AUTO_INCREMENT,
  `id_saludBucal` int NOT NULL,
  `fila_pzaSaludb` int NOT NULL,
  `pieza_pzaSaludb` varchar(10) NOT NULL,
  `placa_pzaSaludb` int NOT NULL,
  `calculo_pzaSaludb` int NOT NULL,
  `gingivitis_pzaSaludb` int NOT NULL,
  PRIMARY KEY (`id_pzaSaludB`),
  KEY `fk_pzasaludb_salud_bucal_idx` (`id_saludBucal`),
  CONSTRAINT `fk_pzasaludb_salud_bucal` FOREIGN KEY (`id_saludBucal`) REFERENCES `saludBucal_tbl` (`id_saludBucal`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `planDiagnostico_tbl`
--

DROP TABLE IF EXISTS `planDiagnostico_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planDiagnostico_tbl` (
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
  CONSTRAINT `fk_tratamiento_planTerapeutico` FOREIGN KEY (`id_tipoTratam`) REFERENCES `tipoTratamiento_tbl` (`id_tipoTratam`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_nomenclatura_procedimiento` FOREIGN KEY (`cod_proced`) REFERENCES `nomProcedimiento_tbl` (`cod_nomProced`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recursoFoto_tbl`
--

DROP TABLE IF EXISTS `recursoFoto_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recursoFoto_tbl` (
  `id_recurso` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `titulo_recurso` text,
  `descripcion_recurso` text,
  `fecha_recurso` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_recurso`),
  KEY `fk_consulta_recurso_idx` (`id_consulta`),
  CONSTRAINT `fk_consulta_recurso` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `saludBucal_tbl`
--

DROP TABLE IF EXISTS `saludBucal_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saludBucal_tbl` (
  `id_saludBucal` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `enferper_saludb` varchar(45) NOT NULL,
  `maloclus_saludb` varchar(45) NOT NULL,
  `fluorosis_saludb` varchar(45) NOT NULL,
  PRIMARY KEY (`id_saludBucal`),
  KEY `fk_saludbucal_consulta_idx` (`id_consulta`),
  CONSTRAINT `fk_saludbucal_consulta` FOREIGN KEY (`id_consulta`) REFERENCES `consulta_tbl` (`id_consulta`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `signoVital_tbl`
--

DROP TABLE IF EXISTS `signoVital_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signoVital_tbl` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subtiProcedimiento_tbl`
--

DROP TABLE IF EXISTS `subtiProcedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtiProcedimiento_tbl` (
  `id_Proce` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `id_tituloProced` tinyint NOT NULL,
  `subti_Proce` varchar(400) NOT NULL,
  PRIMARY KEY (`id_Proce`),
  KEY `fk_tituloProced_idx` (`id_tituloProced`),
  CONSTRAINT `fk_tituloProced` FOREIGN KEY (`id_tituloProced`) REFERENCES `tituloProcedimiento_tbl` (`id_tituloProced`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipoConsulta_tbl`
--

DROP TABLE IF EXISTS `tipoConsulta_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoConsulta_tbl` (
  `id_tipoConsul` int NOT NULL AUTO_INCREMENT,
  `tipo_tipoConsul` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tipoConsul`),
  UNIQUE KEY `tipo_consulta_UNIQUE` (`tipo_tipoConsul`),
  FULLTEXT KEY `full_index_desc` (`tipo_tipoConsul`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipoPago_tbl`
--

DROP TABLE IF EXISTS `tipoPago_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoPago_tbl` (
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
  CONSTRAINT `fk_tipoPago_tbl_tipoConsulta_tbl1` FOREIGN KEY (`id_tipoConsul`) REFERENCES `tipoConsulta_tbl` (`id_tipoConsul`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipoTratamiento_tbl`
--

DROP TABLE IF EXISTS `tipoTratamiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipoTratamiento_tbl` (
  `id_tipoTratam` int NOT NULL AUTO_INCREMENT,
  `tipo_tipoTratam` enum('Clínico','Preventivo','Curativo') NOT NULL,
  `tratam_tipoTratam` varchar(200) NOT NULL,
  PRIMARY KEY (`id_tipoTratam`),
  FULLTEXT KEY `full_index_desc` (`tratam_tipoTratam`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tituloProcedimiento_tbl`
--

DROP TABLE IF EXISTS `tituloProcedimiento_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tituloProcedimiento_tbl` (
  `id_tituloProced` tinyint NOT NULL AUTO_INCREMENT,
  `nom_tituloProced` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_tituloProced`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_enfermedad_CIE` FOREIGN KEY (`codigoCIE`) REFERENCES `enfermedades_cie10` (`codigoCIE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-03  1:51:14
