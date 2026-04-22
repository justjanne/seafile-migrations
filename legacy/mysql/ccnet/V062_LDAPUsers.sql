ALTER TABLE `LDAPUsers`
  ADD COLUMN `reference_id` varchar(255),
  ADD UNIQUE KEY (`reference_id`);
