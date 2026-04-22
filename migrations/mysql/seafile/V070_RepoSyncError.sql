CREATE TABLE `RepoSyncError` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` char(41) DEFAULT NULL,
  `error_time` bigint unsigned DEFAULT NULL,
  `error_con` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB;
