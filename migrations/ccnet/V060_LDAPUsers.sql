ALTER TABLE `LDAPUsers` 
  DROP INDEX `email`,
  ADD UNIQUE KEY `email` (`email`);
