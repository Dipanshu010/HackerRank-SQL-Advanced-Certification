SELECT emp_id, SUM(work_hours) AS total_weekend_hours
FROM (
  SELECT 
    emp_id,
    TIMESTAMPDIFF(HOUR, MIN(timestamp), MAX(timestamp)) AS work_hours
  FROM attendance
  WHERE DAYOFWEEK(timestamp) IN (1, 7)  
  GROUP BY emp_id, DATE(timestamp)
) AS t
GROUP BY emp_id
ORDER BY total_weekend_hours DESC;
