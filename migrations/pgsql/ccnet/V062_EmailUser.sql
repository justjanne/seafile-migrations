alter table emailuser add column reference_id varchar(255);
create unique index if not exists emailuser_reference_id_idx on emailuser (reference_id);
