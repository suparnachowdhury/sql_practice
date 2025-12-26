-- Write a query to print total rides and profit rides
-- profit ride is when the end location of the current ride is the same as the start location of the next ride

create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));
insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');

select * from drivers;

WITH cte AS (
SELECT id, start_loc, end_loc,
		LEAD(start_loc, 1, '') OVER(PARTITION BY id ORDER BY start_time ASC , end_time ASC) next_start
FROM drivers)
SELECT id, COUNT(1) total_ride,
SUM(case when end_loc = next_start then 1 else 0 END) profit_rides
FROM cte
GROUP BY id;
