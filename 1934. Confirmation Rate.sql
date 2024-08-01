-- first solution
WITH t1 AS (
    SELECT s.user_id, COUNT(c.action) AS conf_cnt
    FROM Signups AS s
    LEFT JOIN Confirmations AS c 
    ON s.user_id = c.user_id AND c.action = 'confirmed'
    GROUP BY s.user_id
), t2 AS (
    SELECT s.user_id, COUNT(c.action) AS act_cnt
    FROM Signups AS s
    LEFT JOIN Confirmations AS c 
    ON s.user_id = c.user_id
    GROUP BY s.user_id
)
SELECT 
    t1.user_id,
    CASE 
        WHEN t2.act_cnt = 0 THEN 0
        ELSE ROUND(t1.conf_cnt / t2.act_cnt, 2)
    END AS confirmation_rate
FROM t1
JOIN t2 
ON t1.user_id = t2.user_id;

-- better one:
-- if (condition , true , false)
SELECT s.user_id, ROUND(AVG(if(c.action='confirmed' , 1 , 0)), 2) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c 
ON s.user_id = c.user_id 
GROUP BY s.user_id

