ALTER TABLE EmailUser
    ADD COLUMN IF NOT EXISTS reference_id character varying(255) UNIQUE;
ALTER TABLE LDAPUsers
    ADD COLUMN IF NOT EXISTS reference_id character varying(255) UNIQUE;
