-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.39 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para hotel
CREATE DATABASE IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;

-- Copiando estrutura para tabela hotel.hospedes
CREATE TABLE IF NOT EXISTS `hospedes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela hotel.onibus
CREATE TABLE IF NOT EXISTS `onibus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `total_assentos` int NOT NULL,
  `empresa` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela hotel.passageiros
CREATE TABLE IF NOT EXISTS `passageiros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela hotel.passagens
CREATE TABLE IF NOT EXISTS `passagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `passageiro_id` int NOT NULL,
  `viagem_id` int NOT NULL,
  `numero_assento` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `viagem_id` (`viagem_id`,`numero_assento`),
  KEY `passageiro_id` (`passageiro_id`),
  CONSTRAINT `passagens_ibfk_1` FOREIGN KEY (`passageiro_id`) REFERENCES `passageiros` (`id`),
  CONSTRAINT `passagens_ibfk_2` FOREIGN KEY (`viagem_id`) REFERENCES `viagens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela hotel.quartos
CREATE TABLE IF NOT EXISTS `quartos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `tipo` enum('simples','duplo','suíte') NOT NULL,
  `status` enum('livre','ocupado','manutenção') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela hotel.reservas
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_checkin` date NOT NULL,
  `data_checkout` date NOT NULL,
  `hospede_id` int DEFAULT NULL,
  `quarto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospede_id` (`hospede_id`),
  KEY `quarto_id` (`quarto_id`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`hospede_id`) REFERENCES `hospedes` (`id`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`quarto_id`) REFERENCES `quartos` (`id`),
  CONSTRAINT `reservas_chk_1` CHECK ((`data_checkout` > `data_checkin`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela hotel.viagens
CREATE TABLE IF NOT EXISTS `viagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `origem` varchar(100) NOT NULL,
  `destino` varchar(100) NOT NULL,
  `data_viagem` date NOT NULL,
  `hora_partida` time NOT NULL,
  `onibus_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `onibus_id` (`onibus_id`),
  CONSTRAINT `viagens_ibfk_1` FOREIGN KEY (`onibus_id`) REFERENCES `onibus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
