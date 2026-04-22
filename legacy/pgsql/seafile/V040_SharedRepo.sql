ALTER TABLE SharedRepo ALTER from_email TYPE VARCHAR(255);
ALTER TABLE SharedRepo ALTER to_email TYPE VARCHAR(255);

CREATE INDEX on SharedRepo (from_email);
CREATE INDEX on SharedRepo (to_email);
