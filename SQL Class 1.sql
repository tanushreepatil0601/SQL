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

/*After deploying your database, you realise that you need to add a column for storing user address numbers in the user's table.
 Write the SQL command to achieve this.*/
 
 ALTER TABLE users ADD users_address VARCHAR(100);
 
/*Additionally, explain how you would modify an existing column to accommodate larger
 product names in the products table.*/
 
 ALTER TABLE products MODIFY product_name VARCHAR(255);
 
--  SELECT >> FROM >> WHERE >> GROUP BY >> HAVING >> ORDER BY
-- EXECUTION >> FROM >> JOIN >> WHERE >> GOUP BY >> HAVING >> SELECT










