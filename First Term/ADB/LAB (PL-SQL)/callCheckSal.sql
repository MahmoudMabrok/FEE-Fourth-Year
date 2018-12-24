SET SERVEROUTPUT ON 
BEGIN
if  checkSal(201) is null then 
 dbms_output.put_line('error ') ; 
elsif  checkSal(201) then 
 dbms_output.put_line('is lower max value ') ; 
 else
 dbms_output.put_line('is  max ') ; 
end if ; 
END ; 





