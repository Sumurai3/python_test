/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.21 : Database - audiofiles
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`audiofiles` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `audiofiles`;

/*Table structure for table `audiobooks` */

DROP TABLE IF EXISTS `audiobooks`;

CREATE TABLE `audiobooks` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TitleoftheAudiobook` varchar(100) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Narrator` varchar(100) NOT NULL,
  `Duration` int unsigned NOT NULL,
  `UploadedTime` datetime NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `audiobooks` */

insert  into `audiobooks`(`ID`,`TitleoftheAudiobook`,`Author`,`Narrator`,`Duration`,`UploadedTime`) values 
(1,'Tere name','Sumit Barde','Myself',50,'2022-05-13 02:53:50'),
(2,'AudioBook2','KIshor Kumar','Sanjay',90,'2022-05-13 02:53:50'),
(3,'AudioBook3','KIshor Kumar','Sanjay',90,'2022-05-13 02:53:50');

/*Table structure for table `podcasts` */

DROP TABLE IF EXISTS `podcasts`;

CREATE TABLE `podcasts` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NameofthePodcast` varchar(100) NOT NULL,
  `Duration` int unsigned NOT NULL,
  `UploadedTime` datetime NOT NULL,
  `Host` varchar(100) NOT NULL,
  `Participants` varchar(1500) DEFAULT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `podcasts` */

insert  into `podcasts`(`ID`,`NameofthePodcast`,`Duration`,`UploadedTime`,`Host`,`Participants`) values 
(1,'Tere name',50,'2022-05-13 02:53:50','Sumit','Sumit;Barde,XYZ'),
(2,'Podcast1',50,'2022-05-13 02:53:50','Sumit','Sumit;Barde,XYZ'),
(3,'Podcast2',90,'2022-05-13 02:53:50','Sumit','Sumit;Barde,XYZ'),
(4,'Podcast3',90,'2022-05-13 02:53:50','Sumit','Sumit;Barde,XYZ');

/*Table structure for table `songs` */

DROP TABLE IF EXISTS `songs`;

CREATE TABLE `songs` (
  `ID` int NOT NULL,
  `NameOftheSong` varchar(100) NOT NULL,
  `Duration` int unsigned NOT NULL,
  `UploadedTime` datetime NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `songs` */

insert  into `songs`(`ID`,`NameOftheSong`,`Duration`,`UploadedTime`) values 
(3,'Tere name humne',50,'2022-05-13 02:53:50');

/* Trigger structure for table `audiobooks` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `check_upload_date_insert_audiobooks` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `check_upload_date_insert_audiobooks` AFTER INSERT ON `audiobooks` FOR EACH ROW BEGIN
      IF new.UploadedTime < now()
  THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Upload time cannot be in past";
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `audiobooks` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `check_upload_date_update_audiobooks` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `check_upload_date_update_audiobooks` AFTER UPDATE ON `audiobooks` FOR EACH ROW BEGIN
      IF new.UploadedTime < NOW() 
  THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Upload time cannot be in past";
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `podcasts` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `check_upload_date_insert_podcasts` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `check_upload_date_insert_podcasts` AFTER INSERT ON `podcasts` FOR EACH ROW BEGIN
      IF new.UploadedTime < NOW() 
  THEN
        signal sqlstate '45000' set message_text = "Upload time cannot be in past";
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `podcasts` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `check_upload_date_update_podcasts` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `check_upload_date_update_podcasts` AFTER UPDATE ON `podcasts` FOR EACH ROW BEGIN
      IF new.UploadedTime < now() 
  THEN
        signal sqlstate '45000' set message_text = "Upload time cannot be in past";
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `songs` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `check_upload_date` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `check_upload_date` AFTER INSERT ON `songs` FOR EACH ROW BEGIN
      IF new.UploadedTime < now()
  THEN
        signal sqlstate '45000' set message_text = "Upload time cannot be in past";
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `songs` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `check_upload_date_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `check_upload_date_update` AFTER UPDATE ON `songs` FOR EACH ROW BEGIN
      IF new.UploadedTime < now() 
  THEN
        signal sqlstate '45000' set message_text = "Upload time cannot be in past";
  END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
