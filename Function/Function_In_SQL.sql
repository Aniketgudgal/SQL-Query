use demo_123;
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