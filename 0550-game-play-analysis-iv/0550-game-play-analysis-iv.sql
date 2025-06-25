-- Write your PostgreSQL query statement below
with first_login_res as (
	select a.player_id, min(a.event_date) as first_login
	from Activity a
	group by a.player_id
), res as (
	select count(distinct a.player_id)
	from Activity a
	join first_login_res fl
	on a.player_id = fl.player_id and a.event_date = fl.first_login + 1
), total_players as (
	select count(distinct a.player_id)
	from Activity a
) select * from round((select * from res)/cast((select * from total_players) as numeric), 2) as fraction