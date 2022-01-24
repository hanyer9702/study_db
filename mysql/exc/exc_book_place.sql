CREATE TABLE IF NOT EXISTS `book2` (
  `seq` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `subheading` VARCHAR(100) NULL,
  `category` INT NULL,
  `author` VARCHAR(100) NULL,
  `pub` VARCHAR(100) NULL,
  `pubdate` DATETIME NULL,
  `series` VARCHAR(100) NULL,
  `price` INT NULL,
  `salenumber` INT NULL,
  `price_ebook` INT NULL,
  `discount` INT NULL,
  `gift` INT NULL,
  `deli_date` INT NULL,
  `image` VARCHAR(100) NULL,
  `used` INT NULL,
  `review` INT NULL,
  `scope` FLOAT NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = '서점';

drop table book2;

select * from book2;

insert into book2(
	seq
    , name
    , subheading
    , category
    , author
    , pub
    , pubdate
    , series
    , price
    , salenumber
    , price_ebook
    , discount
    , gift
    , deli_date
    , image
    , used
    , review
    , scope
) values (
	1
	, 'Do it! HTML+CSS+자바스크립트 웹 표준의 정석'
    , '한 권으로 끝내는 웹 기본 교과서'
    , 1
    , '고경희'
    , '이지스퍼블리싱'
    , '2021-01-01 00:00:00'
    , '이지스퍼블리싱-Do it! 시리즈'
    , 27000
    , 49899
    , 19000
    , 10
    , 2
    , 2
    , '../image/1.jpg'
    , 11
    , 15
    , 9.6
);



CREATE TABLE IF NOT EXISTS `place` (
  `seq` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `address` VARCHAR(300) NULL,
  `guestminnum` INT NULL,
  `guestmaxnum` INT NULL,
  `facility_table` TINYINT NULL,
  `facility_mirror` TINYINT NULL,
  `facility_bathroom` TINYINT NULL,
  `facility_smoke` TINYINT NULL,
  `facility_lounge` TINYINT NULL,
  `facility_shower` TINYINT NULL,
  `facility_wifi` TINYINT NULL,
  `placetype_vocal` TINYINT NULL,
  `placetype_ins` TINYINT NULL,
  `reshourmin` INT NULL,
  `reshourmax` INT NULL,
  `introduce` VARCHAR(500) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
COMMENT = '연습실 대여';

drop table place;

select * from place;

delete from place where seq = 1;

insert into place(
	seq
    , name
    , address
    , guestminnum
    , guestmaxnum
    , facility_table
    , facility_mirror
    , facility_bathroom
    , facility_smoke
    , facility_lounge
    , facility_shower
    , facility_wifi
	, placetype_vocal
    , placetype_ins
	, reshourmin
    , reshourmax
    , introduce
) values (
	1
    , '성북동 연습실'
    , '서울시 성북구 성북동'
    , 1
    , 4
    , 1
    , 1
    , 1
    , 1
    , 1
    , 1
    , 1
    , 1
    , 1
    , 1
    , null
    , '레슨, 성악, 보컬, 피아노, 악기 연습 등 원하는 음악을 마음껏 할 수 있는 지상 연습실 (단, 금관악기는 제외)'
);