/*
	DML(Data Manipulation Language, 데이터 조작어)
    select: 데이터를 조회(검색)
    insert: 데이터를 테이블에 삽입
    update: 데이터를 수정
    delete: 데이터를 삭제
*/
create table voca (
	eng varchar(50) primary key,
    kor varchar(50) not null,
    lev int default 1,
    regdate datetime default now()
);

use ai;
drop table voca;
desc voca;
insert into voca values ('apple', '사과', 1, now()); -- 각 컬럼에 모든 데이터를 넣어야함
insert into voca (eng, kor) values ('banana', '바나나'); -- 데이터를 전부 다 안채워도 된다.
insert into voca values ('orange', '오렌지', null, null); -- 기본값 적용이 안된다.
insert into voca values ('orange', '오렌지', null, null); -- 중복 데이터 삽입 시 에러가 일어난다.
-- Error Code: 1062. Duplicate entry 'orange' for key 'voca.PRIMARY'
select * from voca;
insert into voca (eng, kor) values ('melon', '메론');
insert into voca (eng, kor, lev) values ('avocado', '아보카도', 2);

delete from voca; -- 데이터 전부 삭제
delete from voca where eng = 'banana';
-- where절은 조건을 설정한다. where 절의 =은 같다 뒤에 나오면 대입

update voca set lev=1; -- 전체 데이터의 lev가 1로 바뀐다.
update voca set lev=2 where eng = 'avocado'; -- avocado의 레벨을 2로 바꾼다.
desc member;
alter table member add gender varchar(10) not null; -- member 테이블의 gender 컬럼 생성
select * from member;
-- MySQL은 auto_increment를 주는 키를 무조건 기본 키로 설정해야 한다. 테이블 당 한개만 넣을 수 있다.
-- 회원 가입
insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) values ('apple', '1111', '김사과', '010-1111-1111', 'apple@apple.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11','여자'); -- auto_increment 때문에 바로 values가 오는 문법을 사용할 수 없다.
insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) values ('banana', '2222', '반하나', '010-2222-2222', 'banana@banana.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11','여자');
insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) values ('orange', '3333', '오렌지', '010-3333-3333', 'orange@orange.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11','남자');
insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) values ('melon', '4444', '이메론', '010-4444-4444', 'melon@melon.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11','남자');
insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender) values ('cherry', '5555', '채리', '010-5555-5555', 'cherry@cherry.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11','여자');

update member set point = 0 where idx = 5; -- idx가 5번인 사람의 point가 0으로 바뀐다.
update member set point = point + 50; -- 모든 열의 point에 50씩 더해서 대입
update member set point = point + 100 where idx = 2; -- idx가 2번인 사람의 point를 100 더한다.

select * from member;
select userid from member;
select userid, name from member;
select hp, userid, name from member; -- 하나라도 덜 가져와라 부하가 덜걸린다.

select 100;
select 100 + 50;
select 100 + 50 as 덧셈;
select 100 + 50 as '덧셈 연산'; -- as 뒤에 띄어쓰기가 필요한 경우 작은 따옴표로 감싸준다.
select ''; -- 빈 문자열
select null; -- 실제 데이터가 없다는 뜻
select 100 + ''; -- 숫자와 문자의 연산
select 100 + null; -- null과의 연산은 무조건 null
drop table member;
/*
	산술 연산자: +, -, *, /, mod, div
    비교 연산자: =, <, >, <=, >=, <>(다르다)
    대입 연산자: =
    논리 연산자: and, or, not, xor
    is: 양쪽의 피연산자가 모두 같으면 true, 아니면 false
    between A and B: A보다는 크거나 같고, B 보다는 작거나 같으면 true, 아니면 false
    in: 매개변수로 전달된 리스트에 값이 존재하면 true 아니면 false
    like: 패턴으로 문자열을 검색하여 값이 존재하면 true, 아니면 false
*/
-- 포인트가 150 이상인 멤버의 아이디, 이름, 포인트를 검색
select userid, name, point from member where point >= 150;
-- 포인트가 150이상이고, 200이하인 멤버의 아이디, 이름, 포인트, 성별을 검색
select userid, name, point, gender from member where point >= 150 and point <= 200;
select userid, name, point, gender from member where point between 150 and 200;
-- 로그인
select userid from member where userid='apple' and userpw='1111'; -- 성공
select userid from member where userid='apple' and userpw='1234'; -- 실패
-- 이름이 김사과, 반하나, 오렌지인 사람의 모든 정보를 검색
select * from member where name='김사과' or name='반하나' or name='오렌지';
select * from member where name in ('김사과', '반하나', '오렌지');

