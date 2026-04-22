CREATE TABLE `UserDownloadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `download_limit` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB;
