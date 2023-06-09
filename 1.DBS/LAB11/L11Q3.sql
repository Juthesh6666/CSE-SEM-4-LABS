create or replace TRIGGER instrInsert
before insert on instructor
declare
sal number;
budg number;
for each row
begin
if length(trim(translate(:NEW.name, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ' '))) > 0 then
    RAISE_APPLICATION_ERROR(-20100,'Name must contain only alphabets');
else
    if :NEW.salary < 1 THEN
        RAISE_APPLICATION_ERROR(-20100,'Salary must be greater than 0');
    else
        select sum(salary) into sal 
	from instructor 
	where dept_name = :NEW.dept_name;
        select budget into budg 
	from department 
	where dept_name = :NEW.dept_name;
        if sal + :NEW.salary > budg THEN
            RAISE_APPLICATION_ERROR(-20100,'Not enough department budget');  
        end if;
    end if;
end if;
end;
/