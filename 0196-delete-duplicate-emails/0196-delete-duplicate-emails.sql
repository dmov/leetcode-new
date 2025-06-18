delete 
from person p1
where p1.id not in (
	 select min(p2.id)
 	 from person p2
     group by p2.email
)