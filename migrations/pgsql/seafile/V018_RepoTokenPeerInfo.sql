create table if not exists repotokenpeerinfo
(
    token char(40) not null,
    peer_id char(40),
    peer_ip varchar(40),
    peer_name varchar(255),
    sync_time bigint,
    primary key (token)
);
