set serveroutput on 
declare 
cc exception ; 
x number ; 
begin 
select employee_id into x from emp where  employee_id = 1 ;
 if x is null then dbms_output.put_line('sai3'); 
end if ; 
dbms_output.put_line('sai3222'); 

exception 
when no_data_found then dbms_output.put_line('sai3');
end ; 


