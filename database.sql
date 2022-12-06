/*
SQLyog Community
MySQL - 8.0.22 : Database - pharmacy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pharmacy` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pharmacy`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login',7,'add_login'),
(26,'Can change login',7,'change_login'),
(27,'Can delete login',7,'delete_login'),
(28,'Can view login',7,'view_login'),
(29,'Can add medicine',8,'add_medicine'),
(30,'Can change medicine',8,'change_medicine'),
(31,'Can delete medicine',8,'delete_medicine'),
(32,'Can view medicine',8,'view_medicine'),
(33,'Can add video',9,'add_video'),
(34,'Can change video',9,'change_video'),
(35,'Can delete video',9,'delete_video'),
(36,'Can view video',9,'view_video'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add pharmacy',11,'add_pharmacy'),
(42,'Can change pharmacy',11,'change_pharmacy'),
(43,'Can delete pharmacy',11,'delete_pharmacy'),
(44,'Can view pharmacy',11,'view_pharmacy'),
(45,'Can add medicineorder',12,'add_medicineorder'),
(46,'Can change medicineorder',12,'change_medicineorder'),
(47,'Can delete medicineorder',12,'delete_medicineorder'),
(48,'Can view medicineorder',12,'view_medicineorder'),
(49,'Can add feedback',13,'add_feedback'),
(50,'Can change feedback',13,'change_feedback'),
(51,'Can delete feedback',13,'delete_feedback'),
(52,'Can view feedback',13,'view_feedback'),
(53,'Can add complaint',14,'add_complaint'),
(54,'Can change complaint',14,'change_complaint'),
(55,'Can delete complaint',14,'delete_complaint'),
(56,'Can view complaint',14,'view_complaint'),
(57,'Can add bill',15,'add_bill'),
(58,'Can change bill',15,'change_bill'),
(59,'Can delete bill',15,'delete_bill'),
(60,'Can view bill',15,'view_bill');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$EJ7N3u9Hko1G9QwfcZTVfj$6vOwIT9Hj5+kCt4h0NsjfGu4uY6vF21RPk90H9B9byU=','2022-11-10 06:45:27.742982',1,'admin','','','admin@gmail.com',1,1,'2022-11-10 06:30:42.760176'),
(2,'pbkdf2_sha256$260000$qG9GIXb1IRKVEBtGtC7eFu$ZnIjNkpMGQ7CtUsptQZIGr/GYY5N7fnqEkuHnSNYzPU=',NULL,1,'admin1','','','admin1@gmail.com',1,1,'2022-11-14 06:58:44.795050');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(15,'p3app','bill'),
(14,'p3app','complaint'),
(13,'p3app','feedback'),
(7,'p3app','login'),
(8,'p3app','medicine'),
(12,'p3app','medicineorder'),
(11,'p3app','pharmacy'),
(10,'p3app','user'),
(9,'p3app','video'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2022-11-10 04:55:10.500589'),
(2,'auth','0001_initial','2022-11-10 04:55:45.836510'),
(3,'admin','0001_initial','2022-11-10 04:55:56.152526'),
(4,'admin','0002_logentry_remove_auto_add','2022-11-10 04:55:56.515699'),
(5,'admin','0003_logentry_add_action_flag_choices','2022-11-10 04:55:56.740920'),
(6,'contenttypes','0002_remove_content_type_name','2022-11-10 04:56:04.992253'),
(7,'auth','0002_alter_permission_name_max_length','2022-11-10 04:56:08.580799'),
(8,'auth','0003_alter_user_email_max_length','2022-11-10 04:56:10.539034'),
(9,'auth','0004_alter_user_username_opts','2022-11-10 04:56:10.708695'),
(10,'auth','0005_alter_user_last_login_null','2022-11-10 04:56:12.951801'),
(11,'auth','0006_require_contenttypes_0002','2022-11-10 04:56:13.028197'),
(12,'auth','0007_alter_validators_add_error_messages','2022-11-10 04:56:13.283666'),
(13,'auth','0008_alter_user_username_max_length','2022-11-10 04:56:17.685183'),
(14,'auth','0009_alter_user_last_name_max_length','2022-11-10 04:56:22.820098'),
(15,'auth','0010_alter_group_name_max_length','2022-11-10 04:56:23.577317'),
(16,'auth','0011_update_proxy_permissions','2022-11-10 04:56:23.863216'),
(17,'auth','0012_alter_user_first_name_max_length','2022-11-10 04:56:28.878881'),
(18,'p3app','0001_initial','2022-11-10 04:57:37.241105'),
(19,'sessions','0001_initial','2022-11-10 04:57:39.895855');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

/*Table structure for table `p3app_bill` */

DROP TABLE IF EXISTS `p3app_bill`;

