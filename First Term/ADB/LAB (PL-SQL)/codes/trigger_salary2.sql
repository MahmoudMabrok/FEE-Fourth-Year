create or replace  trigger   et before  insert  or update   on e 
for each row 
begin 
if  :new.salary > 50 then 
:new.salary :=  :new.salary + 20  ;
else 
:new.salary :=  :new.salary + 30 ;
end if ;   
end ; 





