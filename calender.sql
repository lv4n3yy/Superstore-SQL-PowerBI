USE ECommerceAnalytics;
GO

CREATE TABLE dbo.Calendar (
    DateKey     int         NOT NULL PRIMARY KEY,
    FullDate    date        NOT NULL,
    [Year]      int         NOT NULL,
    [Quarter]   int         NOT NULL,
    [Month]     int         NOT NULL,
    MonthName   nvarchar(20) NOT NULL,
    [Day]       int         NOT NULL,
    WeekdayName nvarchar(20) NOT NULL
);
GO

DECLARE @d date = '2014-01-01';
WHILE @d <= '2018-12-31'
BEGIN
    INSERT INTO dbo.Calendar
        (DateKey, FullDate, [Year], [Quarter], [Month], MonthName, [Day], WeekdayName)
    VALUES
        (CONVERT(int, FORMAT(@d, 'yyyyMMdd')),
         @d,
         YEAR(@d),
         DATEPART(QUARTER, @d),
         MONTH(@d),
         DATENAME(MONTH, @d),
         DAY(@d),
         DATENAME(WEEKDAY, @d));
    SET @d = DATEADD(DAY, 1, @d);
END;
GO
