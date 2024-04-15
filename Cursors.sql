-- Example 1: Cursor to iterate through a result set and display values
DELIMITER //
CREATE PROCEDURE DisplayFlightNumbers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE flightNumber INT;
    DECLARE cur CURSOR FOR SELECT FlightNumber FROM Flights;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO flightNumber;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT flightNumber;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

CALL DisplayFlightNumbers();

-- Example 2: Cursor to calculate the total available seats for each airline
DELIMITER //
CREATE PROCEDURE CalculateTotalAvailableSeats()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE airlineCode VARCHAR(3);
    DECLARE totalSeats INT;
    DECLARE cur CURSOR FOR SELECT DISTINCT AirlineCode FROM Flights;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO airlineCode;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT airlineCode, SUM(AvailableSeats) INTO airlineCode, totalSeats FROM Flights WHERE AirlineCode = airlineCode;
        SELECT airlineCode, totalSeats;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

CALL CalculateTotalAvailableSeats();

-- Example 3: Cursor to update flight status based on available seats
DELIMITER //
CREATE PROCEDURE UpdateFlightStatus()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE flightNum INT;
    DECLARE cur CURSOR FOR SELECT FlightNumber FROM Flights;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO flightNum;
        IF done THEN
            LEAVE read_loop;
        END IF;
        IF (SELECT AvailableSeats FROM Flights WHERE FlightNumber = flightNum) = 0 THEN
            UPDATE Flights SET Status = 'Booked' WHERE FlightNumber = flightNum;
        END IF;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

CALL UpdateFlightStatus();

-- Example 4: Cursor to delete old reservations
DELIMITER //
CREATE PROCEDURE DeleteOldReservations()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE reservationID INT;
    DECLARE cur CURSOR FOR SELECT ReservationID FROM Reservations WHERE ReservationDate < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO reservationID;
        IF done THEN
            LEAVE read_loop;
        END IF;
        DELETE FROM Reservations WHERE ReservationID = reservationID;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

CALL DeleteOldReservations();

-- Example 5: Cursor to calculate total miles flown by each passenger
DELIMITER //
CREATE PROCEDURE CalculateTotalMilesFlown()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE passengerID INT;
    DECLARE totalMiles INT;
    DECLARE cur CURSOR FOR SELECT DISTINCT PassengerID FROM Reservations;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO passengerID;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT passengerID, SUM(Distance) INTO passengerID, totalMiles FROM Flights JOIN Reservations ON Flights.FlightNumber = Reservations.FlightNumber WHERE PassengerID = passengerID;
        SELECT passengerID, totalMiles;
    END LOOP;
    CLOSE cur;
END;
//
DELIMITER ;

CALL CalculateTotalMilesFlown();
