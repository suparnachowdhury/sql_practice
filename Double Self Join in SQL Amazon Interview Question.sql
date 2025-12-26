

-- Write a SQL wuery to list employeename along with their manager and senior manager's name.
-- senior manager is manager's manager
-- drop table emp;
create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp
values
(1, 'Ankit', 100,25000, null, 39);
insert into emp
values (2, 'Mohit', 100, 18000, 1, 48);
insert into emp
values (3, 'Vikas', 100, 12000,4,37);
insert into emp
values (4, 'Rohit', 100, 14000, 6, 16);
insert into emp
values (5, 'Mudit', 200, 15000, 6,55);
insert into emp
values (6, 'Agam', 200, 16000,2, 14);
insert into emp
values (7, 'Sanjay', 200, 9000, 5,13);
insert into emp
values (8, 'Ashish', 200,5000,4,12);
insert into emp
values (9, 'Mukesh',300,6000,5,51);
insert into emp
values (10, 'Rakesh',500,7000,5,50);

select * from emp;

SELECT e.emp_id, e.emp_name employee
	   , m.emp_name manager
	   , sm.emp_name senior_manager
FROM emp e
left join emp m on e.manager_id = m.emp_id
left join emp sm on m.manager_id = sm.emp_id;