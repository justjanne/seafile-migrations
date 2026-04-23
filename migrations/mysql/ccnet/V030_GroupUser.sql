ALTER TABLE `GroupUser` 
  MODIFY `group_id` int NOT NULL,
  MODIFY `user_name` varchar(255) NOT NULL,
  ADD PRIMARY KEY (`group_id`, `user_name`);
