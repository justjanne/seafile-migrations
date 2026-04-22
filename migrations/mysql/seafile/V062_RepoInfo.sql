CREATE TABLE `RepoInfo` (
  `repo_id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `update_time` bigint DEFAULT NULL,
  `version` int DEFAULT NULL,
  `is_encrypted` int DEFAULT NULL,
  `last_modifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
