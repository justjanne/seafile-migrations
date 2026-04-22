CREATE TABLE `Repo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(37) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
