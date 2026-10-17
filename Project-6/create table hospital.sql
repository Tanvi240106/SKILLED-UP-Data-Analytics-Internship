CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact_info VARCHAR(150)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    head VARCHAR(100)
);

CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    department_id INT,
    admission_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    treatment_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Billing (
    billing_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    amount FLOAT,
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE Readmissions (
    readmission_id INT PRIMARY KEY,
    patient_id INT,
    readmission_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);