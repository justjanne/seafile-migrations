alter table emailuser alter column is_staff type boolean using is_staff::boolean;
create index if not exists idx_emailuser_is_active on emailuser (is_active);

alter table emailuser alter column is_active type boolean using is_active::boolean;
create index if not exists idx_emailuser_is_department_owner on emailuser (is_department_owner);

alter table emailuser add column is_department_owner boolean default false not null;
