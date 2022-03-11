select
a.ifcgSeq
, a.ifcgName
, b.ifcdSeq
, b.ifcdName
, b.ifcdOrder
, b.ifcdUseNy
, b.ifcdDelNy
from infrCodeGroup a
	left join infrCode b on b.ifcgSeq = a.ifcgSeq
where 1=1
	and a.ifcgDelNy = 0
    and a.ifcgUseNy = 1
    and b.ifcdDelNy = 0
    and b.ifcdUseNy = 1
    and a.ifcgSeq = 3
order by
	a.ifcgSeq asc
    -- a.ifcgSeq desc
    , b.ifcdOrder
    -- , b.ifcdOrder desc
;

select 
a.ifcgSeq
, a.ifcgName
, b.ifcdSeq
, b.ifcdName
, b.ifcdOrder
, b.ifcdUseNy
, b.ifcdDelNy 
from infrcode b
	left join infrCodeGroup a on b.ifcgSeq = a.ifcgSeq
where 1=1
	and a.ifcgDelNy = 0
    and a.ifcgUseNy = 1
    and b.ifcdDelNy = 0
    and b.ifcdUseNy = 1    
order by
	a.ifcgSeq asc
    -- a.ifcgSeq desc
    -- , b.ifcdOrder
    , b.ifcdOrder desc
;

select * from infrmemberaddress;

select
	a.ifmmseq
    , a.ifmmAdminNy
    , a.ifmmName
    , a.ifmmId
    , (select ifcdName from infrcode where a.ifmmGenderCd = ifcdSeq) as 성별
    , a.ifmmDob
    , (select ifcdName from infrcode where a.ifmmSavedCd = ifcdSeq) as 저장기간
    , (select ifcdName from infrcode where a.ifmmMarriageCd = ifcdSeq) as 결혼
    , a.ifmmChildrenNum
    , a.ifmmFavoriteColor
    , a.ifmmEmailConsentNy
    , a.ifmmSmsConsentNy
    , a.ifmmPushConsentNy
    , b.ifmaZipcode
    , b.ifmaAddress1
    , b.ifmaAddress2
    , ifnull(c.ifaoSnsTypeCd,"-") as sns체크
    , ifnull((select ifcdName from infrcode where c.ifaoSnsTypeCd = ifcdSeq),"-") as sns
    , ifnull(c.ifaoUrl,"-") as ifaoUrl
    , d.ifmeEmailFull
    , (select ifcdName from infrcode where f.ifjqQuestionCd = ifcdSeq) as 질문
    , f.ifjqAnswer
    , (select ifcdName from infrcode where h.ifmpTelecomCd = ifcdSeq) as 통신사
    , ifmpNumber
	, concat(substring(ifmpNumber,1,3),"-",substring(ifmpNumber,4,4),"-",substring(ifmpNumber,7,4)) as ifmpNumberDash
    , concat(substring(h.ifmpNumber,1,3),"-",substring(h.ifmpNumber,4,4),"-",substring(h.ifmpNumber,7,4)) as 전화번호보기
    , (select concat(substring(ifmpNumber,1,2),"-",substring(ifmpNumber,3,3),"-",substring(ifmpNumber,6,4)) from infrmemberphone where ifmpDeviceCd = 24 and ifmpDefaultNy = 1) as ifmpHomeNumber
    , (select concat(substring(ifmpNumber,1,3),"-",substring(ifmpNumber,4,3),"-",substring(ifmpNumber,7,4)) from infrmemberphone where ifmpDeviceCd = 26 and ifmpDefaultNy = 1) as ifmpFaxNumber
    , (select ifnaName from infrnationality where ifnaSeq = g.ifnaSeq) as 국적
    
from infrmember a
	left join infrmemberaddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy = 1 and b.ifmmSeq = a.ifmmSeq
    left join infrmemberaddressonline c on c.ifaoDelNy = 0 and c.ifaoDefaultNy = 1 and c.ifmmSeq = a.ifmmSeq
    left join infrmemberemail d on d.ifmeDelNy = 0 and d.ifmeDefaultNy = 1 and d.ifmmSeq = a.ifmmSeq
    -- left join infrmemberhobby e on e.ifmhDelNy = 0 and e.ifmhDefaultNy = 1 and e.ifmmSeq = a.ifmmSeq
    left join infrmemberjoinqna f on f.ifjqDelNy = 0 and f.ifmmSeq = a.ifmmSeq
    left join infrmembernationality g on g.ifmnDefaultNy = 1 and g.ifmnDelNy = 0 and g.ifmmSeq = a.ifmmSeq
    left join infrmemberphone h on h.ifmpDelNy = 0 and h.ifmpDefaultNy = 1 and h.ifmmSeq = a.ifmmSeq and h.ifmpDeviceCd = 25 and h.ifmpDefaultNy = 1
where 1=1
	and a.ifmmDelNy = 0
    and a.ifmmSeq = 2
    -- and a.ifmmId like '%xd%'
;

alter table infrmembernationality add ifmnDefaultNy tinyint after ifmnSeq ;

