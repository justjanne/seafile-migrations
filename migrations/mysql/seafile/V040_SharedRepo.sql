ALTER TABLE `SharedRepo` 
  ADD COLUMN `id` int NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (`id`),
  MODIFY `from_email` varchar(255) DEFAULT NULL,
  MODIFY `to_email` varchar(255) DEFAULT NULL,
  ADD INDEX `from_email` (`from_email`),
  ADD INDEX `to_email` (`to_email`);
