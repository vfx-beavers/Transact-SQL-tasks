# Transact-SQL Stored procedure with dynamic rows to columns translation

### Окружение
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=<mspwd>' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest

# Задача 1
Имеется таблица заказов:			
Orders			
OrderId		int		
OrderDate	datetime		
LineId		int		
ProductID	int		
Brand		varchar(100)		
Quantity	int		
			
Написать хранимую процедуру на T-SQL, которая бы на определенный диапазон  дат возвращала таблицу:			
```	
        Brand_1		Brand_2		Brand_3		
Date_1	Total Quantity	Total Quantity	Total Quantity  
Date_2	-		-	  -	-
Date_3	-	  -		-	 -
```
В столбцах таблицы должны встречаться только те бренды, которые продавались в данном дипазоне дат. 
Заполнить таблицу заказов тестовыми данными и сделать 2-3 тестовых вызова с разными периодами

# Задача 2
Есть 2 таблицы c данынми по KPI из разных источников:
```
create table dbo.Source1_KPIData
(
 KPIDataID	   bigint
,KPIName	   nvarchar(250)
,EmployeeName  	   nvarchar(250)
,KPIValue	   numeric(18,6)
)
```
```
INSERT INTO dbo.Source1_KPIData (KPIDataID, KPIName, EmployeeName, KPIValue)
VALUES 
    (1, 'KPI_1', N'Иван Иванов', 25.678),
    (2, 'KPI_2', N'Мария Смирнова', 18.245),
    (3, 'KPI_3', N'Петр Петров', 30.123),
    (4, 'KPI_4', N'Анна Иванова', 15.789),
    (5, 'KPI_5', N'Алексей Соколов', 42.567);
```
```
create table dbo.Source2_KPIData
(
 KPIDataID	   bigint
,KPIName	   nvarchar(250)
,EmployeeName      nvarchar(250)
,KPIValue	   numeric(18,6)
)
```
```
INSERT INTO dbo.Source2_KPIData (KPIDataID, KPIName, EmployeeName, KPIValue)
VALUES 
    (1, 'KPI_6', N'Иван Иванов', 25.678),
    (2, 'KPI_7', N'Мария Смирнова', 18.245),
    (3, 'KPI_8', N'Петр Петров', 30.123),
    (4, 'KPI_9', N'Анна Иванова', 15.789),
    (5, 'KPI_10', N'Алексей Соколов', 42.567);
```
Написать скрипт загрузки данных в хранилище данных из этих таблиц: Source1_KPIData, Source2_KPIData
