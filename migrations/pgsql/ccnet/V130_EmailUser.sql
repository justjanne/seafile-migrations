alter table emailuser alter column id type bigint;
alter table emailuser alter column is_staff type boolean using is_staff::boolean;
alter table emailuser alter column is_active type boolean using is_active::boolean;
alter table emailuser add column is_department_owner boolean default false not null;

create index if not exists idx_emailuser_is_active on emailuser (is_active);
create index if not exists idx_emailuser_is_department_owner on emailuser (is_department_owner);
