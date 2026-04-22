alter table innerpubrepo drop constraint innerpubrepo_pkey;
alter table innerpubrepo add column id bigserial primary key;
alter table innerpubrepo add unique (repo_id);
alter table innerpubrepo alter column repo_id type char(37);
alter table innerpubrepo alter column permission type char(15);
