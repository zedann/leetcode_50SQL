SELECT w1.id 
FROM Weather as w1
INNER JOIN (SELECT * FROM Weather) as w2
ON DATEDIFF(w1.recordDate , w2.recordDate) = 1 AND w1.temperature > w2.temperature;


--sol2 better directly self join them

SELECT today.id FROM Weather as Today 
INNER JOIN Weather as Yesterday
ON DATEDIFF(Today.recordDate , Yesterday.recordDate) = 1 AND Today.temperature > Yesterday.temperature
