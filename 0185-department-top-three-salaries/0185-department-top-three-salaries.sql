-- Write your PostgreSQL query statement below
select res.Department, res.Employee, res.Salary
from (
	select d."name" as Department, e."name" as Employee, e.salary as Salary, dense_rank() over (partition by d.id order by salary desc)
	from employee e 
	join department d on d.id = e.departmentid
) res
where res.dense_rank <= 3