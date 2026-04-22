ALTER TABLE `RepoHistoryLimit` 
  DROP PRIMARY KEY,
  ADD COLUMN `id` bigint NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (`id`),
  MODIFY `repo_id` char(37) DEFAULT NULL,
  ADD UNIQUE KEY `repo_id` (`repo_id`);
