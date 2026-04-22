CREATE TABLE `RoleUploadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  `upload_limit` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role` (`role`)
) ENGINE=InnoDB;
