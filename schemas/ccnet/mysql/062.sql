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
  `passwd` varchar(256) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `ctime` bigint(20) DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB;

-- Group: table
CREATE TABLE `Group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

-- GroupDNPair: table
CREATE TABLE `GroupDNPair` (
  `group_id` int(11) DEFAULT NULL,
  `dn` varchar(255) DEFAULT NULL
) ENGINE=InnoDB;

-- GroupUser: table
CREATE TABLE `GroupUser` (
  `group_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `is_staff` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;

-- LDAPConfig: table
CREATE TABLE `LDAPConfig` (
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `property` int(11) DEFAULT NULL
) ENGINE=InnoDB;

-- LDAPUsers: table
CREATE TABLE `LDAPUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `extra_attrs` text,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB;

-- OrgGroup: table
CREATE TABLE `OrgGroup` (
  `org_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB;

-- OrgUser: table
CREATE TABLE `OrgUser` (
  `org_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`org_id`,`email`),
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

-- UserRole: table
CREATE TABLE `UserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB;
