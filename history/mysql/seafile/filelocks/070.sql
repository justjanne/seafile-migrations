CREATE TABLE `FileLocks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `path` text NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `lock_time` bigint DEFAULT NULL,
  `expire` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
