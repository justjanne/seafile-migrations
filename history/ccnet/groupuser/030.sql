CREATE TABLE `GroupUser` (
  `group_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `is_staff` tinyint DEFAULT NULL,
  PRIMARY KEY (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;
