--We will be using Chinook Database.
--1. Using a subquery, find the names of all the tracks for the album "Californication".
SELECT t.Name, t.TrackId
FROM Tracks t
WHERE t.AlbumId IN (
    SELECT a.AlbumId
    FROM Albums a
    WHERE a.Title = "Californication"
);
--What is the title of the 8th track?
--Porcelain

--2. Find the total number of invoices for each customer along with the customer's full name, city and email.
SELECT c.CustomerId, 
c.FirstName, 
c.LastName, 
c.Email, c.City, 
COUNT(i.InvoiceId)
FROM Customers c
INNER JOIN Invoices i ON (
    c.CustomerId = i.CustomerId
) GROUP BY c.CustomerId;
--After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).
--frantisekw@jetbrains.com

--3. Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT a.AlbumId, 
a.Title,
a.ArtistId,
t.Name,
t.TrackId
FROM Albums a
INNER JOIN Tracks t ON
( 
    a.AlbumId = t.AlbumId
); 
--What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.
--Breaking The Rules

--4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
SELECT mng.LastName Manager, e.LastName Employee
FROM Employees e
LEFT JOIN Employees mng ON
e.ReportsTo = mng.EmployeeId;
--After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?
--Callahan, King

--5. Find the name and ID of the artists who do not have albums.
SELECT art.ArtistId, art.Name, a.Title
FROM Artists art
LEFT JOIN Albums a ON
(
    art.ArtistId = a.ArtistId
) WHERE Title is NULL;
--After running the query described above, two of the records returned have the same last name. Enter that name below.
--Gilberto

--6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
SELECT e.FirstName, e.LastName
FROM Employees e
UNION 
SELECT c.FirstName, c.LastName
FROM Customers c
ORDER BY c.LastName DESC;
--After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.
--Taylor

--7. See if there are any customers who have a different city listed in their billing city versus their customer city.
SELECT c.CustomerId,
c.FirstName,
c.LastName,
c.City,
i.BillingCity
FROM Customers c
JOIN Invoices i ON
(
    c.CustomerId = i.CustomerId
) WHERE c.CustomerId <> i.BillingCity;
--Indicate your answer below.
--No customers have a different city listed in their billing city versus customer city.
