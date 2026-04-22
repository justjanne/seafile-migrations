CREATE TABLE `OrgQuota` (
  `org_id` int NOT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB;
