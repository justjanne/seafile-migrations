CREATE TABLE `OrgUploadRateLimit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int,
  `upload_limit` bigint,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`org_id`)
) ENGINE=InnoDB;
