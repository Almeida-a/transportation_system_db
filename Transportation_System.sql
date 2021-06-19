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

-- TODO Create type for FuncID [w/ drop if exists]
-- ...
-- TODO Create type for address [w/ drop if exists]
drop type if exists locale;
create type locale from varchar(50);

CREATE TABLE Transportation_System.Passenger (

	CC					int				NOT NULL,
	PName				varchar(50),
	Birthday			smalldatetime,
	PRIMARY KEY(CC)

);
-- 
insert into Transportation_System.Passenger (cc, pname, birthday) values (120952978, 'Padgett Mattheissen', '1928-06-03 03:03:24');
insert into Transportation_System.Passenger (cc, pname, birthday) values (118627741, 'Tamarah Erwin', '2015-05-24 06:08:38');
insert into Transportation_System.Passenger (cc, pname, birthday) values (138537300, 'Tabbie Oswell', '1965-02-10 13:49:42');
insert into Transportation_System.Passenger (cc, pname, birthday) values (170623364, 'Lynnet Ranken', '1987-03-14 12:43:09');
insert into Transportation_System.Passenger (cc, pname, birthday) values (152408280, 'Man Wignall', '1965-09-16 13:34:09');
insert into Transportation_System.Passenger (cc, pname, birthday) values (122580157, 'Robby Jahnke', '1938-10-11 03:06:40');
insert into Transportation_System.Passenger (cc, pname, birthday) values (159727588, 'Ally Lucks', '1977-07-30 13:43:17');
insert into Transportation_System.Passenger (cc, pname, birthday) values (180745707, 'Emilee Pochon', '2013-05-03 02:22:38');
insert into Transportation_System.Passenger (cc, pname, birthday) values (135672655, 'Prince Jeynes', '1964-03-25 22:58:09');
insert into Transportation_System.Passenger (cc, pname, birthday) values (168913787, 'Riccardo Roulston', '1956-03-03 12:02:28');
insert into Transportation_System.Passenger (cc, pname, birthday) values (190006157, 'Margeaux MacLleese', '2010-05-22 23:40:05');
insert into Transportation_System.Passenger (cc, pname, birthday) values (143613238, 'Alexi Points', null);

CREATE TABLE Transportation_System.Employee (

	FuncID				char(15)		NOT NULL,
	EName				varchar(50),
	Birthday			smalldatetime,
	Init_Date			smalldatetime,
	PRIMARY KEY(FuncID)
);
-- 
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('987705747291859', 'Luci Schmidt', '1940-10-19 23:02:39', '2012-01-22 17:13:23');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('978194357492412', 'Randee Webling', '1947-10-13 16:24:50', '2018-06-26 23:08:55');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('011186694572846', 'Hollyanne Shaplin', '1998-09-14 09:02:33', '2005-08-10 20:53:43');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('569415054008884', 'Erek Burborough', '1964-10-24 13:49:07', '2008-07-11 22:53:14');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('603989236290146', 'Aron Sarjent', '1955-03-14 23:48:37', '2002-07-07 01:21:05');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('626758722355364', 'Field Hasnney', '1972-09-20 23:38:15', '1990-12-23 14:38:14');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('504824182452584', 'Gian Fotheringham', '1948-03-03 13:02:05', '2005-05-12 16:52:08');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('959001345886574', 'Vince Presshaugh', '1946-01-07 01:42:09', '2016-10-20 05:53:10');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('724568375639863', 'Corrine Cottu', '1978-10-10 05:31:44', '2008-01-10 11:48:25');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('288291341837896', 'Harald Hort', '1974-04-27 06:52:01', '2006-06-20 12:17:00');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('554765825410004', 'Meggy Lindemann', '1965-01-01 23:49:41', '2016-08-02 20:07:54');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('884477435311132', 'Clyde Wallentin', '1952-12-28 07:48:08', '1988-09-19 17:25:49');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('627767374680712', 'De witt Mallinar', '1967-10-22 10:56:40', '1998-04-21 17:41:20');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('069000585623902', 'Delinda Stickley', '1981-07-25 02:51:06', '2015-02-17 09:58:04');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('149154169060096', 'Pat Dunnet', '1959-01-03 16:46:51', '1999-02-22 19:39:34');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('329897717060894', 'Purcell Gravy', '1997-05-30 01:07:08', '1988-09-09 01:42:28');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('633788539874044', 'Ransom Bricklebank', '1964-04-30 06:38:56', '2000-06-07 08:01:37');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('330119670658310', 'Sheilakathryn Batho', '1989-01-24 13:19:17', '2003-05-09 01:58:28');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('160201670208216', 'Melba Marcoolyn', '1959-07-26 22:07:49', '2014-05-23 19:17:29');
insert into Transportation_System.Employee (FuncID, EName, Birthday, Init_Date) values ('554744942004697', 'Anne-corinne Sinyard', '1994-04-12 19:04:06', '2012-03-07 13:36:31');

