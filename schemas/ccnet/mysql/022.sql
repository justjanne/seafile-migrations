-- Binding: table
CREATE TABLE `Binding` (
  `email` varchar(255) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  UNIQUE KEY `peer_id` (`peer_id`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB;

-- EmailUser: table
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

-- Group: table
CREATE TABLE `Group` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

-- GroupUser: table
CREATE TABLE `GroupUser` (
  `group_id` int DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_staff` tinyint DEFAULT NULL,
  UNIQUE KEY `group_id` (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;

-- OrgGroup: table
CREATE TABLE `OrgGroup` (
  `org_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  UNIQUE KEY `org_id` (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB;

-- OrgUser: table
CREATE TABLE `OrgUser` (
  `org_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  UNIQUE KEY `org_id` (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB;

-- Organization: table
CREATE TABLE `Organization` (
  `org_id` int NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `url_prefix` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `ctime` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `url_prefix` (`url_prefix`)
) ENGINE=InnoDB;
