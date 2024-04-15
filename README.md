# Flight Reservation System Database

This repository contains the SQL scripts for creating and managing a Flight Reservation System database. Below are the details of the tables included in the database:

## Tools Used
- MySQL Workbench: MySQL Workbench is used for designing, modeling, and administering the Flight Reservation System database.
  
## Airports Table

The Airports table stores information about airports.

### Columns:
- AirportCode: VARCHAR(3) (Primary Key) - The unique code of the airport.
- AirportName: VARCHAR(100) - The name of the airport.
- City: VARCHAR(100) - The city where the airport is located.

## Airlines Table

The Airlines table stores information about airlines.

### Columns:
- AirlineCode: VARCHAR(3) (Primary Key) - The unique code of the airline.
- AirlineName: VARCHAR(100) - The name of the airline.
- Country: VARCHAR(100) - The country where the airline is based.

## Flights Table

The Flights table stores information about flights.

### Columns:
- FlightNumber: INT (Primary Key) - The unique number of the flight.
- DepartureAirport: VARCHAR(3) (Foreign Key) - The code of the departure airport.
- ArrivalAirport: VARCHAR(3) (Foreign Key) - The code of the arrival airport.
- DepartureTime: DATETIME - The departure time of the flight.
- ArrivalTime: DATETIME - The arrival time of the flight.
- AvailableSeats: INT - The number of available seats on the flight.
- AirlineCode: VARCHAR(3) (Foreign Key) - The code of the airline operating the flight.
- Status: VARCHAR(20) - The status of the flight (e.g., Scheduled, On Time, Delayed).

## Passengers Table

The Passengers table stores information about passengers.

### Columns:
- PassengerID: INT (Primary Key) - The unique identifier of the passenger.
- Name: VARCHAR(100) - The name of the passenger.
- Email: VARCHAR(100) - The email address of the passenger.

## Reservations Table

The Reservations table stores information about flight reservations made by passengers.

### Columns:
- ReservationID: INT (Primary Key) - The unique identifier of the reservation.
- FlightNumber: INT (Foreign Key) - The number of the flight for which the reservation is made.
- PassengerID: INT (Foreign Key) - The identifier of the passenger making the reservation.
- SeatNumber: VARCHAR(10) - The seat number assigned to the passenger for the flight.
- ReservationDate: DATETIME - The date and time when the reservation was made.

