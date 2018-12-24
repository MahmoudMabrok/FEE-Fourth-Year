SET SERVEROUTPUT ON 
declare 
n1 number ;
n2 number ; 
BEGIN 
getMaxMinSalaryEmp(n1 , n2 );
dbms_output.put_line(n1 || ' :: ' || n2) ; 

END ; 





