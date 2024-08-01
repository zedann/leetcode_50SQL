# Write your MySQL query statement below
WITH student_subject AS 
(
    SELECT * FROM Students
    CROSS JOIN Subjects
    ON TRUE
)
SELECT ss.student_id , ss.student_name , ss.subject_name , COUNT(e.subject_name) as attended_exams FROM student_subject as ss
LEFT JOIN Examinations as e
ON (ss.student_id = e.student_id  AND ss.subject_name = e.subject_name) 
GROUP BY  ss.student_id  , ss.subject_name
ORDER BY ss.student_id , ss.subject_name
