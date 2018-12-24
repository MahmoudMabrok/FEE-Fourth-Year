create or replace package  body pkg is 
function validate ( comm  number ) return boolean is 
max_com emp.commission_pct%type ; 
begin 
select max (commission_pct) into max_com from emp ; 
return (comm between 0.0 and max_com ) ; 
end validate ; 

procedure reset_com (new_com number ) is 
begin 
if (validate(new_com )) then 
std_com := new_com ; 
else 
raise_application_error(-20100 , 'Bad Commitions') ; 
end if ; 
end reset_com  ; 
end pkg;  





