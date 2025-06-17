select e2.name as Employee
from employee as e1
join employee as e2 on e1.id = e2.managerid
where e2.salary > e1.salary