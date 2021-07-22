-- Vehicles by:

-- Number of trips
-- Create a new view called 'TripQuant' in schema 'Transportation_System'
-- Drop the view if it already exists
DROP VIEW IF EXISTS Transportation_System.TripQuant;
GO
-- Create the view in the specified schema
CREATE VIEW Transportation_System.TripQuant
AS
    -- body of the view
    SELECT SerialNo, ModelID, Capacity, COUNT(TripNo) AS TripQtt
    FROM Transportation_System.PublicVehicle AS pv
	-- why outer -> Include vehicles without trip => tripQtt = 0
        LEFT OUTER JOIN Transportation_System.Trip AS t ON pv.SerialNo=t.VehicleSerialNo
    GROUP BY SerialNo, ModelID, Capacity;
GO


-- Number of stops
-- Create a new view called 'NumberOfStops' in schema 'Transportation_System'
-- Drop the view if it already exists
DROP VIEW IF EXISTS Transportation_System.NumberOfStops;
GO
-- Create the view in the specified schema
CREATE VIEW Transportation_System.NumberOfStops
AS
    -- body of the view
    SELECT TripNo, COUNT(*) AS Stops
    FROM Transportation_System.StopPoint
    GROUP BY TripNo;
GO


-- Vehicles without a subtype
-- Create a new view called 'AbstractVehicles' in schema 'Transportation_System'
-- Drop the view if it already exists
DROP VIEW IF EXISTS Transportation_System.AbstractVehicles
GO
-- Create the view in the specified schema
CREATE VIEW Transportation_System.AbstractVehicles
AS
    -- body of the view
    SELECT *
    FROM Transportation_System.PublicVehicle
    WHERE SerialNo NOT IN (
        -- Bus
        SELECT SerialNo FROM Transportation_System.Bus
        UNION
        -- Train
        SELECT SerialNo FROM Transportation_System.Train
        UNION 
        -- Tube
        SELECT SerialNo FROM Transportation_System.Tube
    )
GO

-- Test TripQuant
select * from Transportation_System.TripQuant;
-- drop (it interferes with other batches if this is not run - not critical)
DROP VIEW Transportation_System.TripQuant;

-- Test NumberOfStops
select * from Transportation_System.NumberOfStops;
-- drop
DROP VIEW Transportation_System.NumberOfStops;

-- Test AbstractVehicles
INSERT INTO Transportation_System.PublicVehicle VALUES (1234, null, null, null);
select * from Transportation_System.AbstractVehicles;
DELETE FROM Transportation_System.PublicVehicle WHERE SerialNo=1234;
-- drop
DROP VIEW Transportation_System.AbstractVehicles;