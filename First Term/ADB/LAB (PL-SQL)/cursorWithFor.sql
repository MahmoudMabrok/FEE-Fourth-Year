declare 
cursor e is select * from emp ; 
begin 
for em  in e loop 
dbms_output.put_line(  em.first_name || ' '  ||  em.last_name  );
end  loop ;

end; 


