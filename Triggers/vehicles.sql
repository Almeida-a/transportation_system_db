-- Train vehicle is not simultaneously any other vehicle type
CREATE TRIGGER onlyTrain ON Transportation_System.Train
AFTER INSERT, UPDATE
AS
--BEGIN
    -- assert inserted.serialNo not exists on tube nor in bus
    IF (EXISTS(
        SELECT tube.SerialNo, bus.SerialNo
        FROM Transportation_System.Tube AS tube, Transportation_System.Bus AS bus
        WHERE tube.SerialNo = (SELECT SerialNo FROM inserted)
            OR bus.SerialNo = (SELECT SerialNo FROM inserted)
        ))
    BEGIN
		PRINT 'Not allowed to register vehicle as train: already belongs to other type';
        ROLLBACK TRAN;
    END

--END
GO
ENABLE TRIGGER onlyTrain ON Transportation_System.Train
GO

-- Tube vehicle is not simultaneously any other vehicle type
CREATE TRIGGER onlyTube ON Transportation_System.Tube
AFTER INSERT, UPDATE
AS
--BEGIN
    -- assert inserted.serialNo not exists on train nor in bus
    IF (EXISTS(
        SELECT train.SerialNo, bus.SerialNo
        FROM Transportation_System.Train AS train, Transportation_System.Bus AS bus
        WHERE train.SerialNo = (SELECT SerialNo FROM inserted)
            OR bus.SerialNo = (SELECT SerialNo FROM inserted)
        ))
    BEGIN
		PRINT 'Not allowed to register vehicle as subway: already belongs to other type';
        ROLLBACK TRAN;
    END

--END
GO
ENABLE TRIGGER onlyTube ON Transportation_System.Tube
GO

-- Bus vehicle is not simultaneously any other vehicle type
CREATE TRIGGER onlyBus ON Transportation_System.Bus
AFTER INSERT, UPDATE
AS
--BEGIN
    -- assert inserted.serialNo not exists on tube nor in train
    IF (EXISTS(
        SELECT tube.SerialNo, train.SerialNo
        FROM Transportation_System.Tube AS tube, Transportation_System.Train AS train
        WHERE tube.SerialNo = (SELECT SerialNo FROM inserted)
            OR train.SerialNo = (SELECT SerialNo FROM inserted)
        ))
    BEGIN
		PRINT 'Not allowed to register vehicle as bus: already belongs to other type';
        ROLLBACK TRAN;
    END

--END
GO
ENABLE TRIGGER onlyBus ON Transportation_System.Bus;
GO

-- Test inserts
INSERT INTO Transportation_System.PublicVehicle VALUES (12345, null, null, null);
INSERT INTO Transportation_System.Train VALUES (12345);
INSERT INTO Transportation_System.Bus VALUES (12345); -- transation ended in the trigger

-- Disable triggers...
GO
DISABLE TRIGGER onlyTrain ON Transportation_System.Train;
DISABLE TRIGGER onlyTube ON Transportation_System.Tube;
DISABLE TRIGGER onlyBus ON Transportation_System.Bus;


-- Drop triggers...
DROP TRIGGER IF EXISTS Transportation_System.onlyTrain;
DROP TRIGGER IF EXISTS Transportation_System.onlyTube;
DROP TRIGGER IF EXISTS Transportation_System.onlyBus;