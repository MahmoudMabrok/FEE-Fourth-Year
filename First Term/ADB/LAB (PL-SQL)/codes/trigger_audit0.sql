create or replace  trigger   tr_audit  before insert  or update or delete   on e 
for each row 
begin 
if inserting then 
insert into e_audit values ( USER  , 'inserting' , SYSDATE ,  :new.name , :old.salary , :new.salary) ; 
end if; 
end ; 





