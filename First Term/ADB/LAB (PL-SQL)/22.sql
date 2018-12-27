create or replace function getNN (d1 date , d2 date) return boolean 
is 
begin 
for ee in (  select dept.DEPARTMENT_NAME   ,  emp.EMPLOYEE_ID from job_history  j  , dept  , emp    where dept.DEPARTMENT_ID  = j.DEPARTMENT_ID  and emp.EMPLOYEE_ID  = j.EMPLOYEE_ID 
where (start_date  between d1 and d2) and (end_date between d1 and d2 ) )  loop 
dbms_output.put_line('error');
end loop ; 
return true  ; 
exception 
when no_data_fount then 
dbms_output.put_line('error');
end ; 


