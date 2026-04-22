ALTER TABLE `RepoInfo`
  ADD COLUMN `type` varchar(10);
CREATE INDEX `RepoInfoTypeIndex` on `RepoInfo` (`type`);
