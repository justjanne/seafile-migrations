ALTER TABLE `SharedRepo`
  MODIFY `from_email` varchar(255),
  MODIFY `to_email` varchar(255),
  ADD INDEX (`from_email`),
  ADD INDEX (`to_email`);
