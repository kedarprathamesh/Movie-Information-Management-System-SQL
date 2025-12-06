use movie_database_system;
-- CREATE VIEW FOR QUICK Access

-- Check Movie Details, Directors and Genres
CREATE VIEW movie_full_details AS
SELECT 
	m.movie_id,
    m.title,
    m.release_year,
    d.name AS Director,
    group_concat(g.genre_name separator ', ') AS Genres
FROM Movies m
LEFT JOIN Directors d on m.director_id = d.director_id
LEFT JOIN Movie_Genre mg on m.movie_id = mg.movie_id
LEFT JOIN Genres g on mg.genre_id = g.genre_id
Group by m.movie_id;

-- Check Count Of total Rating and Show Average Rating
CREATE VIEW Movie_Rating_Summary AS
SELECT 
	m.movie_id,
    m.title,
    ROUND(AVG(r.rating),2) AS AverageRating,
    COUNT(r.rating_id) AS Total_Reviews
FROM Movies m
LEFT JOIN Ratings r on m.movie_id = r.movie_id
GROUP BY m.movie_id;

-- Count of Movies a Actor as Acted On
CREATE VIEW Actor_Movie_Count AS
SELECT
	a.actor_id,
    a.name,
    COUNT(ma.movie_id) AS Total_Movies
FROM Actors a
LEFT JOIN Movie_Actor ma on a.actor_id = ma.actor_id
Group by a.actor_id;


--  ------------------------------------------------------------------------------------------
-- 												Stored Procedures
-- -------------------------------------------------------------------------------------------

-- Stored Procedure for Adding a New Movies
DROP PROCEDURE IF EXISTS add_movie;
DELIMITER //
CREATE PROCEDURE add_movie(
	IN p_title Varchar(255),
    IN p_year INT,
    IN p_duration INT,
    IN p_desc_id INT,
    IN p_director INT,
    IN p_syn TEXT
)
BEGIN
	INSERT INTO Movies (title,release_year,duration,description_id,director_id,synopsis)
    VALUES (p_title,p_year,p_duration,p_desc_id,p_director,p_syn);
END //
DELIMITER ;

CALL add_movie('Interstellar',2014,169,16,1,'Space Exploration Sci-Fi Film');

DELIMITER //
CREATE PROCEDURE add_movie_ratings(
	IN p_user INT,
    IN p_movie INT,
    IN p_rating INT,
    IN p_review TEXT
)
BEGIN
	INSERT INTO Ratings (user_id,movie_id,rating,review)
    VALUES (p_user,p_movie,p_rating,p_review);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE movies_by_genre( IN p_genre Varchar(50))
BEGIN
	SELECT m.title,m.release_year
    FROM Movies m
    JOIN Movie_Genre mg on m.movie_id = mg.movie_id
    JOIN Genres g on mg.genre_id = g.genre_id
    WHERE g.genre_name = p_genre;
END //
DELIMITER ;

CALL movies_by_genre('Sci-Fi');

SHOW Procedure STATUS LIKE 'movie_by_genre';

--------------------------------------------------------------------------------------------
-- ---------------------------------------- Trigger ----------------------------------------
-- -----------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER prevent_duplicate_ratings
BEFORE INSERT ON Ratings
FOR EACH ROW
BEGIN
	IF (SELECT COUNT(*) FROM Ratings
		WHERE user_id = NEW.user_id AND movie_id = NEW.movie_id) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET message_text = 'User already rated this movie. ';
	END IF;
END //
DELIMITER ;


-- Auto Update Average rating in Moviees Table
ALTER TABLE movies ADD avg_rating FLOAT DEFAULT NULL;

DELIMITER //
CREATE TRIGGER update_average_rating
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
    UPDATE movies
    SET avg_rating = (SELECT AVG(rating) FROM ratings WHERE movie_id = NEW.movie_id)
    WHERE movie_id = NEW.movie_id;
END //
DELIMITER ;

-- Trigger to Log Deleted Movies

-- LOG Table for Deleted Movies
CREATE TABLE Movie_Log(
	log_id INT auto_increment primary key,
    movie_id INT,
    title VARCHAR(255),
    deleted_at timestamp default current_timestamp
);

-- Trigger for Deleted Movies
DELIMITER //
CREATE TRIGGER log_movie_delete
BEFORE DELETE ON Movies
FOR EACH ROW
BEGIN
	INSERT INTO Movie_Log(movie_id, title)
    VALUES (OLD.movie_id,OLD.title);
END //
DELIMITER ;

    