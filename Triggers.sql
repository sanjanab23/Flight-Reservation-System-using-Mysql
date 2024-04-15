-- Trigger 1: UpdateAvailableSeats
DELIMITER //
CREATE TRIGGER UpdateAvailableSeats AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    UPDATE Flights
    SET AvailableSeats = AvailableSeats - 1
    WHERE FlightNumber = NEW.FlightNumber;
END;
//
DELIMITER ;

-- Trigger 2: UpdateFlightStatus
DELIMITER //
CREATE TRIGGER UpdateFlightStatus AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    IF (SELECT AvailableSeats FROM Flights WHERE FlightNumber = NEW.FlightNumber) = 0 THEN
        UPDATE Flights
        SET Status = 'Booked'
        WHERE FlightNumber = NEW.FlightNumber;
    END IF;
END;
//
DELIMITER ;

-- Trigger 3: UpdatePassengerMiles
DELIMITER //
CREATE TRIGGER UpdatePassengerMiles AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    UPDATE Passengers
    SET MilesFlown = MilesFlown + (SELECT Distance FROM Flights WHERE FlightNumber = NEW.FlightNumber)
    WHERE PassengerID = NEW.PassengerID;
END;
//
DELIMITER ;

-- Trigger 4: CancelReservation
DELIMITER //
CREATE TRIGGER CancelReservation AFTER DELETE ON Reservations
FOR EACH ROW
BEGIN
    UPDATE Flights
    SET AvailableSeats = AvailableSeats + 1
    WHERE FlightNumber = OLD.FlightNumber;
END;
//
DELIMITER ;

-- Trigger 5: UpdateFlightPrice
DELIMITER //
CREATE TRIGGER UpdateFlightPrice AFTER UPDATE ON Flights
FOR EACH ROW
BEGIN
    IF OLD.AvailableSeats > NEW.AvailableSeats THEN
        UPDATE Flights
        SET TicketPrice = TicketPrice * 1.1 -- Increase ticket price by 10%
        WHERE FlightNumber = NEW.FlightNumber;
    END IF;
END;
//
DELIMITER ;
