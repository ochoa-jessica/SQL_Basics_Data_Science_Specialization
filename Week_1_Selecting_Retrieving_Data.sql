--We are using the Chinook database.

--1. Retrieve all the records from the Employees table.
SELECT * FROM Employees;
--What is Robert King's mailing address? 
SELECT *
FROM Employees
WHERE FirstName = "Robert" AND LastName = "King";
--590 Columbia Boulevard West, Lethbridge, AB, CANADA T1K 5N8

--2. Retrieve the FirstName, LastName, Birthdate, Address, City, and State from the Employees table.
SELECT 
    FirstName,
    LastName,
    BirthDate,
    Address,
    City,
    State 
FROM Employees;
--Which of the employees listed below has a birthdate of 3-3-1965?
SELECT 
    FirstName,
    LastName,
    BirthDate,
    Address,
    City,
    State 
FROM Employees
WHERE BirthDate = '1965-03-03 00:00:00'
--Steve

--3. Retrieve all the columns from the Tracks table, but only return 20 rows.
SELECT * FROM Tracks
limit 20
--What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn"? Note: You will need to scroll to the right to see it, and you may want to copy and paste the number to ensure it is entered correctly.
SELECT Milliseconds
FROM Tracks
WHERE Name = "Princess of the Dawn"
--375418
