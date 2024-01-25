DROP TABLE if exists dbo.Source1_KPIData;
DROP TABLE if exists dbo.Source2_KPIData;

create table dbo.Source1_KPIData
(
 KPIDataID	   bigint
,KPIName	   nvarchar(250)
,EmployeeName  nvarchar(250)
,KPIValue	   numeric(18,6)
)

INSERT INTO dbo.Source1_KPIData (KPIDataID, KPIName, EmployeeName, KPIValue)
VALUES 
    (1, 'KPI_1', N'Иван Иванов', 25.678),
    (2, 'KPI_2', N'Мария Смирнова', 18.245),
    (3, 'KPI_3', N'Петр Петров', 30.123),
    (4, 'KPI_4', N'Анна Иванова', 15.789),
    (5, 'KPI_5', N'Алексей Соколов', 42.567);


create table dbo.Source2_KPIData
(
 KPIDataID	   bigint
,KPIName	   nvarchar(250)
,EmployeeName      nvarchar(250)
,KPIValue	   numeric(18,6)
)

INSERT INTO dbo.Source2_KPIData (KPIDataID, KPIName, EmployeeName, KPIValue)
VALUES 
    (1, 'KPI_6', N'Иван Иванов', 25.678),
    (2, 'KPI_7', N'Мария Смирнова', 18.245),
    (3, 'KPI_8', N'Петр Петров', 30.123),
    (4, 'KPI_9', N'Анна Иванова', 15.789),
    (5, 'KPI_10', N'Алексей Соколов', 42.567);


