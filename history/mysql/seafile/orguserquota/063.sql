CREATE TABLE `OrgUserQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`user`)
) ENGINE=InnoDB;
