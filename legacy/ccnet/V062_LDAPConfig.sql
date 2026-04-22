CREATE TABLE `LDAPConfig` (
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255),
  `property` int
) ENGINE=InnoDB;
