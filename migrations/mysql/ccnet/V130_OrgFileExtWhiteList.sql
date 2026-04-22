CREATE TABLE `OrgFileExtWhiteList` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `white_list` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`)
) ENGINE=InnoDB;
