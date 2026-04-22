CREATE TABLE `RepoTokenPeerInfo` (
  `token` char(41) NOT NULL,
  `peer_id` char(41) DEFAULT NULL,
  `peer_ip` varchar(41) DEFAULT NULL,
  `peer_name` varchar(255) DEFAULT NULL,
  `sync_time` bigint DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB;
