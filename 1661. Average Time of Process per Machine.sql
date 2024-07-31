# Write your MySQL query statement below
SELECT t1.machine_id , ROUND(AVG(t1.process_diff) , 3) as processing_time
FROM 
(
    SELECT startProcess.machine_id , ROUND(endProcess.timestamp - startProcess.timestamp , 3) as process_diff
    FROM  (SELECT * FROM Activity WHERE activity_type='start')as startProcess
    JOIN
    (SELECT * FROM Activity WHERE activity_type='end') as endProcess
    ON 
    startProcess.machine_id = endProcess.machine_id AND startProcess.process_id = endProcess.process_id

) as t1
GROUP BY t1.machine_id


-- sol2
WITH proces_diff_cte AS(
    SELECT startProcess.machine_id , ROUND(endProcess.timestamp - startProcess.timestamp , 3) as process_diff
    FROM  (SELECT * FROM Activity WHERE activity_type='start')as startProcess
    JOIN
    (SELECT * FROM Activity WHERE activity_type='end') as endProcess
    ON 
    startProcess.machine_id = endProcess.machine_id AND startProcess.process_id = endProcess.process_id

) 
SELECT machine_id , ROUND(AVG(process_diff) , 3) as processing_time
FROM proces_diff_cte
GROUP BY machine_id