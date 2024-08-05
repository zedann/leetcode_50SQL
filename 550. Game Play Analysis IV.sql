# Write your MySQL query statement below

WITH min_dates AS 
(
    SELECT player_id , MIN(event_date) as min_event_date 
    FROM Activity 
    GROUP BY player_id
)

SELECT ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) as players FROM Activity),2) as fraction 
FROM Activity AS A
JOIN min_dates AS MD
ON A.player_id=MD.player_id AND DATE_ADD(MD.min_event_date , INTERVAL 1 DAY) = A.event_date