CREATE TABLE `p3app_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `pid_id` bigint NOT NULL,
  `uid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_bill_pid_id_ee32aa2f_fk_p3app_pharmacy_id` (`pid_id`),
  KEY `p3app_bill_uid_id_a87ed4e1_fk_p3app_user_id` (`uid_id`),
  CONSTRAINT `p3app_bill_pid_id_ee32aa2f_fk_p3app_pharmacy_id` FOREIGN KEY (`pid_id`) REFERENCES `p3app_pharmacy` (`id`),
  CONSTRAINT `p3app_bill_uid_id_a87ed4e1_fk_p3app_user_id` FOREIGN KEY (`uid_id`) REFERENCES `p3app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_bill` */

insert  into `p3app_bill`(`id`,`file`,`date`,`pid_id`,`uid_id`) values 
(1,'beauty_FP5XAMv.jpg','2022-11-09',1,1),
(2,'beauty_WwYgrdj.jpg','2022-11-09',1,1);

/*Table structure for table `p3app_complaint` */

DROP TABLE IF EXISTS `p3app_complaint`;

CREATE TABLE `p3app_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complaints` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(20) NOT NULL,
  `pid_id` bigint NOT NULL,
  `uid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_complaint_pid_id_80da313b_fk_p3app_pharmacy_id` (`pid_id`),
  KEY `p3app_complaint_uid_id_68ef5633_fk_p3app_user_id` (`uid_id`),
  CONSTRAINT `p3app_complaint_pid_id_80da313b_fk_p3app_pharmacy_id` FOREIGN KEY (`pid_id`) REFERENCES `p3app_pharmacy` (`id`),
  CONSTRAINT `p3app_complaint_uid_id_68ef5633_fk_p3app_user_id` FOREIGN KEY (`uid_id`) REFERENCES `p3app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_complaint` */

insert  into `p3app_complaint`(`id`,`complaints`,`date`,`reply`,`pid_id`,`uid_id`) values 
(1,'bad  delivery','2022-11-09','pending',1,1);

/*Table structure for table `p3app_feedback` */

DROP TABLE IF EXISTS `p3app_feedback`;

CREATE TABLE `p3app_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedbacks` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `uid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_feedback_uid_id_fd7ca1c6_fk_p3app_user_id` (`uid_id`),
  CONSTRAINT `p3app_feedback_uid_id_fd7ca1c6_fk_p3app_user_id` FOREIGN KEY (`uid_id`) REFERENCES `p3app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_feedback` */

insert  into `p3app_feedback`(`id`,`feedbacks`,`date`,`uid_id`) values 
(1,'good','2022-11-09',1);

/*Table structure for table `p3app_login` */

DROP TABLE IF EXISTS `p3app_login`;

CREATE TABLE `p3app_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_login` */

insert  into `p3app_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'dhaya123','1111','pharmacy'),
(3,'deepu11','2222','user');

/*Table structure for table `p3app_medicine` */

DROP TABLE IF EXISTS `p3app_medicine`;

CREATE TABLE `p3app_medicine` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicinename` varchar(20) NOT NULL,
  `stock` int NOT NULL,
  `description` varchar(20) NOT NULL,
  `expdate` date NOT NULL,
  `pid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_medicine_pid_id_2fa7b260_fk_p3app_pharmacy_id` (`pid_id`),
  CONSTRAINT `p3app_medicine_pid_id_2fa7b260_fk_p3app_pharmacy_id` FOREIGN KEY (`pid_id`) REFERENCES `p3app_pharmacy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_medicine` */

insert  into `p3app_medicine`(`id`,`medicinename`,`stock`,`description`,`expdate`,`pid_id`) values 
(1,'paracetamol',23,'fever related','2025-07-10',1);

/*Table structure for table `p3app_medicineorder` */

DROP TABLE IF EXISTS `p3app_medicineorder`;

CREATE TABLE `p3app_medicineorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `quantity` int NOT NULL,
  `mid_id` bigint NOT NULL,
  `uid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_medicineorder_mid_id_75f488ae_fk_p3app_medicine_id` (`mid_id`),
  KEY `p3app_medicineorder_uid_id_3505faf9_fk_p3app_user_id` (`uid_id`),
  CONSTRAINT `p3app_medicineorder_mid_id_75f488ae_fk_p3app_medicine_id` FOREIGN KEY (`mid_id`) REFERENCES `p3app_medicine` (`id`),
  CONSTRAINT `p3app_medicineorder_uid_id_3505faf9_fk_p3app_user_id` FOREIGN KEY (`uid_id`) REFERENCES `p3app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_medicineorder` */

/*Table structure for table `p3app_pharmacy` */

DROP TABLE IF EXISTS `p3app_pharmacy`;

CREATE TABLE `p3app_pharmacy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pharmacyname` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `pin` int NOT NULL,
  `post` varchar(20) NOT NULL,
  `district` varchar(20) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(254) NOT NULL,
  `certificate` varchar(100) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_pharmacy_lid_id_12c58564_fk_p3app_login_id` (`lid_id`),
  CONSTRAINT `p3app_pharmacy_lid_id_12c58564_fk_p3app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `p3app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_pharmacy` */

insert  into `p3app_pharmacy`(`id`,`pharmacyname`,`place`,`pin`,`post`,`district`,`phone`,`email`,`certificate`,`lid_id`) values 
(1,'dhaya','ponnani',567867,'biyyam','malappuram',5678675644,'dhaya@gmail.com','impresscer_KBljSjf.jpeg',2);

/*Table structure for table `p3app_user` */

DROP TABLE IF EXISTS `p3app_user`;

CREATE TABLE `p3app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `place` varchar(20) NOT NULL,
  `post` varchar(20) NOT NULL,
  `pin` int NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(254) NOT NULL,
  `lid_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `p3app_user_lid_id_9f545f98_fk_p3app_login_id` (`lid_id`),
  CONSTRAINT `p3app_user_lid_id_9f545f98_fk_p3app_login_id` FOREIGN KEY (`lid_id`) REFERENCES `p3app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_user` */

insert  into `p3app_user`(`id`,`firstname`,`lastname`,`gender`,`place`,`post`,`pin`,`phone`,`email`,`lid_id`) values 
(1,'deepu','p s','female','edappal','kaladi',679675,8067678977,'deep@gmail.com',3);

/*Table structure for table `p3app_video` */

DROP TABLE IF EXISTS `p3app_video`;

CREATE TABLE `p3app_video` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `video` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `p3app_video` */

insert  into `p3app_video`(`id`,`video`) values 
(1,'video_IXioMXg.mp4');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
