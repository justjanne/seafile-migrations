CREATE TABLE `OrgUserQuota` (
  `org_id` int NOT NULL,
  `user` varchar(255) NOT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`,`user`)
) ENGINE=InnoDB;
