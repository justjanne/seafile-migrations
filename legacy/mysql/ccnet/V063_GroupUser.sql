ALTER TABLE `GroupUser`
  DROP PRIMARY KEY,
  ADD COLUMN `id` bigint NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY (`group_id`, `user_name`);
