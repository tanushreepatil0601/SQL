CREATE DATABASE ecommerce_db;
USE ecommerce_db;
/*You are designing a database for an e-commerce application that requires storing user information, products, and orders.
 What DDL commands would you use to create the necessary tables? Include considerations for primary keys, 
 foreign keys, and appropriate data types*/

CREATE TABLE users
(
user_id VARCHAR(50) PRIMARY KEY,
user_name VARCHAR(25),
email_id VARCHAR(25),
contact_info INT
);

CREATE TABLE products
(
product_id VARCHAR(50) PRIMARY KEY,
product_name VARCHAR(50),
product_catogery VARCHAR(50),
price INT
);

CREATE TABLE orders
(
order_id VARCHAR(50) PRIMARY KEY,
user_id VARCHAR(50),
product_id VARCHAR(50),
quantity INT,
order_date DATE,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);


 
total revenue = total sales(if sales is in motenory or units)
total revenue = price * sales(if sales is in units sold/ quantity)
