-- Binding: table
CREATE TABLE `Binding` (
  `email` varchar(255) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  UNIQUE KEY `peer_id` (`peer_id`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB;

-- EmailUser: table
CREATE TABLE `EmailUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `passwd` char(41) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  `is_active` boolean NOT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB;

-- Group: table
CREATE TABLE `Group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

-- GroupUser: table
CREATE TABLE `GroupUser` (
  `group_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  UNIQUE KEY `group_id` (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;

-- OrgGroup: table
CREATE TABLE `OrgGroup` (
  `org_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  UNIQUE KEY `org_id` (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB;

-- OrgUser: table
CREATE TABLE `OrgUser` (
  `org_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  UNIQUE KEY `org_id` (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB;

-- Organization: table
CREATE TABLE `Organization` (
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `url_prefix` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `url_prefix` (`url_prefix`)
) ENGINE=InnoDB;
