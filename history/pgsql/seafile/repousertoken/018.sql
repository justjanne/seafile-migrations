create table if not exists repousertoken
(
    repo_id char(36),
    email varchar(255),
    token char(40),
    unique (repo_id, token)
);

create index if not exists repousertoken_email_idx
    on repousertoken (email);
