create or replace function checkSal(  id in number )  return Boolean
is 
maxS number ; 
empS number ; 
begin 
select max(salary) into maxS  from emp  ; 
select salary into empS  from emp  where employee_id = id  ; 
  if  maxS > empS  then 
   return true ; 
else 
return false ; 
end if ; 
exception 
when no_data_found then 
return null ; 
end ; 









