CREATE TABLE `UserDownloadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255),
  `download_limit` bigint,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`user`)
) ENGINE=InnoDB;
