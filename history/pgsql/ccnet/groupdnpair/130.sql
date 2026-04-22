create table if not exists groupdnpair
(
    id bigserial,
    group_id integer,
    dn varchar(255),
    primary key (id)
);
