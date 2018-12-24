create or replace procedure getDeptCount ( name  in varchar2 , n  out number ) 
is 
c number ; 
begin 
select count(*) into c from emp , dept where dept.department_id = emp.department_id and department_name = name ; 
n := c ; 
end ; 






