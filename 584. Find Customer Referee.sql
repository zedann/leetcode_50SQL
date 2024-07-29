# Write your MySQL query statement below
SELECT Customer.name
FROM Customer 
WHERE referee_id != 2 OR referee_id IS NULL;

# sol2 not supported in mysql

# Write your MySQL query statement below
SELECT Customer.name
FROM Customer 
WHERE referee_id IS DISTINCT FROM 2;

