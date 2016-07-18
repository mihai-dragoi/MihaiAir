# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.99.101 (MySQL 5.6.31)
# Database: mihaiair
# Generation Time: 2016-07-18 22:18:23 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table aircraft
# ------------------------------------------------------------

DROP TABLE IF EXISTS `aircraft`;

CREATE TABLE `aircraft` (
  `id_aircraft` int(6) NOT NULL AUTO_INCREMENT,
  `aircraft_name` varchar(30) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_aircraft`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table airline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `id_airline` int(6) NOT NULL AUTO_INCREMENT,
  `airline_name` varchar(30) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_airline`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table destination
# ------------------------------------------------------------

DROP TABLE IF EXISTS `destination`;

CREATE TABLE `destination` (
  `id_destination` int(6) NOT NULL AUTO_INCREMENT,
  `destination_name` varchar(30) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table flights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `id_flight` int(6) NOT NULL AUTO_INCREMENT,
  `fk_origin` int(6) NOT NULL,
  `fk_destination` int(6) NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  `fk_airline` int(6) DEFAULT NULL,
  `fk_aircraft` int(6) DEFAULT NULL,
  `flight_number` varchar(20) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `availability` int(4) NOT NULL,
  `price` float(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_flight`),
  KEY `origin` (`fk_origin`),
  KEY `destination` (`fk_destination`),
  KEY `airline` (`fk_airline`),
  KEY `aircraft` (`fk_aircraft`),
  CONSTRAINT `aircraft` FOREIGN KEY (`fk_aircraft`) REFERENCES `aircraft` (`id_aircraft`),
  CONSTRAINT `airline` FOREIGN KEY (`fk_airline`) REFERENCES `airline` (`id_airline`),
  CONSTRAINT `destination` FOREIGN KEY (`fk_destination`) REFERENCES `destination` (`id_destination`),
  CONSTRAINT `origin` FOREIGN KEY (`fk_origin`) REFERENCES `origin` (`id_origin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table origin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `origin`;

CREATE TABLE `origin` (
  `id_origin` int(6) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(30) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_origin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
