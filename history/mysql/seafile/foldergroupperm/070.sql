CREATE TABLE `FolderGroupPerm` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `repo_id` char(36) NOT NULL,
  `path` text NOT NULL,
  `permission` char(15) DEFAULT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repo_id` (`repo_id`)
) ENGINE=InnoDB;
