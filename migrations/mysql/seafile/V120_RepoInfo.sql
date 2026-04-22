ALTER TABLE `RepoInfo` 
  ADD COLUMN `type` varchar(10) DEFAULT NULL,
  ADD INDEX `type` (`type`);
