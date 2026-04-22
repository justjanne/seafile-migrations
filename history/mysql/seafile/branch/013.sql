CREATE TABLE `Branch` (
  `name` varchar(10) NOT NULL,
  `repo_id` char(41) NOT NULL,
  `commit_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`repo_id`,`name`)
) ENGINE=InnoDB;
