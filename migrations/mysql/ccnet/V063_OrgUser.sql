ALTER TABLE `OrgUser` 
  DROP PRIMARY KEY,
  ADD COLUMN `id` bigint NOT NULL AUTO_INCREMENT FIRST,
  ADD PRIMARY KEY (`id`),
  MODIFY `org_id` int DEFAULT NULL,
  MODIFY `email` varchar(255) DEFAULT NULL,
  ADD UNIQUE KEY `org_id` (`org_id`, `email`);
