alter table binding add column id bigserial primary key;
create index if not exists idx_binding_email on binding (email);
