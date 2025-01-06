--Test the fare calculation for different train classes and distances.

DECLARE
    v_Fare NUMBER;
BEGIN
    -- Test Case 1: Calculate fare for Sleeper class
    CalculateFare(p_TrainID => 1, p_Class => 'Sleeper', p_Distance => 500, o_Fare => v_Fare);
    DBMS_OUTPUT.PUT_LINE('Fare for Sleeper class, 500 km: ' || v_Fare);

    -- Test Case 2: Calculate fare for AC class
    CalculateFare(p_TrainID => 1, p_Class => 'AC', p_Distance => 300, o_Fare => v_Fare);
    DBMS_OUTPUT.PUT_LINE('Fare for AC class, 300 km: ' || v_Fare);

    -- Test Case 3: Calculate fare for General class
    CalculateFare(p_TrainID => 2, p_Class => 'General', p_Distance => 150, o_Fare => v_Fare);
    DBMS_OUTPUT.PUT_LINE('Fare for General class, 150 km: ' || v_Fare);
END;
/
--2. Test Case: BookTicket Procedure
--Test booking tickets for various passengers, schedules, and classes.
BEGIN
    -- Test Case 1: Book a ticket for Passenger 1 on Schedule 1, Sleeper class
    BookTicket(p_PassengerID => 1, p_ScheduleID => 1, p_TravelDate => TO_DATE('2025-01-15', 'YYYY-MM-DD'), p_Class => 'Sleeper', p_Distance => 1000);
    DBMS_OUTPUT.PUT_LINE('Test Case 1: Ticket booked successfully.');

    -- Test Case 2: Book a ticket for Passenger 2 on Schedule 2, AC class
    BookTicket(p_PassengerID => 2, p_ScheduleID => 2, p_TravelDate => TO_DATE('2025-01-20', 'YYYY-MM-DD'), p_Class => 'AC', p_Distance => 500);
    DBMS_OUTPUT.PUT_LINE('Test Case 2: Ticket booked successfully.');

    -- Test Case 3: Try to book a ticket when seats are not available
    BEGIN
        BookTicket(p_PassengerID => 1, p_ScheduleID => 1, p_TravelDate => TO_DATE('2025-01-15', 'YYYY-MM-DD'), p_Class => 'General', p_Distance => 1000);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Test Case 3: Expected failure - ' || SQLERRM);
    END;
END;
/

--3. Test Case: Seat Availability and Fare Updates
--Validate whether the TrainClasses table updates correctly after booking tickets.


BEGIN
    -- Check Seat Availability for Sleeper class before booking
    DBMS_OUTPUT.PUT_LINE('Test Case 4: Check seat availability for Sleeper class before booking.');
    FOR rec IN (SELECT SeatsAvailable FROM TrainClasses WHERE TrainID = 1 AND Class = 'Sleeper') LOOP
        DBMS_OUTPUT.PUT_LINE('Seats available: ' || rec.SeatsAvailable);
    END LOOP;

    -- Book a ticket for Sleeper class
    BookTicket(p_PassengerID => 1, p_ScheduleID => 1, p_TravelDate => TO_DATE('2025-01-16', 'YYYY-MM-DD'), p_Class => 'Sleeper', p_Distance => 800);

    -- Check Seat Availability for Sleeper class after booking
    DBMS_OUTPUT.PUT_LINE('Test Case 5: Check seat availability for Sleeper class after booking.');
    FOR rec IN (SELECT SeatsAvailable FROM TrainClasses WHERE TrainID = 1 AND Class = 'Sleeper') LOOP
        DBMS_OUTPUT.PUT_LINE('Seats available: ' || rec.SeatsAvailable);
    END LOOP;
END;
/


The 04_test_cases.sql file should include test cases to verify the functionality of the procedures defined in 03_procedures.sql. These test cases help ensure that the procedures (like CalculateFare and BookTicket) work as expected under various scenarios.

Here is what the content of 04_test_cases.sql should look like, based on the provided code:

Contents for 04_test_cases.sql
1. Test Case: CalculateFare Procedure
Test the fare calculation for different train classes and distances.

sql
Copy code
DECLARE
    v_Fare NUMBER;
