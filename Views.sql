-- View 1: AvailableFlights
CREATE VIEW AvailableFlights AS
SELECT f.FlightNumber, f.DepartureAirport, f.ArrivalAirport, f.DepartureTime, f.ArrivalTime, f.AvailableSeats, f.AirlineCode
FROM Flights f
WHERE f.AvailableSeats > 0;

-- View 2: FlightPassengerDetails
CREATE VIEW FlightPassengerDetails AS
SELECT r.FlightNumber, f.DepartureAirport, f.ArrivalAirport, f.DepartureTime, f.ArrivalTime, p.PassengerID, p.Name, p.Email
FROM Reservations r
JOIN Flights f ON r.FlightNumber = f.FlightNumber
JOIN Passengers p ON r.PassengerID = p.PassengerID;

-- View 3: PassengerReservations
CREATE VIEW PassengerReservations AS
SELECT r.ReservationID, r.FlightNumber, r.PassengerID, r.SeatNumber, f.DepartureAirport, f.ArrivalAirport, f.DepartureTime, f.ArrivalTime
FROM Reservations r
JOIN Flights f ON r.FlightNumber = f.FlightNumber;

-- View 4: AirlineFlights
CREATE VIEW AirlineFlights AS
SELECT f.FlightNumber, f.DepartureAirport, f.ArrivalAirport, f.DepartureTime, f.ArrivalTime, f.AvailableSeats, f.AirlineCode, a.AirlineName
FROM Flights f
JOIN Airlines a ON f.AirlineCode = a.AirlineCode;

-- View 5: AirportStats
CREATE VIEW AirportStats AS
SELECT a.AirportCode, a.AirportName, a.City, COUNT(f.FlightNumber) AS TotalFlights
FROM Airports a
LEFT JOIN Flights f ON a.AirportCode = f.DepartureAirport OR a.AirportCode = f.ArrivalAirport
GROUP BY a.AirportCode, a.AirportName, a.City;