insert into member (userid, userpw, name, hp, email, ssn1, ssn2, zipcode, address1, address2, address3, gender, regdate) values ('berry', '6666', '배애리', '010-6666-6666', 'berry@berry.com', '001011', '4011111', '12345', '서울 서초구', '양재동', '111-11','여자', null);
-- regdate가 null인 멤버를 검색
select * from member where regdate = null; -- 원하는 정보가 나오지 않음
select * from member where regdate is null; -- null 찾는 방법
select * from member where regdate is not null; -- null이 아닌 곳 찾는 방법
-- 아이디가 a로 시작하는 멤버의 정보를 검색
select * from member where userid like 'a%'; -- a로 시작
-- 아이디가 a로 끝나는 멤버의 정보를 검색

select * from member where userid like '%a'; -- a로 끝
-- 아이디가 a를 포함하는 멤버의 정보를 검색
select * from member where userid like '%a%'; -- a를 포함
-- 이메일이 '.com'으로 끝나는 멤버의 정보를 검색
select * from member where email like '%.com';
-- 이름이 3자인 멤버를 검색
select * from member where name like '___'; -- '_'3개
-- 이름이 첫 글자가 '김'씨이며 3자인 멤버를 검색
select * from member where  name like '김__';
-------------------------------------------------------
select * from member order by idx; -- 오름차순 asc 생략
select * from member order by idx asc; -- 오름차순
select * from member order by idx desc; -- 내림차순
-- 멤버를 포인트 순으로 정렬
select * from member order by point desc;
-- 멤버를 포인트 순으로 정렬. 단 포인트가 같으면 가입 최신순으로 정렬
select * from member order by point desc, regdate desc;

-- limit: 일부 로우(레코드)를 검색
-- limit 검색할 로우의 개수
select * from member limit 2;
-- limit 시작로우(인덱스) 가져올 로우의 개수 
select * from member limit 2, 3;
-- 멤버에서 포인트순으로 내림차순 정렬하고 포인트가 같다면 가입순으로 내림차순 한 뒤 top 3를 검색
select * from member order by point desc, regdate desc limit 3;

/*
	group
    select 그룹을 맺을 컬럼 또는 집계함수 from 테이블 group by 그룸을 맺을 컬럼
    select 그룹을 맺을 컬럼 또는 집계함수 from 테이블 group by 그룸을 맺을 컬럼 having 그룹에 대한 조건
*/
select gender from member group by gender;
select gender, count(idx) as 인원수 from member group by gender;
select gender, count(idx) as 인원수 from member group by gender having gender = '여자'; -- 테이블 -> 그룹 -> having -> 조회
select gender, count(idx) as 인원수 from member where gender='여자' group by gender; -- 테이블 -> where절 -> 그룹 -> 조회
-- 성별로 그룹을 맺고 인원수가 3명 이상인 성별을 검색
select gender, count(idx) as 인원수 from member group by gender having count(idx) >= 3;
select gender, count(idx) as 인원수 from member group by gender having 인원수 >= 3; -- 앞에서 만든 별칭을 변수처럼 사용할 수 있다.
/*
멤버 중 포인트가 50이상인 멤버중에서 성별로 그룹을 나눈 뒤,
각 그룹의 포인트 평균을 구하고 평균의 포인트가 100이상인 성별을 출력
(단, 성별이 남자, 여자 모두 출력된다면 포인트가 높은 성별을 우선으로 출력)
*/
select gender, avg(point) as 평균
from member where point >=50
group by gender having avg(point) >= 100
order by 평균 desc limit 1;
select * from member;













