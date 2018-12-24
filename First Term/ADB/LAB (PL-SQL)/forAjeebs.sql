set serveroutput on 
begin 
for record in (select first_name from emp ) 
loop 
dbms_output.put_line(record.first_name); 
end loop ; 
end ; 


