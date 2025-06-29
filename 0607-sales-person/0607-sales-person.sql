select distinct sp."name"
from Orders o
right join SalesPerson sp on sp.sales_id = o.sales_id
where sp.sales_id not in (
	select distinct o.sales_id
	from Orders o
	join Company c on c.com_id = o.com_id
	where c."name" = 'RED'
)