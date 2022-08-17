--1. Retrieve all the data from the tracks table. Who is the composer for track 18?
SELECT Composer 
FROM Tracks 
WHERE TrackId = 18;
--AC/DC

--2. Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?
SELECT *
FROM Artists;
-- 5

--3. Retrieve all data from the invoices table. What is the billing address for customer 31?
SELECT *
FROM Invoices;
--194A Chain Lake Drive, Halifax, NS, CANADA B3S 1C5

--4. Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?
SELECT 
    Playlistid,
    Name
FROM Playlists;
--18, Music Videos

--5. Return the Customer Id, Invoice Date, and Billing City from the Invoices table. What city is associated with Customer ID number 42? What was the invoice date for the customer in Santiago?
SELECT 
    CustomerId,
    InvoiceDate, 
    BillingCity 
FROM Invoices;
--Bordeaux, 2009-04-04 00:00:00

--6. Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?
SELECT 
    FirstName, 
    LastName, 
    Email, 
    Phone
FROM Customers;
--+1 (604) 688-2255

--7. Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?
SELECT 
    TrackId, 
    GenreId, 
    Composer, 
    UnitPrice 
FROM Tracks;
--0.99

--8. Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?
SELECT *
FROM Playlist_track 
LIMIT 10;
--To show which tracks are in a specific playlist.

--9. Select all the columns from the Media Types table and limit the results to 50 records. What happened when you ran this query? Were you able to get all 50 records?
SELECT *
FROM Media_types
LIMIT 50;
--I was only able to get 5 records.

--10. Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table?
--What is the name of the 9th album in this list?
SELECT *
FROM Albums;
--Plays Metallica By Four Cellos
