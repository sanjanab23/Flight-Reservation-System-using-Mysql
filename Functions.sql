-- Function 1: GetTotalAvailableSeats
DELIMITER //
CREATE FUNCTION GetTotalAvailableSeats(pAirlineCode VARCHAR(3)) RETURNS INT
BEGIN
    DECLARE totalSeats INT;
    SELECT SUM(AvailableSeats) INTO totalSeats FROM Flights WHERE AirlineCode = pAirlineCode;
    RETURN totalSeats;
END;
//
DELIMITER ;

-- Function 2: GetFlightDuration
DELIMITER //
CREATE FUNCTION GetFlightDuration(pDepartureTime DATETIME, pArrivalTime DATETIME) RETURNS TIME
BEGIN
    DECLARE duration TIME;
    SET duration = TIMEDIFF(pArrivalTime, pDepartureTime);
    RETURN duration;
END;
//
DELIMITER ;

-- Function 3: GetPassengerReservationCount
DELIMITER //
CREATE FUNCTION GetPassengerReservationCount(pPassengerID INT) RETURNS INT
BEGIN
    DECLARE reservationCount INT;
    SELECT COUNT(*) INTO reservationCount FROM Reservations WHERE PassengerID = pPassengerID;
    RETURN reservationCount;
END;
//
DELIMITER ;

-- Function 4: IsFlightFull
DELIMITER //
CREATE FUNCTION IsFlightFull(pFlightNumber INT) RETURNS BOOLEAN
BEGIN
    DECLARE isFull BOOLEAN;
    SELECT AvailableSeats = 0 INTO isFull FROM Flights WHERE FlightNumber = pFlightNumber;
    RETURN isFull;
END;
//
DELIMITER ;

-- Function 5: GetFlightStatus
DELIMITER //
CREATE FUNCTION GetFlightStatus(pFlightNumber INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE status VARCHAR(20);
    SELECT CASE 
        WHEN AvailableSeats = 0 THEN 'Booked'
        ELSE 'Available'
    END INTO status FROM Flights WHERE FlightNumber = pFlightNumber;
    RETURN status;
END;
//
DELIMITER ;
