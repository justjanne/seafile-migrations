CREATE TABLE `RepoGroup` (
  `repo_id` char(37) DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `permission` char(15) DEFAULT NULL,
  UNIQUE KEY `group_id` (`group_id`,`repo_id`),
  KEY `repo_id` (`repo_id`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;
