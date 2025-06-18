CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  if N < 1 then return QUERY(select NULL::INT as salary);
	else
  		RETURN QUERY (
    		select distinct(e.salary) 
			from employee e
			order by e.salary desc
			limit 1
			offset N-1
  		);
	end if;
END;
$$ LANGUAGE plpgsql;