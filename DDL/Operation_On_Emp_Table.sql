use july_2025;
show tables;
create table employee(emp_id int(4) primary key, emp_name varchar(50) not null, department varchar(50), salary decimal(10,2), join_date date);

desc employee;
insert into employee(emp_id, emp_name, department, salary, join_date) values(6,'Rohan', 'IT', 30000, '2025-02-01');
insert into employee(emp_id, emp_name, department, salary, join_date) values(7,'Sneha', 'HR', 26000, '2025-11-10'), (8,'vikram', 'Finance', 38000,'2022-08-18');
insert into employee values(9,'Anjali','Marketing',42000,'2026-02-12');
insert into employee value(10,'Mahesh','Finance',55000,'2023-12-15');

select * from employee;

insert into employee value(12,'Rahul','IT',35000,'2023-06-25');

#Write a SQL query to display all records from the Employee table.
select * from employee;

#Write a SQL query to display only emp_name and salary of all employees.

select emp_name, salary from employee;

#Write a SQL query to display employees working in the 'IT' department.

select * from employee where department = 'IT';

#Write a SQL query to display employees whose salary is greater than 30000.

select * from employee where salary > 30000;

#WWrite a SQL query to display employees who joined after '2022-01-01'.

select * from employee where join_date = '2022-01-01';

# Write a SQL query to display distinct department names from the Employee table.

select distinct department from employee;

