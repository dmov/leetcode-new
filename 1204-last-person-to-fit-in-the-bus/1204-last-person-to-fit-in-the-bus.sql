-- Write your PostgreSQL query statement below
select res.person_name
from (
    select *, sum(q.weight) over (order by q.turn)
    from Queue q
) res
where res.sum <= 1000
order by res.sum desc
limit 1