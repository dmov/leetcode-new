-- Write your PostgreSQL query statement below
select *
from Cinema c
where c.description != 'boring'
and MOD(c.id, 2) != 0
order by c.rating desc