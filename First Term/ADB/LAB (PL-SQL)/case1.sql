set serveroutput on ;  
declare 
 a number := 10  ;
begin 
CASE a 
when 1 then dbms_output.put_line('1') 
when 10 then  dbms_output.put_line('1') 
else dbms_output.put_line('Error ')
end case ; 
end ; 



