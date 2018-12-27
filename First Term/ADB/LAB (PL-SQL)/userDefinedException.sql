set serveroutput on 
declare 
cc exception ; 
begin 
update  emp set salary = 1000 
where employee_id = 1 ; 

if sql%notfound then 
raise cc ;
  end if ; 

exception 
when cc then dbms_output.put_line('sai3');
end ; 


