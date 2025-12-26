create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);

select * from candidates;

	WITH total_salary AS (
		SELECT *, SUM(salary) OVER(PARTITION BY experience
		                            ORDER BY salary) AS running_sum
		FROM candidates
	), 
	hired_seniors AS (
		SELECT emp_id, experience, salary
		FROM total_salary
		WHERE experience = 'Senior' AND running_sum <= 70000
	)
	SELECT emp_id, experience, salary
	FROM total_salary
	WHERE  experience = 'Junior'
		   AND running_sum < 70000 - (SELECT Sum(salary)
									  FROM   hired_seniors)
	UNION ALL
	SELECT emp_id, experience, salary FROM hired_seniors;

	    WITH numbers (n) AS (
    -- Base/ Anchor: Start from 1
    SELECT 1
    UNION ALL
    -- Recursive: Increment the number by 1
    SELECT n + 1
    FROM numbers
    WHERE n < 7
     )
    SELECT n
    FROM numbers;




