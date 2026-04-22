CREATE INDEX on OrgSharedRepo (org_id, repo_id);
CREATE INDEX on OrgSharedRepo (from_email);
CREATE INDEX on OrgSharedRepo (to_email);

ALTER TABLE OrgSharedRepo ALTER from_email TYPE VARCHAR(255);
ALTER TABLE OrgSharedRepo ALTER to_email TYPE VARCHAR(255);
