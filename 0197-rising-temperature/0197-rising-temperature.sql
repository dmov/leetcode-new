-- Write your PostgreSQL query statement below
select res.id
from (
	select *, lag(w.temperature) over (order by w.recorddate) as prev_temp, lag(w.recorddate ) over (order by w.recorddate) as prev_date 
	from Weather w
) res
where res.prev_temp < res.temperature and res.prev_date = res.recorddate - 1