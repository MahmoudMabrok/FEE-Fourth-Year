create or replace function disEmp    return number
is 
begin 
for row in (select * from emp ) loop 
dbms_output.put_line('name ' || row.first_name || '  salary ' || 
 row.salary );
end loop ; 
return 1 ;  
exception 
when no_data_found then 
return 0 ; 
end ; 









