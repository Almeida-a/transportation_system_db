-- Utility functions


-- Check which type is the given vehicle
-- input: serial number
-- output: either "Tube", "Train", "Bus", "Neither", "Inexistent"

-- Create a new stored procedure called 'getVehicleType' in schema 'dbo.Transportation_System'
-- Drop the stored procedure if it already exists

DROP PROCEDURE IF EXISTS Transportation_System.getVehicleType;
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE Transportation_System.getVehicleType
    @serialNo int = -1,
    @type varchar(10) OUTPUT
AS
    -- body of the stored procedure
    SELECT @serialNo;

    --- Error handling
    -- @serialNo = -1? Raiserror 16
    IF @serialNo=-1
    BEGIN
        --RAISERROR(16, 'Proc getVehicleType: No vehicle specified');
        RETURN -1;
    END

    -- Exists in tube?
    IF (@serialNo IN (SELECT SerialNo FROM Transportation_System.Tube))
    BEGIN
        -- save in output variable
        SET @type = 'Tube';
        RETURN 0;
    END;
    -- Exists in bus?
    IF (@serialNo IN (SELECT SerialNo FROM Transportation_System.Bus))
    BEGIN
        -- save in output variable
        SET @type = 'Bus';
        RETURN 0;
    END;
    -- Exists in train?
    IF (@serialNo IN (SELECT SerialNo FROM Transportation_System.Train))
    BEGIN
        -- save in output variable
        SET @type = 'Train';
        RETURN 0;
    END;
    -- Exists at all?
    IF(@serialNo IN (SELECT SerialNo FROM Transportation_System.PublicVehicle))
    BEGIN
        SET @type = 'Inexistent';
        RETURN 0;
    END
    ELSE
    BEGIN
        SET @type = 'Neither';
        RETURN 0;
    END
    
GO
-- example to execute the stored procedure we just created
DECLARE @type varchar(10);
EXECUTE Transportation_System.getVehicleType 278934, @type;
GO

DROP PROCEDURE Transportation_System.getVehicleType;


-- ...