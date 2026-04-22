CREATE TABLE `Group` (
  `group_id` bigint NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `parent_group_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;
