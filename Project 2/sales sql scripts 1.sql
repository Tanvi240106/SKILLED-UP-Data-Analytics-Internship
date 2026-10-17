USE `salaseindustries` ;

-- -----------------------------------------------------
-- Table `salaseindustries`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salaseindustries`.`customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Phone` VARCHAR(15) NULL DEFAULT NULL,
  `City` VARCHAR(50) NULL DEFAULT NULL,
  `State` VARCHAR(50) NULL DEFAULT NULL,
  `JoinDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `Email` (`Email` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `salaseindustries`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salaseindustries`.`products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(100) NOT NULL,
  `Category` VARCHAR(50) NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(10,2) NULL DEFAULT NULL,
  `StockQuantity` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `salaseindustries`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salaseindustries`.`sales` (
  `SaleID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NULL DEFAULT NULL,
  `ProductID` INT NULL DEFAULT NULL,
  `SaleDate` DATE NULL DEFAULT NULL,
  `QuantitySold` INT NULL DEFAULT NULL,
  `TotalAmount` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  INDEX `CustomerID` (`CustomerID` ASC) ,
  INDEX `ProductID` (`ProductID` ASC) ,
  CONSTRAINT `sales_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `salaseindustries`.`customers` (`CustomerID`),
  CONSTRAINT `sales_ibfk_2`
    FOREIGN KEY (`ProductID`)
    REFERENCES `salaseindustries`.`products` (`ProductID`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `salaseindustries`.`salesagents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salaseindustries`.`salesagents` (
  `AgentID` INT NOT NULL AUTO_INCREMENT,
  `AgentName` VARCHAR(100) NOT NULL,
  `Region` VARCHAR(50) NULL DEFAULT NULL,
  `Phone` VARCHAR(15) NULL DEFAULT NULL,
  `JoiningDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`AgentID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `salaseindustries`.`agent_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `salaseindustries`.`agent_sales` (
  `SaleID` INT NOT NULL,
  `AgentID` INT NOT NULL,
  PRIMARY KEY (`SaleID`, `AgentID`),
  INDEX `AgentID` (`AgentID` ASC) ,
  CONSTRAINT `agent_sales_ibfk_1`
    FOREIGN KEY (`SaleID`)
    REFERENCES `salaseindustries`.`sales` (`SaleID`),
  CONSTRAINT `agent_sales_ibfk_2`
    FOREIGN KEY (`AgentID`)
    REFERENCES `salaseindustries`.`salesagents` (`AgentID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE SalaseIndustries;

INSERT INTO Customers (Name, Email, Phone, City, State, JoinDate) VALUES
('Tanvi Aggarwal', 'tanvi@example.com', '9990001111', 'Delhi', 'Delhi', '2024-01-15'),
('Ravi Sharma', 'ravi@example.com', '9988001122', 'Mumbai', 'Maharashtra', '2024-02-10'),
('Neha Verma', 'neha@example.com', '9876543210', 'Bangalore', 'Karnataka', '2023-12-01'),
('Ankit Singh', 'ankit@example.com', '7766554433', 'Lucknow', 'UP', '2025-01-05'),
('Meera Jain', 'meera@example.com', '9988776655', 'Chennai', 'Tamil Nadu', '2024-06-10'),
('Karan Mehta', 'karan@example.com', '9443311223', 'Ahmedabad', 'Gujarat', '2023-11-15'),
('Pooja Das', 'pooja@example.com', '9344119988', 'Kolkata', 'West Bengal', '2024-04-25'),
('Arjun Nair', 'arjun@example.com', '9123456780', 'Thiruvananthapuram', 'Kerala', '2023-10-05'),
('Simran Kaur', 'simran@example.com', '9223334445', 'Amritsar', 'Punjab', '2024-09-12'),
('Vikas Rawat', 'vikas@example.com', '9112233445', 'Dehradun', 'Uttarakhand', '2024-07-08');

INSERT INTO Products (ProductName, Category, UnitPrice, StockQuantity) VALUES
('Toothpaste', 'Personal Care', 45.00, 200),
('Shampoo', 'Personal Care', 150.00, 100),
('Soap', 'Personal Care', 30.00, 250),
('Rice 1kg', 'Food', 60.00, 300),
('Atta 5kg', 'Food', 250.00, 150),
('Biscuits', 'Snacks', 20.00, 400),
('Cold Drink', 'Beverage', 40.00, 300),
('Detergent 1kg', 'Home Care', 120.00, 180),
('Floor Cleaner', 'Home Care', 90.00, 160),
('Toilet Cleaner', 'Home Care', 80.00, 130);

INSERT INTO Sales (CustomerID, ProductID, SaleDate, QuantitySold, TotalAmount) VALUES
(2, 9, '2024-11-15', 5, 2940.00),
(3, 9, '2025-04-15', 5, 3715.00),
(4, 4, '2025-03-17', 6, 4530.00),
(8, 5, '2025-01-03', 5, 2935.00),
(6, 1, '2024-09-14', 12, 10788.00),
(10, 2, '2024-07-03', 20, 6680.00),
(8, 4, '2024-11-18', 8, 7400.00),
(2, 7, '2025-05-06', 8, 2032.00),
(10, 4, '2025-03-08', 20, 18200.00),
(3, 3, '2025-04-17', 44, 134200.00),
(7, 1, '2024-10-15', 12, 5640.00),
(10, 3, '2024-11-19', 8, 3872.00),
(1, 4, '2025-01-18', 4, 992.00),
(7, 9, '2025-05-27', 4, 212.00),
(1, 2, '2024-12-05', 14, 13930.00),
(8, 5, '2024-11-20', 6, 5676.00),
(1, 4, '2024-07-06', 18, 12150.00),
(6, 7, '2024-11-23', 5, 3690.00),
(5, 3, '2025-06-08', 10, 7720.00),
(10, 4, '2025-04-15', 29, 136590.00),
(7, 7, '2024-09-11', 18, 5778.00),
(7, 8, '2025-05-03', 9, 3411.00),
(1, 10, '2024-12-02', 10, 1140.00),
(5, 7, '2024-08-27', 17, 13685.00),
(5, 5, '2024-09-29', 7, 4613.00),
(9, 10, '2025-01-08', 1, 79.00),
(1, 6, '2025-04-22', 12, 10908.00),
(3, 4, '2025-06-10', 4, 5320.00),
(6, 6, '2024-08-20', 3, 3279.00),
(4, 9, '2025-05-17', 5, 2235.00),
(3, 1, '2024-09-01', 12, 8856.00),
(9, 4, '2025-06-12', 10, 5450.00),
(2, 3, '2024-10-05', 10, 6890.00),
(10, 9, '2025-02-25', 10, 4020.00),
(1, 5, '2024-12-25', 6, 7752.00),
(4, 8, '2025-01-10', 9, 4545.00),
(6, 10, '2024-11-30', 11, 11110.00),
(9, 1, '2024-12-28', 6, 4116.00),
(3, 10, '2025-01-30', 15, 6210.00),
(2, 6, '2025-06-01', 18, 12402.00),
(5, 9, '2025-06-15', 12, 5028.00),
(7, 4, '2025-06-16', 25, 18000.00),
(8, 6, '2025-06-17', 5, 2345.00),
(2, 5, '2025-06-18', 6, 4560.00),
(4, 10, '2025-06-19', 7, 3773.00),
(5, 8, '2025-06-20', 4, 1640.00),
(10, 6, '2025-06-21', 15, 13350.00),
(9, 2, '2025-06-22', 13, 11050.00),
(6, 2, '2025-06-23', 10, 7840.00),
(7, 5, '2025-06-24', 9, 6120.00),
(8, 1, '2025-06-25', 8, 4144.00),
(3, 6, '2025-06-26', 16, 13536.00);

INSERT INTO SalesAgents (AgentName, Region, Phone, JoiningDate) VALUES
('Rohit Kumar', 'North', '9898989898', '2024-01-01'),
('Divya Patel', 'West', '9777777777', '2023-12-10'),
('Suresh Reddy', 'South', '9666666666', '2024-02-15'),
('Anjali Sharma', 'East', '9555555555', '2024-03-20'),
('Vivek Mehta', 'Central', '9444444444', '2023-11-25');

INSERT INTO Agent_Sales (SaleID, AgentID) VALUES
(1, 3), (2, 2), (3, 3), (4, 1), (5, 5), (6, 4), (7, 3), (8, 3), (9, 3), (10, 3),
(11, 1), (12, 5), (13, 5), (14, 2), (15, 1), (16, 3), (17, 3), (18, 5), (19, 1), (20, 3),
(21, 4), (22, 2), (23, 4), (24, 3), (25, 3), (26, 2), (27, 2), (28, 4), (29, 4), (30, 4),
(31, 5), (32, 4), (33, 4), (34, 4), (35, 1), (36, 4), (37, 5), (38, 5), (39, 1), (40, 1),
(41, 2), (42, 3), (43, 4), (44, 3), (45, 3), (46, 3), (47, 2), (48, 4), (49, 1), (50, 5);

