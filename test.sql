use ai;

CREATE TABLE test_member (
    userid VARCHAR(50) PRIMARY KEY,      -- 회원 아이디, 중복 불가
    username VARCHAR(50) NOT NULL,       -- 회원 이름
    userpw VARCHAR(100) NOT NULL,        -- 비밀번호
    phone VARCHAR(20),                   -- 전화번호
    email VARCHAR(100),                  -- 이메일
    regdate DATETIME DEFAULT NOW()       -- 가입일
);
ALTER TABLE test_member DROP COLUMN email;

INSERT INTO test_member (userid, username, userpw, phone, email)
VALUES ('apple', '김사과', '1111', '010-1111-1111', 'apple@test.com'),
('banana', '반하나', '2222', '010-2222-2222', 'banana@test.com'),
('melon', '이메론', '3333', '010-3333-3333', 'melon@test.com');


select * from test_member;

CREATE TABLE phonebook (
 name VARCHAR(50) NOT NULL,
 phone VARCHAR(30) NOT NULL PRIMARY KEY,
 address VARCHAR(200)
);
select phone from phonebook where name like '%4%' or phone like '%4%';
INSERT INTO phonebook (name, phone, address)
VALUES ('김사과', '010-1111-1111', '서울'),
('반하나', '010-2222-2222', '경기도'),
('이메론', '010-3333-3333', '전라도');
select phone from phonebook where name like concat('%%', '%s','%%) or phone like concat('%%', '%s','%%);
select * from phonebook;
update phonebook set phone = '010-1234-1234' where phone = '010-4444-4444'
