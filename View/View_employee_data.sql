use demo_123;

show tables;

create or replace view empInfo as select emp_id, emp_name, salary from employee;

select * from empInfo;