ALTER TABLE `EmailUser`
  ADD COLUMN `reference_id` varchar(255),
  ADD UNIQUE KEY (`reference_id`);
