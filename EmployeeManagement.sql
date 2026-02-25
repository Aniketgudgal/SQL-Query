# Display all employee details whose salary is greater than 40000.

select * from employee where salary > 40000;

# Display employee names and salary who belong to 'IT' department.

select emp_name, salary from employee where department = 'IT';

# Show employees whose experience is between 3 and 7 years.

select * from employee where experience between 3 and 7;

# Display employees who are not from 'Pune'

select * from employee where not city = 'Pune';

# Find the total salary of all employees.

select sum(salary) from employee;

# Find the average salary of employees in 'HR' department.

select avg(salary) from employee where department = 'HR';

# Count the number of employees working in 'Sales' department.

select count(emp_id) from employee where department = 'Sales';

# Display the maximum salary in the company.

select max(salary) from employee;

# Show employee name and salary in descending order of salary.

select emp_name, salary from employee order by salary desc;

# Display department wise total salary using GROUP BY.

select department, sum(salary) from employee group by department;

# Display department wise average salary where average salary is greater than 50000.

select department, avg(salary) as average_sal from employee group by department having average_sal > 50000;

# Count number of employees in each city and display only those cities having more than 2 employees.

select city, count(emp_id) as total_emp from employee group by city having total_emp > 2;

# Display department wise maximum salary.

select department, max(salary) from employee group by department;

# Show departments where total salary is greater than 200000.

select department, sum(salary) as total_sal from employee group by department having total_sal > 200000;

# Display city wise employee count in descending order of employee count.

 select city, count(emp_id) as emp_count from employee group by city order by emp_count desc;
 
 
 