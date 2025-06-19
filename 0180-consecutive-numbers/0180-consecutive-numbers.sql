-- Write your PostgreSQL query statement below
select distinct res.num as ConsecutiveNums
from (
    select 
    l.num
    , lag(l.num, 1) over ( order by l.id) as prev
    , lag(l.num, 2) over ( order by l.id) as prev_prev
    from Logs l
) res
where res.num = res.prev and res.num = prev_prev