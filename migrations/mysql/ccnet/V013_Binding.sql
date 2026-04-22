CREATE TABLE `Binding` (
  `email` varchar(255) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  UNIQUE KEY `peer_id` (`peer_id`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB;
