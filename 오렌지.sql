use ai;

select * from member;

insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) values ('avocado', '1111', '아보카도', '010-1111-1111', 'apple@apple.com', '001011', '4011111', '12345', '경기도 화성시', '양재동', '111-11','여자');
delete from member where idx = 8;
-- Error Code: 1142. DELETE command denied to user 'orange'@'localhost' for table 'member'




