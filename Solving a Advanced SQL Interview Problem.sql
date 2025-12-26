-- https://www.youtube.com/watch?v=nCfaHbTVPXQ&list=PLBTZqjSKn0IeKBQDjLmzisazhqQy4iGkb&index=56


create table job_positions (id  int,
                                             title varchar(100),
                                              groups varchar(10),
                                              levels varchar(10),     
                                               payscale int, 
                                               totalpost int );
 insert into job_positions values (1, 'General manager', 'A', 'l-15', 10000, 1); 
insert into job_positions values (2, 'Manager', 'B', 'l-14', 9000, 5); 
insert into job_positions values (3, 'Asst. Manager', 'C', 'l-13', 8000, 10);  

  create table job_employees ( id  int, 
                                                 name   varchar(100),     
                                                  position_id  int 
                                                );  
  insert into job_employees values (1, 'John Smith', 1); 
insert into job_employees values (2, 'Jane Doe', 2);
 insert into job_employees values (3, 'Michael Brown', 2);
 insert into job_employees values (4, 'Emily Johnson', 2); 
insert into job_employees values (5, 'William Lee', 3); 
insert into job_employees values (6, 'Jessica Clark', 3); 
insert into job_employees values (7, 'Christopher Harris', 3);
 insert into job_employees values (8, 'Olivia Wilson', 3);
 insert into job_employees values (9, 'Daniel Martinez', 3);
 insert into job_employees values (10, 'Sophia Miller', 3);


 select * from job_employees;
 select * from job_positions;



with re_cte as(
 select title, groups, levels, payscale, totalpost,  1 as jobpost
 from job_positions 

 union all
 select title, groups, levels, payscale, totalpost,  jobpost +1
 from re_cte
    WHERE jobpost +1 <= totalpost
 ) select * from re_cte
select  ep.title, ep.groups, ep.levels, ep.payscale, coalesce(je.name, 'vacant') emp_name
 from re_cte ep
 left join job_employees je
 on  je.position_id = ep.id
 order by ep.id, ep.row_id




 select * from job_employees;
 select * from job_positions;

 with t1 as(
 select id as row_id from job_employees
 where id <= (select max(totalpost) from job_positions)
 ), emp_pos as (
 select * from job_positions p
 inner join t1
 on t1.row_id <= p.totalpost)
 select  ep.title, ep.groups, ep.levels, ep.payscale, coalesce(je.name, 'vacant') emp_name
 from emp_pos ep
 left join job_employees je
 on je.id = ep.row_id and je.position_id = ep.id
 order by ep.id, ep.row_id



 