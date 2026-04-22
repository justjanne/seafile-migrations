ALTER TABLE `OrgGroup` 
  MODIFY `org_id` int NOT NULL,
  MODIFY `group_id` int NOT NULL,
  ADD PRIMARY KEY (`org_id`, `group_id`);
