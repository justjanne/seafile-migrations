ALTER TABLE `OrgUser` 
  MODIFY `org_id` int NOT NULL,
  MODIFY `email` varchar(255) NOT NULL,
  ADD PRIMARY KEY (`org_id`, `email`);
