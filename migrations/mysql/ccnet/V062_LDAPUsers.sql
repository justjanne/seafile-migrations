ALTER TABLE `LDAPUsers` 
  ADD COLUMN `reference_id` varchar(255) DEFAULT NULL,
  ADD UNIQUE KEY `reference_id` (`reference_id`);
