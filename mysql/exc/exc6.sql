CREATE TABLE IF NOT EXISTS `world`.`codeGroup` (
  `seq` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
default charset utf8;

CREATE TABLE IF NOT EXISTS `world`.`code` (
  `code` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NULL,
  `codeGroup_seq` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codeGroup_seq`, `code`),
  CONSTRAINT `fk_code_codeGroup1`
    FOREIGN KEY (`codeGroup_seq`)
    REFERENCES `world`.`codeGroup` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
default charset utf8;

drop table code;

insert into codeGroup(
	seq
    , name
) values (
	'infra002'
    , '통신사'
);

select * from codeGroup;
select * from code;

insert into code(
	code
	, name
    , codeGroup_seq
) values (
	'4'
    , '알뜰폰'
    , 'infra002'
);

select
	a.seq
    , a.name
    , b.code
    , b.name
from codeGroup a
left join code b on b.codeGroup_seq = a.seq;