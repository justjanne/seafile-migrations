CREATE TABLE `RepoStorageId` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `storage_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
