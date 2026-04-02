use demo_123;

show tables;

delimiter //

create function getSqrt(n int(2)) returns int(2)
DETERMINISTIC
begin 
DECLARE result int(3);
SET result = n*n;
return result;
END
//

select getSqrt(4);

delimiter //
-- this function is used for the perform the operation of string concatination with loop
create function printName(name varchar(200)) returns varchar(200)
DETERMINISTIC
begin
DECLARE i int(3);
SET i = 1;

test_loop: LOOP
IF i = 5 THEN
	LEAVE test_loop;
ELSE
 SET name = concat(name,name);
SET i = i+1;
END IF;
END LOOP;
return name;
END
//

delimiter ;
select printName("Aniket")  ;

select * from employee;

drop function printName;