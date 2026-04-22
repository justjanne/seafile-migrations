CREATE TABLE `OrgUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB;
