CREATE TABLE `RepoValidSince` (
  `repo_id` char(37) NOT NULL,
  `timestamp` bigint DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
