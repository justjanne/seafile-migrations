ALTER TABLE `Group` 
  MODIFY `group_id` bigint NOT NULL AUTO_INCREMENT,
  ADD COLUMN `parent_group_id` int DEFAULT NULL;