CREATE TABLE Transportation_System.Station (
	Addr			locale	 NOT NULL,
	StatName		varchar(30),
	StatType		varchar(25),
	Descricao		varchar(75),
	UNIQUE(StatName),
	PRIMARY KEY (Addr)
);
-- 
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Aveiro', 'Aveiro 23910', 'Primary', 'impotent enthrall doughnut black ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Quintans', 'Quintans 30574', 'Primary', 'eights wishing mourns hush''s ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Oia', 'Oia 73280', 'Secondary', 'foreigners roars mortuaries facetious ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Oliveira do Bairro', 'Oliveira do Bairro 50432', 'Primary', 'loping rotor evolve corruptest ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Paraimo-Sangalhos', 'Paraimo-Sangalhos 45696', 'Secondary', 'elaborated cannon cordial''s essential ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Mogofores', 'Mogofores 27691', 'Secondary', 'vision sweating routine''s pecked ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Curia', 'Curia 39249', 'Primary', 'dynamo mediate landing direr ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Aguim', 'Aguim 20678', 'Primary', 'birth withstands research''s disfavor''s ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Mealhada', 'Mealhada 55113', 'Secondary', 'meet''s watchdogs slain mushes ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Pampilhosa', 'Pampilhosa 42795', 'Primary', 'timid celibate''s plumb bites ');
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Souselas', 'Souselas 44968', 'Secondary', null);
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Vilela-Fornos', 'Vilela-Fornos 968', 'Secondary', null);
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Ademia', 'Ademia 4496', 'Secondary', null);
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Coimbra-B', 'Coimbra-B 4968', 'Primary', null);
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Coimbra', 'Coimbra 448', 'Primary', null);
insert into Transportation_System.Station (StatName, Addr, StatType, Descricao) values ('Lisboa', 'Lisboa 2231', 'Primary', null);


CREATE TABLE Transportation_System.TicketSeller (

	FuncID				char(15)	NOT NULL,
	WorkStationAddress	locale		NOT NULL,
	PRIMARY KEY(FuncID),
	-- Foreign keys
	-- FuncID
	FOREIGN KEY (FuncID) REFERENCES Transportation_System.Employee(FuncID),
	-- WorkStationAddress
	FOREIGN KEY (WorkStationAddress) REFERENCES Transportation_System.Station(Addr)
);
-- TODO insert trigger asserting seller isn't on another station and isn't already a crewmember
-- Aveiro employees
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (987705747291859, 'Aveiro 23910');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (978194357492412, 'Aveiro 23910');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (011186694572846, 'Aveiro 23910');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (569415054008884, 'Aveiro 23910');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (603989236290146, 'Aveiro 23910');
-- Coimbra employees
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (724568375639863, 'Coimbra 448');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (288291341837896, 'Coimbra 448');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (554765825410004, 'Coimbra 448');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (884477435311132, 'Coimbra 448');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (627767374680712, 'Coimbra 448');
-- Coimbra-B employees
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (330119670658310, 'Coimbra-B 4968');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (160201670208216, 'Coimbra-B 4968');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (554744942004697, 'Coimbra-B 4968');
-- Lisboa employees
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (069000585623902, 'Lisboa 2231');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (149154169060096, 'Lisboa 2231');
insert into Transportation_System.TicketSeller(FuncID, WorkStationAddress) values (329897717060894, 'Lisboa 2231');

CREATE TABLE Transportation_System.CrewMember (

	FuncID				char(15)	NOT NULL,
	PRIMARY KEY(FuncID),
	-- Foreign keys
	-- FuncID
	FOREIGN KEY (FuncID) REFERENCES Transportation_System.Employee(FuncID)
);
insert into Transportation_System.TicketSeller(FuncID) values (626758722355364);
insert into Transportation_System.TicketSeller(FuncID) values (504824182452584);
insert into Transportation_System.TicketSeller(FuncID) values (959001345886574);

