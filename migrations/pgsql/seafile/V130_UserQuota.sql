alter table userquota drop constraint userquota_pkey;
alter table userquota add column id bigserial primary key;
alter table userquota add unique ("user");
