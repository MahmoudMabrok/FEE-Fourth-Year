create or replace  trigger   secure_emp before  insert or update or delete    on e 
for each row 
begin 
pkg.reset_com(:new.salary);
exception 
when others then 
dbms_output.put_line('aa');
end ; 





