delete
from person p1
where p1.id in (
	select res.id
	from (
		select *, rank() over (partition by p.email order by p.id) as rank
		from person p
	) as res
	where res.rank > 1
)