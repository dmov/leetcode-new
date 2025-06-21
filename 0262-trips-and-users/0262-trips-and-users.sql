select * from (
	select dd::date as "Day", rr.rate as "Cancellation Rate" 
	from generate_series(
		'2013-10-01'::timestamp,
		'2013-10-03'::timestamp,
		'1 day'::interval) dd, lateral
	(
		with res as (
			select * 
			from trips t 
			join users u1 on t.client_id = u1.users_id
			join users u2 on t.driver_id = u2.users_id
			where u1.banned = 'No' and u2.banned = 'No'
			and t.request_at = (dd::date)::varchar
		) , total_count as (
			select count(*) from res
		) , cancelation_count as (
			select count(*) from res
			where res.status = 'cancelled_by_client' or res.status = 'cancelled_by_driver'
		) select case
 			when (select * from total_count) = 0 then (select NULL::numeric as rate)
 			else (select round((select * from cancelation_count)/cast((select * from total_count) as numeric), 2) as rate)
	 	 	end
	) rr
) as rslt
where rslt."Cancellation Rate" is not null