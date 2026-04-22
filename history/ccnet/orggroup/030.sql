CREATE TABLE `OrgGroup` (
  `org_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB;
