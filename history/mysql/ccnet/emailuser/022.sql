CREATE TABLE `EmailUser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `passwd` varchar(256) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  `is_active` boolean NOT NULL,
  `ctime` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB;
