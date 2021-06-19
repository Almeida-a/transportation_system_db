-- Related to upcoming rides


-- From selected destination-arrival stops + within a timestamp
/*
    Pseudo-code:
    create function dbo.Transportation_Systems.getTrips
    (
        @arrival_location locale,
        @departure_location locale,
        @timestamp_left smalldatetime,
        @timestamp_right smalldatetime
    )
    returns table
    as
    return (
        select tripNumber, tmp1.departureTime, tmp1.stopAddress
            tmp2.arrivalTime, tmp2.stopAddress
        from (
            (
                select * from stoppoint 
                where StopAddress="X departure location"
            ) as tmp1
            JOIN
            (
                select * from stoppoint
                where StopAddress="Y arrival location"
            ) as tmp2
            ON tmp1.tripNumber=tmp2.tripNumber
            -- When transits are here included, tripnumbers are not necessarily the same
        )
        where tmp1.departureTime.isAfter(@timestamp_left)   -- assert trips are inside the required time-bounds
            and tmp2.arrivalTime.isBefore(@timestamp_right) -- assert trips are inside the required time-bounds
            and tmp1.departureTime.isBefore(tmp2.arrivalTime) -- eliminate reverse trips
    )
*/

-- Same as above + transit + midpoints
/*
    -- Description
    -- get routes with or without transits, but with the requested midpoints (if any)
    -- continue here... (add more if necessary)
    
    create function dbo.Transportation_System.getRoutes
    (
        @arrival_location locale, @departure_location locale,
        @timestamp_left smalldatetime, @timestamp_right smalldatetime
        -- midpoints (1 for now)
        @midpoint_stop locale
    )
    returns @table table
    (
        TripNumber              int         not null,
        DepartureStopAddress    locale          null,
        DepartureTime           smalldatetime   null,
        ArrivalStopAddress      locale          null,
        ArrivalTime             smalldatetime   null
    )
    as
    begin
        -- if connectedRoutes(dep, arr) (w/ midpoint(s)) returns empty, return empty table
        declare #tmp;
        set #tmp = select dbo.Transportation_System.getTrips(
            @arrival_location, @departure_location, @timestamp_left, @timestamp_right
        ) as tmp
        where exists(
            select * from stoppoint
            where tripNumber==tmp.tripNumber and stopAddress=@midpoint_stop
        )

        if not exists(#tmp)
        begin
            return;
        end
        
        else-- getTrips(...) returns non-empty:
            -- insert return values
            insert (select * from #tmp) on @table;

        -- return transit options
        -- ...

        return;
    end
*/