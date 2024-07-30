# Write your MySQL query statement below
SELECT v.customer_id , SUM(t.transaction_id IS NULL) as count_no_trans FROM Visits as v
LEFT JOIN Transactions as t
ON v.visit_id = t.visit_id
GROUP BY v.customer_id
HAVING count_no_trans != 0


-- solve 2
SELECT v.customer_id , 
       COUNT(v.visit_id) as count_no_trans 
FROM Visits as v
WHERE v.visit_id NOT IN 
      (SELECT visit_id FROM Transactions as t)
GROUP BY customer_id

-- solve 3

SELECT customer_id , COUNT(*)  as count_no_trans
FROM Visits as v  
LEFT JOIN Transactions as t ON v.visit_id = t.visit_id 
WHERE t.transaction_id IS NULL
GROUP BY customer_id
