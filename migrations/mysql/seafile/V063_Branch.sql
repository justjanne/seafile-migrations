ALTER TABLE `Branch` 
  DROP PRIMARY KEY,
  ADD COLUMN `id` bigint NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (`id`),
  MODIFY `name` varchar(10) DEFAULT NULL,
  MODIFY `repo_id` char(41) DEFAULT NULL,
  ADD UNIQUE KEY `repo_id` (`repo_id`, `name`);
