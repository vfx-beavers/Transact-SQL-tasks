DROP TABLE if exists dbo.stg_Source1_KPIData;
DROP TABLE if exists dbo.stg_Source2_KPIData;
DROP TABLE if exists dbo.combined_KPIData;
DROP TABLE if exists dbo.combined_union_KPIData;
DROP TABLE if exists dbo.combined_serial_KPIData;

SELECT * INTO dbo.stg_Source1_KPIData FROM dbo.Source1_KPIData;
SELECT * INTO dbo.stg_Source2_KPIData FROM dbo.Source2_KPIData;

-- Вариант с сохранением источника
CREATE TABLE dbo.combined_KPIData
(
    KPIDataID bigint,
    KPIName nvarchar(250),
    EmployeeName nvarchar(250),
    KPIValue numeric(18,6),
    "Source" nvarchar(50) 
);

INSERT INTO dbo.combined_KPIData (KPIDataID, KPIName, EmployeeName, KPIValue, "Source")
SELECT KPIDataID, KPIName, EmployeeName, KPIValue, 'Source1'
FROM dbo.stg_Source1_KPIData;

INSERT INTO dbo.combined_KPIData (KPIDataID, KPIName, EmployeeName, KPIValue, "Source")
SELECT KPIDataID, KPIName, EmployeeName, KPIValue, 'Source2'
FROM dbo.stg_Source2_KPIData;

-- OUT
-- 1	KPI_1	Иван Иванов	25.678000	Source1
-- 2	KPI_2	Мария Смирнова	18.245000	Source1
-- 3	KPI_3	Петр Петров	30.123000	Source1
-- 4	KPI_4	Анна Иванова	15.789000	Source1
-- 5	KPI_5	Алексей Соколов	42.567000	Source1
-- 1	KPI_6	Иван Иванов	25.678000	Source2
-- 2	KPI_7	Мария Смирнова	18.245000	Source2
-- 3	KPI_8	Петр Петров	30.123000	Source2
-- 4	KPI_9	Анна Иванова	15.789000	Source2
-- 5	KPI_10	Алексей Соколов	42.567000	Source2

-- Вариант с сохранением источника


-- Вариант с сохранением источника без KPIDataID
SELECT * INTO dbo.combined_union_KPIData 
FROM ( 
SELECT KPIName, EmployeeName, KPIValue, 'Source1' AS Source
FROM dbo.stg_Source1_KPIData
UNION 
SELECT KPIName, EmployeeName, KPIValue, 'Source2' AS Source
FROM dbo.stg_Source2_KPIData) as x;

-- OUT
-- KPI_1	Иван Иванов	25.678000	Source1
-- KPI_2	Мария Смирнова	18.245000	Source1
-- KPI_3	Петр Петров	30.123000	Source1
-- KPI_4	Анна Иванова	15.789000	Source1
-- KPI_5	Алексей Соколов	42.567000	Source1
-- KPI_6	Иван Иванов	25.678000	Source2
-- KPI_7	Мария Смирнова	18.245000	Source2
-- KPI_8	Петр Петров	30.123000	Source2
-- KPI_9	Анна Иванова	15.789000	Source2
-- KPI_10	Алексей Соколов	42.567000	Source2

-- Вариант с сохранением источника без KPIDataID


-- Вариант если KPIDataID был не порядковый, а реальный и уникальный
SELECT a.KPIDataID, a.KPIName, a.EmployeeName, a.KPIValue
FROM dbo.stg_Source1_KPIData as a
inner join 
dbo.stg_Source2_KPIData as b
on a.KPIDataID = b.KPIDataID;

-- OUT
-- 1	KPI_1	Иван Иванов	25.678000
-- 2	KPI_2	Мария Смирнова	18.245000
-- 3	KPI_3	Петр Петров	30.123000
-- 4	KPI_4	Анна Иванова	15.789000
-- 5	KPI_5	Алексей Соколов	42.567000

-- Вариант если KPIDataID был не порядковый, а реальный и уникальный


-- Вариант если KPIDataID был порядковый, KPIName разный, но подразумевалось, содержание одно и то же
-- C новыми serial id
CREATE TABLE dbo.combined_serial_KPIData
(
    id INT IDENTITY(1, 1),
    EmployeeName nvarchar(250),
    KPIValue numeric(18,6)
);

INSERT INTO dbo.combined_serial_KPIData (EmployeeName, KPIValue) 
SELECT a.EmployeeName, a.KPIValue
FROM dbo.stg_Source1_KPIData as a
inner join 
dbo.stg_Source2_KPIData as b
on a.EmployeeName = b.EmployeeName and a.KPIValue = b.KPIValue
;

-- OUT
-- 1	Иван Иванов	25.678000
-- 2	Мария Смирнова	18.245000
-- 3	Петр Петров	30.123000
-- 4	Анна Иванова	15.789000
-- 5	Алексей Соколов	42.567000

-- Вариант если KPIDataID был порядковый, KPIName разный, но подразумевалось, содержание одно и то же