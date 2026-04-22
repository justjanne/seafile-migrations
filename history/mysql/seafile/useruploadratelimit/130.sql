CREATE TABLE `UserUploadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `upload_limit` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB;
