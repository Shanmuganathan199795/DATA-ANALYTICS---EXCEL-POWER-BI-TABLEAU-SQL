use assignment;
-- select all employees in department 10 whose salary is greater than 3000.
Select * from emp where dept_no =10 and salary > 30000 ;

select * from students;

-- 2. The grading of students based on the marks they have obtained is done as follows:
-- 40 to 50 -> Second Class
-- 50 to 60 -> First Class
-- 60 to 80 -> First Class
-- 80 to 100 -> Distinctions


create view student_grades_distinction as 
select id, name, marks,
Case 
		WHEN marks >= 80 AND marks <= 100 THEN 'Distinction'
        WHEN marks >= 60 AND marks < 80 THEN 'First Class'
        WHEN marks >= 50 AND marks < 60 THEN 'First Class'
        WHEN marks >= 40 AND marks < 50 THEN 'Second Class'
        ELSE 'Fail'
    END AS grade
FROM students; 

-- a. How many students have graduated with first class?
Select count(*) from student_grades_distinction where grade ='First Class';

-- students have obtained distinction
Select count(*) from student_grades_distinction where grade ='Distinction';

-- 3.Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.
create view even_station as SELECT DISTINCT city FROM station WHERE MOD(ID, 2) = 0;

Select * from even_station;

-- 4.  Find the difference between N and N1

SELECT COUNT(city) - COUNT(DISTINCT city) AS difference FROM station;

-- 5. a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]

SELECT DISTINCT CITY FROM STATION WHERE UPPER(LEFT(CITY, 1)) IN ('A', 'E', 'I', 'O', 'U');

-- b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE UPPER(LEFT(CITY, 1)) IN ('A', 'E', 'I', 'O', 'U')
  AND UPPER(RIGHT(CITY, 1)) IN ('A', 'E', 'I', 'O', 'U');

-- c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE UPPER(LEFT(CITY, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');

-- d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]


SELECT DISTINCT CITY FROM STATION WHERE UPPER(LEFT(CITY, 1)) NOT IN ('A', 'E', 'I', 'O', 'U')
   OR UPPER(RIGHT(CITY, 1)) NOT IN ('A', 'E', 'I', 'O', 'U');

-- 6. Query to list employee names
select * from emp;
SELECT CONCAT(first_name, ' ', last_name) AS employee_name FROM emp WHERE salary > 2000 AND EXTRACT(YEAR FROM hire_date) < YEAR(CURDATE()) - 3
ORDER BY salary DESC;

-- 7. How much money does the company spend every month on salaries for each department? [table: employee]
SELECT deptno, SUM(salary) AS total_salary_expenditure FROM emp GROUP BY deptno;

-- 8. How many cities in the CITY table have a Population larger than 100000

SELECT district, SUM(population) AS population1 FROM CITY WHERE Population > 100000 GROUP BY district;
SELECT * from city;

-- 9. What is the total population of California? 
SELECT 'Canada' AS country, SUM(population) AS total_population
FROM CITY;

-- 10. average population of the districts in each country
SELECT district, AVG(population) AS average_population FROM CITY GROUP BY district;

-- 11. -- Query to retrieve order information for 'Disputed' orders
use assignment;

DESCRIBE orders;
DESCRIBE customers;

-- Query to retrieve order information for 'Disputed' orders with customer details
SELECT
    o.orderNumber,
    o.orderDate,
    o.requiredDate,
    o.shippedDate,
    o.status,
    o.comments,
    o.customerNumber,
    c.customerName,
    c.phone,
    c.city,
    c.state,
    c.postalCode,
    c.country,
    c.salesRepEmployeeNumber,
    c.creditLimit
FROM
    orders o
JOIN
    customers c ON o.customerNumber = c.customerNumber
WHERE
    o.status = 'Disputed';

