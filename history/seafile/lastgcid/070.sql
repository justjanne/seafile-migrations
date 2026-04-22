CREATE TABLE `LastGCID` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `client_id` varchar(128) DEFAULT NULL,
  `gc_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`client_id`)
) ENGINE=InnoDB;
