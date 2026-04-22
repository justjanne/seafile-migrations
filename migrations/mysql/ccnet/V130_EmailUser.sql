ALTER TABLE `EmailUser` 
  ADD COLUMN `is_department_owner` boolean NOT NULL DEFAULT '0',
  ADD INDEX `is_active` (`is_active`),
  ADD INDEX `is_department_owner` (`is_department_owner`);
