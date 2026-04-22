CREATE TABLE `SharedRepo` (
  `repo_id` char(37) DEFAULT NULL,
  `from_email` varchar(512) DEFAULT NULL,
  `to_email` varchar(512) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
