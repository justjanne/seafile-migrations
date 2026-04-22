CREATE TABLE `Group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;
