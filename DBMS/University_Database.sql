University Database Schema Overview

Assume the following entities:
- **Students**
- **Courses**
- **Enrollments**
- **Professors**
- **Departments**
1. Table Creation Queries
-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    DepartmentID INT
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT,
    DepartmentID INT
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2)
);

-- Create Professors table
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT
);

-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
```

---
 2. Insert Sample Data
-- Insert into Departments
INSERT INTO Departments VALUES (1, 'Computer Science'), (2, 'Mechanical'), (3, 'Electrical');

-- Insert into Students
INSERT INTO Students VALUES (101, 'Alice', 20, 'Female', 1), (102, 'Bob', 21, 'Male', 2);

-- Insert into Courses
INSERT INTO Courses VALUES (201, 'DBMS', 4, 1), (202, 'Thermodynamics', 3, 2);

-- Insert into Enrollments
INSERT INTO Enrollments VALUES (301, 101, 201, 'A'), (302, 102, 202, 'B');

-- Insert into Professors
INSERT INTO Professors VALUES (401, 'Dr. Sharma', 1), (402, 'Dr. Rao', 2);
```
 3. Select Queries
-- List all students
SELECT * FROM Students;

-- Get all courses offered by Computer Science department
SELECT CourseName FROM Courses WHERE DepartmentID = 1;

-- Find students enrolled in DBMS
SELECT Students.Name
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'DBMS';

-- Get professor names from Mechanical department
SELECT Name FROM Professors WHERE DepartmentID = 2;

4. Useful Joins and Aggregations
-- Count number of students in each department
SELECT DepartmentID, COUNT(*) AS StudentCount
FROM Students
GROUP BY DepartmentID;

-- List students with their grades
SELECT Students.Name, Courses.CourseName, Enrollments.Grade
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
