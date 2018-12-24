create or replace procedure getMaxMinSalaryEmp( maxS  out number , minS  out number ) 
is 
ma number ;
mi number ; 
begin 
select max(salary) into ma  from emp  ; 
select min(salary) into mi  from emp  ; 
maxS := ma ;
minS := mi ; 
end ; 









