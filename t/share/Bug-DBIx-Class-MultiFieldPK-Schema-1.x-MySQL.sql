-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sun Oct  9 22:15:44 2011
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS `image`;

--
-- Table: `image`
--
CREATE TABLE `image` (
  `image_id` integer NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `user`;

--
-- Table: `user`
--
CREATE TABLE `user` (
  `user_id` integer NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `user_image_downloaded`;

--
-- Table: `user_image_downloaded`
--
CREATE TABLE `user_image_downloaded` (
  `downloaded_id` integer NOT NULL auto_increment,
  `fk_user_id` integer NOT NULL,
  `fk_image_id` integer NOT NULL,
  INDEX `user_image_downloaded_idx_fk_image_id` (`fk_image_id`),
  INDEX `user_image_downloaded_idx_fk_user_id` (`fk_user_id`),
  PRIMARY KEY (`downloaded_id`),
  CONSTRAINT `user_image_downloaded_fk_fk_image_id` FOREIGN KEY (`fk_image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_image_downloaded_fk_fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

SET foreign_key_checks=1;

