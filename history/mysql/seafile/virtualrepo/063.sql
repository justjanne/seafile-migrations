CREATE TABLE `VirtualRepo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `origin_repo` char(36) DEFAULT NULL,
  `path` text,
  `base_commit` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `origin_repo` (`origin_repo`)
) ENGINE=InnoDB;
