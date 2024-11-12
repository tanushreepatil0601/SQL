-- This SQL code creates a stored procedure named productSales that retrieves product IDs and sales data from the market_fact_full table. 
-- When invoked, the procedure selects and displays the Prod_id and Sales columns from the specified table.

DELIMITER $$
CREATE PROCEDURE productSales()
BEGIN
    SELECT Prod_id, Sales
    FROM market_fact_full;
END$$
DELIMITER ;

call productSales();



-- Beloe stored procedure named get_sales_customers accepts an integer input parameter sales_input. It retrieves distinct customer IDs
-- along with their rounded sales amounts from a table named market_fact_full, filtering for sales amounts greater than the provided input.
-- The results are ordered by the rounded sales amounts.

DELIMITER $$
CREATE PROCEDURE get_sales_customers (sales_input INT) 
BEGIN 
    SELECT DISTINCT cust_id,
           ROUND(sales) AS sales_amount
    FROM
		market_fact_full
    WHERE ROUND(sales) > sales_input
	ORDER BY sales_amount;
END$$
DELIMITER ;
CALL get_sales_customers(300);


-- Below stored procedure named GetProductMargins retrieves product IDs along with their corresponding margin categories ('high' or 'low')
-- based on a threshold condition applied to the product base margin from the table market_fact_full.

DELIMITER //
CREATE PROCEDURE GetProductMargins()
BEGIN
    SELECT 
        prod_id,
        CASE
            WHEN Product_base_margin > 0.5 THEN 'high'
            ELSE 'low'
        END AS Margin_Category
    FROM 
        market_fact_full;
END//
DELIMITER ;


select * from market_fact_full;


