
--What grades are stored in the database?
SELECT DISTINCT GradeId
FROM Author;

--What emotions may be associated with a poem?
SELECT *
FROM Emotion;

--How many poems are in the database?
SELECT COUNT(Id)
FROM Poem;

--Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT TOP 76 Name
FROM Author
ORDER BY Name;

--Starting with the above query, add the grade of each of the authors.
SELECT TOP 76 a.Name, g.Name
FROM Author a
LEFT JOIN Grade g ON a.GradeId = g.Id
ORDER BY a.Name;

--Starting with the above query, add the recorded gender of each of the authors.
SELECT TOP 76 a.Name, gr.Name, g.Name
FROM Author a
LEFT JOIN Grade gr ON a.GradeId = gr.Id
LEFT JOIN Gender g ON a.GenderId = g.Id
ORDER BY a.Name;
--What is the total number of words in all poems in the database?
SELECT SUM(WordCount) as 'Total Words'
FROM Poem

--Which poem has the fewest characters?
SELECT p.Title, p.CharCount, p.TEXT
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
Where CharCount = (SELECT MIN(CharCount) FROM Poem)

--How many authors are in the third grade?
SELECT COUNT(*) as '3rd Grade Authors'
FROM Author
WHERE GradeId = 3;
--How many authors are in the first, second or third grades?
SELECT COUNT(*) as '1st, 2nd & 3rd Grade'
FROM Author
WHERE GradeId = 3 OR GradeId = 2 OR GradeId = 1;

--What is the total number of poems written by fourth graders?
SELECT COUNT(*) as '4th grade poems'
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
WHERE a.GradeId = 4; 
--How many poems are there per grade?
SELECT GradeId,COUNT(*)
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
GROUP BY GradeId
ORDER BY GradeId;

--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
SELECT COUNT(*)
FROM Author
GROUP BY GradeId
ORDER BY GradeId;
--what is the title of the poem that has the most words?
SELECT p.Title, p.WordCount, p.TEXT
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
Where WordCount = (SELECT MAX(WordCount) FROM Poem)
--Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT a.Name, Count(*) as 'Total per individual author'
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
GROUP BY p.AuthorId, a.Name
ORDER BY Count(*) DESC
SELECT a.Name, Count(*) as 'Total per name'
FROM Poem p
LEFT JOIN Author a ON p.AuthorId = a.Id
GROUP BY a.Name
ORDER BY Count(*) DESC

--How many poems have an emotion of sadness?
SELECT Name, COUNT(*)
FROM PoemEmotion pe
LEFT JOIN  Emotion e ON pe.EmotionId = e.Id
WHERE Name = 'Sadness'
GROUP BY Name 

--How many poems are not associated with any emotion?

SELECT COUNT(*) as 'No emotion'
FROM PoemEmotion pe
FULL JOIN Poem p on p.Id = pe.PoemId

FULL JOIN Emotion e on e.id = pe.EmotionId
WHERE e.Id IS NULL;

--Which emotion is associated with the least number of poems?

select top 1 e.Name
from PoemEmotion pe
LEFT JOIN Emotion e ON pe.EmotionId = e.Id
group by e.Name
order by count(*);


--Which grade has the largest number of poems with an emotion of joy?
SELECT TOP 1 g.Name
FROM PoemEmotion pe
LEFT JOIN Poem p ON pe.PoemId = p.Id
LEFT JOIN Author a ON p.AuthorId = a.Id
LEFT JOIN Grade g ON a.GradeId = g.Id
LEFT JOIN Emotion e ON pe.EmotionId = e.Id
WHERE e.Name = 'Joy'
GROUP BY g.Name
Order BY COUNT(*) DESC



--Which gender has the least number of poems with an emotion of fear?
SELECT TOP 1 g.Name
FROM PoemEmotion pe
LEFT JOIN Poem p ON pe.PoemId = p.Id
LEFT JOIN Author a ON p.AuthorId = a.Id
LEFT JOIN Gender g ON a.GenderId = g.Id
LEFT JOIN Emotion e ON pe.EmotionId = e.Id
WHERE e.Name = 'Fear'
GROUP BY g.Name
Order BY COUNT(*)

--SELECT a.Name, a.Id, Count(*)
--From Poem p
--LEFT JOIN Author a ON p.AuthorId = a.Id
--WHERE Name = 'emily'
--GROUP BY a.Name, a.Id









