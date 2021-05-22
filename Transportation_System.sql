DROP TABLE IF EXISTS Transportation_System.StopPoint;
DROP TABLE IF EXISTS Transportation_System.WorksOn;
DROP TABLE IF EXISTS Transportation_System.Ticket;
DROP TABLE IF EXISTS Transportation_System.Trip;
DROP TABLE IF EXISTS Transportation_System.Tube;
DROP TABLE IF EXISTS Transportation_System.Bus;
DROP TABLE IF EXISTS Transportation_System.Train;
DROP TABLE IF EXISTS Transportation_System.PublicVehicle;
DROP TABLE IF EXISTS Transportation_System.TicketSeller;
DROP TABLE IF EXISTS Transportation_System.CrewMember;
DROP TABLE IF EXISTS Transportation_System.Passenger;
DROP TABLE IF EXISTS Transportation_System.Employee;
DROP TABLE IF EXISTS Transportation_System.Station;
GO

DROP SCHEMA IF EXISTS Transportation_System;

GO

CREATE SCHEMA Transportation_System;

GO

CREATE TABLE Transportation_System.Passenger (

	CC					int				NOT NULL,
	PName				varchar(50),
	Birthday			smalldatetime,
	PRIMARY KEY(CC)

);

CREATE TABLE Transportation_System.Employee (

	FuncID				char(15)		NOT NULL,
	EName				varchar(50),
	Birthday			smalldatetime,
	Init_Date			smalldatetime,
	PRIMARY KEY(FuncID)
);

CREATE TABLE Transportation_System.Station (
	Addr			varchar(50) NOT NULL,
	StatName		varchar(30),
	StatType		varchar(25),
	Descricao		varchar(75),
	PRIMARY KEY (Addr)
);

CREATE TABLE Transportation_System.TicketSeller (

	FuncID				char(15)	NOT NULL,
	WorkStationAddress	varchar(50)	NOT NULL,
	PRIMARY KEY(FuncID),
	-- Foreign keys
	-- FuncID
	FOREIGN KEY (FuncID) REFERENCES Transportation_System.Employee(FuncID),
	-- WorkStationAddress
	FOREIGN KEY (WorkStationAddress) REFERENCES Transportation_System.Station(Addr)
);

CREATE TABLE Transportation_System.PublicVehicle (
	SerialNo		int			NOT NULL,
	ModelID			char(15),
	Capacity		smallint,
	ServiceMode		varchar(40),
	PRIMARY KEY(SerialNo)
);

CREATE TABLE Transportation_System.Train (

	SerialNo		int		NOT NULL,
	PRIMARY KEY(SerialNo),
	FOREIGN KEY (SerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)

);

CREATE TABLE Transportation_System.Bus (

	SerialNo		int		NOT NULL,
	PRIMARY KEY(SerialNo),
	FOREIGN KEY (SerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)

);

CREATE TABLE Transportation_System.Tube (

	SerialNo		int		NOT NULL,
	PRIMARY KEY(SerialNo),
	FOREIGN KEY (SerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)

);

CREATE TABLE Transportation_System.Trip (

	TripNo				int		NOT NULL,
	VehicleSerialNo		int		NOT NULL,
	PRIMARY KEY(TripNo),
	-- Foreign keys
	-- VehicleSerialNo
	FOREIGN KEY (VehicleSerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)
);

CREATE TABLE Transportation_System.StopPoint (

	TripNo				int			NOT NULL,
	StopNo				smallint	NOT NULL,
	DepartureTime		smalldatetime,
	ArrivalTime			smalldatetime,
	StopAddress			varchar(50)	NOT NULL,
	PRIMARY KEY(TripNo, StopNo),
	--UNIQUE(TripNo),

	-- Foreign keys
	-- TripNo
	FOREIGN KEY (TripNo) REFERENCES Transportation_System.Trip(TripNo),
	-- StopAddress
	FOREIGN KEY (StopAddress) REFERENCES Transportation_System.Station(Addr)
);

CREATE TABLE Transportation_System.Ticket (

	TicketNo			int				NOT NULL,
	PurchaseDate		smalldatetime,
	TripNumber			int				NOT NULL,
	BuyersCC			int				NOT NULL,
	SellerID			char(15),
	DepartureTripNo		int				NOT NULL,
	DepartureStopNo		smallint		NOT NULL,
	ArrivalTripNo		int				NOT NULL,
	ArrivalStopNo		smallint		NOT NULL

	PRIMARY KEY(TicketNo),
	-- Foreign keys
	-- TripNumber
	FOREIGN KEY (TripNumber) REFERENCES Transportation_System.Trip(TripNo),
	-- BuyersCC
	FOREIGN KEY (BuyersCC) REFERENCES Transportation_System.Passenger(CC),
	-- SellerID
	FOREIGN KEY (SellerID) REFERENCES Transportation_System.TicketSeller(FuncID),
	-- Departure Trip Number
	FOREIGN KEY (DepartureTripNo, DepartureStopNo)	REFERENCES Transportation_System.StopPoint(TripNo, StopNo),
	-- Departure Stop Number
	--FOREIGN KEY (DepartureStopNo)	REFERENCES Transportation_System.StopPoint(StopNo),
	-- Arrival Trip Number
	FOREIGN KEY (ArrivalTripNo, ArrivalStopNo)	REFERENCES Transportation_System.StopPoint(TripNo, StopNo)
	-- Arrival Stop Number
	--FOREIGN KEY (ArrivalStopNo)	REFERENCES Transportation_System.StopPoint(StopNo)

);

CREATE TABLE Transportation_System.CrewMember (

	FuncID				char(15)	NOT NULL,
	PRIMARY KEY(FuncID),
	-- Foreign keys
	-- FuncID
	FOREIGN KEY (FuncID) REFERENCES Transportation_System.Employee(FuncID)
);

CREATE TABLE Transportation_System.WorksOn (

	FuncID				char(15)	NOT NULL,
	TripNo				int			NOT NULL,
	PRIMARY KEY(FuncID, TripNo),
	-- Foreign keys
	-- FuncID
	FOREIGN KEY (FuncID) REFERENCES Transportation_System.CrewMember(FuncID),
	-- TripNo
	FOREIGN KEY (TripNo) REFERENCES Transportation_System.Trip(TripNo)
);