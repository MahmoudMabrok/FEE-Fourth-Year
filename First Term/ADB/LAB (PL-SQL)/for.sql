set serveroutput on 
declare 
 x number := 10 ; 
begin 
for i in 1..3 loop 
x := x + i ; 
dbms_output.put_line( x ); 
end loop ;
end; 
 


