select dept.DEPARTMENT_NAME   ,  emp.EMPLOYEE_ID from job_history  j  , dept  , emp    where dept.DEPARTMENT_ID  = j.DEPARTMENT_ID  and emp.EMPLOYEE_ID  = j.EMPLOYEE_ID 
 


