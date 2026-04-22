CREATE TABLE `FileLockTimestamp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) DEFAULT NULL,
  `update_time` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
