use practice;
show tables;
select first_name as worker_name from worker;
select upper(first_name) from worker;
select distinct department from worker;
select substring(first_name,1,3) from worker;
select instr(first_name, binary'h') from worker where first_name="Amitabh";
select rtrim(first_name) from worker;
select distinct length(department) from worker;
select replace(first_name,'a','A') from worker;
select concat(first_name,' ',last_name) as complete_name from worker;
select concat_ws('-',first_name,last_name) as complete_name from worker;
select * from worker order by first_name asc;
select * from worker order by first_name asc ,department desc;
select * from worker where first_name in("vipul","satish");
select * from worker where first_name not in("vipul","satish");
select * from worker where department like "Admin%";
select * from worker where first_name like "%a%";
select * from worker where first_name like "%a";
select * from worker where first_name like "______h";
select * from worker where salary between 100000 and 500000;
select * from worker where joinnig_date = 2021;
select count(*) from worker order by department desc;
select count(*) from worker where department= "Admin";
select * from workers where worker_ID in(worker_title);
select* from title;
select* from bonus;
select * from title as t inner join bonus as b on t.worker_ref_id=b.worker_ref_id;
select distinct w.first_name, t.worker_title from worker w inner join title t on w.worker_id = t.worker_ref_id and t.worker_title in("manager");
select worker_title , affected_from, count(*) from title group by worker_title, affected_from having count(*)>1;
select * from worker where mod(worker_id,2)<>0;
select * from worker where mod(worker_id,2)=0;
create table cloneworker like worker;
insert into cloneworker(select *from worker);
select *from cloneworker;
(select *from worker) intersect (select *from cloneworker);
select *from worker minus select *from title;
select salary from worker w1 where 4=(select count(distinct(w2.salary)) from worker w2 where w2.salary >= w1.salary);
select max(salary) from worker where salary not in(select max(salary) from worker);
select max(salary) from worker where salary<(select max(salary) from worker);
select * from worker union all select *from worker order by worker_id;
select * from worker where worker_id = 1 union all select * from worker where worker_id = 1;
(select *from title) union (select*from bonus);
select * from worker where worker_id <=(select(count(worker_id)/2)from worker);
select department, count(worker_id) as 'number of workers' from worker group by department having count(worker_id)<5;
select department, count(worker_id) as 'number of workers' from worker group by department;
select * from worker where worker_id = (select max(worker_id) from worker);
select * from worker order by worker_id desc limit 1;
select * from worker order by worker_id desc limit 5;
select first_name, salary from worker where salary = (select max(salary) from worker);
select department , sum(salary) from worker group by department;
select distinct salary from worker a where 3>= (select count(distinct salary) from worker b where a.salary >= b.salary) order by salary desc;
select distinct salary from worker a where 3<= (select count(distinct salary) from worker b where a.salary >= b.salary) order by salary desc;
select * from title limit 1 offset 7;