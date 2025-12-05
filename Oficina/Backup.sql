-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Mendes','11998887766','123.456.789-00','São Paulo','SP','Centro','joao@gmail.com'),(2,'Maria Silva','11992223344','987.654.321-00','Campinas','SP','Taquaral','maria@gmail.com'),(3,'Carlos Santos','11991112233','111.222.333-44','Limeira','SP','Vila Nova','carlos@gmail.com'),(4,'Ana Pereira','19988776655','555.666.777-88','Piracicaba','SP','Bosque','ana@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanicos`
--

DROP TABLE IF EXISTS `mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanicos` (
  `id_mecanico` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `especialidade` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_mecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanicos`
--

LOCK TABLES `mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanicos` DISABLE KEYS */;
INSERT INTO `mecanicos` VALUES (1,'Ricardo Almeida','Motor'),(2,'Bruno Carvalho','Suspensão'),(3,'Felipe Souza','Freios'),(4,'Marcos Lima','Elétrica');
/*!40000 ALTER TABLE `mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens_servico`
--

DROP TABLE IF EXISTS `ordens_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens_servico` (
  `id_os` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_veiculo` int NOT NULL,
  `status` varchar(50) DEFAULT 'Aguardando Avaliação',
  `data_abertura` date NOT NULL,
  `data_conclusao` date DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id_os`),
  KEY `id_cliente` (`id_cliente`),
  KEY `idx_fk_os_veiculo` (`id_veiculo`),
  CONSTRAINT `ordens_servico_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `ordens_servico_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens_servico`
--

LOCK TABLES `ordens_servico` WRITE;
/*!40000 ALTER TABLE `ordens_servico` DISABLE KEYS */;
INSERT INTO `ordens_servico` VALUES (1,1,1,'Concluída','2025-01-10','2025-01-11','Troca de óleo e revisão geral'),(2,2,3,'Em Execução','2025-01-15',NULL,'Freio fazendo barulho'),(3,3,4,'Aguardando Avaliação','2025-01-18',NULL,'Falhando ao ligar'),(4,4,5,'Concluída','2025-01-20','2025-01-22','Revisão completa');
/*!40000 ALTER TABLE `ordens_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_mecanicos`
--

DROP TABLE IF EXISTS `os_mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_mecanicos` (
  `id_os` int NOT NULL,
  `id_mecanico` int NOT NULL,
  PRIMARY KEY (`id_os`,`id_mecanico`),
  KEY `id_mecanico` (`id_mecanico`),
  CONSTRAINT `os_mecanicos_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `ordens_servico` (`id_os`),
  CONSTRAINT `os_mecanicos_ibfk_2` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanicos` (`id_mecanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_mecanicos`
--

LOCK TABLES `os_mecanicos` WRITE;
/*!40000 ALTER TABLE `os_mecanicos` DISABLE KEYS */;
INSERT INTO `os_mecanicos` VALUES (1,1),(4,1),(4,2),(2,3),(3,4);
/*!40000 ALTER TABLE `os_mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_pecas`
--

DROP TABLE IF EXISTS `os_pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_pecas` (
  `id_os` int NOT NULL,
  `id_peca` int NOT NULL,
  `quantidade_usada` int NOT NULL,
  `preco_unitario_cobrado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_os`,`id_peca`),
  KEY `id_peca` (`id_peca`),
  KEY `idx_os_pecas_composto` (`id_os`,`id_peca`),
  CONSTRAINT `os_pecas_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `ordens_servico` (`id_os`),
  CONSTRAINT `os_pecas_ibfk_2` FOREIGN KEY (`id_peca`) REFERENCES `pecas` (`id_peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_pecas`
--

LOCK TABLES `os_pecas` WRITE;
/*!40000 ALTER TABLE `os_pecas` DISABLE KEYS */;
INSERT INTO `os_pecas` VALUES (1,1,1,30.00),(2,2,1,150.00),(3,3,1,95.00),(4,4,2,200.00);
/*!40000 ALTER TABLE `os_pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os_servicos`
--

DROP TABLE IF EXISTS `os_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os_servicos` (
  `id_os` int NOT NULL,
  `id_servico` int NOT NULL,
  `preco_cobrado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_os`,`id_servico`),
  KEY `id_servico` (`id_servico`),
  CONSTRAINT `os_servicos_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `ordens_servico` (`id_os`),
  CONSTRAINT `os_servicos_ibfk_2` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_servicos`
--

LOCK TABLES `os_servicos` WRITE;
/*!40000 ALTER TABLE `os_servicos` DISABLE KEYS */;
INSERT INTO `os_servicos` VALUES (1,1,80.00),(2,3,150.00),(4,2,120.00),(4,4,200.00);
/*!40000 ALTER TABLE `os_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `id_peca` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `preco_custo` decimal(10,2) NOT NULL,
  `preco_venda` decimal(10,2) NOT NULL,
  `qtd_estoque` int NOT NULL,
  PRIMARY KEY (`id_peca`),
  CONSTRAINT `chk_preco` CHECK ((`preco_venda` >= `preco_custo`))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES (1,'Filtro de Óleo','Bosch',15.00,30.00,50),(2,'Pastilha de Freio','Nakashi',80.00,150.00,20),(3,'Correia Dentada','Gates',50.00,95.00,2),(4,'Amortecedor Dianteiro','Cofap',120.00,200.00,0);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id_servico` int NOT NULL AUTO_INCREMENT,
  `nome_servico` varchar(150) NOT NULL,
  `especialidade` varchar(150) DEFAULT NULL,
  `preco_mao_obra` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,'Troca de Óleo','Motor',80.00),(2,'Alinhamento e Balanceamento','Suspensão',120.00),(3,'Troca de Pastilhas de Freio','Freios',150.00),(4,'Revisão Elétrica','Elétrica',200.00);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `placa` varchar(10) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`id_veiculo`),
  UNIQUE KEY `placa` (`placa`),
  KEY `id_cliente` (`id_cliente`),
  KEY `idx_placa` (`placa`),
  CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (1,1,'ABC1A23','Ford','Fiesta',2012),(2,1,'ABC2B34','Chevrolet','Onix',2018),(3,2,'XYZ9Z99','Honda','Civic',2015),(4,3,'KLM3C45','Volkswagen','Gol',2010),(5,4,'QWE4R56','Toyota','Corolla',2019);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'oficina'
--

--
-- Dumping routines for database 'oficina'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05 14:43:12
