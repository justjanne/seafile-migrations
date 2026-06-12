CREATE TABLE IF NOT EXISTS `message_usermessage` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `from_email` varchar(75) NOT NULL,
  `to_email` varchar(75) NOT NULL,
  `timestamp` datetime NOT NULL,
  `ifread` boolean NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `message_usermessage_8b1dd4eb` (`from_email`),
  KEY `message_usermessage_590d1560` (`to_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `message_usermsglastcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;