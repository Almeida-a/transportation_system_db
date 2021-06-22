-- Vehicles by:

-- Number of trips
/*
    Pseudo-code:
    create view
        select serialno, modelId, capacity, tripQtt as count(serialNo)
        from vehicle join trips on serialno
        group by serialno, modelId, capacity
        order by tripQtt
*/
-- Create a new view called 'TripQuant' in schema 'Transportation_System'
-- Drop the view if it already exists
IF EXISTS (
SELECT *
    FROM sys.views
    JOIN sys.schemas
    ON sys.views.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'Transportation_System'
    AND sys.views.name = N'TripQuant'
)
DROP VIEW Transportation_System.TripQuant
GO
-- Create the view in the specified schema
CREATE VIEW Transportation_System.TripQuant
AS
    -- body of the view
    SELECT SerialNo, ModelID, Capacity, COUNT(TripNo) AS TripQtt
    FROM Transportation_System.PublicVehicle AS pv
	-- left outer -> Includes vehicles without trip => tripQtt = 0
        LEFT OUTER JOIN Transportation_System.Trip AS t ON pv.SerialNo=t.VehicleSerialNo
    GROUP BY SerialNo, ModelID, Capacity;
GO

-- Test query
select * from Transportation_System.TripQuant;
-- drop (it interferes with other batches if this is not run - not critical)
DROP VIEW Transportation_System.TripQuant;


-- Number of stops
/*
    Pseudo-code
    create view
        select serialno, modelId, capacity, stopQtt as sum(stopsNo)
        from vehicle join (
            select tripNumber, stopsNo as count(tripNumber)
            from stoppoint
            group by tripNumber
            order by stopsNo
        ) as stops on vehicle.tripNo=stops.tripNo
        group by serialno, modelId, capacity
        order by desc stopQtt
*/


-- Vehicles without a subtype
-- Create a new view called 'AbstractVehicles' in schema 'Transportation_System'
-- Drop the view if it already exists
IF EXISTS (
SELECT *
    FROM sys.views
    JOIN sys.schemas
    ON sys.views.schema_id = sys.schemas.schema_id
    WHERE sys.schemas.name = N'Transportation_System'
    AND sys.views.name = N'AbstractVehicles'
)
DROP VIEW Transportation_System.AbstractVehicles
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

select * from Transportation_System.AbstractVehicles;

DROP VIEW Transportation_System.AbstractVehicles;