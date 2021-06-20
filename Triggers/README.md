## TODO implement the next UDFs

TODO list here the intended triggers (get from DDL file)

- TicketSeller
    - [ ] insert trigger asserting seller isn't on another station and isn't already a crewmember
<!-- - WorksOn
    - [ ] insert trigger asserting inserted funcIDs are in CrewMember [easy] -->
- Train
    - [ ] insert trigger asserting SerialNo isn't present at Tube nor Bus table
- Bus
    - [ ] insert trigger asserting SerialNo isn't present at Train nor Tube table
- Tube
    - [ ] insert trigger asserting SerialNo isn't present at Train nor Bus table
- StopPoint
    - insert trigger asserting:
        - [ ] stoppoints are sequencial; [easy]
        - [ ] stopNo and times are semantically consistent [hard]

### Extras

- Ticket
    - insert trigger(s) asserting:
        - [ ] departures and arrival stops are connectable (if depTripNo == arrTripNo then no asserting needed) [hard, but easy if used one specific udf]
        - [ ] purchaseDate precedes departure (DepartureStop.depTime) [easy]
        - ticket seller is either: [hard]
            - [ ] a crewmember of one of the connecting trips
            - [ ] an actual ticket at the departure station