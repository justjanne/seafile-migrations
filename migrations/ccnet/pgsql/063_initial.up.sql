CREATE TABLE IF NOT EXISTS LDAPConfig
(
    id        serial                 NOT NULL PRIMARY KEY,
    cfg_group character varying(255) NOT NULL,
    cfg_key   character varying(255) NOT NULL,
    value     character varying(255),
    property  integer
);

CREATE TABLE IF NOT EXISTS GroupStructure
(
    id       serial NOT NULL primary key,
    group_id integer,
    path     character varying(1024)
);

ALTER TABLE "group"
    ADD COLUMN IF NOT EXISTS parent_group_id INTEGER DEFAULT 0;

ALTER TABLE ONLY Binding
    ADD primary key (id);

ALTER TABLE OrgUser
    ADD COLUMN IF NOT EXISTS id serial NOT NULL PRIMARY KEY;

ALTER TABLE OrgGroup
    ADD COLUMN IF NOT EXISTS id serial NOT NULL PRIMARY KEY;

ALTER TABLE GroupUser
    ADD COLUMN IF NOT EXISTS id serial NOT NULL PRIMARY KEY;

ALTER TABLE GroupDNPair
    ADD COLUMN IF NOT EXISTS id serial NOT NULL PRIMARY KEY;