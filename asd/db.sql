/*
SQLyog Community
MySQL - 8.0.22 : Database - depression
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`depression` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `depression`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `health_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `appointment` */

insert  into `appointment`(`id`,`health_id`,`staff_id`,`date`,`status`) values 
(1,1,2,'2022-12-27','pending'),
(5,3,2,'2022-12-27','pending');

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `attendance` */

insert  into `attendance`(`id`,`staff_id`,`date`,`status`) values 
(1,2,'2022-12-27','present');

/*Table structure for table `complaints` */

DROP TABLE IF EXISTS `complaints`;

CREATE TABLE `complaints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `complaints` varchar(40) DEFAULT NULL,
  `reply` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `complaints` */

insert  into `complaints`(`id`,`staff_id`,`complaints`,`reply`,`date`) values 
(1,2,'not good','pending','2022-12-27');

/*Table structure for table `designation` */

DROP TABLE IF EXISTS `designation`;

CREATE TABLE `designation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `designame` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `designation` */

insert  into `designation`(`id`,`designame`) values 
(1,'Hr'),
(2,'sale'),
(3,'accountent');

/*Table structure for table `healthteam` */

DROP TABLE IF EXISTS `healthteam`;

CREATE TABLE `healthteam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_id` int DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `Qualific` varchar(30) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `healthteam` */

insert  into `healthteam`(`id`,`login_id`,`name`,`Qualific`,`phone`,`email`) values 
(1,4,'pranav','pg',6789786755,'pranav@gmail.com'),
(3,6,'Rithu','degree',6767565644,'rith@gmail.com');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'arun','123','staff'),
(4,'shambu','1111','health'),
(6,'rithu','2222','health');

/*Table structure for table `meditation` */

DROP TABLE IF EXISTS `meditation`;

CREATE TABLE `meditation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appoinment_id` int DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `meditation` */

insert  into `meditation`(`id`,`appoinment_id`,`title`,`description`) values 
(1,1,'dioahjh','retsyukjmhngfxbnmnbvcx');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notifications` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `notification` */

insert  into `notification`(`id`,`notifications`,`date`) values 
(1,'make it fast','2022-12-27');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login_id` int DEFAULT NULL,
  `desig_id` int DEFAULT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `staff` */

insert  into `staff`(`id`,`login_id`,`desig_id`,`firstname`,`lastname`,`gender`,`dob`,`phone`,`email`) values 
(1,18,7,'sivan','pn','male','1995-10-12',5678767655,'sivan@gmail.com'),
(2,2,2,'arun','s','male','2007-07-13',3456785645,'arun@gamail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
