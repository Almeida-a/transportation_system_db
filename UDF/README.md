## TODO implement the next UDFs

- [ ] Upcoming rides (upcoming_rides.sql)
    - [ ] From selected destination and arrival stops and within any timestamp (e.g. between tomorrow and the next 3 days after) Inline Table Valued UDF
        - [ ] With any selected mid stops + featuring transit -> Multi-Statement Table Valued UDF
- [ ] Bookings (bookings.sql) -> Multi-Statement Table Valued UDF
    - [ ] By given trip [and given vehicle type]
        - [ ] For each stop-point, how many people booked to leave or enter at the vehicle
- [ ] Average employee number of hours (avg_hours.sql) -> Scalar UDF
    - [ ] By employee type
    - [ ] By station (only for ticketsellers)