CREATE TABLE Transportation_System.PublicVehicle (
	SerialNo		int			NOT NULL check(SerialNo > 0),
	ModelID			char(17),
	Capacity		smallint check(Capacity>0),
	ServiceMode		varchar(40),
	PRIMARY KEY(SerialNo)
);
--
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (722161, null, 147, 'Inter-Cidades');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (214191, 'JA32U2FU5EU923754', 89, 'Inter-Cidades');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (365238, 'WA1DMAFP4FA092257', 250, 'Urbano');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (455238, '3D4PH5FVXAT843797', 94, 'Expresso');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (194217, '5NPEB4AC0BH018620', 76, 'Inter-Cidades');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (298300, '1G6AY5SXXE0294540', 262, 'Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (120363, 'KMHFH4JGXEA241289', 289, 'Alfa-Pendular');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (17849, 'JA32U2FU8FU448621', 268, 'Inter-Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (697570, 'JM1NC2JF8F0042596', 233, 'Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (318281, 'WAUWMAFC2EN049861', 52, 'Urbano');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (297856, '1G6DH8E54D0497477', 151, null);
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (246234, 'JN8AZ2KR9CT732376', 113, 'Internacional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (272663, '3D73M4CL7BG640001', 118, 'Expresso');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (659418, 'SCFEFBBC7AG967559', 279, 'Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (278934, 'WAUBF78E78A033886', 226, 'Alfa-Pendular');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (481344, 'WAUFEAFM2DA228798', 156, null);
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (939581, '1G6AK5SXXD0724809', 125, 'Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (859507, '3N1CN7AP0EL085857', 187, 'Alfa-Pendular');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (350832, '4T1BK1EB3EU152756', 244, 'Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (682545, '5BZAF0AA9EN744717', 72, 'Alfa-Pendular');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (541273, 'YV4852CZ4A1296594', 268, 'Inter-Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (500914, '1FAHP2DW8BG557795', 231, 'Expresso');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (550744, '3VW1K7AJ7DM478401', 260, 'Regional');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (310694, 'SCFKDCEP7EG796475', 40, 'Expresso');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (574213, 'YV4952CF0E1983832', 229, 'Expresso');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (89883, '1FMEU7FE7AU716970', 41, 'Urbano');
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (103253, '2C3CDYCJ1DH733135', 230, null);
insert into Transportation_System.PublicVehicle (SerialNo, ModelID, Capacity, ServiceMode) values (514919, '5UXFH0C54BL479646', 199, 'Regional');


CREATE TABLE Transportation_System.Train (

	SerialNo		int		NOT NULL,
	PRIMARY KEY(SerialNo),
	FOREIGN KEY (SerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)

);
-- TODO insert trigger asserting SerialNo isn't present at Tube nor Bus table
insert into Transportation_System.Train (SerialNo) values (722161);
insert into Transportation_System.Train (SerialNo) values (214191);
insert into Transportation_System.Train (SerialNo) values (365238);
insert into Transportation_System.Train (SerialNo) values (194217);
insert into Transportation_System.Train (SerialNo) values (298300);
insert into Transportation_System.Train (SerialNo) values (120363);
insert into Transportation_System.Train (SerialNo) values (17849);
insert into Transportation_System.Train (SerialNo) values (697570);
insert into Transportation_System.Train (SerialNo) values (318281);
insert into Transportation_System.Train (SerialNo) values (659418);
insert into Transportation_System.Train (SerialNo) values (278934);
insert into Transportation_System.Train (SerialNo) values (939581);
insert into Transportation_System.Train (SerialNo) values (859507);
insert into Transportation_System.Train (SerialNo) values (350832);
insert into Transportation_System.Train (SerialNo) values (682545);
insert into Transportation_System.Train (SerialNo) values (541273);
insert into Transportation_System.Train (SerialNo) values (550744);
insert into Transportation_System.Train (SerialNo) values (89883);
insert into Transportation_System.Train (SerialNo) values (514919);


CREATE TABLE Transportation_System.Bus (

	SerialNo		int		NOT NULL,
	PRIMARY KEY(SerialNo),
	FOREIGN KEY (SerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)

);
-- TODO insert trigger asserting SerialNo isn't present at Train nor Tube table
insert into Transportation_System.Bus(SerialNo) values (455238);
insert into Transportation_System.Bus(SerialNo) values (272663);
insert into Transportation_System.Bus(SerialNo) values (246234);
insert into Transportation_System.Bus(SerialNo) values (500914);
insert into Transportation_System.Bus(SerialNo) values (310694);
insert into Transportation_System.Bus(SerialNo) values (574213);
insert into Transportation_System.Bus(SerialNo) values (103253);
--insert into Transportation_System.Bus(SerialNo) values (); more, if needed

CREATE TABLE Transportation_System.Tube (

	SerialNo		int		NOT NULL,
	PRIMARY KEY(SerialNo),
	FOREIGN KEY (SerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)

);
-- TODO insert trigger asserting SerialNo isn't present at Train nor Bus table
insert into Transportation_System.Tube(SerialNo) values (297856);
insert into Transportation_System.Tube(SerialNo) values (481344);


CREATE TABLE Transportation_System.Trip (

	TripNo				int		NOT NULL,
	VehicleSerialNo		int		NOT NULL,
	PRIMARY KEY(TripNo),
	-- Foreign keys
	-- VehicleSerialNo
	FOREIGN KEY (VehicleSerialNo) REFERENCES Transportation_System.PublicVehicle(SerialNo)
);
-- Trips with random trains
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (928688, 278934);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (266516, 297856);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (304356, 214191);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (213571, 859507);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (303133, 365238);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (898517, 350832);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (489183, 455238);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (38089, 272663);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (830079, 939581);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (560954, 722161);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (819781, 659418);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (551351, 350832);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (674417, 939581);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (206821, 722161);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (464837, 278934);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (444867, 297856);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (981008, 722161);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (290276, 481344);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (873127, 120363); -- Alfa
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (673698, 455238);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (747193, 246234);
insert into Transportation_System.Trip (TripNo, VehicleSerialNo) values (990651, 697570);

CREATE TABLE Transportation_System.StopPoint (

	TripNo				int			NOT NULL,
	StopNo				smallint	NOT NULL,
	DepartureTime		smalldatetime,
	ArrivalTime			smalldatetime check(ArrivalTime <= DepartureTime), -- goal it to assert depTime isn't before arrival time
	StopAddress			locale		NOT NULL,
	PRIMARY KEY(TripNo, StopNo),

	-- Foreign keys
	-- TripNo
	FOREIGN KEY (TripNo) REFERENCES Transportation_System.Trip(TripNo),
	-- StopAddress
	FOREIGN KEY (StopAddress) REFERENCES Transportation_System.Station(Addr)
);
-- TODO insert trigger asserting:
--		stoppoints are sequencial; [easy]
--		stopNo and times are semantically consistent [hard]
-- Note:  if depTrip==arrTrip then it's assumed no scale is made
-- Viagem de um comboio regional de aveiro a coimbra
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 1, '2021-06-03 21:03:24', '2021-06-03 21:03:24', 'Aveiro 23910');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 2, '2021-06-03 21:08:24', '2021-06-03 21:09:24', 'Quintans 30574');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 3, '2021-06-03 21:13:24', '2021-06-03 21:14:24', 'Oia 73280');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 4, '2021-06-03 21:19:24', '2021-06-03 21:20:24', 'Oliveira do Bairro 50432');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 5, '2021-06-03 21:24:24', '2021-06-03 21:25:24', 'Paraimo-Sangalhos 45696');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 6, '2021-06-03 21:29:24', '2021-06-03 21:30:24', 'Mogofores 27691');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 7, '2021-06-03 21:34:24', '2021-06-03 21:35:24', 'Curia 39249');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 8, '2021-06-03 21:39:24', '2021-06-03 21:40:24', 'Aguim 20678');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 9, '2021-06-03 21:44:24', '2021-06-03 21:45:24', 'Mealhada 55113');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 10, '2021-06-03 21:49:24', '2021-06-03 21:50:24', 'Pampilhosa 42795');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 11, '2021-06-03 21:54:24', '2021-06-03 21:56:24', 'Souselas 44968');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 12, '2021-06-03 21:59:24', '2021-06-03 22:00:24', 'Vilela-Fornos 968');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 13, '2021-06-03 22:04:24', '2021-06-03 22:05:24', 'Ademia 4496');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 14, '2021-06-03 22:09:24', '2021-06-03 22:10:24', 'Coimbra-B 4968');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (990651, 15, '2021-06-03 22:14:24', '2021-06-03 22:14:24', 'Coimbra 448');
-- Viagem de um comboio inter-cidades de aveiro a coimbra
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (560954, 1, '2021-06-03 21:03:24', '2021-06-03 21:03:24', 'Aveiro 23910');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (560954, 2, '2021-06-03 21:34:24', '2021-06-03 21:34:24', 'Coimbra 448');
-- Viagem de um comboio alfa-pendular de aveiro a lisboa
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (120363, 1, '2021-06-03 22:14:24', '2021-06-03 22:14:24', 'Aveiro 23910');
insert into Transportation_System.StopPoint (TripNo, StopNo, DepartureTime, ArrivalTime, StopAddress) values (120363, 2, '2021-06-04 00:14:24', '2021-06-03 24:14:24', 'Lisboa 2231');

