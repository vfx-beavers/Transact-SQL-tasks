--DROP TABLE if exists dbo.Orders;

CREATE table dbo.Orders (
    OrderId int,
	OrderDate datetime,
	LineId int,
	ProductID int,
	Brand varchar(100),
	Quantity int
);

INSERT INTO de.dbo.Orders (OrderId,OrderDate,LineId,ProductID,Brand,Quantity) VALUES
	 (23698,'2024-01-01 00:00:00.0',65,32659,N'Neogalen',10),
	 (14569,'2024-04-23 00:00:00.0',56,25498,N'Promovia',30),
	 (89654,'2024-05-12 00:00:00.0',12,12369,N'Pediakid',12),
	 (23659,'2024-02-05 00:00:00.0',85,89658,N'Panadol',6),
	 (96321,'2024-03-10 00:00:00.0',35,14785,N'ReOxy',2),
	 (22335,'2024-09-22 00:00:00.0',89,44558,N'Yod',4),
	 (22435,'2024-10-04 00:00:00.0',95,43158,N'Marganec',1),
	 (22735,'2024-06-24 00:00:00.0',90,89658,N'Panadol',1),
	 (22738,'2024-06-24 00:00:00.0',90,89658,N'Panadol',2),
	 (22135,'2024-07-15 00:00:00.0',82,44958,N'Aspirin',8),
	 (22935,'2024-08-30 00:00:00.0',20,44758,N'Spirt',5);
	
	
INSERT INTO de.dbo.Orders (OrderId,OrderDate,LineId,ProductID,Brand,Quantity) VALUES
	 (23699,'2024-01-01 00:00:00.0',65,32659,N'Neogalen',5)


