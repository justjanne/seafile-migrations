CREATE TABLE `RepoUserToken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`,`token`),
  KEY `email` (`email`)
) ENGINE=InnoDB;
