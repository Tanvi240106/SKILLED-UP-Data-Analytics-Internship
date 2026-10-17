CREATE DATABASE telecom_db;

USE telecom_db;

CREATE TABLE telecom_data (
    customerid VARCHAR(255),
    gender VARCHAR(10),
    seniorcitizen INT,
    partner VARCHAR(10),
    dependents VARCHAR(10),
    tenure INT,
    phoneservice VARCHAR(10),
    multiplelines VARCHAR(50),
    internetservice VARCHAR(50),
    onlinesecurity VARCHAR(50),
    onlinebackup VARCHAR(50),
    deviceprotection VARCHAR(50),
    techsupport VARCHAR(50),
    streamingtv VARCHAR(50),
    streamingmovies VARCHAR(50),
    contract VARCHAR(50),
    paperlessbilling VARCHAR(10),
    paymentmethod VARCHAR(100),
    monthlycharges DECIMAL(10,2),
    totalcharges DECIMAL(10,2),
    churn VARCHAR(10)
);

SELECT 
  ROUND(SUM(totalcharges), 2) AS Total_Charges,
  ROUND(SUM(monthlycharges), 2) AS Monthly_Charges
FROM telecom_data;

SELECT churn, COUNT(*) AS Customer_Count
FROM telecom_data
GROUP BY churn;

SELECT paymentmethod, SUM(totalcharges) AS Total_Charges
FROM telecom_data
GROUP BY paymentmethod;

SELECT paymentmethod, SUM(monthlycharges) AS Monthly_Charges
FROM telecom_data
GROUP BY paymentmethod;

SELECT contract, SUM(totalcharges) AS Total_Charges
FROM telecom_data
GROUP BY contract;

SELECT churn, SUM(tenure) AS Total_Tenure
FROM telecom_data
GROUP BY churn;

SELECT internetservice, ROUND(AVG(monthlycharges), 2) AS Avg_Monthly_Charge
FROM telecom_data
GROUP BY internetservice;

SELECT gender, SUM(totalcharges) AS Total_Charges
FROM telecom_data
GROUP BY gender;
