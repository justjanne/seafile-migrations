CREATE TABLE `RepoHead` (
  `repo_id` char(37) NOT NULL,
  `branch_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`repo_id`)
) ENGINE=InnoDB;
