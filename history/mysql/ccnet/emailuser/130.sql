CREATE TABLE `EmailUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `passwd` varchar(256) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  `is_active` boolean NOT NULL,
  `is_department_owner` boolean NOT NULL DEFAULT '0',
  `ctime` bigint DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `reference_id` (`reference_id`),
  KEY `is_active` (`is_active`),
  KEY `is_department_owner` (`is_department_owner`)
) ENGINE=InnoDB;
