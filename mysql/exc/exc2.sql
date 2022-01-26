use world;

CREATE TABLE IF NOT EXISTS `book3` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `publisher_cd` INT NULL,
  PRIMARY KEY (`no`));
  
CREATE TABLE IF NOT EXISTS `publisher` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`));
  
desc book3;
desc publisher;

insert into book3(
	name
	,publisher_cd
) values (
	'발은 발이지 사랑이 아니다'
    ,5
);

insert into publisher(
	name
) values (
	'줄리언 대왕 만세'
);

select * from book3;
select * from publisher;

select
a.no
,a.name
,a.publisher_cd
,b.name
from book3 as a
-- left join publisher as b on a.publisher_cd = b.no;
inner join publisher as b on a.publisher_cd = b.no;

-- 테이블 조인을 해야 되면 테이블 이름에 알리아스를 넣는다. (alias)

select
	a.no
    ,a.name
    ,a.publisher_cd
    ,(select name from publisher where no = a.publisher_cd)
from book3 as a;

select
	a.no
    ,a.name
    ,a.publisher_cd
    ,(select name from publisher where no = a.publisher_cd) as publisher_name
from book3 as a;

select
	a.no
    ,a.name
    ,a.publisher_cd
    ,getPublisherName -- 함수, function
from book3 as a;

