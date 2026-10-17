CREATE DATABASE IF NOT EXISTS hospital_project;
USE hospital_project;

CREATE TABLE IF NOT EXISTS Patients (
    patient_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    nic_conditions VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS Admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id VARCHAR(20),
    department VARCHAR(50),
    admission_date DATE,
    discharge_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE IF NOT EXISTS Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id VARCHAR(20),
    diagnosis VARCHAR(100),
    treatment_plan VARCHAR(100),
    department VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE IF NOT EXISTS Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    treatment_id INT,
    total_cost FLOAT,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE IF NOT EXISTS Readmissions (
    readmission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id VARCHAR(20),
    readmission_flag VARCHAR(10),
    readmission_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE IF NOT EXISTS Departments (
    department_name VARCHAR(50) PRIMARY KEY,
    head_doctor VARCHAR(100)
);

SELECT * FROM Patients LIMIT 10;

SELECT t.department, ROUND(AVG(b.total_cost),2) AS avg_treatment_cost
FROM Treatments t
JOIN Billing b ON t.treatment_id = b.treatment_id
GROUP BY t.department;

SELECT t.department,
       COUNT(r.patient_id) AS total_readmissions,
       COUNT(t.patient_id) AS total_patients,
       ROUND((COUNT(r.patient_id)/COUNT(t.patient_id))*100,2) AS readmission_rate
FROM Treatments t
LEFT JOIN Readmissions r ON t.patient_id = r.patient_id AND r.readmission_flag='Yes'
GROUP BY t.department;

SELECT admission_date, COUNT(patient_id) AS occupied_beds
FROM Admissions
GROUP BY admission_date
ORDER BY admission_date;

SELECT department, ROUND(AVG(DATEDIFF(discharge_date, admission_date)),2) AS avg_stay_days
FROM Admissions
GROUP BY department;

SELECT t.treatment_plan, ROUND(AVG(b.total_cost),2) AS avg_cost
FROM Treatments t
JOIN Billing b ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_plan
ORDER BY avg_cost DESC
LIMIT 5;
