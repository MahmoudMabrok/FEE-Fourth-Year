declare 
 x number := 17 ; 
begin 
 loop 
x := x + 1 ; 
dbms_output.put_line( x ); 
exit when x > 16 ;
end loop ;
end; 
 


