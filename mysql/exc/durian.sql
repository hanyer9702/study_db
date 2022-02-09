CREATE TABLE IF NOT EXISTS `durian`.`infrMember` (
  `ifmmSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmmAdminNy` TINYINT NULL,
  `ifmmDormancyNy` TINYINT NULL,
  `ifmmName` VARCHAR(50) NOT NULL,
  `ifmmId` VARCHAR(50) NOT NULL,
  `ifmmPassword` VARCHAR(100) NULL,
  `ifmmPwdModDate` DATETIME NULL COMMENT '패스워드수정일',
  `ifmmGenderCd` TINYINT NULL,
  `ifmmDob` DATE NULL,
  `ifmmSavedCd` TINYINT NULL COMMENT '회원정보저장기간',
  `ifmmMarriageCd` TINYINT NULL,
  `ifmmMarriageDate` DATE NULL,
  `ifmmChildrenNum` TINYINT NULL,
  `ifmmFavoriteColor` VARCHAR(50) NULL,
  `ifmmRecommenderSeq` BIGINT NULL,
  `ifmmEmailConsentNy` TINYINT NULL,
  `ifmmSmsConsentNy` TINYINT NULL,
  `ifmmPushConsentNy` TINYINT NULL,
  `ifmmDesc` VARCHAR(255) NULL,
  `ifmmDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  PRIMARY KEY (`ifmmSeq`))
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmember`
(
`ifmmAdminNy`,
`ifmmDormancyNy`,
`ifmmName`,
`ifmmId`,
`ifmmPassword`,
`ifmmPwdModDate`,
`ifmmGenderCd`,
`ifmmDob`,
`ifmmSavedCd`,
`ifmmMarriageCd`,
`ifmmMarriageDate`,
`ifmmChildrenNum`,
`ifmmFavoriteColor`,
`ifmmDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`)
VALUES
(
1,
0,
'관리자1',
'admin_101001',
'imadmin',
now(),
1,
'1980-01-01',
1,
2,
'2000-01-01',
2,
'#111111',
0,
now(),
now(),
now(),
now());

select * from infrmember;

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberEmail` (
  `ifmeSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmeDefaultNy` TINYINT NOT NULL,
  `ifmeTypeCd` TINYINT NULL,
  `ifmeEmailFull` VARCHAR(100) NULL,
  `ifmeEmailAccount` VARCHAR(100) NULL,
  `ifmeEmailDomain` VARCHAR(100) NULL,
  `ifmeEmailDomainCd` TINYINT NULL,
  `ifmeDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifmeSeq`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember1`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmemberemail`
(
`ifmeDefaultNy`,
`ifmeTypeCd`,
`ifmeEmailFull`,
`ifmeEmailAccount`,
`ifmeEmailDomain`,
`ifmeEmailDomainCd`,
`ifmeDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES
(
1,
14,
'youhanlee@company1.com',
'youhanlee',
'company1.com',
19,
0,
now(),
now(),
now(),
now(),
2);

select * from infrmemberemail;

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberPhone` (
  `ifmpSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmpDefaultNy` TINYINT NOT NULL,
  `ifmpTypeCd` TINYINT NULL,
  `ifmpDeviceCd` TINYINT NULL,
  `ifmpTelecomCd` TINYINT NULL,
  `ifmpNumber` VARCHAR(50) NULL,
  `ifmpDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifmpSeq`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember10`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmemberphone`
(
`ifmpDefaultNy`,
`ifmpTypeCd`,
`ifmpDeviceCd`,
`ifmpTelecomCd`,
`ifmpNumber`,
`ifmpDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES
(
0,
22,
24,
29,
01012342622,
0,
now(),
now(),
now(),
now(),
2);

select * from infrmemberphone;

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberAddressOnline` (
  `ifaoSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifaoTypeCd` TINYINT NULL,
  `ifaoDefaultNy` TINYINT NOT NULL,
  `ifaoSnsTypeCd` TINYINT NULL,
  `ifaoUrl` VARCHAR(100) NULL,
  `ifaoTitle` VARCHAR(100) NULL,
  `ifaoDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifaoSeq`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember100`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmemberaddressonline`
(
`ifaoTypeCd`,
`ifaoDefaultNy`,
`ifaoSnsTypeCd`,
`ifaoUrl`,
`ifaoTitle`,
`ifaoDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES
(
33,
0,
35,
'@hybrid',
'페북',
0,
now(),
now(),
now(),
now(),
2);

select * from infrmemberaddressonline;

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberHobby` (
  `ifmhSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmhHobbyCd` TINYINT NOT NULL,
  `ifmhUseNy` TINYINT NULL,
  `ifmhOrder` TINYINT NULL,
  `ifmaDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifmhSeq`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember110`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmemberhobby`
(
`ifmhHobbyCd`,
`ifmhUseNy`,
`ifmhOrder`,
`ifmaDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES
(
41,
1,
2,
0,
now(),
now(),
now(),
now(),
2);

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberJoinQna` (
  `ifjqSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifjqQuestionCd` TINYINT NOT NULL,
  `ifjqAnswer` VARCHAR(50) NOT NULL,
  `ifjqDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifjqSeq`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember1100`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmemberjoinqna`
(
`ifjqQuestionCd`,
`ifjqAnswer`,
`ifjqDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES
(
63,
'김땡땡',
0,
now(),
now(),
now(),
now(),
1);

select * from infrmemberjoinqna;

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberAddress` (
  `ifmaSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmaDefaultNy` TINYINT NOT NULL,
  `ifmaTypeCd` TINYINT NULL,
  `ifmaTitle` VARCHAR(100) NULL,
  `ifmaAddress1` VARCHAR(100) NULL,
  `ifmaAddress2` VARCHAR(100) NULL,
  `ifmaZipcode` VARCHAR(50) NULL,
  `ifmaDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifmaSeq`),
  INDEX `fk_infrMemberEmail_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberEmail_infrMember11`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmemberaddress`
(
`ifmaDefaultNy`,
`ifmaTypeCd`,
`ifmaTitle`,
`ifmaAddress1`,
`ifmaAddress2`,
`ifmaZipcode`,
`ifmaDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifmmSeq`)
VALUES
(
2,
59,
'회사',
'서울시 동작구',
'어쩌구 저쩌구',
01010,
0,
now(),
now(),
now(),
now(),
2);

CREATE TABLE IF NOT EXISTS `durian`.`infrMemberNationality` (
  `ifmnSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmnDelNy` TINYINT NOT NULL,
  `reqIp` VARCHAR(100) NULL,
  `reqSeq` BIGINT NULL,
  `reqDevice` TINYINT NULL,
  `reqDateTime` DATETIME NULL,
  `reqDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifnaSeq` BIGINT UNSIGNED NOT NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifmnSeq`),
  INDEX `fk_infrMemberNationality_infrNationality1_idx` (`ifnaSeq` ASC),
  INDEX `fk_infrMemberNationality_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrMemberNationality_infrNationality1`
    FOREIGN KEY (`ifnaSeq`)
    REFERENCES `durian`.`infrNationality` (`ifnaSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infrMemberNationality_infrMember1`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `durian`.`infrmembernationality`
(
`ifmnDelNy`,
`reqDateTime`,
`reqDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifnaSeq`,
`ifmmSeq`)
VALUES
(
0,
now(),
now(),
now(),
now(),
2,
2);
