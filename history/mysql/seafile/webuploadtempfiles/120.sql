CREATE TABLE `WebUploadTempFiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(40) NOT NULL,
  `file_path` text NOT NULL,
  `tmp_file_path` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
