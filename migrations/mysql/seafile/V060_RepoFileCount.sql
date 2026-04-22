CREATE TABLE `RepoFileCount` (
  `repo_id` char(36) NOT NULL,
  `file_count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
