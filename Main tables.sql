CREATE DATABASE MultiLease9300;
GO

USE MultiLease9300;
GO

CREATE TABLE Customers
(
  customerID char(50)NOT NULL,
  leaseID	varchar(50) NOT NULL,
  customerName    char(50)  NOT NULL ,
  customerAddress char(50)  NULL ,
  customerCity    char(50)  NULL ,
  customerProvince   char(5)   NULL ,
  customerPostalcode     char(10)  NULL ,
  customerPhonenumber char(50)  NULL 
);

ALTER TABLE Customers ADD PRIMARY KEY (customerID);

INSERT INTO Customers VALUES ('Roger Smith','28954', '7485 Lanley rd', 'Smithsville', 'QC', 'j1j 4m4', '951-247-6999'); 
INSERT INTO Customers VALUES ('Roland Archivault', '28955','2519 Peanut dr', 'georgesville', 'QC', 'j1i 4m4', '974-258-6939'); 
INSERT INTO Customers VALUES ('Steven Duplasis', '28957','9012 Short rd', 'Kantana', 'QC', 'g1j 3m4', '951-301-7999'); 
INSERT INTO Customers VALUES ('Short Debbie','28959', '5412 Anton Cresent', 'Bailloop', 'QC', 'j1j 4m4', '951-300-6666'); 
INSERT INTO Customers VALUES ('Banana Rasta','28960', '7485 stanley rd', 'Valleston', 'QC', 'q4m 6g6', '952-698-7542'); 

----------------------------------------------------------------

CREATE TABLE Leases
(
  leaseID	varchar(50) NOT NULL,	
  dateLeaseStarted   DATE,
  firstPaymentDate DATE,
  amountOfMonthlyPayment    DECIMAL(6,2),
  numberOfMonthlyPayments   DECIMAL(6,2),
  vehicleVIN     varchar(50)  NOT NULL ,
  customerName char(50)  NOT NULL ,
  customerPhoneNumber char(50)NOT NULL,
);


ALTER TABLE Leases ADD PRIMARY KEY (leaseID);
ALTER TABLE Leases ADD CONSTRAINT FK_Leases_Customers FOREIGN KEY (customerName) REFERENCES Customers (customerName);
ALTER TABLE Leases ADD CONSTRAINT FK_Leases_VehicleTypes FOREIGN KEY (vehicleVIN) REFERENCES VehicleTypes(vehicleVIN);

INSERT INTO Leases VALUES ('28954','01-05-2008','01-19-2008','200.00','24','W8T111GH2046987','Roger Smith','951-247-6999');
INSERT INTO Leases VALUES ('28955','02-05-2009','02-19-2009','199.00','24','W8T112GH2046989','Roland Archivault','974-258-6939');
INSERT INTO Leases VALUES ('28957','03-05-2010','03-19-2010','78.00','36','W8T113GH2046970','Steven Duplasis','951-301-7999');
INSERT INTO Leases VALUES ('28959','04-05-2011','04-19-2011','100.00','24','W8T114GH2046971','Short Debbie','951-300-6666');
INSERT INTO Leases VALUES ('28960','05-05-2012','05-19-2012','99.99','12','W8TT117GH2046975','Banana Rasta','952-698-7542');

SELECT * FROM Leases;


---------------------------------------------------------

CREATE TABLE Vehicles
(
  VehicleID varchar(50) NOT NULL,
  leaseID	varchar(50) NOT NULL,
 vehicleVIN     varchar(50)  NOT NULL ,
 Model	varchar(50),
 vehicletype varchar(50),
 vehicleColour varchar(50),
 vehicleyear varchar(20),
 bookValue bigint,
 transmission varchar(10) NOT NULL,
 airConditioning varchar(10) NOT NULL,
 powerLocks varchar(10) NOT NULL
 CONSTRAINT UC_Vehicles UNIQUE(vehicleVIN)
);


ALTER TABLE Vehicles ADD PRIMARY KEY (vehicleID);

INSERT INTO Vehicles VALUES('','W8T111GH2046987','28954','truck','twodoor','black','1999',20000,'yes','yes','yes');
INSERT INTO Vehicles VALUES('','W8T112GH2046989','28955','sedan','fourdoor','white','2000',15000,'yes','yes','yes');
INSERT INTO Vehicles VALUES('','W8T113GH2046970','28957','coupe','twodoor','blue','2004',35000,'yes','yes','yes');
INSERT INTO Vehicles VALUES	('','W8T114GH2046971','hatchback','fivedoor','red','2006',12000,'yes','yes','yes');
INSERT INTO Vehicles VALUES('','W8TT117GH2046975', 'truck', 'fourdoor', '1993','pink', 12000, 'yes','yes','yes');

SELECT * FROM Vehicles;
------------------------------------------------------------


