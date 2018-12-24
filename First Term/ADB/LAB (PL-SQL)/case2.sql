set serveroutput on ;  
declare 
 a number := 10  ;
m number  ; 
begin 
m := 
CASE a 
when 1 then 10  
when 10 then 12 
else 13 
end ; 

dbms_output.put_line('value is '  || m ); 
end ; 



