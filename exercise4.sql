-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `idDoctor` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `address` VARCHAR(45) NULL,
  `Phone` INT NULL,
  `salary` INT NULL,
  PRIMARY KEY (`idDoctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `idMedical` INT NOT NULL,
  `idDoctor` INT NULL,
  `overtime_rate` TIME NULL,
  PRIMARY KEY (`idMedical`),
  INDEX `fk_Medical_1_idx` (`idDoctor` ASC),
  CONSTRAINT `fk_Medical_1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `idSpecialist` INT NOT NULL,
  `idDoctor` INT NULL,
  `field_area` VARCHAR(45) NULL,
  PRIMARY KEY (`idSpecialist`),
  INDEX `fk_Specialist_1_idx` (`idDoctor` ASC),
  CONSTRAINT `fk_Specialist_1`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `address` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL,
  `details` VARCHAR(45) NULL,
  `methods` VARCHAR(45) NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
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
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_2`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_3`
    FOREIGN KEY (`idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `idBill` INT NOT NULL,
  `idPatient` INT NULL,
  `Total` INT NULL,
  PRIMARY KEY (`idBill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment_bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment_bill` (
  `idCrossreff` INT NOT NULL,
  `idPayment` INT NULL,
  `idBill` INT NULL,
  PRIMARY KEY (`idCrossreff`),
  INDEX `fk_Crossreff_1_idx` (`idPayment` ASC),
  INDEX `fk_Crossreff_2_idx` (`idBill` ASC),
  CONSTRAINT `fk_Crossreff_1`
    FOREIGN KEY (`idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Crossreff_2`
    FOREIGN KEY (`idBill`)
    REFERENCES `mydb`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
