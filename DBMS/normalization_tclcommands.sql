1. SQL Queries on Normalized University Schema
Table Definitions

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Course_Instructors (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

 Sample Queries

-- List all students and their enrolled courses
SELECT S.StudentName, C.CourseName, E.EnrollmentDate
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

-- Find instructors teaching more than 2 courses
SELECT I.InstructorName, COUNT(*) AS NumCourses
FROM Instructors I
JOIN Course_Instructors CI ON I.InstructorID = CI.InstructorID
GROUP BY I.InstructorName
HAVING COUNT(*) > 2;

-- Show students majoring in 'Computer Science'
SELECT StudentName FROM Students WHERE Major = 'Computer Science';

-- List courses with their assigned instructors
SELECT C.CourseName, I.InstructorName
FROM Courses C
JOIN Course_Instructors CI ON C.CourseID = CI.CourseID
JOIN Instructors I ON CI.InstructorID = I.InstructorID;

2(A). Data Control Language (DCL)
 GRANT
-- Grant SELECT and INSERT privileges on Students to user 'faculty_user'
GRANT SELECT, INSERT ON Students TO faculty_user;

REVOKE
-- Revoke INSERT privilege from 'faculty_user'
REVOKE INSERT ON Students FROM faculty_user;

2(B). Transaction Control Language (TCL)

COMMIT

BEGIN;

INSERT INTO Students VALUES (101, 'Alice', 'Physics');
INSERT INTO Enrollments VALUES (101, 201, '2025-10-27');

COMMIT;

SAVEPOINT
BEGIN;

INSERT INTO Students VALUES (102, 'Bob', 'Math');
SAVEPOINT sp1;

INSERT INTO Enrollments VALUES (102, 202, '2025-10-28');
SAVEPOINT sp2;

-- Rollback to sp1 (undo enrollment but keep student)
ROLLBACK TO sp1;

COMMIT;

ROLLBACK

BEGIN;

INSERT INTO Students VALUES (103, 'Charlie', 'Biology');
INSERT INTO Enrollments VALUES (103, 203, '2025-10-29');

-- Something went wrong
ROLLBACK;
