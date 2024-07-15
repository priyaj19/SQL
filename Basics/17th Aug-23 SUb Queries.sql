use hr;

-- Write a query to display the name (first and last ) for those employees who gets more 
-- salary than the employee whose ID is 163.

select employee_id,first_name,last_name,salary from employees 
where salary > (select salary from employees where employee_id=163);

-- Write a query to display all the information of employess whose salary is within the 
-- range of smallest salary and 2500.

select * from employees where salary 
IN (select min(salary) from employees) and 2500;

select * from employees where salary 
between (select min(salary) from employees) and 2500;

-- Write a query to display the name (first and last ),salary,department id,job id 
-- for those employees who works in the 
-- same designation as the employee works whose id is 169.

select first_name,last_name ,salary,department_id,job_id from employees
where job_id=(select job_id from employees where employee_id=169);

-- Write a query to display the name (first and last ),salary,department id,job id for 
-- those employees who earn such amount of 
-- salary which is the smallest salary of any of the departments.

select first_name,last_name ,salary,department_id,job_id from employees
where salary=(select min(salary) from employees);

select min(salary),department_id from employees where salary in
(select min(salary) from employees) group by department_id;

-- Write a query to get the details of employees who are managers.
-- select employee_id,manager_id from employees;
-- select count(employee_id) from employees;

select * from employees 
where employee_id IN(select manager_id from employees);

-- Write a query to get the details of employees who manage a department.
select * from employees 
where employee_id IN(select manager_id from employees);

-- Write a query to display the department id and the total salary for those 
-- departments which contains at least one employee

select department_id,sum(salary) from employees where  exists
(select department_id from employees) group by department_id order by department_id;

select department_id,sum(salary) from employees where department_id in
(select department_id from employees) group by department_id order by department_id;

--  Write a query to display the name (first and last ) and department for 
-- all employees for any existence of 
-- those employees whose salary is more than 3700. 
                    
select first_name,last_name,department_id,salary from employees where salary>3700;

select first_name,last_name,department_id,salary from employees 
where exists (select salary from employees where salary>3700);

-- Write a query to display all the information of those employees who 
-- did not have any job in the past.
select * from employees;
select * from job_history;

select count(employee_id) from employees where employee_id 
not in(select employee_id from job_history);

-- Write a query to display employee name(firstname,lastname),
-- employee_id and job title for all employees whose location is Toronto

select first_name,last_name,employee_id,job_id,department_id from employees;
select job_id,job_title from jobs;
select location_id,city from locations;
select department_id,location_id from departments;

use hr;
select e.first_name,e.last_name,e.employee_id,j.job_title,e.department_id ,l.city
from employees e,jobs j,locations l,departments d
where e.job_id=j.job_id and e.department_id=d.department_id 
and d.location_id=l.location_id and l.city='toronto';




