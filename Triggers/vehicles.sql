-- Train vehicle is not simultaneously any other vehicle type
CREATE TRIGGER onlyTrain ON Transportation_System.Train
AFTER INSERT, UPDATE
AS
--BEGIN
    -- assert inserted.serialNo not exists on tube nor in bus
    IF (EXISTS(
        SELECT SerialNo
        FROM Transportation_System.Tube AS tube, Transportation_System.Bus AS bus
        WHERE tube.SerialNo = (SELECT SerialNo FROM inserted)
            OR bus.SerialNo = (SELECT SerialNo FROM inserted)
        ))
    BEGIN
		PRINT 'Error: Inserted vehicle is already another sub-type. Cannot have more than one...';
        ROLLBACK TRAN;
    END

--END
GO
ENABLE TRIGGER onlyTrain ON dbo.Transportation_System.Train
GO

-- Tube vehicle is not simultaneously any other vehicle type
CREATE TRIGGER onlyTube ON dbo.Transportation_System.Tube
AFTER INSERT, UPDATE
AS
--BEGIN
    -- assert inserted.serialNo not exists on train nor in bus
    IF (EXISTS(
        SELECT SerialNo
        FROM Transportation_System.Train AS train, Transportation_System.Bus AS bus
        WHERE train.SerialNo = (SELECT SerialNo FROM inserted)
            OR bus.SerialNo = (SELECT SerialNo FROM inserted)
        ))
    BEGIN
        ROLLBACK TRAN;
    END

--END
GO
ENABLE TRIGGER onlyTube ON dbo.Transportation_System.Tube
GO

-- Bus vehicle is not simultaneously any other vehicle type
CREATE TRIGGER onlyBus ON dbo.Transportation_System.Bus
AFTER INSERT, UPDATE
AS
--BEGIN
    -- assert inserted.serialNo not exists on tube nor in train
    IF (EXISTS(
        SELECT SerialNo
        FROM Transportation_System.Tube AS tube, Transportation_System.Train AS train
        WHERE tube.SerialNo = (SELECT SerialNo FROM inserted)
            OR train.SerialNo = (SELECT SerialNo FROM inserted)
        ))
    BEGIN
        ROLLBACK TRAN;
    END

--END
GO
ENABLE TRIGGER onlyTrain ON dbo.Transportation_System.Train

-- Test inserts...

-- Disable triggers...