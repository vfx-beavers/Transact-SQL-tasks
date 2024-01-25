DROP PROCEDURE if exists dbo.BrandsToColumnsDynamic_proc;

CREATE PROCEDURE dbo.BrandsToColumnsDynamic_proc
    @StartPeriod datetime,
    @EndPeriod datetime
AS
BEGIN
DECLARE @PivotSQL NVARCHAR(MAX);
DECLARE @PivotList NVARCHAR(MAX);
SET @PivotList = (
    SELECT STRING_AGG(SUB.Brand, ',') FROM (
	SELECT DISTINCT Brand, OrderDate
	FROM Orders WHERE OrderDate BETWEEN @StartPeriod AND @EndPeriod
	) AS SUB
    );
    SET @PivotSQL = N'
    SELECT *
    FROM
    (
      SELECT cast(OrderDate as date) as OrderDate, Brand, Quantity
      FROM Orders AS SourceTable
      WHERE OrderDate BETWEEN @StartPeriod AND @EndPeriod 
      GROUP BY OrderDate, Brand, Quantity
    ) AS SourceTable
    PIVOT(SUM(Quantity) FOR Brand IN (' + @PivotList + ')) AS PivotTable
    '; 
   EXEC sp_executesql @PivotSQL, N'@StartPeriod datetime, @EndPeriod datetime', @StartPeriod, @EndPeriod;
END

EXEC dbo.BrandsToColumnsDynamic_proc '2024-06-01', '2024-09-29';

-- EXEC PivotRowsToColumnsDynamically3 '2024-01-01', '2024-03-29';
-- OUT
-- 2024-01-01	15		
-- 2024-02-05		6	
-- 2024-03-10			2

-- EXEC PivotRowsToColumnsDynamically3 '2024-03-29', '2024-05-29';
-- OUT
-- 2024-04-23		30
-- 2024-05-12	12	

-- EXEC PivotRowsToColumnsDynamically3 '2024-06-01', '2024-09-29';
-- OUT
-- 2024-06-24		3		
-- 2024-07-15	8			
-- 2024-08-30			5	
-- 2024-09-22				4