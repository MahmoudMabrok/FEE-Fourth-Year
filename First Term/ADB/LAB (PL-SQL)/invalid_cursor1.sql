declare  
 cursor  e is 
select * from emp ; 
row emp%rowtype ; 
begin
close e ;  
loop 
fetch e into row ; 
dbms_output.put_line('aaa ' ) ; 
exit when e%notfound ; 
end loop ; 

end ; 


