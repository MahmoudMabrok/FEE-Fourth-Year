create or replace  trigger   secure_emp before  insert or update or delete    on e 
for each row 
begin 
 if (to_char(sysdate , 'DY') in ('SAT' , 'MON')) or (to_char(sysdate , 'HH24') NOT BETWEEN '08' and '16') then 
raise_application_error (-20500   , 'Error ') ; 
end if ; 
end ; 


