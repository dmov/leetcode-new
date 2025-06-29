-- Write your PostgreSQL query statement below
select max(res.num) as num
from (
    select mn.num
    from MyNumbers mn
    group by mn.num
    having count(*) = 1
) res