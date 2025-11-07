Schema Overview
work with three tables:

- **Sailors(sid, sname, rating, age)** – stores sailor info
- **Boats(bid, bname, color)** – stores boat info
- **Reserves(sid, bid, day)** – stores which sailor reserved which boat on which day

---1. DML Commands: SELECT, INSERT, UPDATE, DELETE
 INSERT
-- Insert a sailor
INSERT INTO Sailors VALUES (101, 'John', 5, 25.5);

-- Insert a boat
INSERT INTO Boats VALUES (201, 'Titanic', 'Red');

-- Insert a reservation
INSERT INTO Reserves VALUES (101, 201, '2025-10-27');

SELECT
-- Select all sailors
SELECT * FROM Sailors;

-- Find names of sailors who reserved a red boat
SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'Red';

UPDATE
-- Update rating of a sailor
UPDATE Sailors
SET rating = 7
WHERE sid = 101;

 DELETE
-- Delete a reservation
DELETE FROM Reserves
WHERE sid = 101 AND bid = 201;

2. Aggregate Functions with GROUP BY and HAVING
COUNT, AVG, MIN, MAX, SUM

-- Count how many sailors reserved each boat
SELECT bid, COUNT(*) AS total_reservations
FROM Reserves
GROUP BY bid;

-- Average age of sailors by rating
SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating;

-- Find boats with more than 2 reservations
SELECT bid, COUNT(*) AS num_reservations
FROM Reserves
GROUP BY bid
HAVING COUNT(*) > 2;

-- Minimum and maximum age of sailors
SELECT MIN(age) AS youngest, MAX(age) AS oldest
FROM Sailors;

-- Total number of reservations made by each sailor
SELECT sid, COUNT(*) AS total_reservations
FROM Reserves
GROUP BY sid;
