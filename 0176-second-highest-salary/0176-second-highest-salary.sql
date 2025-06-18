-- Write your PostgreSQL query statement below
select (
	select distinct(e.salary) 
	from employee e
	order by e.salary desc
	limit 1
	offset 1
) as SecondHighestSalary