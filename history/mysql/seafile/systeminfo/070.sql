CREATE TABLE `SystemInfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `info_key` varchar(256) DEFAULT NULL,
  `info_value` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
