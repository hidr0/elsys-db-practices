-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: game_of_thrones
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `Battles`
--

DROP TABLE IF EXISTS `Battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Battles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `winner_id` int(11) NOT NULL,
  `loser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `winner_id` (`winner_id`),
  KEY `loser_id` (`loser_id`),
  CONSTRAINT `Battles_ibfk_1` FOREIGN KEY (`winner_id`) REFERENCES `Persons` (`id`),
  CONSTRAINT `Battles_ibfk_2` FOREIGN KEY (`loser_id`) REFERENCES `Persons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Battles`
--

LOCK TABLES `Battles` WRITE;
/*!40000 ALTER TABLE `Battles` DISABLE KEYS */;
INSERT INTO `Battles` VALUES (1,1,3),(2,4,6),(3,2,6),(4,5,2);
/*!40000 ALTER TABLE `Battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Houses`
--

DROP TABLE IF EXISTS `Houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `number_of_wins` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Houses`
--

LOCK TABLES `Houses` WRITE;
/*!40000 ALTER TABLE `Houses` DISABLE KEYS */;
INSERT INTO `Houses` VALUES (1,'aba',2),(2,'daba',1),(3,'caba',1);
/*!40000 ALTER TABLE `Houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonBattles`
--

DROP TABLE IF EXISTS `PersonBattles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonBattles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `battle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `battle_id` (`battle_id`),
  CONSTRAINT `PersonBattles_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `Persons` (`id`),
  CONSTRAINT `PersonBattles_ibfk_2` FOREIGN KEY (`battle_id`) REFERENCES `Battles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonBattles`
--

LOCK TABLES `PersonBattles` WRITE;
/*!40000 ALTER TABLE `PersonBattles` DISABLE KEYS */;
INSERT INTO `PersonBattles` VALUES (1,1,1),(2,3,1),(3,4,2),(4,5,2),(5,6,2),(6,2,3),(7,6,3),(8,5,4),(9,2,4);
/*!40000 ALTER TABLE `PersonBattles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Persons`
--

DROP TABLE IF EXISTS `Persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `house_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `Persons_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `Houses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Persons`
--

LOCK TABLES `Persons` WRITE;
/*!40000 ALTER TABLE `Persons` DISABLE KEYS */;
INSERT INTO `Persons` VALUES (1,'pesho',1),(2,'iva',1),(3,'a',2),(4,'c',2),(5,'d',3),(6,'c',3);
/*!40000 ALTER TABLE `Persons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-17 12:00:54
