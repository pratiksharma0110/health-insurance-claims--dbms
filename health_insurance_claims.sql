CREATE DATABASE health_insurance;
USE health_insurance;

--create tables;
CREATE TABLE PolicyHolder (
    PolicyHolderID INT,
    Policies VARCHAR(20),
    FullName VARCHAR(100),
    Address VARCHAR(255),
    ContactNumbers VARCHAR(255),
    PRIMARY KEY (PolicyHolderID, Policies)
);

CREATE TABLE Policy (
    PolicyNumber VARCHAR(20) PRIMARY KEY,
    PolicyType VARCHAR(50),
    PremiumAmount DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    PolicyHolderId INT,
    FOREIGN KEY (PolicyHolderId) REFERENCES PolicyHolder(PolicyHolderID)
);

CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100),
    Location VARCHAR(255),
    ContactNumber VARCHAR(20)
);

CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Specialization VARCHAR(100),
    HospitalID INT,
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);


CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY,
    PolicyNumber VARCHAR(20),
    DoctorID INT,
    HospitalID INT,
    TreatmentDetails VARCHAR(255),
    ClaimAmount DECIMAL(10, 2),
    ClaimDate DATE,
    FOREIGN KEY (PolicyNumber) REFERENCES Policy(PolicyNumber),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID)
);

--insertion: 
INSERT INTO PolicyHolder (PolicyHolderID, Policies, FullName, Address, ContactNumbers)
VALUES (1, 'NP123', 'Ram Bahadur', 'Kathmandu', '9812345678,9807654321');

INSERT INTO Policy (PolicyNumber, PolicyType, PremiumAmount, StartDate, EndDate, PolicyHolderId)
VALUES ('NP123', 'Health', 1500.00, '2024-01-01', '2024-12-31', 3);

INSERT INTO Hospital (HospitalID, HospitalName, Location, ContactNumber)
VALUES (1, 'City Hospital', 'Kathmandu', '01-5551234');


INSERT INTO Doctor (DoctorID, DoctorName, Specialization, HospitalID)
VALUES (1, 'Dr. Sharma', 'Cardiology', 1);

INSERT INTO Claims (ClaimID, PolicyNumber, DoctorID, HospitalID, TreatmentDetails, ClaimAmount, ClaimDate)
VALUES (1, 'NP123', 1, 1, 'Heart Surgery', 5000.00, '2024-02-01');

--selection: 
SELECT * FROM Claims WHERE ClaimAmount > 1000;

--projection: 
SELECT FullName, Address FROM PolicyHolder;

--set operations: 
SELECT FullName FROM PolicyHolder
UNION
SELECT HospitalName FROM Hospital;

SELECT FullName FROM PolicyHolder
INTERSECT
SELECT HospitalName FROM Hospital;

SELECT FullName FROM PolicyHolder
EXCEPT
SELECT HospitalName FROM Hospital;



--joins:
SELECT PolicyHolder.FullName, Claims.TreatmentDetails
FROM PolicyHolder
LEFT JOIN Claims ON PolicyHolder.PolicyHolderID = Claims.PolicyNumber;


SELECT Doctor.DoctorName, Claims.TreatmentDetails
FROM Claims
RIGHT JOIN Doctor ON Claims.DoctorID = Doctor.DoctorID;


SELECT PolicyHolder.FullName, Claims.TreatmentDetails
FROM PolicyHolder
INNER JOIN Claims ON PolicyHolder.PolicyHolderID = Claims.PolicyNumber;


--normalization techniques:
CREATE TABLE PolicyHolderContact (
    PolicyHolderID INT,
    ContactNumber VARCHAR(20),
    FOREIGN KEY (PolicyHolderID) REFERENCES PolicyHolder(PolicyHolderID)
);

CREATE TABLE PolicyHolderDetails (
    PolicyHolderID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE City (
    CityID INT PRIMARY KEY,
    CityName VARCHAR(100)
);

--transaction:
START TRANSACTION;
INSERT INTO Claims (ClaimID, PolicyNumber, DoctorID, HospitalID, TreatmentDetails, ClaimAmount, ClaimDate)
VALUES (1, 'NP123', 1, 1, 'Duplicate Entry', 5000.00, '2024-02-01');
ROLLBACK;

START TRANSACTION;
INSERT INTO Claims (ClaimID, PolicyNumber, DoctorID, HospitalID, TreatmentDetails, ClaimAmount, ClaimDate)
VALUES (2, 'NP124', 1, 1, 'Consultation', 200.00, '2024-02-15');
COMMIT;


--stored procedures:
DELIMITER //
CREATE PROCEDURE InsertDoctor (
    IN DoctorID INT,
    IN DoctorName VARCHAR(100),
    IN Specialization VARCHAR(100),
    IN HospitalID INT
)
BEGIN
    INSERT INTO Doctor (DoctorID, DoctorName, Specialization, HospitalID)
    VALUES (DoctorID, DoctorName, Specialization, HospitalID);
END //
DELIMITER ;





