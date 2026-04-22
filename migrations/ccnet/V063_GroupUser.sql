ALTER TABLE `GroupUser` 
  DROP PRIMARY KEY,
  ADD COLUMN `id` bigint NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (`id`),
  MODIFY `group_id` bigint DEFAULT NULL,
  MODIFY `user_name` varchar(255) DEFAULT NULL,
  ADD UNIQUE KEY `group_id` (`group_id`, `user_name`);
