-- Employees by:

-- Time they've been on the job
/*
    Pseudo-code:
    create view
        select funcid, name
        from employee
        group by funcid, name
        order by init_date
*/