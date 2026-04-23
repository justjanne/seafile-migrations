CREATE TABLE `UserShareQuota` (
  `user` varchar(255) NOT NULL,
  `quota` bigint DEFAULT NULL,
  PRIMARY KEY (`user`)
) ENGINE=InnoDB;
