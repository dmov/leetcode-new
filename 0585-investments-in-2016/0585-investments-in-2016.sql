select round(sum(res.group_sum)::numeric, 2) as tiv_2016
from (
	select sum(i.tiv_2016) as group_sum
	from insurance i
	where i.pid in (
		select max(i1.pid)
		from insurance i1 
		group by i1.lat, i1.lon
		having count(*) = 1
	)
	and i.tiv_2015 in (
		select max(i2.tiv_2015)
		from insurance i2 
		group by i2.tiv_2015
		having count(*) > 1
	)
	group by i.tiv_2015
) res