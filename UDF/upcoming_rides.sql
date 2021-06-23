-- Related to upcoming rides


DROP FUNCTION IF EXISTS Transportation_System.getTrips;

-- From selected destination-arrival stops + within a timestamp

GO

CREATE FUNCTION Transportation_System.getTrips
(
    @arrival_location locale,
    @departure_location locale,
    @timestamp_left smalldatetime,
    @timestamp_right smalldatetime
)
RETURNS TABLE
AS
    RETURN (
        SELECT tmp1.TripNo AS TripNumber,
				tmp1.departureTime AS DepartureTime,
				tmp1.stopAddress AS DepartureStopAddress,
				tmp2.arrivalTime AS ArrivalTime,
				tmp2.stopAddress AS ArrivalStopAddress
        FROM (
            (
                SELECT * FROM Transportation_System.StopPoint 
                WHERE StopAddress=@departure_location
            ) AS tmp1
            JOIN
            (
                SELECT * FROM Transportation_System.StopPoint
                WHERE StopAddress=@arrival_location
            ) AS tmp2
            ON tmp1.TripNo=tmp2.TripNo
            -- When transits are here included, tripnumbers are not necessarily the same
        )
        WHERE tmp1.departureTime > @timestamp_left   -- assert trips are inside the required time-bounds
            AND tmp2.arrivalTime < @timestamp_right  -- assert trips are inside the required time-bounds
            AND tmp1.departureTime < tmp2.arrivalTime -- eliminate reverse trips
    )


GO

DROP FUNCTION IF EXISTS Transportation_System.getRoutes;

-- Same as above but enabling transit options

-- Description
-- get routes with or without transits, but with the requested midpoints (if any)
-- continue here... (add more if necessary)

GO
    
create function Transportation_System.getRoutes
(
    @arrival_location locale, @departure_location locale,
    @timestamp_left smalldatetime, @timestamp_right smalldatetime
)
returns @table table
(
    Trip1Number             int           not null,
	Trip2Number             int			  not null,
    DepartureStopAddress    locale		  not null,
    DepartureTime           smalldatetime not null,
	TransitStopAddress		locale		  not null,
    TransitDepartureTime    smalldatetime not null,
    ArrivalStopAddress      locale        not null,
    ArrivalTime             smalldatetime not null
)
as
begin

	-- for station of all stations (except first and last stop stations)
	--	check if there exist trips from A to stop AND from stop to B
	--  if so, add 
	
	DECLARE @statAddress locale;
	DECLARE @half_trips table
	(
		TripNumber			int				NOT NULL,
		StartAddress		locale			NOT NULL,
		StartDepartureTime	smalldatetime	NOT NULL,
		EndAddress			locale			NOT NULL,
		EndArrivalTime		smalldatetime	NOT NULL,
		FirstHalf			binary			NOT NULL
	);

    -- create cursor
	DECLARE C_stations	CURSOR /* w/ options? */
		FOR SELECT Addr
		FROM Transportation_System.Station
		WHERE Addr <> @departure_location
			AND Addr <> @arrival_location;

	OPEN C_stations;

	FETCH C_stations INTO @statAddress;

	-- select for initializing variables if needed...

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- check first half trips between startStop and statAddress within timestamp
		INSERT INTO @half_trips
		SELECT *, 1 AS FirstHalf -- all and a column FirstHalf with value zero
		FROM Transportation_System.getTrips
		(
			@departure_location, @statAddress,
			@timestamp_left, @timestamp_right
		);
		-- check last half trips between statAddress and endStop within timestamp
		INSERT INTO @half_trips
		SELECT *, 0 AS FirstHalf -- all and a column FirstHalf with value zero
		FROM Transportation_System.getTrips
		(
			@statAddress, @arrival_location,
			@timestamp_left, @timestamp_right
		);

		-- get trips combinations where fh.arrivalTime < lh.departureTime
		-- set based? ...
		-- cartesian product half_trips first X second halves, where first.startDepartureTime < second.endArrivalTime
		INSERT INTO @table
		SELECT fst.TripNumber AS Trip1Number, sd.TripNumber AS Trip2Number,
			fst.StartAddress AS DepartureStopAddress, fst.StartDepartureTime AS DepartureTime,
			@statAddress AS TransitStopAddress, sd.StartDepartureTime AS TransitDepartureTime,
			sd.EndAddress AS ArrivalStopAddress, sd.EndArrivalTime AS ArrivalTime
		FROM (
			SELECT *
			FROM @half_trips
			WHERE FirstHalf=1
		) AS fst,
		(
			SELECT *
			FROM @half_trips
			WHERE FirstHalf=0
		) AS sd
		WHERE fst.EndArrivalTime < sd.StartDepartureTime;
	END


    return;
end

GO

SELECT * FROM Transportation_System.getTrips('Coimbra 448', 'Aveiro 23910', '2021-06-02 21:03:24', '2021-06-04 21:03:24');

GO

SELECT * FROM Transportation_System.getRoutes('Aveiro 23910', 'Lisboa 2231',
						CONVERT(smalldatetime, '2021-06-01 21:03:24'), CONVERT(smalldatetime, ('2021-06-05 21:03:24')));

DROP FUNCTION Transportation_System.getTrips;
DROP FUNCTION Transportation_System.getRoutes;

-- Returns lists of trips connecting two stopAddresses
-- input: departureStopAddress, arrivalStopAddress (both of type locale)
-- output: 

-- implement... maybe cursors?