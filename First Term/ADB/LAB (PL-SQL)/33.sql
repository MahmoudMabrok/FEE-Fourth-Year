set serveroutput on 
begin 
for record in (  select dept.DEPARTMENT_NAME   ,  emp.EMPLOYEE_ID from job_history  j  , dept  , emp    where dept.DEPARTMENT_ID  = j.DEPARTMENT_ID  and emp.EMPLOYEE_ID  = j.EMPLOYEE_ID 
where (start_date  between d1 and d2) and (end_date between d1 and d2 ) ) 
loop 
dbms_output.put_line(record.first_name); 
end loop ; 
end ; 





