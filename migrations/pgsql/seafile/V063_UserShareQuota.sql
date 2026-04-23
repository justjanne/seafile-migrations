alter table usersharequota drop constraint usersharequota_pkey;
alter table usersharequota add column id bigserial primary key;
alter table usersharequota add unique ("user");