CREATE TABLE IF NOT EXISTS `durian`.`infrMenu` (
  `ifmuSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmuAdminNy` TINYINT NULL,
  `ifmuName` VARCHAR(50) NOT NULL,
  `ifmuNameEng` VARCHAR(50) NULL,
  `ifmuUrl` VARCHAR(100) NULL,
  `ifmuParents` BIGINT NULL,
  `ifmuDepth` TINYINT NULL COMMENT '단계정보',
  `ifmuUseNy` TINYINT NULL,
  `ifmuOrder` TINYINT NULL,
  `ifmuDesc` VARCHAR(255) NULL,
  `ifmuDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  PRIMARY KEY (`ifmuSeq`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `durian`.`infrAuth` (
  `ifatSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifatAdminNy` TINYINT NULL,
  `ifatName` VARCHAR(50) NOT NULL,
  `ifatNameEng` VARCHAR(50) NULL,
  `ifatUseNy` TINYINT NULL,
  `ifatOrder` TINYINT NULL,
  `ifatDesc` VARCHAR(255) NULL,
  `ifatDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  PRIMARY KEY (`ifatSeq`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `durian`.`infrAuthMenu` (
  `ifauSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifauRoleCd` BIGINT NULL COMMENT '관리, 조회\n목록, 등록, 수정, 삭제, 조회',
  `ifauUserNy` TINYINT NULL,
  `ifauOrder` TINYINT NULL,
  `ifauDesc` VARCHAR(255) NULL,
  `ifauDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT(11) NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifatSeq` BIGINT UNSIGNED NOT NULL,
  `ifmuSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifauSeq`),
  INDEX `fk_infrAuthMenu_infrAuth1_idx` (`ifatSeq` ASC),
  INDEX `fk_infrAuthMenu_infrMenu1_idx` (`ifmuSeq` ASC),
  CONSTRAINT `fk_infrAuthMenu_infrAuth1`
    FOREIGN KEY (`ifatSeq`)
    REFERENCES `durian`.`infrAuth` (`ifatSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infrAuthMenu_infrMenu1`
    FOREIGN KEY (`ifmuSeq`)
    REFERENCES `durian`.`infrMenu` (`ifmuSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `durian`.`infrAuthMember` (
  `ifamSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifamDefaultNy` TINYINT NULL,
  `ifamUserNy` TINYINT NULL,
  `ifamOrder` TINYINT NULL,
  `ifamDesc` VARCHAR(255) NULL,
  `ifamDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `ifatSeq` BIGINT UNSIGNED NOT NULL,
  `ifmmSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`ifamSeq`),
  INDEX `fk_infrAuthMember_infrAuth1_idx` (`ifatSeq` ASC),
  INDEX `fk_infrAuthMember_infrMember1_idx` (`ifmmSeq` ASC),
  CONSTRAINT `fk_infrAuthMember_infrAuth1`
    FOREIGN KEY (`ifatSeq`)
    REFERENCES `durian`.`infrAuth` (`ifatSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infrAuthMember_infrMember1`
    FOREIGN KEY (`ifmmSeq`)
    REFERENCES `durian`.`infrMember` (`ifmmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `durian`.`infrLogLogin` (
  `iflgSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifmmId` VARCHAR(50) NULL,
  `ifmmSeq` BIGINT NULL,
  `iflgResultNy` TINYINT NULL,
  `iflgDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  PRIMARY KEY (`iflgSeq`))
ENGINE = InnoDB;

desc infrAuth;

select * from infrAuth;

INSERT INTO `durian`.`infrauth`
(
`ifatAdminNy`,
`ifatName`,
`ifatUseNy`,
`ifatOrder`,
`ifatDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`)
VALUES
(
1,
'회원관리',
1,
1,
0,
now(),
now(),
now(),
now());

INSERT INTO `durian`.`infrmenu`
(
`ifmuAdminNy`,
`ifmuName`,
`ifmuParents`,
`ifmuDepth`,
`ifmuUseNy`,
`ifmuOrder`,
`ifmuDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`)
VALUES
(
1,
'테스트관리',
3,
1,
1,
3,
0,
now(),
now(),
now(),
now());

select * from infrmenu;

desc infrauthmenu;

INSERT INTO `durian`.`infrauthmenu`
(
`ifauRoleCd`,
`ifauUserNy`,
`ifauOrder`,
`ifauDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifatSeq`,
`ifmuSeq`)
VALUES
(
1,
1,
2,
0,
now(),
now(),
now(),
now(),
2,
11);

select * from infrauthmenu;


INSERT INTO `durian`.`infrauthmember`
(
`ifamDefaultNy`,
`ifamUserNy`,
`ifamOrder`,
`ifamDelNy`,
`regDateTime`,
`regDateTimeSvr`,
`modDateTime`,
`modDateTimeSvr`,
`ifatSeq`,
`ifmmSeq`)
VALUES
(
1,
1,
1,
0,
now(),
now(),
now(),
now(),
3,
1);

select * from infrauthmember;

select
	b.ifatSeq
    , b.ifatName
    , a.ifmuSeq
    , c.ifmuName
    , a.ifauOrder
	, (select ifcdName from infrCode where ifcdSeq = a.ifauRoleCd) as 역할
from infrAuthMenu a
	left join infrAuth b on b.ifatSeq = a.ifatSeq
	left join infrMenu c on c.ifmuSeq = a.ifmuSeq
where 1=1
;