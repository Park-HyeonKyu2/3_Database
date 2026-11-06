use ai;

show databases;
show tables;

select * from member;

create user 'banana'@'lpcalhost' identified by '2222';
-- Error Code: 1227. Access denied; you need (at least one of) the CREATE USER privilege(s) for this operation
