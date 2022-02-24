CREATE TABLE IF NOT EXISTS `shmlCategory` (
  `shcgSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `shcgUseNy` TINYINT NULL,
  `shcgName` VARCHAR(100) NULL,
  `shcgParentSeq` BIGINT NULL,
  `shcgOrder` TINYINT NULL,
  `shcgDepth` TINYINT NULL,
  `shcgDesc` VARCHAR(255) NULL,
  `DelNy` TINYINT NOT NULL,
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
  PRIMARY KEY (`shcgSeq`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `shmlCategoryEntry` (
  `shcgiSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `shcgiName` VARCHAR(100) NULL,
  `shcgiUseNy` TINYINT NULL,
  `shcgiOrder` INT NULL,
  `shcgiDesc` VARCHAR(255) NULL,
  `DelNy` TINYINT NOT NULL,
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
  `shcgSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`shcgiSeq`),
  INDEX `fk_shmlCategoryItem_shmlCategory1_idx` (`shcgSeq` ASC),
  CONSTRAINT `fk_shmlCategoryItem_shmlCategory1`
    FOREIGN KEY (`shcgSeq`)
    REFERENCES `shmlCategory` (`shcgSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- \func now()