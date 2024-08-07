# Write your MySQL query statement below
SELECT product_id,year as first_year , quantity , price
FROM Sales AS S
WHERE (S.product_id , S.year) IN
(
    SELECT product_id , MIN(year)  as first_year
    FROM Sales
    GROUP BY product_id
)