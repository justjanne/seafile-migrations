ALTER TABLE SharedRepo ALTER from_email TYPE VARCHAR(255);

ALTER TABLE SharedRepo ALTER to_email TYPE VARCHAR(255);

CREATE INDEX on SharedRepo (from_email);

CREATE INDEX on SharedRepo (to_email);


CREATE TABLE IF NOT EXISTS OrgSharedRepo (
                                             id SERIAL PRIMARY KEY,
                                             org_id INT,
                                             repo_id CHAR(37) ,
    from_email VARCHAR(255),
    to_email VARCHAR(255),
    permission CHAR(15)
    );

CREATE INDEX on OrgSharedRepo (org_id, repo_id);
CREATE INDEX on OrgSharedRepo (from_email);
CREATE INDEX on OrgSharedRepo (to_email);

ALTER TABLE OrgSharedRepo ALTER from_email TYPE VARCHAR(255);

ALTER TABLE OrgSharedRepo ALTER to_email TYPE VARCHAR(255);
