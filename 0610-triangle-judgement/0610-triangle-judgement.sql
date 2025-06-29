-- Write your PostgreSQL query statement below
select *, case when (t.x + t.y > t.z) and (t.z + t.y > t.x) and (t.z + t.x > t.y) then 'Yes' else 'No' end as triangle
from Triangle t