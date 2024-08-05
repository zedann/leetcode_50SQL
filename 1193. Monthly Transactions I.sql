# Write your MySQL query statement below
SELECT DATE_FORMAT(trans_date , '%Y-%m') as month,
       country,
       COUNT(state) as trans_count,
       SUM(if(state='approved',1,0))as approved_count,
       SUM(amount)as trans_total_amount,
       SUM(if(state='approved',amount,0)) as approved_total_amount
FROM Transactions
GROUP BY month,country