CREATE TABLE Transportation_System.Ticket (

	TicketNo			int				NOT NULL,
	PurchaseDate		smalldatetime,
	BuyersCC			int				NOT NULL,
	SellerID			char(15),
	DepartureTripNo		int				NOT NULL,
	DepartureStopNo		smallint		NOT NULL,
	ArrivalTripNo		int				NOT NULL,
	ArrivalStopNo		smallint		NOT NULL,

	PRIMARY KEY(TicketNo),
	-- Foreign keys
	-- BuyersCC
	FOREIGN KEY (BuyersCC) REFERENCES Transportation_System.Passenger(CC),
	-- SellerID
	FOREIGN KEY (SellerID) REFERENCES Transportation_System.TicketSeller(FuncID),
	-- Departure Trip Number
	FOREIGN KEY (DepartureTripNo, DepartureStopNo)	REFERENCES Transportation_System.StopPoint(TripNo, StopNo),
	-- Arrival Trip Number
	FOREIGN KEY (ArrivalTripNo, ArrivalStopNo)	REFERENCES Transportation_System.StopPoint(TripNo, StopNo)

);
-- TODO insert trigger asserting:
--		departures and arrival stops are connectable (if depTripNo == arrTripNo then no asserting needed) [hard]
--		purchaseDate precedes departure (DepartureStop.depTime) [easy]
--		ticket seller is either: [hard]
--			a crewmember of one of the connecting trips
--			an actual ticket at the departure station
--- Based upon the above inserted trip(s):
-- Ticket Aveiro->Coimbra (R)
insert into Transportation_System.Ticket (TicketNo, PurchaseDate, BuyersCC, SellerID, DepartureTripNo, DepartureStopNo, ArrivalTripNo, ArrivalStopNo)
	values (23, '2021-06-03 21:00:24', 120952978, '987705747291859', 990651, 1, 990651, 15);
