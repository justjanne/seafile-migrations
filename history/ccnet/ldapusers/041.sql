CREATE TABLE `LDAPUsers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_staff` boolean NOT NULL,
  `is_active` boolean NOT NULL,
  `extra_attrs` text,
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB;
