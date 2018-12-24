set serveroutput on 
begin
 pkg.reset_com(0.001) ; 
dbms_output.put_line(pkg.std_com) ;
end ; 


