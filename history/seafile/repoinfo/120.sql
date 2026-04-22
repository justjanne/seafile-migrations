CREATE TABLE `RepoInfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `update_time` bigint DEFAULT NULL,
  `version` int DEFAULT NULL,
  `is_encrypted` int DEFAULT NULL,
  `last_modifier` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '0',
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB;
