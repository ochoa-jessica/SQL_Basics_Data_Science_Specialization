--We will be using Chinook Database.
--1. How many albums does the artist Led Zeppelin have?
SELECT COUNT(AlbumId) AS totalAlbums
FROM albums
WHERE ArtistId IN ( 
    SELECT ArtistId
    FROM artists
    WHERE Name = "Led Zeppelin");
--14

--2. Create a list of album titles and the unit prices for the artist "Audioslave".
SELECT 
	a.Title, 
	t.UnitPrice
FROM albums a
INNER JOIN tracks t ON a.AlbumId = t.AlbumId
INNER JOIN artists ar ON ar.ArtistID = a.ArtistID
WHERE ar.Name = "Audioslave"
--How many records are returned?
--Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.
--40

--3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?
SELECT 
	c.FirstName, 
	c.LastName
FROM customers c
INNER JOIN invoices i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId is NULL
--No

--4. Find the total price for each album.
--What is the total price for the album “Big Ones”?
SELECT a.Title, SUM(t.UnitPrice)
FROM tracks t
LEFt JOIN albums a ON t.AlbumId = a.AlbumId
WHERE a.Title = "Big Ones";
--14.85

--5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?
SELECT inv.InvoiceId
FROM invoices inv
CROSS JOIN invoice_items inv_items ;
--Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.
--922880
