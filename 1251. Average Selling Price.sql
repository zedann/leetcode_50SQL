# Write your MySQL query statement below
WITH product_price AS ( 
    SELECT  p.product_id  , 
            price , 
            SUM(price * units) as productxunits
    FROM Prices as p
    LEFT JOIN UnitsSold as u
    ON p.product_id=u.product_id 
    WHERE purchase_date >= start_date AND  purchase_date <= end_date OR purchase_date IS NULL
    GROUP BY p.product_id
),

unites AS (
    SELECT product_id,SUM(units) as units 
    FROM UnitsSold
    GROUP BY product_id
)

SELECT pp.product_id, 
if(productxunits , ROUND(productxunits / units,2) , 0) as average_price  
FROM product_price as pp
LEFT JOIN unites as u
ON pp.product_id= u.product_id
-- SELECT * FROM product_price;


-- sol2
# Write your MySQL query statement below
 
SELECT  p.product_id  , 
        if(SUM(units) != 0,ROUND(SUM(price * units)/SUM(units),2),0) as average_price
FROM Prices as p
LEFT JOIN UnitsSold as u
ON p.product_id=u.product_id 
WHERE purchase_date >= start_date AND  purchase_date <= end_date OR purchase_date IS NULL
GROUP BY p.product_id


