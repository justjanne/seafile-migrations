CREATE TABLE `RepoOwner` (
  `repo_id` char(37) NOT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`repo_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB;
