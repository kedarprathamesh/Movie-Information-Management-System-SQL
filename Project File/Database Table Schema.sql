drop database movie_database_system;

create database movie_database_system;
use movie_database_system;

create table Directors(
	director_id int auto_increment primary key,
    name varchar(255) not null,
    birth_year int,
    nationality varchar(100),
    biography TEXT
);

CREATE TABLE Movies(
	movie_id INT auto_increment primary key,
    title varchar(255) not null,
    release_year INT,
    duration INT,
    description_id INT,
	director_id INT,
    synopsis TEXT,
    foreign key(director_id) references Directors(director_id),
    Index(title),
    Index(release_year), 
    rating_avg int
);

create table Actors(
	actor_id int auto_increment primary key,
    name varchar(255) not null,
    birth_year int,
	nationality varchar(100), 
    biography TEXT
);

create table Genres(
	genre_id int auto_increment primary key,
    genre_name varchar(50) not null
);

create table Users(
	user_id int auto_increment primary key,
    user_name varchar(50) unique not null,
    email varchar(255),
    created_at timestamp default current_timestamp
);

create table Ratings(
	rating_id int auto_increment primary key,
    user_id int,
    movie_id int,
    rating int check(rating between 1 and 10),
    review TEXT,
    created_at timestamp default current_timestamp,
    foreign key (user_id) references Users(user_id),
    foreign key (movie_id) references Movies(movie_id)
);

create table Movie_Actor(
	movie_id int,
    actor_id int,
    role_name varchar(255),
    primary key (movie_id, actor_id),
    foreign key (movie_id) references Movies(movie_id),
    foreign key (actor_id) references Actors(actor_id)
);

create table Movie_Genre(
	movie_id INT,
    genre_id INT,
    primary key (movie_id, genre_id),
    foreign key (movie_id) references Movies(movie_id),
    foreign key (genre_id) references Genres(genre_id)
);

