CREATE DATABASE IF NOT EXISTS hospital_project;
USE hospital_project;

CREATE TABLE IF NOT EXISTS hospital_admissions (
    Patient_ID VARCHAR(20),
    Age INT,
    AgeGroup VARCHAR(10),
    Gender VARCHAR(10),
    Admission_Date DATE,
    Discharge_Date DATE,
    LOS INT,
    Disease VARCHAR(100),
    Treatment_Given VARCHAR(100),
    Doctor_Name VARCHAR(100),
    Department VARCHAR(100),
    Bed_Occupancy INT,
    Hospital_Costs DECIMAL(12,2),
    Outcome VARCHAR(50)
);

SELECT COUNT(*) AS total_rows FROM hospital_admissions;
SELECT * FROM hospital_admissions LIMIT 10;

SELECT DATE_FORMAT(Admission_Date, '%Y-%m') AS Month,
       COUNT(*) AS Admissions
FROM hospital_admissions
GROUP BY Month
ORDER BY Month;

SELECT Disease, COUNT(*) AS Cases
FROM hospital_admissions
GROUP BY Disease
ORDER BY Cases DESC
LIMIT 10;

SELECT Department, ROUND(AVG(LOS),2) AS Avg_LOS
FROM hospital_admissions
GROUP BY Department
ORDER BY Avg_LOS DESC;

SELECT Department, ROUND(AVG(Hospital_Costs),2) AS Avg_Cost
FROM hospital_admissions
GROUP BY Department
ORDER BY Avg_Cost DESC;

SELECT Doctor_Name, COUNT(*) AS Patients_Treated
FROM hospital_admissions
GROUP BY Doctor_Name
ORDER BY Patients_Treated DESC;

SELECT Outcome, COUNT(*) AS Total
FROM hospital_admissions
GROUP BY Outcome
ORDER BY Total DESC;

SELECT DATE_FORMAT(Admission_Date, '%Y-%m') AS Month,
       ROUND(AVG(Bed_Occupancy),2) AS Avg_Bed_Occupancy
FROM hospital_admissions
GROUP BY Month
ORDER BY Month;

SELECT ROUND(AVG(Hospital_Costs / NULLIF(LOS,0)),2) AS Avg_Cost_Per_Day
FROM hospital_admissions
WHERE LOS > 0;
SELECT Treatment_Given, ROUND(AVG(Hospital_Costs),2) AS Avg_Cost
FROM hospital_admissions
GROUP BY Treatment_Given
ORDER BY Avg_Cost DESC
LIMIT 10;