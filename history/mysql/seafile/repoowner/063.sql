CREATE TABLE `RepoOwner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `owner_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=InnoDB;
