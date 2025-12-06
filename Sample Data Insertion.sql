use movie_database_system;

INSERT INTO Directors (name, birth_year, nationality, biography)
VALUES
('Christopher Nolan', 1970, 'British-American', 'Known for mind-bending films.'),
('Steven Spielberg', 1946, 'American', 'Iconic blockbuster filmmaker.'),
('Quentin Tarantino', 1963, 'American', 'Known for dialogue-driven crime films.'),
('James Cameron', 1954, 'Canadian', 'Master of sci-fi epics.'),
('Martin Scorsese', 1942, 'American', 'Legendary crime and drama director.'),
('Ridley Scott', 1937, 'British', 'Famous for atmospheric sci-fi and historical films.'),
('Peter Jackson', 1961, 'New Zealander', 'Creator of The Lord of the Rings trilogy.'),
('Denis Villeneuve', 1967, 'Canadian', 'Known for deep sci-fi storytelling.'),
('Guy Ritchie', 1968, 'British', 'Stylish crime and comedy director.'),
('Tim Burton', 1958, 'American', 'Dark gothic fantasy filmmaker.'),
('Ron Howard', 1954, 'American', 'Versatile drama and adventure director.'),
('J.J. Abrams', 1966, 'American', 'Sci-fi and action specialist.'),
('Clint Eastwood', 1930, 'American', 'Actor and filmmaker known for gritty dramas.'),
('Wes Anderson', 1969, 'American', 'Distinct colorful film style.'),
('Sofia Coppola', 1971, 'American', 'Drama-focused filmmaker.');

INSERT INTO Movies (title, release_year, duration, description_id, director_id, synopsis, rating_avg)
VALUES
('Inception', 2010, 148, NULL, 1, 'Dream heist thriller.', 9),
('Jurassic Park', 1993, 127, NULL, 2, 'Dinosaurs return.', 8),
('Pulp Fiction', 1994, 154, NULL, 3, 'Non-linear crime tale.', 9),
('Avatar', 2009, 162, NULL, 4, 'Humans vs Na\'vi.', 8),
('The Wolf of Wall Street', 2013, 180, NULL, 5, 'Excess on Wall Street.', 8),
('Gladiator', 2000, 155, NULL, 6, 'Roman general seeks revenge.', 9),
('The Lord of the Rings: Fellowship', 2001, 178, NULL, 7, 'Ring quest begins.', 9),
('Dune', 2021, 155, NULL, 8, 'Spice wars on Arrakis.', 8),
('Sherlock Holmes', 2009, 128, NULL, 9, 'Detective adventure.', 7),
('Edward Scissorhands', 1990, 105, NULL, 10, 'Gentle man with scissors.', 8),
('Apollo 13', 1995, 140, NULL, 11, 'Failed moon mission.', 8),
('Star Wars: The Force Awakens', 2015, 138, NULL, 12, 'New galactic threat.', 8),
('Gran Torino', 2008, 116, NULL, 13, 'Grumpy war veteran.', 8),
('The Grand Budapest Hotel', 2014, 99, NULL, 14, 'Hotel adventure.', 8),
('Lost in Translation', 2003, 102, NULL, 15, 'Actors bond in Tokyo.', 8);

INSERT INTO Actors (name, birth_year, nationality, biography)
VALUES
('Leonardo DiCaprio', 1974, 'American', 'Award-winning actor.'),
('Samuel L. Jackson', 1948, 'American', 'Prolific actor.'),
('Jeff Goldblum', 1952, 'American', 'Known for sci-fi roles.'),
('Tom Hardy', 1977, 'British', 'Intense dramatic performer.'),
('Cate Blanchett', 1969, 'Australian', 'Highly versatile actress.'),
('Johnny Depp', 1963, 'American', 'Famous for eccentric roles.'),
('Matt Damon', 1970, 'American', 'Award-winning actor.'),
('Scarlett Johansson', 1984, 'American', 'Sci-fi and action star.'),
('Ian McKellen', 1939, 'British', 'Renowned stage and film actor.'),
('Timothee Chalamet', 1995, 'American', 'Rising star in dramas.'),
('Keanu Reeves', 1964, 'Canadian', 'Action icon.'),
('Robert Downey Jr.', 1965, 'American', 'Marvel superstar.'),
('Morgan Freeman', 1937, 'American', 'Legendary narrator and actor.'),
('Brad Pitt', 1963, 'American', 'Award-winning actor.'),
('Emma Watson', 1990, 'British', 'Known for the Harry Potter series.');


INSERT INTO Genres (genre_name)
VALUES
('Action'),
('Sci-Fi'),
('Drama'),
('Adventure'),
('Crime'),
('Fantasy'),
('Romance'),
('Thriller'),
('Mystery'),
('Comedy'),
('Horror'),
('Biography'),
('History'),
('Animation'),
('Family');

INSERT INTO Users (user_name, email)
VALUES
('alpha', 'alpha@example.com'),
('beta', 'beta@example.com'),
('cinema_fan', 'fan1@example.com'),
('critic_jane', 'jane@example.com'),
('moviebuff123', 'buff@example.com'),
('john_doe', 'john@example.com'),
('viewer007', 'viewer@example.com'),
('film_geek', 'geek@example.com'),
('luna', 'luna@example.com'),
('max', 'max@example.com'),
('reviewer_pro', 'pro@example.com'),
('anna', 'anna@example.com'),
('chris', 'chris@example.com'),
('tony', 'tony@example.com'),
('oliver', 'oliver@example.com');

INSERT INTO Ratings (user_id, movie_id, rating, review)
VALUES
(1,1,9,'Excellent.'),
(2,2,8,'Great classic.'),
(3,3,10,'Masterpiece.'),
(4,4,9,'Visually stunning.'),
(5,5,8,'Intense and wild.'),
(6,6,9,'Epic and emotional.'),
(7,7,10,'A fantasy landmark.'),
(8,8,9,'Deep and immersive.'),
(9,9,7,'Fun detective story.'),
(10,10,8,'Beautiful and unique.'),
(11,11,8,'Suspenseful and well-made.'),
(12,12,9,'Great revival of the saga.'),
(13,13,8,'Thoughtful and strong.'),
(14,14,9,'Amazing visuals and humor.'),
(15,15,8,'Soft and emotional.');

INSERT INTO Movie_Actor (movie_id, actor_id, role_name)
VALUES
(1,1,'Dom Cobb'),
(3,2,'Jules Winnfield'),
(2,3,'Dr. Ian Malcolm'),
(1,4,'Eames'),
(6,5,'Lucilla'),
(10,6,'Edward'),
(11,7,'Jim Lovell'),
(12,8,'Rey'),
(7,9,'Gandalf'),
(8,10,'Paul Atreides'),
(4,11,'Jake Sully'),
(9,12,'Sherlock Holmes'),
(13,13,'Walt'),
(14,14,'Gustave H.'),
(15,15,'Charlotte');

INSERT INTO Movie_Genre (movie_id, genre_id)
VALUES
(1,1),
(1,2),
(2,4),
(3,5),
(4,2),
(5,12),
(6,1),
(7,6),
(8,2),
(9,8),
(10,7),
(11,13),
(12,1),
(14,10),
(15,3);


