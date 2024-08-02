# Write your MySQL query statement below
SELECT contest_id,ROUND((COUNT(R.user_id)/Nou.num_of_users)*100 ,2) as percentage
FROM Register as R
CROSS JOIN
(SELECT COUNT(user_id) as num_of_users FROM Users) as Nou
GROUP BY R.contest_id
ORDER BY percentage DESC ,contest_id ASC
-- sol2

SELECT contest_id,ROUND((COUNT(R.user_id)/(SELECT COUNT(user_id) as user_cnt FROM Users))*100 ,2) as percentage
FROM Register as R
GROUP BY R.contest_id
ORDER BY percentage DESC ,contest_id ASC
