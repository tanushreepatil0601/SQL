-- create employees1 table
CREATE TABLE employees1 (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  assets int 
);
 -- insert the values
INSERT INTO employees1 (name, department, assets) VALUES
  ('Riya', 'Engineering', 5),
  ('Rahul', 'Marketing', 4),
  ('Aisha', 'Sales', 4),
  ('Priya', 'HR', 7),
  ('Sara', 'Sales', 4),
  ('Viya', 'IT', 5),
  ('Ram', 'Engineering', 5),
  ('Vena', 'Marketing', 4);


-- drop table employees1;
-- drop table employees2;

-- create employees1 table
CREATE TABLE employees2 (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  assets int
);
 -- insert the values
INSERT INTO employees2 (name, department,assets) VALUES
  ('Nikita', 'Marketing', 4),
  ('Suresh', 'Engineering', 5),
  ('Pooja', 'Sales', 4),
  ('Aman', 'HR', 7),
  ('David', 'Finance', 6),
  ('Rohan', 'Engineering', 5),
  ('Jiya', 'Finance', 6),
  ('karan', 'HR', 7),
  ('Jisan', 'Marketing', 5);
  
  

SELECT * FROM employees1;
SELECT * FROM employees2;

SET profiling = 1;
SELECT * FROM employees1
UNION
SELECT * FROM employees2;
SHOW PROFILES;

SET profiling = 1;
SELECT * FROM employees1
UNION ALL
SELECT * FROM employees2;
SHOW PROFILES;


-- Create a temporary table called market_fact_temp from an existing table called market_fact_full.
-- We are creating an index named filter_index on the market_fact_temp table. This index is designed 
-- to optimize queries that involve the columns cust_id


CREATE TEMPORARY TABLE market_fact_temp
SELECT * FROM market_fact_full;

SHOW INDEXES FROM market_fact_temp;

-- ALTER TABLE market_fact_temp
-- DROP INDEX filter_index;

-- Query without index
SET profiling = 1;
SELECT *
FROM market_fact_temp
WHERE cust_id = 'Cust_1618';
SHOW PROFILES;

CREATE INDEX filter_index on market_fact_temp(Cust_id);
SHOW INDEXES FROM market_fact_temp;

-- Query using index
SET profiling = 1;
SELECT *
FROM market_fact_temp
WHERE cust_id = 'Cust_1618';
SHOW PROFILES;

select * from market_fact_temp;


-- Clustered Index vs Non-Clustered Index
-- Clustered Index 
SHOW INDEXES FROM employees1;
CREATE INDEX idx_employees_id ON employees1 (id);
SELECT * FROM employees1 WHERE id = 3;

-- Non-Clustered Index
CREATE INDEX idx_employees_dept ON employees1(department);
SELECT * FROM employees1 WHERE department = 'Engineering';



-- Consider two employee tables, employees1 and employees2, where each employee is associated with a department and assets 
-- they possess. Write a SQL query to display the names, departments, and assets of employees from both tables who belong to 
-- the same department. 

-- Unoptimized Query
SELECT DISTINCT e1.name, e1.department, e1.assets, e2.name, e2.department, e2.assets
FROM employees1 AS e1, employees2 AS e2
WHERE e1.department = e2.department;

-- In the unoptimized query:
-- SELECT DISTINCT is used, which can slow down query processing.
-- Implicit join syntax (FROM employees1 AS e1, employees2 AS e2 WHERE e1.department = e2.department) is used, 
-- which can result in Cartesian products and is generally considered less readable and maintainable compared to explicit joins.

-- Optimized Query
SELECT e1.name AS name_1, e1.department AS department_1, e1.assets AS assets_1,
       e2.name AS name_2, e2.department AS department_2, e2.assets AS assets_2
FROM employees1 AS e1
JOIN employees2 AS e2 ON e1.department = e2.department;
