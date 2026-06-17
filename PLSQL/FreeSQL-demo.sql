declare
    cursor raj_cursor is
    select * from raj46;
    raj_rec raj46%rowtype;
begin
    open raj_cursor;
    fetch raj_cursor into raj_rec;
    while(raj_cursor%found) loop
        dbms_output.put_line(raj_rec.first_name ||' '|| raj_rec.employee_id);
        fetch raj_cursor into raj_rec;
    end loop;
    close raj_cursor;
end;