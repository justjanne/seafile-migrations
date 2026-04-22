CREATE TABLE `GroupDNPair` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `dn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
