-- Write your PostgreSQL query statement below
select o.customer_number
from Orders o
group by o.customer_number
order by count(o.customer_number) desc
limit 1