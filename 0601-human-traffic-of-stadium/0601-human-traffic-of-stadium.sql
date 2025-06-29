with res as (
	select *,
	s.id - rank() over (order by s.id) as diff
	from Stadium s
	where s.people  >= 100
)
select res.id, res.visit_date, res.people
from res
where res.diff in (
	select res.diff
	from res
	group by res.diff
	having count(*) >= 3
)
