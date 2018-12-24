create or replace  trigger   et before  insert   on e 
for each row 
begin 
:new.salary := :old.salary + 10 ;  
end ; 


