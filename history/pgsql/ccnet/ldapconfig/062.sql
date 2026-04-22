create table if not exists ldapconfig
(
    cfg_group varchar(255) not null,
    cfg_key varchar(255) not null,
    value varchar(255),
    property integer
);
