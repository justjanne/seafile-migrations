CREATE TABLE `OrgRepo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `repo_id` char(37) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`repo_id`),
  UNIQUE KEY `repo_id` (`repo_id`),
  KEY `org_id_2` (`org_id`,`user`),
  KEY `user` (`user`)
) ENGINE=InnoDB;
