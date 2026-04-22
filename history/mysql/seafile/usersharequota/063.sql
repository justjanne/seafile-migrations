CREATE TABLE `UserShareQuota` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB;
