-- Average employee hours

-- By employee type (CrewMember/TicketSeller/all)
CREATE FUNCTION dbo.Transportation_System.avg_hours_by_employee_type
(
    @e_type VARCHAR(12),
    @curr_date smalldatetime, -- impossible to get current date inside function, because scalar udf is deterministic
)
RETURNS SMALLINT
AS
BEGIN
    DECLARE @hours SMALLINT;

    -- Get employees requested (crewMember/ticketSeller/all) to table variable
    DECLARE @employees TABLE (
        FuncID char(15) NOT NULL,
        EName varchar(50),
        Birthday smalldatetime,
        Init_Date smalldatetime
        );
    
    IF @e_type = "TicketSeller"
    BEGIN
        -- Get only CrewMembers
        INSERT INTO @employees
        SELECT * FROM Transportation_System.Employee
        WHERE FuncID IN (SELECT FuncID FROM Transportation_System.CrewMember)
    END
    ELSE 
        IF @e_type = "CrewMember"
        BEGIN
            -- Get only TicketSellers
            INSERT INTO @employees
            SELECT * FROM Transportation_System.Employee
            WHERE FuncID IN (SELECT FuncID FROM Transportation_System.TicketSeller)
        END
        ELSE
            IF @e_type = "All"
            BEGIN
                INSERT INTO @employees
                SELECT * FROM Transportation_System.Employee
            END
            -- else others (continue here)...
            ELSE
            BEGIN
                PRINT 'Error: Wrong @e_type';
                RETURN -1;
            END
    --GO

    -- Select rows from a Table or View 'Employee' in schema 'SchemaName'
    SELECT @hours=AVG(years * 50 * 40)-- AS h -- hours = years * 50 * 40 (= years * weeks per year * hours per week)
    FROM (
        -- get number of years worked
        -- Select rows from a Table or View 'Employee' in schema 'Transportation_System'
        SELECT FuncID, datediff(year, @curr_date, Init_Date) as years
        FROM @employee
    ) AS tmp
    GROUP BY tmp.FuncID;

    RETURN @hours
END

GO
-- By station (only for ticketSellers)
CREATE FUNCTION dbo.Transportation_System.avg_hours_by_station
(
    @station locale,
    @curr_date smalldatetime -- impossible to get current date inside function, because scalar udf is deterministic
)
RETURNS SMALLINT
AS
BEGIN
    DECLARE @hours SMALLINT;

    -- Get employees from requested station to table variable
    INSERT INTO @employees
    SELECT *
    FROM Transportation_System.Employee
    WHERE FuncID IN
    (
        SELECT FuncID
        FROM Transportation_System.TicketSeller
        WHERE WorkStationAddress=@station
    );

    -- Select rows from a Table or View 'Employee' in schema 'SchemaName'
    SELECT @hours=AVG(years * 50 * 40)-- AS h -- hours = years * 50 * 40 (= years * weeks per year * hours per week)
    FROM (
        -- get number of years worked
        -- Select rows from a Table or View 'Employee' in schema 'Transportation_System'
        SELECT FuncID, datediff(year, @curr_date, Init_Date) as years
        FROM @employee
    ) AS tmp
    GROUP BY tmp.FuncID;

    RETURN @hours
END