CREATE TABLE `GroupStructure` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int,
  `path` varchar(1024),
  PRIMARY KEY (`id`)
  UNIQUE KEY (`group_id`)
) ENGINE=InnoDB;