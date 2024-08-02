# Write your MySQL query statement below
SELECT query_name,ROUND(AVG(rating/position),2) as quality,
       ROUND(SUM(if(rating<3,1,0))*100/COUNT(query_name),2) as poor_query_percentage
FROM Queries 
GROUP BY query_name
HAVING query_name IS NOT NULL