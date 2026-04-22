CREATE TABLE `RoleUploadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(255),
  `upload_limit` bigint,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`role`)
) ENGINE=InnoDB;
