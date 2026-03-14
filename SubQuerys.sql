use demo_123;
show tables;
select * from department;
select * from employee;
select * from project;

# Write a query to find employees whose salary is greater than the average salary of all employees.

select * from employee where salary > (select avg(salary) from employee);

# Write a query to display employees who work in the department named 'HR'.

select * from employee where dept_id = (select dept_id from department where dept_name = 'HR');

# Find employees whose salary is greater than the minimum salary in the Employee table.

select * from employee where salary > (select min(salary) from employee);

# Display employees whose department location is 'Mumbai'.

 select * from employee where dept_id = (select dept_id from department where location = 'Mumbai');
 
 # Find employees who are working on any project.
 
select * from employee where emp_id IN ( select emp_id from project );

# Display employees whose salary is equal to the maximum salary in the Employee table.

select * from employee where salary = (select max(salary) from employee);

# Find employees who joined in the same year as employee with emp_id = 3.

 select * from employee where join_year = (select join_year from employee where emp_id = 3);
 
 # Display employees whose salary is greater than the salary of employee 'Rahul'.

select * from employee where salary > (select salary from employee where emp_name = 'Rahul');

# Find employees whose department id exists in the Department table.

select * from employee e where exists (select dept_id from department d where e.dept_id = d.dept_id);

# Display employees who are working on a project with budget greater than 50000.

select * from employee where emp_id in (select emp_id from project where budget > 50000);

# Write a query to display employees whose salary is greater than the average salary of their department.

select * from employee e where salary > (select avg(salary) from employee where dept_id = e.dept_id);

# Find departments where no employee is assigned.

select * from employee e where not exists(select dept_id from department where e.dept_id = dept_id);

# Display employees who earn more than the average salary of employees in 'IT' department.

select * from employee where salary > (select avg(salary) from employee where dept_id = (select dept_id from department where dept_name = 'IT'));

# Find employees who are working on the project with the highest budget.

select * from employee where emp_id IN (select emp_id from project where budget = (select max(budget) from project));

# Display employees whose salary is higher than at least one employee in department 2.

 select * from employee where  salary > any (select salary from employee  where dept_id = 2);
 
 # Find employees whose salary is less than the maximum salary in their department.

select * from employee e where salary < (select max(salary) from employee p where p.dept_id = e.dept_id);

# Display employees who work in departments located in the same location as the 'Sales' department.

select * from employee where dept_id IN (select dept_id from department where location = (select location from department where location = 'Sales'));

# Find employees who are not assigned to any project.

select * from employee e where not exists (select emp_id from project p where e.emp_id = p.emp_id);

# Display departments where average salary of employees is greater than 60000.


