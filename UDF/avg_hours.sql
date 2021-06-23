DROP FUNCTION IF EXISTS Transportation_System.avg_hours_by_employee_type;
DROP FUNCTION IF EXISTS Transportation_System.avg_hours_by_station;

-- Average employee hours

-- By employee type (CrewMember/TicketSeller/all)

GO

CREATE FUNCTION Transportation_System.avg_hours_by_employee_type
(
    @e_type VARCHAR(12),
    @curr_date smalldatetime -- impossible to get current date inside function, because scalar udf is deterministic
)
RETURNS int
AS
BEGIN
    DECLARE @hours int;

    -- Get employees requested (crewMember/ticketSeller/all) to table variable
    DECLARE @employees TABLE (
        FuncID char(15) NOT NULL,
        EName varchar(50),
        Birthday smalldatetime,
        Init_Date smalldatetime
        );
    
    IF @e_type = 'TicketSeller'
    BEGIN
        -- Get only CrewMembers
        INSERT INTO @employees
        SELECT * FROM Transportation_System.Employee
        WHERE FuncID IN (SELECT FuncID FROM Transportation_System.CrewMember);
    END
    ELSE 
        IF @e_type = 'CrewMember'
        BEGIN
            -- Get only TicketSellers
            INSERT INTO @employees
            SELECT * FROM Transportation_System.Employee
            WHERE FuncID IN (SELECT FuncID FROM Transportation_System.TicketSeller)
        END
        ELSE
            IF @e_type = 'All'
            BEGIN
                INSERT INTO @employees
                SELECT * FROM Transportation_System.Employee
            END
            -- else others (continue here)...
            ELSE
            BEGIN
                -- Error: Wrong @e_type;
                RETURN -1;
            END

    -- Select rows from a Table or View 'Employee' in schema 'SchemaName'
    SELECT @hours=AVG(weeks * 38) -- (aprox. = 40 * 50 / 52) Taking into account 2 weeks off per year
    FROM (
        -- get number of years worked
        -- Select rows from a Table or View 'Employee' in schema 'Transportation_System'
        SELECT FuncID, datediff(week, Init_Date, @curr_date) as weeks
        FROM @employees
    ) AS tmp
    GROUP BY tmp.FuncID;

    RETURN @hours
END

GO
-- By station (only for ticketSellers)
CREATE FUNCTION Transportation_System.avg_hours_by_station
(
    @station locale,
    @curr_date smalldatetime -- impossible to get current date inside function, because scalar udf is deterministic
)
RETURNS int
AS
BEGIN
    DECLARE @hours int;

	-- Get employees requested (crewMember/ticketSeller/all) to table variable
    DECLARE @employees TABLE (
        FuncID char(15) NOT NULL,
        EName varchar(50),
        Birthday smalldatetime,
        Init_Date smalldatetime
        );

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
    SELECT @hours=AVG(weeks * 38) -- (aprox. = 40 * 50 / 52) Taking into account 2 weeks off per year
    FROM (
        -- get number of weeks worked
        -- Select rows from a Table or View 'Employee' in schema 'Transportation_System'
        SELECT FuncID, datediff(week, Init_Date, @curr_date) as weeks
        FROM @employees
    ) AS tmp
    GROUP BY tmp.FuncID;

    RETURN @hours
END

GO

-- Call functions (use example)
SELECT Transportation_System.avg_hours_by_employee_type('TicketSeller', CONVERT(smalldatetime, GETDATE()))
	AS Avg_Total_TicketSeller_hours;
SELECT Transportation_System.avg_hours_by_station('Coimbra 448', CONVERT(smalldatetime, GETDATE()))
	AS Avg_Total_Coimbra_Station_TicketSellers_hours;

-- Test queries (for debugging) :
-- select * from Transportation_System.TicketSeller as t join Transportation_System.Employee as e on t.FuncID=e.FuncID where WorkStationAddress='Coimbra 448';

GO

DROP FUNCTION Transportation_System.avg_hours_by_employee_type;
DROP FUNCTION Transportation_System.avg_hours_by_station;