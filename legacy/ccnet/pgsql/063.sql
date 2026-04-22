CREATE TABLE "LDAPConfig" (
    id serial NOT NULL,
    cfg_group character varying(255) NOT NULL,
    cfg_key character varying(255) NOT NULL,
    value character varying(255),
    property integer
);

ALTER TABLE ONLY "LDAPConfig" ADD CONSTRAINT "LDAPConfig_id_pkey" PRIMARY KEY (id);

CREATE TABLE "GroupStructure" (
    id serial NOT NULL,
    group_id integer,
    path character varying(1024)
);

ALTER TABLE ONLY "GroupStructure" ADD CONSTRAINT "GroupStructure_id_pkey" PRIMARY KEY (id);

ALTER TABLE "Group" ADD COLUMN parent_group_id INTEGER;
ALTER TABLE "Group" ALTER COLUMN parent_group_id SET DEFAULT 0;

ALTER TABLE Binding ADD COLUMN id serial NOT NULL;
ALTER TABLE ONLY Binding ADD CONSTRAINT "Binding_id_pkey" PRIMARY KEY (id);

ALTER TABLE LDAPConfig ADD COLUMN id serial NOT NULL;

ALTER TABLE OrgUser ADD COLUMN id SERIAL NOT NULL;
ALTER TABLE ONLY OrgUser ADD CONSTRAINT "OrgUser_id_pkey" PRIMARY KEY (id);

ALTER TABLE OrgGroup ADD COLUMN id SERIAL NOT NULL;
ALTER TABLE ONLY OrgGroup ADD CONSTRAINT "OrgGroup_id_pkey" PRIMARY KEY (id);

ALTER TABLE GroupUser ADD COLUMN id SERIAL NOT NULL;
ALTER TABLE ONLY GroupUser ADD CONSTRAINT "GroupUser_id_pkey" PRIMARY KEY (id);

ALTER TABLE GroupDNPair ADD COLUMN id SERIAL NOT NULL;
ALTER TABLE ONLY GroupDNPair ADD CONSTRAINT "GroupDNPair_id_pkey" PRIMARY KEY (id);