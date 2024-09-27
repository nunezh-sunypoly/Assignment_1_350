/* Problem 6 Solution */
 /* Author: Kimberly Birmingham */
Select avg (e.salary) as avg_salary
from employees e 
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id
where country_id like '%DE%'


/* Problem 7 Solution */
 /* Author: Kimberly Birmingham */

select department_id, avg(salary) as avg_salary, count(department_id)
from employees
group by department_id
having count(*) >=8;


/* Problem 8 Solution */
 /* Author: Kimberly Birmingham */
select min(e.salary) as min_salary, max(e.salary) as max_salary
from employees e
join jobs j on e.job_id = j.job_id
Where j.job_title = 'Programmer';


/* Problem 9 Solution */
 /* Author: Kimberly Birmingham */ 

select sum (e.salary) AS total_salary 
from employees e
join departments d on e.department_id = d.department_id
Where department_name = 'Finance';
