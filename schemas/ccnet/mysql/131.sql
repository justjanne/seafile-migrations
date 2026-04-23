-- Binding: table
CREATE TABLE `Binding` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `peer_id` char(41) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `peer_id` (`peer_id`),
  KEY `email` (`email`(20))
) ENGINE=InnoDB;

-- EmailUser: table
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

-- Group: table
CREATE TABLE `Group` (
  `group_id` bigint NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `timestamp` bigint DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `parent_group_id` int DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB;

-- GroupDNPair: table
CREATE TABLE `GroupDNPair` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `dn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- GroupStructure: table
CREATE TABLE `GroupStructure` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB;

-- GroupUser: table
CREATE TABLE `GroupUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` bigint DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `is_staff` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_name`),
  KEY `user_name` (`user_name`)
) ENGINE=InnoDB;

-- LDAPConfig: table
CREATE TABLE `LDAPConfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `property` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

-- LDAPUsers: table
CREATE TABLE `LDAPUsers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_staff` boolean NOT NULL,
  `is_active` boolean NOT NULL,
  `extra_attrs` text,
  `reference_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `reference_id` (`reference_id`)
) ENGINE=InnoDB;

-- OrgFileExtWhiteList: table
CREATE TABLE `OrgFileExtWhiteList` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `white_list` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`)
) ENGINE=InnoDB;

-- OrgGroup: table
CREATE TABLE `OrgGroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`group_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB;

-- OrgUser: table
CREATE TABLE `OrgUser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `org_id` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_staff` boolean NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_id` (`org_id`,`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB;

-- Organization: table
CREATE TABLE `Organization` (
  `org_id` bigint NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `url_prefix` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `ctime` bigint DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  UNIQUE KEY `url_prefix` (`url_prefix`)
) ENGINE=InnoDB;

-- UserRole: table
CREATE TABLE `UserRole` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `is_manual_set` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB;
