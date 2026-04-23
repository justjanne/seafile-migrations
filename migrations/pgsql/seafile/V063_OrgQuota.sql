alter table orgquota drop constraint orgquota_pkey;
alter table orgquota add column id bigserial primary key;
alter table orgquota add unique (org_id);
