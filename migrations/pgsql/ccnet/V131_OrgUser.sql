alter table orguser add column id bigserial primary key;
alter table orguser alter column is_staff type boolean using is_staff::boolean;
alter index orguser_email_idx rename to idx_orguser_email;
