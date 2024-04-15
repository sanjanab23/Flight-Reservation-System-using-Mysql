-- Example 1: String Function (UPPER), Date Function (MONTH), Numeric Function (COUNT)
SELECT UPPER(Name) AS UppercaseName, MONTH(DepartureTime) AS DepartureMonth, COUNT(*) AS TotalFlights
FROM Flights
WHERE DepartureTime BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY DepartureMonth;

-- Example 2: String Function (LEFT), Date Function (YEAR), Numeric Function (SUM)
SELECT LEFT(AirportCode, 2) AS AirportPrefix, YEAR(DepartureTime) AS DepartureYear, SUM(AvailableSeats) AS TotalAvailableSeats
FROM Flights
GROUP BY AirportPrefix, DepartureYear;

-- Example 3: String Function (CONCAT), Date Function (DATEDIFF), Numeric Function (AVG)
SELECT CONCAT(FlightNumber, ' - ', DepartureAirport, ' to ', ArrivalAirport) AS FlightRoute, DATEDIFF(ArrivalTime, DepartureTime) AS DurationDays, AVG(AvailableSeats) AS AvgAvailableSeats
FROM Flights
GROUP BY FlightRoute;

-- Example 4: String Function (CHAR_LENGTH), Date Function (DAYOFMONTH), Numeric Function (MAX)
SELECT CHAR_LENGTH(AirlineName) AS AirlineNameLength, DAYOFMONTH(DepartureTime) AS DepartureDay, MAX(AvailableSeats) AS MaxAvailableSeats
FROM Flights
GROUP BY AirlineNameLength, DepartureDay;

-- Example 5: String Function (SUBSTRING), Date Function (WEEK), Numeric Function (MIN)
SELECT SUBSTRING(FlightNumber, 2, 3) AS FlightCode, WEEK(DepartureTime) AS DepartureWeek, MIN(AvailableSeats) AS MinAvailableSeats
FROM Flights
GROUP BY FlightCode, DepartureWeek;
