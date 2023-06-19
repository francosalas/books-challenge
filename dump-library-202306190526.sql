-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) NOT NULL,
  `Country` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'J.D. Salinger','USA'),(2,'F. Scott. Fitzgerald','USA'),(3,'Jane Austen','UK'),(4,'Scott Hanselman','USA'),(5,'Jason N. Gaylord','USA'),(6,'Pranav Rastogi','India'),(7,'Todd Miranda','USA'),(8,'Christian Wenz','USA');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Cover` varchar(200) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'The Catcher in the Rye','https://upload.wikimedia.org/wikipedia/commons/8/8e/Catcher-in-the-rye-red-cover.jpg','The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, Holden searches for truth and rails against the “phoniness” of the adult world. He ends up exhausted and emotionally unstable. The events are related after the fact.'),(2,'Nine Stories','https://m.media-amazon.com/images/I/41B2f5VvjVL.jpg','Nine Stories (1953) is a collection of short stories by American fiction writer J. D. Salinger published in April 1953. It includes two of his most famous short stories, \"A Perfect Day for Bananafish\" and \"For Esmé - with Love and Squalor\". (Nine Stories is the U.S. title; the book is published in many other countries as For Esmé - with Love and Squalor, and Other Stories.)'),(3,'Franny and Zooey','https://upload.wikimedia.org/wikipedia/commons/7/72/Frannyzoey.jpg','The short story concerns Franny\'s weekend date with her collegiate boyfriend, Lane Coutell. Lane takes her to a fashionable lunch room, where Franny quickly becomes exasperated when he only appears interested in conversing about the minutiae of his academic frustrations.'),(4,'The Great Gatsby','https://upload.wikimedia.org/wikipedia/commons/7/7a/The_Great_Gatsby_Cover_1925_Retouched.jpg','The Great Gatsby, third novel by F. Scott Fitzgerald, published in 1925 by Charles Scribner\'s Sons. Set in Jazz Age New York, the novel tells the tragic story of Jay Gatsby, a self-made millionaire, and his pursuit of Daisy Buchanan, a wealthy young woman whom he loved in his youth.'),(5,'Tender is the Night','https://upload.wikimedia.org/wikipedia/commons/2/25/Tender_Is_the_Night_%281934_1st_ed_dust_jacket%29.jpg','Tender Is the Night, semiautobiographical novel by F. Scott Fitzgerald, published in 1934. It is the story of a psychiatrist who marries one of his patients; as she slowly recovers, she exhausts his vitality until he is, in Fitzgerald\'s words, un homme épuisé (“a used-up man”)'),(6,'Pride and Prejudice','https://almabooks.com/wp-content/uploads/2016/10/9781847493699.jpg','Pride and Prejudice follows the turbulent relationship between Elizabeth Bennet, the daughter of a country gentleman, and Fitzwilliam Darcy, a rich aristocratic landowner. They must overcome the titular sins of pride and prejudice in order to fall in love and marry.'),(7,'Professional ASP.NET 4.5 in C# and VB','https://media.wiley.com/product_data/coverImage300/59/11183320/1118332059.jpg','ASP.NET is Microsoft\'s technology for building dynamically generated web pages from database content. Originally introduced in 2002, ASP.NET has undergone many changes in multiple versions and iterations as developers have gained a decade of experience with this popular technology.');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booksauthors`
--

DROP TABLE IF EXISTS `booksauthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booksauthors` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorId` int(11) NOT NULL,
  `BookId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `AuthorId` (`AuthorId`),
  KEY `booksauthors_ibfk_2` (`BookId`),
  CONSTRAINT `booksauthors_ibfk_1` FOREIGN KEY (`AuthorId`) REFERENCES `authors` (`Id`),
  CONSTRAINT `booksauthors_ibfk_2` FOREIGN KEY (`BookId`) REFERENCES `books` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booksauthors`
--

LOCK TABLES `booksauthors` WRITE;
/*!40000 ALTER TABLE `booksauthors` DISABLE KEYS */;
INSERT INTO `booksauthors` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,4,7),(8,5,7),(9,6,7),(10,7,7),(11,8,7);
/*!40000 ALTER TABLE `booksauthors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(70) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  `CategoryId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `CategoryId` (`CategoryId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `categories` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cynthia Bowman','Cynthia@gmail.com','USA','$2a$10$6a6hr260zNMZ1DtF0/Ouj.L0sKn12S48OdTSrrJJrdY/2DCqSsiBu',2),(2,'Hanley Rios','Hanley@gmail.com','USA','$2a$10$6a6hr260zNMZ1DtF0/Ouj.L0sKn12S48OdTSrrJJrdY/2DCqSsiBu',1),(3,'Rowena Twitty','Rowena@gmail.com','USA','$2a$10$6a6hr260zNMZ1DtF0/Ouj.L0sKn12S48OdTSrrJJrdY/2DCqSsiBu',1),(4,'Fabian Webster','Fabian@gmail.com','India','$2a$10$6a6hr260zNMZ1DtF0/Ouj.L0sKn12S48OdTSrrJJrdY/2DCqSsiBu',1),(5,'Harper Mann','Harper@gmail.com','USA','$2a$10$6a6hr260zNMZ1DtF0/Ouj.L0sKn12S48OdTSrrJJrdY/2DCqSsiBu',2),(6,'Christian Wenz','Christian@gmail.com','USA','$2a$10$6a6hr260zNMZ1DtF0/Ouj.L0sKn12S48OdTSrrJJrdY/2DCqSsiBu',2),(7,'Franco Admin','francoadmin@gmail.com','Argentina','$2a$10$v6KdX.UccnBdf445tmLiFO7C5X/xTWoX82g1Y2kltjOEoZ7Xu7yXO',1),(8,'Franco User','francouser@gmail.com','Argentina','$2a$10$JkWJaW8uZ8RWI/AQnxgSweutjGtseOmCM5iA.93GTcAy/kLSpnNAi',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19  5:26:13
