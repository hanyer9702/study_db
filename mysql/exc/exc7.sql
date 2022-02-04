create database rebecca;

-- 회원가입
CREATE TABLE IF NOT EXISTS `rebecca`.`infrMember` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `genderCd` INT NULL,
  `id` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `birth` DATE NULL,
  `recommandNo` INT NULL,
  `photo` VARCHAR(100) NULL,
  `color` VARCHAR(100) NULL,
  `marriageNY` TINYINT NULL,
  `weddingAniversary` DATE NULL,
  `childNY` INT NULL,
  `introduce` VARCHAR(600) NULL,
  `emailAgreeNY` INT NULL,
  `mobileAgreeNY` INT NULL,
  `personalPeriodCd` INT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberAddress` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` INT NULL,
  `typeCd` INT NULL,
  `zipCode` INT NULL,
  `addressLine1` VARCHAR(300) NULL,
  `addressLine2` VARCHAR(200) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_address_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_address_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberEmail` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` INT NULL,
  `typeCd` INT NULL,
  `email` VARCHAR(100) NULL,
  `domainCd` INT NULL,
  `domain` VARCHAR(100) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberSns` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeCd` INT NULL,
  `snsId` VARCHAR(100) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_table1_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_table1_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberProject` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeCd` INT NULL,
  `projectName` VARCHAR(100) NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `role` VARCHAR(100) NULL,
  `company` VARCHAR(100) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberProject_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberProject_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberNationality` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` INT NULL,
  `nationalityCd` INT NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberNationality_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberNationality_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberMobile` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` INT NULL,
  `phoneTypeCd` INT NULL,
  `useCd` INT NULL,
  `carrier` INT NULL,
  `mobile` VARCHAR(100) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberMobile_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberMobile_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberPasswordQuestion` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order` INT NULL,
  `passwordQuestionCd` INT NULL,
  `passwordAnswer` VARCHAR(100) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_inftMemberPaswordQuestion_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_inftMemberPaswordQuestion_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberJob` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` INT NULL,
  `jobCd` INT NULL,
  `choice` INT NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberJob_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberJob_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberHobby` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hobbyCd` INT NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberHobby_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberHobby_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrMemberEmail` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `defaultNY` INT NULL,
  `typeCd` INT NULL,
  `email` VARCHAR(100) NULL,
  `domainCd` INT NULL,
  `domain` VARCHAR(100) NULL,
  `infrMember_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`infrMember_no` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember1`
    FOREIGN KEY (`infrMember_no`)
    REFERENCES `rebecca`.`infrMember` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


desc infrmember;

select * from infrMemberpasswordquestion;

-- infrmember

insert into infrMember (
	name
    , genderCd
    , id
    , password
    , birth
    , recommandNo
    , photo
    , color
    , marriageNY
    , childNY
    , introduce
    , emailAgreeNY
    , mobileAgreeNY
    , personalPeriodCd
) values (
	'메이슨'
    , 1
    , 'phil'
    , 'phil'
    , '1980-06-30'
    , NULL
    , NULL
    , '#000000'
    , 0
    , 0
    , '메이슨과 함께 노는건 정말 재밌어'
    , 1
    , 1
    , 1
);


-- 공통코드 테이블

CREATE TABLE IF NOT EXISTS `rebecca`.`infrCodeGroup` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `anotherNo` VARCHAR(100) NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `rebecca`.`infrCode` (
  `no` BIGINT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `anotherNo` VARCHAR(100) NULL,
  `name` VARCHAR(100) NULL,
  `infrCodeGroup_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`, `infrCodeGroup_no`),
  UNIQUE INDEX `no_UNIQUE` (`no` ASC),
  INDEX `fk_infrCode_infrCodeGroup1_idx` (`infrCodeGroup_no` ASC),
  CONSTRAINT `fk_infrCode_infrCodeGroup1`
    FOREIGN KEY (`infrCodeGroup_no`)
    REFERENCES `rebecca`.`infrCodeGroup` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

drop table infrCodeGroup;

desc codeGroup;
desc code;

select * from infrCodeGroup;
select * from infrCode;

-- 공통코드 테이블에 정보 들어가 있어야 함

insert into infrCodeGroup (
	no
    , name
) values (
	1
    , 'infr_addressType'
);

insert into infrCode (
	no
    , name
    , codeGroup_no
) values (
	5
    , '친구'
    , 13
);

rename table code to infrCode;

update 
	code
set
	name = '기타'
where
	codeGroup_no = 11 and no=4;

select
	a.name
    , b.no
    , b.name
from infrCodeGroup a
left join infrCode b on b.codeGroup_no = a.no;

-- 회원관리 목록
