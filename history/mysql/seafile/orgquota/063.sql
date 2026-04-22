CREATE TABLE `OrgQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`)
) ENGINE=InnoDB;
