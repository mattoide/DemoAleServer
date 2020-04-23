-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              8.0.19 - MySQL Community Server - GPL
-- S.O. server:                  Win64
-- HeidiSQL Versione:            11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database demoale
CREATE DATABASE IF NOT EXISTS `demoale` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `demoale`;

-- Dump della struttura di tabella demoale.aziende
CREATE TABLE IF NOT EXISTS `aziende` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ragioneSociale` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  `cel` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `toponimo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `indirizzo` varchar(50) NOT NULL,
  `civico` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `cap` varchar(50) NOT NULL,
  `apertura` varchar(50) NOT NULL,
  `chiusura` varchar(50) NOT NULL,
  `descrizione` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ragioneSociale` (`ragioneSociale`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.aziende: ~2 rows (circa)
/*!40000 ALTER TABLE `aziende` DISABLE KEYS */;
/*!40000 ALTER TABLE `aziende` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.aziende_categorie
CREATE TABLE IF NOT EXISTS `aziende_categorie` (
  `id_azienda` int NOT NULL,
  `categoria` varchar(50) NOT NULL,
  KEY `FK_aziende_categorie_aziende` (`id_azienda`),
  KEY `FK_aziende_categorie_categorie` (`categoria`),
  CONSTRAINT `FK_aziende_categorie_aziende` FOREIGN KEY (`id_azienda`) REFERENCES `aziende` (`id`),
  CONSTRAINT `FK_aziende_categorie_categorie` FOREIGN KEY (`categoria`) REFERENCES `categorie` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.aziende_categorie: ~4 rows (circa)
/*!40000 ALTER TABLE `aziende_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `aziende_categorie` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.aziende_prodotti
CREATE TABLE IF NOT EXISTS `aziende_prodotti` (
  `id_azienda` int NOT NULL,
  `prodotto` varchar(50) NOT NULL,
  KEY `FK_aziende_prodotti_aziende` (`id_azienda`),
  KEY `FK_aziende_prodotti_prodotti` (`prodotto`),
  CONSTRAINT `FK_aziende_prodotti_aziende` FOREIGN KEY (`id_azienda`) REFERENCES `aziende` (`id`),
  CONSTRAINT `FK_aziende_prodotti_prodotti` FOREIGN KEY (`prodotto`) REFERENCES `prodotti` (`prodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.aziende_prodotti: ~0 rows (circa)
/*!40000 ALTER TABLE `aziende_prodotti` DISABLE KEYS */;
/*!40000 ALTER TABLE `aziende_prodotti` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.aziende_servizi
CREATE TABLE IF NOT EXISTS `aziende_servizi` (
  `id_azienda` int DEFAULT NULL,
  `servizio` varchar(50) DEFAULT NULL,
  KEY `FK_aziende_servizi_aziende` (`id_azienda`),
  KEY `FK_aziende_servizi_servizi` (`servizio`),
  CONSTRAINT `FK_aziende_servizi_aziende` FOREIGN KEY (`id_azienda`) REFERENCES `aziende` (`id`),
  CONSTRAINT `FK_aziende_servizi_servizi` FOREIGN KEY (`servizio`) REFERENCES `servizi` (`servizio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.aziende_servizi: ~0 rows (circa)
/*!40000 ALTER TABLE `aziende_servizi` DISABLE KEYS */;
/*!40000 ALTER TABLE `aziende_servizi` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`categoria`),
  UNIQUE KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.categorie: ~12 rows (circa)
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`categoria`) VALUES
	('CAFE'),
	('GELATERIE'),
	('PANINOTECHE'),
	('PASTICCERIE'),
	('PIZZA AL TAGLIO'),
	('PIZZERIA'),
	('PUB'),
	('RISTORANTI'),
	('ROSTICCERIA'),
	('TAKE AWAY'),
	('TRATTORIE'),
	('WINE BAR');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.prodotti
CREATE TABLE IF NOT EXISTS `prodotti` (
  `prodotto` varchar(50) NOT NULL,
  PRIMARY KEY (`prodotto`),
  UNIQUE KEY `prodotto` (`prodotto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.prodotti: ~5 rows (circa)
/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` (`prodotto`) VALUES
	('Dolci'),
	('Panini e Sandwich'),
	('Pizza'),
	('Primo'),
	('Secondo');
/*!40000 ALTER TABLE `prodotti` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.servizi
CREATE TABLE IF NOT EXISTS `servizi` (
  `servizio` varchar(50) NOT NULL,
  PRIMARY KEY (`servizio`),
  UNIQUE KEY `servizio` (`servizio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.servizi: ~10 rows (circa)
/*!40000 ALTER TABLE `servizi` DISABLE KEYS */;
INSERT INTO `servizi` (`servizio`) VALUES
	('Accesso disabili'),
	('Area bimbi'),
	('Buoni pasto'),
	('Fascia prezzo'),
	('Menù fissi'),
	('Pet friendly'),
	('Promozioni'),
	('Senza glutine'),
	('Solo vegan'),
	('Wi-Fi');
/*!40000 ALTER TABLE `servizi` ENABLE KEYS */;

-- Dump della struttura di tabella demoale.toponimi
CREATE TABLE IF NOT EXISTS `toponimi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `toponimo` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `toponimo` (`toponimo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dump dei dati della tabella demoale.toponimi: ~4 rows (circa)
/*!40000 ALTER TABLE `toponimi` DISABLE KEYS */;
INSERT INTO `toponimi` (`id`, `toponimo`) VALUES
	(5, 'Contrada'),
	(3, 'Piazza'),
	(4, 'Strada'),
	(1, 'Via'),
	(2, 'Viale');
/*!40000 ALTER TABLE `toponimi` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
