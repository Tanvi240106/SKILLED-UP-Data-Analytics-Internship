-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema telecom_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema telecom_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `telecom_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `telecom_db` ;

-- -----------------------------------------------------
-- Table `telecom_db`.`cleaned_telecom_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telecom_db`.`cleaned_telecom_data` (
  `customerID` TEXT NULL DEFAULT NULL,
  `gender` TEXT NULL DEFAULT NULL,
  `SeniorCitizen` INT NULL DEFAULT NULL,
  `Partner` TEXT NULL DEFAULT NULL,
  `Dependents` TEXT NULL DEFAULT NULL,
  `tenure` INT NULL DEFAULT NULL,
  `PhoneService` TEXT NULL DEFAULT NULL,
  `MultipleLines` TEXT NULL DEFAULT NULL,
  `InternetService` TEXT NULL DEFAULT NULL,
  `OnlineSecurity` TEXT NULL DEFAULT NULL,
  `OnlineBackup` TEXT NULL DEFAULT NULL,
  `DeviceProtection` TEXT NULL DEFAULT NULL,
  `TechSupport` TEXT NULL DEFAULT NULL,
  `StreamingTV` TEXT NULL DEFAULT NULL,
  `StreamingMovies` TEXT NULL DEFAULT NULL,
  `Contract` TEXT NULL DEFAULT NULL,
  `PaperlessBilling` TEXT NULL DEFAULT NULL,
  `PaymentMethod` TEXT NULL DEFAULT NULL,
  `MonthlyCharges` DOUBLE NULL DEFAULT NULL,
  `TotalCharges` DOUBLE NULL DEFAULT NULL,
  `Churn` TEXT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `telecom_db`.`telecom_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `telecom_db`.`telecom_data` (
  `customerid` VARCHAR(255) NULL DEFAULT NULL,
  `gender` VARCHAR(10) NULL DEFAULT NULL,
  `seniorcitizen` INT NULL DEFAULT NULL,
  `partner` VARCHAR(10) NULL DEFAULT NULL,
  `dependents` VARCHAR(10) NULL DEFAULT NULL,
  `tenure` INT NULL DEFAULT NULL,
  `phoneservice` VARCHAR(10) NULL DEFAULT NULL,
  `multiplelines` VARCHAR(50) NULL DEFAULT NULL,
  `internetservice` VARCHAR(50) NULL DEFAULT NULL,
  `onlinesecurity` VARCHAR(50) NULL DEFAULT NULL,
  `onlinebackup` VARCHAR(50) NULL DEFAULT NULL,
  `deviceprotection` VARCHAR(50) NULL DEFAULT NULL,
  `techsupport` VARCHAR(50) NULL DEFAULT NULL,
  `streamingtv` VARCHAR(50) NULL DEFAULT NULL,
  `streamingmovies` VARCHAR(50) NULL DEFAULT NULL,
  `contract` VARCHAR(50) NULL DEFAULT NULL,
  `paperlessbilling` VARCHAR(10) NULL DEFAULT NULL,
  `paymentmethod` VARCHAR(100) NULL DEFAULT NULL,
  `monthlycharges` DECIMAL(10,2) NULL DEFAULT NULL,
  `totalcharges` DECIMAL(10,2) NULL DEFAULT NULL,
  `churn` VARCHAR(10) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
