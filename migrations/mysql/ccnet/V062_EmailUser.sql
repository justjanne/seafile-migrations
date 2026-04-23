ALTER TABLE `EmailUser` 
  ADD COLUMN `reference_id` varchar(255) DEFAULT NULL,
  ADD UNIQUE KEY `reference_id` (`reference_id`);
