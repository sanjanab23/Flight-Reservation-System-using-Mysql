-- Query 1: Retrieve all columns from the Flights table
SELECT * FROM Flights;

-- Query 2: Retrieve flights departing from 'DEL' airport
SELECT * FROM Flights WHERE DepartureAirport = 'DEL';

-- Query 3: Retrieve flights with available seats greater than 50
SELECT * FROM Flights WHERE AvailableSeats > 50;

-- Query 4: Retrieve flights operated by 'AI' airline
SELECT * FROM Flights WHERE AirlineCode = 'AI';

-- Query 5: Retrieve flights departing from 'DEL' airport and operated by 'AI' airline
SELECT * FROM Flights WHERE DepartureAirport = 'DEL' AND AirlineCode = 'AI';

-- Query 6: Count the total number of flights
SELECT COUNT(*) AS TotalFlights FROM Flights;

-- Query 7: Calculate the average available seats across all flights
SELECT AVG(AvailableSeats) AS AverageAvailableSeats FROM Flights;

-- Query 8: Retrieve flights with departure time after '2024-04-15'
SELECT * FROM Flights WHERE DepartureTime > '2024-04-15';

-- Query 9: Retrieve flights with arrival time before '2024-05-01'
SELECT * FROM Flights WHERE ArrivalTime < '2024-05-01';

-- Query 10: Calculate the total distance covered by all flights
SELECT SUM(Distance) AS TotalDistance FROM Flights;

-- Query 11: Retrieve flights with a ticket price greater than 5000
SELECT * FROM Flights WHERE TicketPrice > 5000;

-- Query 12: Retrieve flights with a status of 'Scheduled' or 'On Time'
SELECT * FROM Flights WHERE Status IN ('Scheduled', 'On Time');

-- Query 13: Retrieve flights with available seats less than 20 and operated by '6E' airline
SELECT * FROM Flights WHERE AvailableSeats < 20 AND AirlineCode = '6E';

-- Query 14: Retrieve flights departing from 'BOM' airport ordered by departure time
SELECT * FROM Flights WHERE DepartureAirport = 'BOM' ORDER BY DepartureTime;

-- Query 15: Retrieve flights with a departure time between '2024-04-15' and '2024-04-30'
SELECT * FROM Flights WHERE DepartureTime BETWEEN '2024-04-15' AND '2024-04-30';
