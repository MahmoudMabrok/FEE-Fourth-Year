SET SERVEROUTPUT ON 
declare 
n number ; 
BEGIN 
getDeptCount ( 'Marketing' , n);
dbms_output.put_line(n) ; 

END ; 





