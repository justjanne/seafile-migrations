ALTER TABLE emailuser ADD COLUMN IF NOT EXISTS is_department_owner BOOLEAN NOT NULL DEFAULT FALSE;
CREATE INDEX idx_emailuser_is_active ON emailuser(is_active);
CREATE INDEX idx_emailuser_is_department_owner ON emailuser(is_department_owner);
UPDATE emailuser SET is_department_owner = TRUE WHERE email LIKE '%@seafile_group';
