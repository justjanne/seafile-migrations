CREATE TABLE `UserUploadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255),
  `upload_limit` bigint,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`user`)
) ENGINE=InnoDB;
