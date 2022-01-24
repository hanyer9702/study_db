use world;

-- show tables;

-- 테이블 생성
create table member (
	seq int,
    name varchar(100),
    id varchar(100),
    regdate datetime
);

create table member2 (
	seq int,
    name varchar(100),
    id varchar(100),
    regdate datetime
);

-- 테이블 삭제
drop table member2;
drop table member;

insert into cafe(
	seq
	,name
	,tablenum
	,chairnum
	,addr
	,area
	,rm
) values (
	1
    ,'투썸플레이스'
    ,10
    ,20
    ,'서울시 신사동'
    ,'서울'
    ,'코왈스키'
);

-- varchar 은 ' 또는 " 로 감싼다.
-- int는 사용하지 않아도 된다.
-- 컴마는 앞쪽을 선호 : 이건 호불호가 갈린다.

-- 데이터 조회
select * from cafe;

select * from cafe where seq = 3;
select * from cafe where tablenum = 10;
select * from cafe where name='펭귄카페';
select * from cafe where name = '펭귄카페' and tablenum = 10 and area = '서울';
select * from cafe where rm = '모트' or rm = '줄리언';

select * from cafe where tablenum > 30;
select * from cafe where tablenum < 30;
select * from cafe where tablenum >= 20;
select * from cafe where chairnum <= 20;
select * from cafe where chairnum <> 30;

select * from cafe where name like '%귄카%';
select * from cafe where name like '%탐스';
select * from cafe where name like '메가%';

-- primary key : 유일한 데이터
