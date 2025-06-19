# Write your MySQL query statement below
SELECT res.name as 'Department', emp.name as 'Employee', res.salary as 'Salary'
FROM (
  SELECT d.id, d.name, MAX(e.salary) as 'salary'
  FROM Employee e
  JOIN Department d ON e.departmentId = d.id
  GROUP BY d.id
) res
JOIN Employee emp ON emp.salary = res.salary
  AND emp.departmentId = res.id
