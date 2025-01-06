--Calculates the fare based on the train, class, and distance.
CREATE OR REPLACE PROCEDURE CalculateFare (
    p_TrainID IN NUMBER,
    p_Class IN VARCHAR2,
    p_Distance IN NUMBER,
    o_Fare OUT NUMBER
) AS
    v_PricePerKm NUMBER;
BEGIN
    SELECT PricePerKm INTO v_PricePerKm
    FROM TicketPrices
    WHERE TrainID = p_TrainID AND Class = p_Class;

    o_Fare := p_Distance * v_PricePerKm;
END;
/

CREATE OR REPLACE PROCEDURE BookTicket (
    p_PassengerID IN NUMBER,
    p_ScheduleID IN NUMBER,
    p_TravelDate IN DATE,
    p_Class IN VARCHAR2,
    p_Distance IN NUMBER
) AS
    v_Fare NUMBER;
    v_SeatsAvailable NUMBER;
    v_TrainID NUMBER;
BEGIN
    -- Get TrainID for the given ScheduleID
    SELECT TrainID INTO v_TrainID
    FROM TrainSchedules
    WHERE ScheduleID = p_ScheduleID;

    -- Check seat availability
    SELECT SeatsAvailable INTO v_SeatsAvailable
    FROM TrainClasses
    WHERE TrainID = v_TrainID AND Class = p_Class;

    IF v_SeatsAvailable <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No seats available in the selected class.');
    END IF;

    -- Calculate fare
    CalculateFare(v_TrainID, p_Class, p_Distance, v_Fare);

    -- Book the ticket
    INSERT INTO Bookings (PassengerID, ScheduleID, TravelDate, Class, Fare, Status)
    VALUES (p_PassengerID, p_ScheduleID, p_TravelDate, p_Class, v_Fare, 'Confirmed');

    -- Update the available seats
    UPDATE TrainClasses
    SET SeatsAvailable = SeatsAvailable - 1
    WHERE TrainID = v_TrainID AND Class = p_Class;

    -- Output the success message
    DBMS_OUTPUT.PUT_LINE('Ticket booked successfully!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Schedule ID not found or no seats available.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


