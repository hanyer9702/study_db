CREATE TABLE IF NOT EXISTS `book4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`));
  
CREATE TABLE IF NOT EXISTS `review4` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `book4_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_review4_book4_idx` (`book4_no` ASC) VISIBLE,
  CONSTRAINT `fk_review4_book4`
    FOREIGN KEY (`book4_no`)
    REFERENCES `book4` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    desc book4;
    
insert into book4(
	name
) values (
	'왜 그는 왕관을 쓰는가'
);

select * from book4;

desc review4;

insert into review4 (
	comment
    , book4_no
) values (
	'한마디로 말할 수 있다 천재'
    ,1
);

select * from review4;


CREATE TABLE IF NOT EXISTS `world`.`book5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`review5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NULL,
  `book5_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`, `book5_no`),
  INDEX `fk_review5_book51_idx` (`book5_no` ASC) VISIBLE,
  CONSTRAINT `fk_review5_book51`
    FOREIGN KEY (`book5_no`)
    REFERENCES `world`.`book5` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';

desc book5;

insert into book5(
	name
) values (
	'모트'
);

select * from book5;

insert into review5(
	comment
    , book5_no
) values (
	'대왕님 짱 멋져'
    ,7
);

select * from review5;

-- 점선 : nonidentifying : 부모자식관계 : 개발하기 좀 불편하다.
-- 실선 : identifying : 개발용이성 높다

desc review5;

select
	a.name
	, (select count(no) from review5 where book5_no = a.no) as count
from book5 a;

select
	b.comment
    , a.name
from book5 a
-- left join review5 b on b.book5_no = a.no;
inner join review5 b on b.book5_no = a.no;