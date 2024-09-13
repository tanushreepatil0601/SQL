# SQL
Given an employees table with the following columns:

Employees

Write a query to retrieve the full names of all the employees along with their employee numbers.

SELECT employeeNumber, CONCAT(firstName,' ',lastName) AS fullName
FROM Employees;
