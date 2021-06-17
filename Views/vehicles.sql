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