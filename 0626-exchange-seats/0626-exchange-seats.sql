-- Write your PostgreSQL query statement below
select s.id,
case 
    when MOD(s.id,2) != 0 then 
        case when lead(s.student) over (order by s.id) is null then s.student
        else lead(s.student) over (order by s.id)
        end
    else lag(s.student) over (order by s.id) 
end as student
from Seat s