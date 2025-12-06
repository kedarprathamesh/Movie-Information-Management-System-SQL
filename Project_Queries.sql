use movie_database_system;

-- show all the movies that inserted 
select m.title AS Title,m.release_year AS Release_Year,d.name AS Director
from Movies m
JOIN Directors d on m.director_id = d.director_id
ORDER BY release_year desc;

-- All movies featuring a specific actor
SELECT m.title
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
WHERE ma.actor_id = 1;   -- example actor_id

-- Check for a Actor who played the specific role in the Movie
select a.name
from Actors a 
join Movie_Actor ma on a.actor_id = ma.actor_id
where ma.role_name = "Sherlock Holmes";

-- find Average Rating of movie from rating table 
select m.title AS Title, AVG(r.rating) as Avg_Rating
FROM Movies m
LEFT JOIN Ratings r on m.movie_id = r.movie_id
group by m.movie_id
ORDER BY AVG(r.rating) desc;

-- Search Movie By Genre
select m.title
from Movies m
join Movie_Genre mg on m.movie_id = mg.movie_id
join Genres g on mg.genre_id = g.genre_id 
where g.genre_name = 'Sci-Fi'; 

-- Find Top Rated Movies
Select m.title , AVG(r.rating) as AVG_Rating
from Movies m
JOIN Ratings r on m.movie_id = r.movie_id
group by m.movie_id
order by AVG_Rating DESC
limit 5;

-- Director with the most movies
SELECT d.name, count(m.movie_id) as "Movies Directed"
FROM Directors d
JOIN movies m on d.director_id = m.director_id
Group by d.director_id
order by "Movies Directed" DESC
LIMIT 1;

-- Second Highest Rated Movie
SELECT title, AVG_Rating
FROM (
	SELECT m.title,
		AVG(r.rating) as AVG_Rating,
		dense_rank() OVER (ORDER BY AVG(r.rating) DESC) as rnk
    from Movies m
    join Ratings r on m.movie_id = r.movie_id
    group by m.movie_id
) ranked
WHERE rnk = 2
limit 1;

-- Top 5 movies with highest rating
SELECT m.title, AVG(r.rating) AS AVG_Rating
FROM Movies m
join Ratings r on m.movie_id = r.movie_id
group by m.movie_id
order by AVG_Rating DESC
limit 5;

select distinct a.name
from Actors a
JOIN Movie_Actor ma on a.actor_id = ma.actor_id
JOIN Movies m on ma.movie_id = m.movie_id
where m.director_id = 1; 

-- Movie released in current 10 years
select * from movies where release_year >= Year(curdate()) - 10;


-- Highest Rated movies in each genre
SELECT g.genre_name, m.title,AVG(r.rating) AS AVG_Rating
FROM Genres g
JOIN Movie_Genre mg on g.genre_id = mg.genre_id
JOIN Movies m on mg.movie_id = m.movie_id
JOIN Ratings r on m.movie_id = r.movie_id
GROUP BY g.genre_id, m.movie_id
order by g.genre_name,AVG_Rating DESC; 

-- Movies with Most Actors
SELECT m.title,COUNT(ma.actor_id) AS total_cast
FROM Movies m
join Movie_Actor ma on m.movie_id = ma.movie_id
Group By m.movie_id
order by total_cast desc;

-- Most Active Users
select u.user_name, count(r.rating_id) as TotalReviews
FROM Users u
JOIN Ratings r on u.user_id = r.user_id
group by u.user_id
order by TotalReviews desc;

-- Movies with NO rating
SELECT m.title
FROM movies m
LEFT JOIN ratings r ON m.movie_id = r.movie_id
WHERE r.rating_id IS NULL;

-- List Movies and their genres
select m.title AS Title, group_concat(g.genre_name separator ', ') AS Genres
from Movies m
JOIN movie_genre mg on m.movie_id = mg.movie_id
JOIN genres g on mg.genre_id = g.genre_id
Group by m.movie_id;

-- Average Rating by User
SELECT u.user_name, AVG(r.rating) AS avg_rating
FROM Users u
JOIN Ratings r ON u.user_id = r.user_id
GROUP BY u.user_id;


