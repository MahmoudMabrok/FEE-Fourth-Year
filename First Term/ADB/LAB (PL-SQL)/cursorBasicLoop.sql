declare 
cursor e is select first_name  from emp ; 
fname emp.first_name%type ; 
begin
open e ;  
loop 
fetch e into fname ; 
dbms_output.put_line( fname );
exit when e%notfound ; 
end  loop ;
close e ; 
end; 


