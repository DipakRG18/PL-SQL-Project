-- Insert Sample Data into Stations Table
INSERT INTO Stations (Name, Location) VALUES ('Central Station', 'City Center');
INSERT INTO Stations (Name, Location) VALUES ('North Station', 'Northside');
INSERT INTO Stations (Name, Location) VALUES ('South Station', 'Southside');

-- Insert Sample Data into Trains Table
INSERT INTO Trains (Name, TrainType, TotalSeats) VALUES ('InterCity Express', 'Express', 500);
INSERT INTO Trains (Name, TrainType, TotalSeats) VALUES ('Local Passenger', 'Passenger', 300);

-- Insert Sample Data into TrainClasses Table
INSERT INTO TrainClasses (TrainID, Class, SeatsAvailable) VALUES (1, 'Sleeper', 200);
INSERT INTO TrainClasses (TrainID, Class, SeatsAvailable) VALUES (1, 'AC', 100);
INSERT INTO TrainClasses (TrainID, Class, SeatsAvailable) VALUES (2, 'General', 300);

-- Insert Sample Data into TrainSchedules Table
INSERT INTO TrainSchedules (TrainID, DepartureStationID, ArrivalStationID, DepartureTime, ArrivalTime, DaysOfOperation)
VALUES (1, 1, 2, TIMESTAMP '2025-01-10 08:00:00', TIMESTAMP '2025-01-10 12:00:00', 'Mon, Wed, Fri');
INSERT INTO TrainSchedules (TrainID, DepartureStationID, ArrivalStationID, DepartureTime, ArrivalTime, DaysOfOperation)
VALUES (2, 2, 3, TIMESTAMP '2025-01-11 09:00:00', TIMESTAMP '2025-01-11 14:00:00', 'Tue, Thu, Sat');

-- Insert Sample Data into TicketPrices Table
INSERT INTO TicketPrices (TrainID, Class, PricePerKm) VALUES (1, 'Sleeper', 1.5);
INSERT INTO TicketPrices (TrainID, Class, PricePerKm) VALUES (1, 'AC', 3.0);
INSERT INTO TicketPrices (TrainID, Class, PricePerKm) VALUES (2, 'General', 0.75);

-- Insert Sample Data into Passengers Table
INSERT INTO Passengers (Name, Email, Phone, Age, Gender) VALUES ('John Doe', 'john.doe@gmail.com', '1234567890', 30, 'Male');
INSERT INTO Passengers (Name, Email, Phone, Age, Gender) VALUES ('Jane Smith', 'jane.smith@gmail.com', '9876543210', 25, 'Female');

-- Insert Sample Data into Bookings Table
INSERT INTO Bookings (PassengerID, ScheduleID, TravelDate, Class, Fare, Status)
VALUES (1, 1, DATE '2025-01-15', 'Sleeper', 1500.0, 'Confirmed');
INSERT INTO Bookings (PassengerID, ScheduleID, TravelDate, Class, Fare, Status)
VALUES (2, 2, DATE '2025-01-20', 'General', 750.0, 'Confirmed');

-- Insert Sample Data into PaymentRecords Table
INSERT INTO PaymentRecords (BookingID, PaymentDate, Amount, PaymentMethod, Status)
VALUES (1, SYSTIMESTAMP, 1500.0, 'Credit Card', 'Successful');
INSERT INTO PaymentRecords (BookingID, PaymentDate, Amount, PaymentMethod, Status)
VALUES (2, SYSTIMESTAMP, 750.0, 'UPI', 'Successful');

-- Insert Sample Data into Reviews Table
INSERT INTO Reviews (BookingID, PassengerID, Rating, Comments, ReviewDate)
VALUES (1, 1, 5, 'Great service and comfortable ride!', SYSTIMESTAMP);
INSERT INTO Reviews (BookingID, PassengerID, Rating, Comments, ReviewDate)
VALUES (2, 2, 4, 'Good experience overall.', SYSTIMESTAMP);

-- Insert Sample Data into Cancellations Table
INSERT INTO Cancellations (BookingID, CancellationDate, RefundAmount, Status)
VALUES (1, SYSTIMESTAMP, 1500.0, 'Processed');
