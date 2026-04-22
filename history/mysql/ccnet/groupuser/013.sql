CREATE TABLE `GroupUser` (
  `group_id` int DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_staff` tinyint DEFAULT NULL,
  UNIQUE KEY `group_id` (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;
