-- Inner Join
SELECT Flights.FlightNumber, Flights.DepartureAirport, Airports.AirportName
FROM Flights
INNER JOIN Airports ON Flights.DepartureAirport = Airports.AirportCode;

-- Left Join
SELECT Flights.FlightNumber, Flights.DepartureAirport, Airports.AirportName
FROM Flights
LEFT JOIN Airports ON Flights.DepartureAirport = Airports.AirportCode;

-- Right Join
SELECT Flights.FlightNumber, Flights.DepartureAirport, Airports.AirportName
FROM Flights
RIGHT JOIN Airports ON Flights.DepartureAirport = Airports.AirportCode;

-- Full Outer Join
SELECT Flights.FlightNumber, Flights.DepartureAirport, Airports.AirportName
FROM Flights
FULL OUTER JOIN Airports ON Flights.DepartureAirport = Airports.AirportCode;

-- Cross Join
SELECT Flights.FlightNumber, Flights.DepartureAirport, Airports.AirportName
FROM Flights
CROSS JOIN Airports;
