alter table emailuser add column is_department_owner boolean default false not null;

create index if not exists idx_emailuser_is_active on emailuser (is_active);
create index if not exists idx_emailuser_is_department_owner on emailuser (is_department_owner);

update emailuser set is_department_owner = true where email like '%@seafile_group';
