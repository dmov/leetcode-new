# Write your MySQL query statement below
select p.email
from Person as p
group by p.email
having count(*) > 1