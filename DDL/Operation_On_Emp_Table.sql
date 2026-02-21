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

#Write a SQL query to display employees whose salary is between 25000 and 40000

select * from employee where salary between 25000 and 40000;

#Write a SQL query to display employees whose salary is not equal to 35000.

select * from employee where salary != 35000

#Write a SQL query to display employees who work in 'HR' or 'IT' department

select * from employee where department in ("HR","IT");

#Write a SQL query to display employees whose name starts with letter 'P'.

select * from employee where emp_name like 'P%';

#Write a SQL query to display employees whose salary is greater than or equal to 30000 and department is 'IT'.

select * from employee where salary >= 3000 and department = 'IT';

#Write a SQL query to display employees whose salary is less than 30000 or department is 'Finance'.

select * from employee where salary < 30000  and department = 'Finace';

#Write a SQL query to display employees whose name contains the letter 'a'.

select * from employee where emp_name like '%a%';

#Write a SQL query to increase salary of all employees in the 'IT' department by 2000.

select  * from employee;

update employee set salary = salary + 2000 where department = "IT";

#Write a SQL query to update department of employee with emp_id 3 to 'HR'.

select * from employee;

insert into employee value(3,'rakesh','IT',40000,'2025-04-06');

update employee set department = 'HR' where emp_id = 3;

#Write a SQL query to update salary of employee named 'Amit' to 30000

insert into employee values(2,'Amit', 'Finance',25000,'2022-11-18');

select * from employee;

update employee set salary = 30000 where emp_name = "Amit";

#Write a SQL query to change join_date of employee with emp_id 5 to '2024-01-01'

insert  into employee values(5,"Akshay","Marketing",40000,'2023-12-25');

select * from employee;

update employee set join_date = '2024-01-01' where emp_id = 5;