-- Procedure 1: BookFlight
DELIMITER //
CREATE PROCEDURE BookFlight(
    IN pFlightNumber INT,
    IN pPassengerID INT,
    IN pSeatNumber VARCHAR(10)
)
BEGIN
    INSERT INTO Reservations (FlightNumber, PassengerID, SeatNumber)
    VALUES (pFlightNumber, pPassengerID, pSeatNumber);
    UPDATE Flights
    SET AvailableSeats = AvailableSeats - 1
    WHERE FlightNumber = pFlightNumber;
END;
//
DELIMITER ;

-- Procedure 2: CancelFlight
DELIMITER //
CREATE PROCEDURE CancelFlight(
    IN pReservationID INT
)
BEGIN
    DECLARE vFlightNumber INT;
    SELECT FlightNumber INTO vFlightNumber FROM Reservations WHERE ReservationID = pReservationID;
    DELETE FROM Reservations WHERE ReservationID = pReservationID;
    UPDATE Flights
    SET AvailableSeats = AvailableSeats + 1
    WHERE FlightNumber = vFlightNumber;
END;
//
DELIMITER ;

-- Procedure 3: GetFlightPassengers
DELIMITER //
CREATE PROCEDURE GetFlightPassengers(
    IN pFlightNumber INT
)
BEGIN
    SELECT p.PassengerID, p.Name, p.Email, r.SeatNumber
    FROM Passengers p
    JOIN Reservations r ON p.PassengerID = r.PassengerID
    WHERE r.FlightNumber = pFlightNumber;
END;
//
DELIMITER ;

-- Procedure 4: UpdatePassengerEmail
DELIMITER //
CREATE PROCEDURE UpdatePassengerEmail(
    IN pPassengerID INT,
    IN pNewEmail VARCHAR(100)
)
BEGIN
    UPDATE Passengers
    SET Email = pNewEmail
    WHERE PassengerID = pPassengerID;
END;
//
DELIMITER ;

-- Procedure 5: GetAirportFlights
DELIMITER //
CREATE PROCEDURE GetAirportFlights(
    IN pAirportCode VARCHAR(3)
)
BEGIN
    SELECT *
    FROM Flights
    WHERE DepartureAirport = pAirportCode OR ArrivalAirport = pAirportCode;
END;
//
DELIMITER ;
