CREATE TABLE `OrgGroup` (
  `org_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  UNIQUE KEY `org_id` (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB;
