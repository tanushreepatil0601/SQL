SELECT * from market_fact_full;

-- Case when example
/*  profit <-500 -> Huge loss
	profit -500 to 0 -> Bearable loss
    profit  -0 to 500 -> Decent profit
    profit >500 -> Great profit
*/

-- This query categorizes profits from the market_fact_full table into different types based on predefined thresholds. 
-- It assigns labels such as "Huge loss," "Bearable loss," "Decent profit," or "Great Profit" according to the value of the profit column.
SELECT
	market_fact_id,
    profit,
    CASE
		WHEN profit <-500 THEN "Huge loss"
		WHEN profit BETWEEN -500 AND 0 THEN "Bearable loss"
        WHEN profit BETWEEN 0 AND 500 THEN "Decent profit"
		ELSE "Great Profit" 	
	END AS profit_type
FROM
	market_fact_full;


