CREATE TABLE `RoleDownloadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(255),
  `download_limit` bigint,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`role`)
) ENGINE=InnoDB;
