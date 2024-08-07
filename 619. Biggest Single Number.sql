-- sol1 
# Write your MySQL query statement below
select ifnull((select num 
from MyNumbers
group by num
having count(num)=1
order by num desc
limit 1) , null) as num
-- sol2
# Write your MySQL query statement below

SELECT MAX(T.num) AS num
FROM (
    SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num)=1
    ) AS T