create database hr;
use hr;
create table staff
(
    id       int(4) primary key,
    name     varchar(10) not null,
    sex      varchar(4),
    job      varchar(20),
    dept     varchar(20),
    entryday varchar(30),
    birthday varchar(30)
) charset = utf8;