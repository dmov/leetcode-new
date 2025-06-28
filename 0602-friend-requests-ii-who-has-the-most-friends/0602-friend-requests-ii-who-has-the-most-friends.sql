-- Write your PostgreSQL query statement below
select res.id, count(res.id) as num
from (
    select r1.requester_id as id
    from RequestAccepted r1
    union all
    select r2.accepter_id as id
    from RequestAccepted r2
) res
group by res.id
order by num desc
limit 1