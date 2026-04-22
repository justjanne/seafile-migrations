CREATE TABLE `GroupStructure` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB;