BEGIN
    -- Test Case 1: Calculate fare for Sleeper class
    CalculateFare(p_TrainID => 1, p_Class => 'Sleeper', p_Distance => 500, o_Fare => v_Fare);
    DBMS_OUTPUT.PUT_LINE('Fare for Sleeper class, 500 km: ' || v_Fare);

    -- Test Case 2: Calculate fare for AC class
    CalculateFare(p_TrainID => 1, p_Class => 'AC', p_Distance => 300, o_Fare => v_Fare);
    DBMS_OUTPUT.PUT_LINE('Fare for AC class, 300 km: ' || v_Fare);

    -- Test Case 3: Calculate fare for General class
    CalculateFare(p_TrainID => 2, p_Class => 'General', p_Distance => 150, o_Fare => v_Fare);
    DBMS_OUTPUT.PUT_LINE('Fare for General class, 150 km: ' || v_Fare);
END;
/
2. Test Case: BookTicket Procedure
Test booking tickets for various passengers, schedules, and classes.

sql
Copy code
BEGIN
    -- Test Case 1: Book a ticket for Passenger 1 on Schedule 1, Sleeper class
    BookTicket(p_PassengerID => 1, p_ScheduleID => 1, p_TravelDate => TO_DATE('2025-01-15', 'YYYY-MM-DD'), p_Class => 'Sleeper', p_Distance => 1000);
    DBMS_OUTPUT.PUT_LINE('Test Case 1: Ticket booked successfully.');

    -- Test Case 2: Book a ticket for Passenger 2 on Schedule 2, AC class
    BookTicket(p_PassengerID => 2, p_ScheduleID => 2, p_TravelDate => TO_DATE('2025-01-20', 'YYYY-MM-DD'), p_Class => 'AC', p_Distance => 500);
    DBMS_OUTPUT.PUT_LINE('Test Case 2: Ticket booked successfully.');

    -- Test Case 3: Try to book a ticket when seats are not available
    BEGIN
        BookTicket(p_PassengerID => 1, p_ScheduleID => 1, p_TravelDate => TO_DATE('2025-01-15', 'YYYY-MM-DD'), p_Class => 'General', p_Distance => 1000);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Test Case 3: Expected failure - ' || SQLERRM);
    END;
END;
/
3. Test Case: Seat Availability and Fare Updates
Validate whether the TrainClasses table updates correctly after booking tickets.

sql
Copy code
BEGIN
    -- Check Seat Availability for Sleeper class before booking
    DBMS_OUTPUT.PUT_LINE('Test Case 4: Check seat availability for Sleeper class before booking.');
    FOR rec IN (SELECT SeatsAvailable FROM TrainClasses WHERE TrainID = 1 AND Class = 'Sleeper') LOOP
        DBMS_OUTPUT.PUT_LINE('Seats available: ' || rec.SeatsAvailable);
    END LOOP;

    -- Book a ticket for Sleeper class
    BookTicket(p_PassengerID => 1, p_ScheduleID => 1, p_TravelDate => TO_DATE('2025-01-16', 'YYYY-MM-DD'), p_Class => 'Sleeper', p_Distance => 800);

    -- Check Seat Availability for Sleeper class after booking
    DBMS_OUTPUT.PUT_LINE('Test Case 5: Check seat availability for Sleeper class after booking.');
    FOR rec IN (SELECT SeatsAvailable FROM TrainClasses WHERE TrainID = 1 AND Class = 'Sleeper') LOOP
        DBMS_OUTPUT.PUT_LINE('Seats available: ' || rec.SeatsAvailable);
    END LOOP;
END;
/
--4. Negative Test Cases
--Ensure the procedures handle invalid input gracefully.

BEGIN
    -- Test Case 6: Invalid Train ID for CalculateFare
    BEGIN
        DECLARE
            v_Fare NUMBER;
        BEGIN
            CalculateFare(p_TrainID => 999, p_Class => 'Sleeper', p_Distance => 500, o_Fare => v_Fare);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Test Case 6: Expected failure for invalid TrainID - ' || SQLERRM);
        END;
    END;

    -- Test Case 7: Invalid Schedule ID for BookTicket
    BEGIN
        BookTicket(p_PassengerID => 1, p_ScheduleID => 999, p_TravelDate => TO_DATE('2025-01-15', 'YYYY-MM-DD'), p_Class => 'Sleeper', p_Distance => 500);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Test Case 7: Expected failure for invalid ScheduleID - ' || SQLERRM);
    END;
END;
/
