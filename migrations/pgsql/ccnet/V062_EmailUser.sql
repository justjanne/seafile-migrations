alter table emailuser add column reference_id varchar(255);

alter index if exists EmailUser_reference_id rename to emailuser_reference_id_idx;
create unique index if not exists emailuser_reference_id_idx on emailuser (reference_id);
