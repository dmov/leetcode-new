CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    select distinct(e.salary) 
	from employee e
	order by e.salary desc
	limit 1
	offset N-1
  );
END;
$$ LANGUAGE plpgsql;