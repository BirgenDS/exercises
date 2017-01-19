-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise4` DEFAULT CHARACTER SET utf8 ;
USE `exercise4` ;

-- -----------------------------------------------------
-- Table `exercise4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Doctor` (
  `idDoctor` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `address` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `salary` INT NULL,
  PRIMARY KEY (`idDoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Medical` (
  `idMedical` INT NOT NULL,
  `idDoctor` INT NULL,
  `overtime_rate` TIME NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `fk_Medical_1_idx` (`idDoctor` ASC),
  CONSTRAINT `fk_Medical_1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `idDoctor` INT NULL,
  `field_area` VARCHAR(45) NULL,
  PRIMARY KEY (`idSpecialist`),
  INDEX `fk_Specialist_1_idx` (`idDoctor` ASC),
  CONSTRAINT `fk_Specialist_1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `address` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Payment` (
  `idPayment` INT NOT NULL,
  `details` VARCHAR(45) NULL,
  `methods` VARCHAR(45) NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `idPatient` INT NULL,
  `idDoctor` INT NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `idPayment` INT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `fk_Appointment_1_idx` (`idPatient` ASC),
  INDEX `fk_Appointment_2_idx` (`idDoctor` ASC),
  INDEX `fk_Appointment_3_idx` (`idPayment` ASC),
  CONSTRAINT `fk_Appointment_1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `exercise4`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_2`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_3`
    FOREIGN KEY (`idPayment`)
    REFERENCES `exercise4`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Bill` (
  `idBill` INT NOT NULL,
  `idPatient` INT NULL,
  `Total` INT NULL,
  PRIMARY KEY (`idBill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Payment_bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Payment_bill` (
  `idCrossreff` INT NOT NULL,
  `idPayment` INT NULL,
  `idBill` INT NULL,
  PRIMARY KEY (`idCrossreff`),
  INDEX `fk_Crossreff_1_idx` (`idPayment` ASC),
  INDEX `fk_Crossreff_2_idx` (`idBill` ASC),
  CONSTRAINT `fk_Crossreff_1`
    FOREIGN KEY (`idPayment`)
    REFERENCES `exercise4`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Crossreff_2`
    FOREIGN KEY (`idBill`)
    REFERENCES `exercise4`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
