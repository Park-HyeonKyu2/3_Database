create database DoItSQL;
use DoItSQL;
create table doit_create_table (
col_1 int,
col_2 varchar(50),
col_3 datetime
);

drop table doit_create_table;

create table doit_dml(
col_1 int,
col_2 varchar(50),
col_3 datetime
);

insert into doit_dml (col_1, col_2, col_3) values (1, 'DoItSQL', '2026-01-01');

select * from doit_dml;