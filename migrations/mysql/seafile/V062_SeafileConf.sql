CREATE TABLE `SeafileConf` (
  `cfg_group` varchar(255) NOT NULL,
  `cfg_key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `property` int DEFAULT NULL
) ENGINE=InnoDB;
