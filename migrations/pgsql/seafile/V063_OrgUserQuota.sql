alter table orguserquota drop constraint orguserquota_pkey;
alter table orguserquota add column id bigserial primary key;
alter table orguserquota add unique (org_id, "user");
