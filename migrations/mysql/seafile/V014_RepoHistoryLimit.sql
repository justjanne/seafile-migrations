CREATE TABLE `RepoHistoryLimit` (
  `repo_id` char(37) NOT NULL,
  `days` int DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
