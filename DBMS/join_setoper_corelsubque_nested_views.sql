Schema Recap

Sailors(sid, sname, rating, age)
Boats(bid, bname, color)
Reserves(sid, bid, day)

1. Join Operations
Natural Join

SELECT * 
FROM Sailors NATURAL JOIN Reserves;

*Joins on common column `sid` automatically.*

Equi-Join
SELECT S.sname, R.day
FROM Sailors S, Reserves R
WHERE S.sid = R.sid;

Inner Join

SELECT S.sname, B.bname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid;

Left Outer Join

SELECT S.sname, R.day
FROM Sailors S
LEFT JOIN Reserves R ON S.sid = R.sid;

Right Outer Join

SELECT S.sname, R.day
FROM Sailors S
RIGHT JOIN Reserves R ON S.sid = R.sid;

Full Outer Join

SELECT S.sname, R.day
FROM Sailors S
FULL OUTER JOIN Reserves R ON S.sid = R.sid;

2. Set Operations
UNION

SELECT sname FROM Sailors
UNION
SELECT bname FROM Boats;

INTERSECT

SELECT sid FROM Sailors
INTERSECT
SELECT sid FROM Reserves;

EXCEPT (Set Difference)

SELECT sid FROM Sailors
EXCEPT
SELECT sid FROM Reserves;

3. Subqueries
Nested Query
SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT sid FROM Reserves WHERE bid = 201
);

Correlated Subquery

SELECT sname
FROM Sailors S
WHERE EXISTS (
    SELECT * FROM Reserves R
    WHERE S.sid = R.sid AND R.bid = 201
);

4. Views and Materialized Views
Creating a View

CREATE VIEW RedBoatReservations AS
SELECT S.sname, B.bname, R.day
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'Red';

Querying a View

SELECT * FROM RedBoatReservations;

Materialized View (syntax may vary by DBMS)

-- For PostgreSQL or Oracle
CREATE MATERIALIZED VIEW SailorStats AS
SELECT rating, COUNT(*) AS num_sailors, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating;

-- Refreshing the materialized view
REFRESH MATERIALIZED VIEW SailorStats;