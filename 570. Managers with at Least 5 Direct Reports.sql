# Write your MySQL query statement below
WITH manage_cnt as(
    SELECT e.managerId , 
    COUNT(e.managerId) as manage 
    FROM Employee as e
    GROUP BY e.managerId
)

SELECT e.name 
FROM Employee as e
INNER JOIN manage_cnt mc
ON e.id=mc.managerId
WHERE manage >= 5