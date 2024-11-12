
-- This SQL code defines a user-defined function named square that takes an integer parameter X and returns the square of that integer.
--  The function is created using the DELIMITER keyword to define the delimiter as '$$', then defining the function body with the
--  RETURN statement inside a BEGIN...END block. Finally, the DELIMITER is reset to its default value.

DELIMITER $$
CREATE FUNCTION square(X INT)
RETURNS INT DETERMINISTIC
BEGIN
  RETURN X * X;
END;$$
DELIMITER ;

select square(8);



-- This SQL code defines a user-defined function named profitType that categorizes profits into different types based on predefined thresholds.
-- The function takes an integer parameter profit and returns a varchar message indicating the profit type. It uses a CASE statement to 
-- determine the profit type based on the value of the profit parameter.
DELIMITER $$
CREATE FUNCTION profitType(profit INT)
RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
    DECLARE message VARCHAR(30);
    
    SET message = 
        CASE
            WHEN profit < -500 THEN 'Huge Loss'
            WHEN profit BETWEEN -500 AND 0 THEN 'Bearable Loss'
            WHEN profit BETWEEN 0 AND 500 THEN 'Decent Profit'
            ELSE 'Great Profit'
        END;
    
    RETURN message;
END$$
DELIMITER ;

SELECT profitType(10);


-- This SQL code defines a user-defined function named GetMarginCategory that categorizes product margins as either "high" or "low".
--  The function takes a decimal parameter product_margin and returns a varchar indicating the margin category. If the product margin
--  is greater than 0.5, it is classified as "high"; otherwise, it is classified as "low".

DELIMITER $$
CREATE FUNCTION GetMarginCategory(product_margin DECIMAL(10,2))
RETURNS VARCHAR(10) DETERMINISTIC
BEGIN
    DECLARE margin_category VARCHAR(10);
    
    IF product_margin > 0.5 THEN
        SET margin_category = 'high';
    ELSE
        SET margin_category = 'low';
    END IF;
    
    RETURN margin_category;
END;$$
DELIMITER ;

select getmargincategory(0.6);



-- This SQL code defines a user-defined function named OrderType that categorizes orders based on their quantity into different 
-- types: "Bulk order," "Medium order," "Low order," or "Null" if the quantity falls outside the specified ranges. The function 
-- takes an integer parameter Order_quantity and returns a varchar message indicating the order type.

DELIMITER $$
CREATE FUNCTION OrderType(Order_quantity INT)
RETURNS VARCHAR(30) DETERMINISTIC
BEGIN
    DECLARE message VARCHAR(30);
    
    SET message = 
        CASE
            WHEN Order_quantity > 30 THEN 'Bulk order'
            WHEN Order_quantity BETWEEN 10 AND 30 THEN 'Medium order'
            WHEN Order_quantity BETWEEN 0 AND 10 THEN 'Low Order'
            ELSE 'Null'
        END;
    
    RETURN message;
END$$
DELIMITER ;

SELECT OrderType(50);




-- This SQL code defines a user-defined function named CircleArea that calculates the area of a circle given its radius.
-- The function takes a decimal parameter radius and returns the area of the circle as a decimal value. It uses the formula
--  for the area of a circle, which is π (pi) multiplied by the square of the radius.

DELIMITER $$
CREATE FUNCTION CircleArea(radius DECIMAL(10,2))
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE area DECIMAL(10,2);
    SET area = PI() * POWER(radius, 2);
    RETURN area;
END$$
DELIMITER ;

SELECT CircleArea(5);


