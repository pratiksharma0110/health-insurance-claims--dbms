
# Health Insurance Claims Management System

## Project Overview
The **Health Insurance Claims Management System** is a database-driven project designed to streamline the management and processing of health insurance claims. It leverages structured data storage, retrieval, and manipulation techniques using SQL, ensuring efficient and reliable data management for policyholders, healthcare providers, and insurers.

### Key Features
- **Database Design**: Structured schema to manage policyholder information, policies, claims, hospitals, and doctors.
- **Normalization**: Implementation of 1NF, 2NF, and 3NF to optimize database efficiency.
- **Advanced SQL Queries**: Use of selection, projection, joins, and set operations to retrieve and manipulate data.
- **Transactions**: Ensures data integrity through rollback and commit mechanisms.
- **Stored Procedures**: Automates repetitive tasks such as inserting data into the database.

---

## Objectives
- **Data Integrity**: Reduce redundancy and ensure consistent and accurate data storage.
- **Performance Optimization**: Optimize query performance for large datasets.
- **Scalability**: Design the database to support future expansions and integration.
- **User-Friendliness**: Simplify the management and retrieval of health insurance claims data.

---

## Project Components

### 1. Database Schema
The system includes the following core tables:
- **PolicyHolder**: Stores information about the insured individuals.
- **Policy**: Details about insurance policies.
- **Hospital**: Information about healthcare providers.
- **Doctor**: Details of doctors associated with hospitals.
- **Claims**: Data about insurance claims.

### 2. Key Operations
- **Data Insertion**: SQL scripts to populate the database with sample data.
- **Data Retrieval**: Queries using selection, projection, and joins to fetch required information.
- **Normalization**: Structured transformations to achieve 1NF, 2NF, and 3NF.
- **Transactions**: Examples showcasing the use of rollback and commit.
- **Stored Procedures**: Custom procedure for automating data insertion.

---

## How to Use

### Prerequisites
- A database management system (e.g., MySQL, PostgreSQL) installed on your system.
- A SQL client or terminal to execute scripts.

### Setup Instructions
1. **Database Creation**:
   - Execute the script to create the `health_insurance` database.
2. **Table Creation**:
   - Run the provided SQL scripts to create all required tables.
3. **Data Insertion**:
   - Use the INSERT queries to populate the tables with sample data.
4. **Run Queries**:
   - Execute the provided SQL queries for selection, projection, joins, and other operations.
5. **Stored Procedures**:
   - Create and execute the stored procedure for inserting data into the Doctor table.

---

## Example Queries
- **Fetch all claims exceeding a certain amount**:
  ```sql
  SELECT * FROM Claims WHERE ClaimAmount > 1000;
  ```
- **Join policyholder and claims data**:
  ```sql
  SELECT PolicyHolder.FullName, Claims.TreatmentDetails
  FROM PolicyHolder
  INNER JOIN Claims ON PolicyHolder.PolicyHolderID = Claims.PolicyNumber;
  ```

---

## Technologies Used
- **SQL**: For data definition, manipulation, and querying.
- **Database Normalization**: To ensure data integrity and efficiency.
- **Transaction Management**: For reliable data operations.

---

## Conclusion
This project demonstrates the effective use of database management principles to design and implement a system for managing health insurance claims. By adhering to normalization standards and leveraging advanced SQL functionalities, the system ensures efficient, scalable, and reliable operations.
