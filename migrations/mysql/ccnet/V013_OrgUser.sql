CREATE TABLE `OrgUser` (
  `org_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  UNIQUE KEY `org_id` (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB;
