select *
from album;

SELECT ArtistID,
       GenreID
  FROM Album ;


  SELECT *
  From Genre;



--SELECT DISTINCT 
--       a.ArtistName, GenreId
--  FROM Album s
--       LEFT JOIN Artist a on s.ArtistId = a.id
       
--  where GenreId = 7;
SELECT art.ArtistName
FROM Artist art inner join
Album alb on art.id = alb.ArtistId
WHERE alb.GenreId = (SELECT id
					FROM Genre
					WHERE label ='Pop');


SELECT art.ArtistName
FROM Artist art inner join
Album alb on art.id = alb.ArtistId
WHERE alb.GenreId IN (SELECT id
					FROM Genre
					WHERE label ='Jazz' OR label ='Rock');


  
--SELECT DISTINCT 
--       a.ArtistName, GenreId
--  FROM Album s
--       LEFT JOIN Artist a on s.ArtistId = a.id
       
--  where GenreId = 2 OR GenreID = 4;

select Title
FROM Album
where AlbumLength = 0;

/*INSERT INTO Artist (ArtistName, YearEstablished) Values ('Lindsey Stirling', 2010)*/

/*INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Lindsey Stirling', '9/18/2012', 2711, 'Bridge Tone', 28, 14);*/
/*INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Crystallize', 258, '9/18/2012', 14, 28, 23);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Moon Trance', 185, '9/18/2012', 14, 28, 23);
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Transcendence', 225, '9/18/2012', 14, 28, 23); */

SELECT a.Title, s.Title, k.ArtistName 
FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id
LEFT JOIN Artist k ON s.ArtistId = k.id
WHERE a.Title = 'By Lindsey Stirling';


SELECT a.Title, COUNT(a.Title) as 'NumberofSongs'
FROM Song s
LEFT JOIN Album a ON s.AlbumID= a.Id
GROUP BY a.Title;

SELECT a.ArtistName, COUNT(Title)
FROM Song s
Left Join Artist a ON s.ArtistId = a.ID
GROUP BY a.ArtistName

SELECT g.Label, COUNT(Title)
FROM Song s
LEFT JOIN Genre g ON s.GenreId = g.Id
GROUP BY g.Label;

SELECT COUNT(DISTINCT a.Label) as 'Number of labels', ar.ArtistName
FROM Album a
LEFT JOIN Artist ar ON a.ArtistId = ar.id
GROUP BY ar.ArtistName
HAVING COUNT(DISTINCT a.Label) > 1;

SELECT Title, Albumlength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

SELECT s.Title, s.SongLength, a.Title
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.Id
WHERE SongLength = (SELECT MAX(SongLength) FROM SONG)