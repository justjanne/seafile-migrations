CREATE TABLE `OrgUserDefaultQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int,
  `quota` bigint,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`org_id`)
) ENGINE=InnoDB;
