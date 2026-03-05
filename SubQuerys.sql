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