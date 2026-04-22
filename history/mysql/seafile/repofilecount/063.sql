CREATE TABLE `RepoFileCount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) DEFAULT NULL,
  `file_count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
