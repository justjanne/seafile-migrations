CREATE TABLE `OrgUser` (
  `org_id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_staff` boolean NOT NULL,
  PRIMARY KEY (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB;
