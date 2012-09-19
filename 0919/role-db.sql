/*
SQLyog Ultimate v8.71 
MySQL - 5.5.11 : Database - petclinic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`petclinic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `petclinic`;

/*Table structure for table `owners` */

DROP TABLE IF EXISTS `owners`;

CREATE TABLE `owners` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `owners` */

insert  into `owners`(`id`,`first_name`,`last_name`,`address`,`city`,`telephone`) values (1,'George','Franklin','110 W. Liberty St.','Madison','6085551023'),(2,'Betty','Davis','638 Cardinal Ave.','Sun Prairie','6085551749'),(3,'Eduardo','Rodriquez','2693 Commerce St.','McFarland','6085558763'),(4,'Harold','Davis','563 Friendly St.','Windsor','6085553198'),(5,'Peter','McTavish','2387 S. Fair Way','Madison','6085552765'),(6,'Jean','Coleman','105 N. Lake St.','Monona','6085552654'),(7,'Jeff','Black','1450 Oak Blvd.','Monona','6085555387'),(8,'Maria','Escobito','345 Maple St.','Madison','6085557683'),(9,'David','Schroeder','2749 Blackhawk Trail','Madison','6085559435'),(10,'Carlos','Estaban','2335 Independence La.','Waunakee','6085555487');

/*Table structure for table `path_authroizations` */

DROP TABLE IF EXISTS `path_authroizations`;

CREATE TABLE `path_authroizations` (
  `path_id` int(11) NOT NULL,
  `role_perm_name` varchar(50) NOT NULL,
  `author_type` char(1) NOT NULL,
  PRIMARY KEY (`path_id`,`role_perm_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `path_authroizations` */

insert  into `path_authroizations`(`path_id`,`role_perm_name`,`author_type`) values (1,'owner:edit','P'),(1,'owner:list','P'),(2,'pet:edit','P');

/*Table structure for table `paths` */

DROP TABLE IF EXISTS `paths`;

CREATE TABLE `paths` (
  `path_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `need_login_flag` char(1) NOT NULL,
  PRIMARY KEY (`url`),
  UNIQUE KEY `path_id` (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `paths` */

insert  into `paths`(`path_id`,`url`,`description`,`need_login_flag`) values (1,'/owners/*/edit','edit owner','Y'),(2,'/owners/*/pets/*/edit','edit pets','Y');

/*Table structure for table `pets` */

DROP TABLE IF EXISTS `pets`;

CREATE TABLE `pets` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `type_id` int(4) unsigned NOT NULL,
  `owner_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `owner_id` (`owner_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `pets` */

insert  into `pets`(`id`,`name`,`birth_date`,`type_id`,`owner_id`) values (1,'Leo','2000-09-07',1,1),(2,'Basil','2002-08-06',6,2),(3,'Rosy','2001-04-17',2,3),(4,'Jewel','2000-03-07',2,3),(5,'Iggy','2000-11-30',3,4),(6,'George','2000-01-20',4,5),(7,'Samantha','1995-09-04',1,6),(8,'Max','1995-09-04',1,6),(9,'Lucky','1999-08-06',5,7),(10,'Mulligan','1997-02-24',2,8),(11,'Freddy','2000-03-09',5,9),(12,'Lucky','2000-06-24',2,10),(13,'Sly','2002-06-08',1,10),(14,'big dog','1999-12-01',2,2);

/*Table structure for table `roles_permissions` */

DROP TABLE IF EXISTS `roles_permissions`;

CREATE TABLE `roles_permissions` (
  `role_name` varchar(200) NOT NULL,
  `permission` varchar(200) NOT NULL,
  PRIMARY KEY (`role_name`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `roles_permissions` */

insert  into `roles_permissions`(`role_name`,`permission`) values ('owner-editor','owner:edit'),('owner-editor','owner:list'),('pet-editor','pet:edit');

/*Table structure for table `specialties` */

DROP TABLE IF EXISTS `specialties`;

CREATE TABLE `specialties` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `specialties` */

insert  into `specialties`(`id`,`name`) values (3,'dentistry'),(1,'radiology'),(2,'surgery');

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `types` */

insert  into `types`(`id`,`name`) values (5,'bird'),(1,'cat'),(2,'dog'),(6,'hamster'),(3,'lizard'),(4,'snake');

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `username` varchar(200) NOT NULL,
  `role_name` varchar(200) NOT NULL,
  PRIMARY KEY (`username`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_roles` */

insert  into `user_roles`(`username`,`role_name`) values ('a','owner-editor'),('b','pet-editor');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`) values (1,'a','a'),(2,'b','b');

/*Table structure for table `vet_specialties` */

DROP TABLE IF EXISTS `vet_specialties`;

CREATE TABLE `vet_specialties` (
  `vet_id` int(4) unsigned NOT NULL,
  `specialty_id` int(4) unsigned NOT NULL,
  UNIQUE KEY `vet_id` (`vet_id`,`specialty_id`),
  KEY `specialty_id` (`specialty_id`),
  CONSTRAINT `vet_specialties_ibfk_1` FOREIGN KEY (`vet_id`) REFERENCES `vets` (`id`),
  CONSTRAINT `vet_specialties_ibfk_2` FOREIGN KEY (`specialty_id`) REFERENCES `specialties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vet_specialties` */

insert  into `vet_specialties`(`vet_id`,`specialty_id`) values (2,1),(5,1),(3,2),(4,2),(3,3);

/*Table structure for table `vets` */

DROP TABLE IF EXISTS `vets`;

CREATE TABLE `vets` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `vets` */

insert  into `vets`(`id`,`first_name`,`last_name`) values (1,'James','Carter'),(2,'Helen','Leary'),(3,'Linda','Douglas'),(4,'Rafael','Ortega'),(5,'Henry','Stevens'),(6,'Sharon','Jenkins');

/*Table structure for table `visits` */

DROP TABLE IF EXISTS `visits`;

CREATE TABLE `visits` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `pet_id` int(4) unsigned NOT NULL,
  `visit_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pet_id` (`pet_id`),
  CONSTRAINT `visits_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `visits` */

insert  into `visits`(`id`,`pet_id`,`visit_date`,`description`) values (1,7,'1996-03-04','rabies shot'),(2,8,'1996-03-04','rabies shot'),(3,8,'1996-06-04','neutered'),(4,7,'1996-09-04','spayed'),(5,2,'2012-09-16','first visit'),(6,2,'2012-09-16','second visit'),(7,2,'2012-09-16','third visit');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
