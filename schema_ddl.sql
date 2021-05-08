CREATE SCHEMA Transportation_System

go

CREATE TABLE Transportation_System.Station (
	Addr			varchar(50) NOT NULL,
	StatName		varchar(30),
	StatType		varchar(25),
	Descricao		varchar(75),
	PRIMARY KEY (Addr)
);