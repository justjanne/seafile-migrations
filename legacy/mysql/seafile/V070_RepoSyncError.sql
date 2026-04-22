CREATE TABLE `RepoSyncError` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` char(41),
  `error_time` bigint unsigned,
  `error_con` varchar(1024),
  PRIMARY KEY (`id`),
  UNIQUE KEY (`token`)
) ENGINE=InnoDB;

ALTER TABLE `RepoSyncError` MODIFY COLUMN `error_con` VARCHAR(1024);
