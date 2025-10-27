SHOW databases;
# sql is not case-sensitive
-- each sql command is separated by ;
# To execute use bolt icon
# key board shortcut to execute a line is Ctrl+Enter

USE employees;

SHOW tables;

SELECT *
FROM salaries
LIMIT 10;

SELECT emp_no, first_name, last_name, birth_date, gender, hire_date
FROM employees;

# SELECT <column1, column2...>
# FROM <table>;
# Note: * = all colummns

SELECT * 
FROM employees
LIMIT 10;

# DISTINCT - Only returns unique values
SELECT COUNT(first_name)
FROM employees;
# 300024

SELECT COUNT(DISTINCT first_Name)
FROM employees;
# 1275 unique first names

# ARithematic
SELECT emp_no, salary, from_date, to_date
FROM salaries; # anual salary

SELECT emp_no, salary/12, from_date, to_date
FROM salaries; # monthly salary

SELECT emp_no, salary/12 AS monthly_salary,
from_date, to_date
FROM salaries; # rename column in display

SELECT emp_no, salary/12 monthly_salary,
from_date, to_date
FROM salaries;# AS can be ommited (not recommend)

# monthly_salary is a variable
# variable cannot contain a space
# to include space in the new name use quotes ""

SELECT emp_no, salary/12 "monthly salary",
from_date, to_date
FROM salaries;

SELECT emp_no, salary/12 `"monthly' salary"`,
from_date, to_date
FROM salaries;

# WHERE clause - apply filter to the result table

SELECT COUNT(*)
FROM salaries;
# 2844047

SELECT COUNT(*)
FROM salaries
WHERE salary < 50000;
# 677528

# Find all employess with the title of senior engineer
SELECT * 
FROM titles
WHERE title = "senior engineer"; # quotes not case sensitive

SELECT * 
FROM titles
WHERE BINARY title = "senior engineer"; # Make it case sensitive

# Comparison operators
# BETWEEN ... AND
SELECT *
FROM salaries
WHERE salary BETWEEN 40000 AND 50000; # 40000<=salary<=50000
# Same thing
SELECT *
FROM salaries
WHERE salary >= 40000 AND salary <= 50000; 

# IN(value1, value2...)
# WHERE salary = value1 OR salary = Value2 ...
SELECT *
FROM salaries
WHERE salary IN(41000, 42000, 43000); # Only these three values are acceptable

-- FIND employees whose first name is george or mary 
SELECT * FROM employees
WHERE first_name IN("george", "Mary");

# Text matching with wildcard
# Match a random character
# LIKE
SELECT * FROM employees
WHERE first_name LIKE "georg_"; # any random character in place of _

# % for any number of characters
SELECT * FROM employees
WHERE first_name LIKE  "geo%";

-- Anyone whose last name ends with a ‘g’?
SELECT * FROM employees
WHERE last_name LIKE "%g";

-- Anyone whose employee number starts with 103?
SELECT * FROM employees
WHERE emp_no LIKE "103%";

-- Which employees have “nd” as the third and fourth letters of their first
-- name?
SELECT * FROM employees
WHERE first_name LIKE "__nd%";

# Combine conditions with AND, OR, NOT
# WHERE x LIKE "a" AND x LIKE "b"
# WHERE x NOT BETWEEN a AND b

# ORDER BY -Sorting
SELECT first_name AS fName, last_name AS lName, gender
FROM employees
WHERE last_name LIKE "___k%" AND gender = "M"
ORDER BY first_name; # ascending by default

SELECT first_name AS fName, last_name AS lName, gender
FROM employees
WHERE last_name LIKE "___k%" AND gender = "M"
ORDER BY 2;

SELECT first_name AS fName, last_name AS lName, gender
FROM employees
WHERE last_name LIKE "___k%" AND gender = "M"
ORDER BY lName DESC;

SELECT first_name AS fName, last_name AS lName, gender
FROM employees
WHERE last_name LIKE "___k%" AND gender = "M"
ORDER BY lName DESC, fName DESC;

-- 1. Display department names in alphabetical order.
SELECT dept_name AS department_name
FROM departments
ORDER BY dept_name;

-- 2. Display the first names and last names of employees, order them
-- by the hire date in a descending order.
SELECT first_name AS fName, last_name AS lName, hire_date
FROM employees
WHERE last_name LIKE "___k%" AND gender = "M"
ORDER BY hire_date DESC;

-- 3. Display employee 10560’s salary records, order them by the
-- amount in a descending order, then by the from date in an ascending
-- order.
SELECT emp_no, salary, from_date
FROM salaries
WHERE emp_no = 10560
ORDER BY salary DESC, from_date ASC;
