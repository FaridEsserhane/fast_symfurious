-- MySQL Script generated by MySQL Workbench
-- ven. 09 sept. 2022 12:11:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SYMFURIOUS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SYMFURIOUS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SYMFURIOUS` DEFAULT CHARACTER SET utf8 ;
USE `SYMFURIOUS` ;

-- -----------------------------------------------------
-- Table `SYMFURIOUS`.`categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SYMFURIOUS`.`categorie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `parent_id` INT NULL,
  `categorie_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categorie_categorie_idx` (`categorie_id` ASC) VISIBLE,
  CONSTRAINT `fk_categorie_categorie`
    FOREIGN KEY (`categorie_id`)
    REFERENCES `SYMFURIOUS`.`categorie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SYMFURIOUS`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SYMFURIOUS`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `category_id` INT NULL,
  `prix` DECIMAL NULL,
  `date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_courses_categorie1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_categorie1`
    FOREIGN KEY (`category_id`)
    REFERENCES `SYMFURIOUS`.`categorie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SYMFURIOUS`.`pilotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SYMFURIOUS`.`pilotes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NULL,
  `lastname` VARCHAR(155) NULL,
  `username` VARCHAR(155) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SYMFURIOUS`.`resultats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SYMFURIOUS`.`resultats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pilote_id` INT NULL,
  `course_id` INT NULL,
  `classement` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resultats_pilotes1_idx` (`pilote_id` ASC) VISIBLE,
  INDEX `fk_resultats_courses1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_resultats_pilotes1`
    FOREIGN KEY (`pilote_id`)
    REFERENCES `SYMFURIOUS`.`pilotes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultats_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `SYMFURIOUS`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SYMFURIOUS`.`options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SYMFURIOUS`.`options` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `vehicule_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_options_vehicules1_idx` (`vehicule_id` ASC) VISIBLE,
  CONSTRAINT `fk_options_vehicules1`
    FOREIGN KEY (`vehicule_id`)
    REFERENCES `SYMFURIOUS`.`resultats` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SYMFURIOUS`.`resultats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SYMFURIOUS`.`resultats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pilote_id` INT NULL,
  `course_id` INT NULL,
  `classement` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resultats_pilotes1_idx` (`pilote_id` ASC) VISIBLE,
  INDEX `fk_resultats_courses1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_resultats_pilotes1`
    FOREIGN KEY (`pilote_id`)
    REFERENCES `SYMFURIOUS`.`pilotes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_resultats_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `SYMFURIOUS`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
