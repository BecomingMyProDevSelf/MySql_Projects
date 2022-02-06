USE MultiLease9300;
GO

CREATE TABLE LeaseTerms
(
  TermID	varchar(50) NOT NULL,
  UserID varchar(50)NOT NULL,
  numberOfYears int NOT NULL,
  maximumKilometres bigint NOT NULL,
  chargeExtraMileage decimal(6, 2) NOT NULL
);


ALTER TABLE LeaseTerms ADD PRIMARY KEY (TermID);



INSERT INTO LeaseTerms VALUES('28954','2','1500','0.50');
INSERT INTO LeaseTerms VALUES('28955','2','900','1.00');
INSERT INTO LeaseTerms VALUES('28957','3','1200','0.75');
INSERT INTO LeaseTerms VALUES('28959','2','200','0.25');
INSERT INTO LeaseTerms VALUES('28960','1','100','0.35');

SELECT * FROM LeaseTerms;
-------------------------------------------

CREATE TABLE Models
(
 ModelID	varchar(50) NOT NULL,
 fourdoor bit(10) NOT NULL,
 twoDoor bit(10) NOT NULL,
 coupe bit(10) NOT NULL,
 hatchback bit(10)NOT NULL,
);


ALTER TABLE Models ADD PRIMARY KEY (ModelID);

INSERT INTO Models VALUES('28954','NO','YES','NO','NO');
INSERT INTO Models VALUES('28955','YES','NO','NO','NO');
INSERT INTO Models VALUES('28957','NO','YES','YES','NO');
INSERT INTO Models VALUES('28959','NO','NO','NO','YES');
INSERT INTO Models VALUES('28960','YES','NO','NO','NO');

SELECT * FROM Models;

----------------------------------------------

CREATE TABLE Colours
(
 ColorID	varchar(50) NOT NULL,
 Colour char(10) NOT NULL,

);

ALTER TABLE Colours ADD PRIMARY KEY (ColorID);

INSERT INTO Colours VALUES('28954', red );
INSERT INTO Colours VALUES('28955',blue);
INSERT INTO Colours VALUES('28957',blue);
INSERT INTO Colours VALUES('28959',white);
INSERT INTO Colours VALUES('28960', black);

SELECT * FROM Colours;
--------------------------------------------

CREATE TABLE VehicleTypes
(
 VehicleTypeID	varchar(50) NOT NULL,
 truck bit(10)NOT NULL,
 sedans bit(10)NOT NULL,
 vans bit(10)NOT NULL,
 coupe bit(10)NOT NULL
);

ALTER TABLE VehicleTypes ADD PRIMARY KEY (VehicleTypeID);

INSERT INTO VehicleTypes VALUES ('28954', , ,);
INSERT INTO VehicleTypes VALUES ('28955', , ,);
INSERT INTO VehicleTypes VALUES ('28957', , ,);
INSERT INTO VehicleTypes VALUES ('28959', , ,);
INSERT INTO VehicleTypes VALUES ('28960', , ,);

SELECT * FROM VehicleTypes;




DROP TABLE VehicleTypes;



--------------------------------------------

CREATE TABLE Payments
(
 PaymentID	varchar(50) NOT NULL,
 firstPaymentDate DATE,
 monthlyAmortization    INT,
);

ALTER TABLE Payments ADD PRIMARY KEY (PaymentID);


ALTER TABLE Payments
ADD CONSTRAINT default_monthlyterm
DEFAULT '12, 24, 36 , 48' FOR monthlyAmortization;


BEGIN TRY
BEGIN TRANSACTION
INSERT INTO Payments VALUES ('28964', '01-05-2000','100');
UPDATE Payments SET firstPaymentDate = '06-19-2014' WHERE leaseID = '28964';
UPDATE Payments SET monthlyAmortization = '100' WHERE leaseID = '28964';
COMMIT TRANSACTION
PRINT 'Transaction Completed'
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Transaction Unsuccessful and rolledback'
END CATCH

SELECT * FROM Payments;

DELETE FROM Payments
WHERE leaseID = '28954';
-----------------------------------------------


CREATE TABLE Audits
(
 AuditsID	varchar(50) NOT NULL,
 dateofChange date NOT NULL,
 changedField varchar(50) NOT NULL,
 oldvalue varchar(50) NOT NULL,
 newvalue varchar(50) NOT NULL
 
);

ALTER TABLE Audits ADD PRIMARY KEY (AuditsID);


DELETE FROM Audits
WHERE leaseID = ;


UPDATE Audits
SET newvalue = ' '
WHERE leaseID =  ;

UPDATE Audits
SET oldvalue = ' '
WHERE leaseID =  ;



----------------------------------------------------

CREATE TABLE Convention
(
 ConventionID char(10)NOT NULL,
 powerlock char(10)NOT NULL,
 airConditioning char(10)NOT NULL,
 vehicleVIN     varchar(50)  NOT NULL,
 vehicletype varchar(50) NOT NULL
)

ALTER TABLE Convention ADD PRIMARY KEY (ConventionID);

-------------------------------------------

CREATE TABLE Users
(
  UserID varchar(50)NOT NULL,
  leaseID varchar(50)NOT NULL,
  PassWord varchar(50)NOT NULL
)

ALTER TABLE Users ADD PRIMARY KEY (UserID);