-- Ticket Oia->Souselas (R)
insert into Transportation_System.Ticket (TicketNo, PurchaseDate, BuyersCC, SellerID, DepartureTripNo, DepartureStopNo, ArrivalTripNo, ArrivalStopNo)
	values (56, '2021-06-03 21:05:24', 138537300, null, 990651, 3, 990651, 11);
-- 2 Tickets Aveiro-->Lisboa (AP)
insert into Transportation_System.Ticket (TicketNo, PurchaseDate, BuyersCC, SellerID, DepartureTripNo, DepartureStopNo, ArrivalTripNo, ArrivalStopNo)
	values (59, '2021-06-03 22:00:24', 138537300, '987705747291859', 120363, 1, 120363, 2);
insert into Transportation_System.Ticket (TicketNo, PurchaseDate, BuyersCC, SellerID, DepartureTripNo, DepartureStopNo, ArrivalTripNo, ArrivalStopNo)
	values (60, '2021-06-03 22:02:24', 170623364, '987705747291859', 120363, 1, 120363, 2);
-- Ticket Aveiro->Coimbra (IC)
insert into Transportation_System.Ticket (TicketNo, PurchaseDate, BuyersCC, SellerID, DepartureTripNo, DepartureStopNo, ArrivalTripNo, ArrivalStopNo)
	values (89, '2021-06-03 20:54:24', 152408280, '978194357492412', 560954, 1, 560954, 2);

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
-- TODO insert trigger asserting inserted funcIDs are in CrewMember
insert into Transportation_System.WorksOn(FuncID, TripNo) values (626758722355364, 990651);
insert into Transportation_System.WorksOn(FuncID, TripNo) values (504824182452584, 560954);
insert into Transportation_System.WorksOn(FuncID, TripNo) values (959001345886574, 120363);