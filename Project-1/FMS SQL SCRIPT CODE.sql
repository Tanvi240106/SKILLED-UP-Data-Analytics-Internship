USE `financialmanagementsystem` ;

-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `phone_number` VARCHAR(15) NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`accounts` (
  `account_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `account_type` VARCHAR(50) NULL DEFAULT NULL,
  `balance` DECIMAL(12,2) NULL DEFAULT NULL,
  `opened_date` DATE NULL DEFAULT NULL,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  INDEX `user_id` (`user_id` ASC) ,
  CONSTRAINT `accounts_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `financialmanagementsystem`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`admins` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `password_hash` VARCHAR(255) NULL DEFAULT NULL,
  `role` VARCHAR(50) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE INDEX `username` (`username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`investments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`investments` (
  `investment_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `investment_type` VARCHAR(50) NULL DEFAULT NULL,
  `amount_invested` DECIMAL(12,2) NULL DEFAULT NULL,
  `date_invested` DATE NULL DEFAULT NULL,
  `current_value` DECIMAL(12,2) NULL DEFAULT NULL,
  PRIMARY KEY (`investment_id`),
  INDEX `user_id` (`user_id` ASC) ,
  CONSTRAINT `investments_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `financialmanagementsystem`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`loans` (
  `loan_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `loan_type` VARCHAR(50) NULL DEFAULT NULL,
  `amount` DECIMAL(12,2) NULL DEFAULT NULL,
  `interest_rate` DECIMAL(5,2) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `status` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  INDEX `user_id` (`user_id` ASC) ,
  CONSTRAINT `loans_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `financialmanagementsystem`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `loan_id` INT NULL DEFAULT NULL,
  `amount_paid` DECIMAL(12,2) NULL DEFAULT NULL,
  `payment_date` DATE NULL DEFAULT NULL,
  `payment_method` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `loan_id` (`loan_id` ASC) ,
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`loan_id`)
    REFERENCES `financialmanagementsystem`.`loans` (`loan_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `financialmanagementsystem`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financialmanagementsystem`.`transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `account_id` INT NULL DEFAULT NULL,
  `transaction_type` VARCHAR(50) NULL DEFAULT NULL,
  `amount` DECIMAL(12,2) NULL DEFAULT NULL,
  `transaction_date` DATE NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `account_id` (`account_id` ASC),
  CONSTRAINT `transactions_ibfk_1`
    FOREIGN KEY (`account_id`)
    REFERENCES `financialmanagementsystem`.`accounts` (`account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE financialmanagementsystem;

INSERT INTO users (user_id, full_name, email, phone_number, address, created_at)
VALUES
(1, 'Tanvi Aggarwal', 'aggarwaltanvi93@gmail.com', '7011286687', 'Delhi', CURRENT_TIMESTAMP),
(2, 'Rohan Mehta', 'rohan.mehta@example.com', '9123456780', 'Mumbai', CURRENT_TIMESTAMP);

INSERT INTO accounts (account_id, user_id, account_type, balance, opened_date, status)
VALUES
(1, 1, 'Savings', 15000.50, '2024-01-10', 'Active'),
(2, 2, 'Current', 32000.00, '2024-02-15', 'Active');

INSERT INTO transactions (transaction_id, account_id, transaction_type, amount, transaction_date, description)
VALUES
(1, 1, 'Deposit', 5000.00, '2024-03-05', 'Initial deposit'),
(2, 1, 'Withdrawal', 1000.00, '2024-03-10', 'ATM withdrawal'),
(3, 2, 'Deposit', 15000.00, '2024-04-01', 'Salary credit');

INSERT INTO loans (loan_id, user_id, loan_type, amount, interest_rate, start_date, end_date, status)
VALUES
(1, 1, 'Home', 800000.00, 7.5, '2023-05-01', '2033-05-01', 'Approved'),
(2, 2, 'Education', 400000.00, 5.0, '2024-06-01', '2028-06-01', 'Pending');

INSERT INTO admins (admin_id, username, password_hash, role, created_at)
VALUES
(1, 'admin_tanvi', '5f4dcc3b5aa765d61d8327deb882cf99', 'Manager', CURRENT_TIMESTAMP),
(2, 'admin_rohan', 'e99a18c428cb38d5f260853678922e03', 'Clerk', CURRENT_TIMESTAMP);

INSERT INTO payments (payment_id, loan_id, amount_paid, payment_date, payment_method)
VALUES
(1, 1, 20000.00, '2024-06-10', 'Online Transfer'),
(2, 1, 15000.00, '2024-07-10', 'Cheque');

INSERT INTO investments (investment_id, user_id, investment_type, amount_invested, date_invested, current_value)
VALUES
(1, 1, 'Mutual Fund', 100000.00, '2023-11-01', 110000.00),
(2, 2, 'Fixed Deposit', 50000.00, '2024-01-15', 53000.00);

SELECT * FROM users;
SELECT * FROM admins;
SELECT * FROM accounts;
SELECT * FROM transactions;
SELECT * FROM loans;
SELECT * FROM payments;
SELECT * FROM investments;







