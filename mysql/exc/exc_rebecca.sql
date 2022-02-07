CREATE TABLE IF NOT EXISTS `infrCodeGroup` (
  `no` BIGINT(11) UNSIGNED NOT NULL,
  `anotherNo` VARCHAR(100) NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `infrCode` (
  `no` BIGINT(11) UNSIGNED NOT NULL,
  `anotherNo` VARCHAR(100) NULL,
  `name` VARCHAR(100) NULL,
  `infrCodeGroup_no` BIGINT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`no`, `infrCodeGroup_no`),
  INDEX `fk_infrCode_infrCodeGroup1_idx` (`infrCodeGroup_no` ASC),
  CONSTRAINT `fk_infrCode_infrCodeGroup1`
    FOREIGN KEY (`infrCodeGroup_no`)
    REFERENCES `infrCodeGroup` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

select * from infrCodeGroup;