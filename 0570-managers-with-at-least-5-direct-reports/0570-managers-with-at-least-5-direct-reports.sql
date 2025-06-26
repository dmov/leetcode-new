-- Write your PostgreSQL query statement below
select e.name
from Employee e
where e.id in (
    select max(e1.managerId)
    from Employee e1
    group by e1.managerId
    having count(*) >= 5
)