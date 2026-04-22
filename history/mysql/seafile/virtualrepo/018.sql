CREATE TABLE `VirtualRepo` (
  `repo_id` char(36) NOT NULL,
  `origin_repo` char(36) DEFAULT NULL,
  `path` text,
  `base_commit` char(40) DEFAULT NULL,
  PRIMARY KEY (`repo_id`),
  KEY `origin_repo` (`origin_repo`)
) ENGINE=InnoDB;
