CREATE DATABASE movieDB;

USE movieDB;


CREATE TABLE language_tb (
    LanguageID INT AUTO_INCREMENT PRIMARY KEY,
    languageName VARCHAR(20) NOT NULL
);

CREATE TABLE ratings_tb (
    RatingsID INT AUTO_INCREMENT PRIMARY KEY,
    RatingNumber DECIMAL(3,1),
    sauerce VARCHAR(10)
);

CREATE TABLE crew_tb (
    CrewID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE movies_tb (
    movieID INT AUTO_INCREMENT PRIMARY KEY,
    crewID INT,
    languageID INT,
    movieTitle VARCHAR(20) NOT NULL,
    releaseYear VARCHAR(5),
    description VARCHAR(30),
    ratings INT,
    movieLength INT,
    CONSTRAINT fk_crewtb_movietb FOREIGN KEY (crewID) REFERENCES crew_tb(CrewID),
    CONSTRAINT fk_language_movies FOREIGN KEY (languageID) REFERENCES language_tb(LanguageID),
    CONSTRAINT fk_ratingsTB_moviesTB FOREIGN KEY (ratings) REFERENCES ratings_tb(RatingsID)
);


CREATE TABLE actors_tb (
    ActorsID INT AUTO_INCREMENT PRIMARY KEY,
    Firstname VARCHAR(15),
    Lastname VARCHAR(15),
    Nationality VARCHAR(20),
    EmailAddress VARCHAR(50) UNIQUE,
    gender VARCHAR(2)
);

CREATE TABLE directors_tb (
    DirectorsID INT AUTO_INCREMENT PRIMARY KEY,
    Firstname VARCHAR(15),
    Lastname VARCHAR(15),
    Nationality VARCHAR(20),
    EmailAddress VARCHAR(50) UNIQUE,
    gender VARCHAR(2)
);

CREATE TABLE genre_tb (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(20)
);

CREATE TABLE Movie_Genre (
    MovieID INT,
    GenreID INT,
    CONSTRAINT fk_movie_genre FOREIGN KEY (MovieID) REFERENCES movies_tb(movieID),
    CONSTRAINT fk_genre_movie FOREIGN KEY (GenreID) REFERENCES genre_tb(GenreID)
);

CREATE TABLE Crew_Actors (
    CrewID INT,
    ActorsID INT,
    CONSTRAINT fk_crewActors_crewTB FOREIGN KEY (CrewID) REFERENCES crew_tb(CrewID),
    CONSTRAINT fk_crewActors_actorsTB FOREIGN KEY (ActorsID) REFERENCES actors_tb(ActorsID)
);

CREATE TABLE Crew_Directors (
    CrewID INT,
    DirectorsID INT,
    CONSTRAINT fk_crewDirectors_crewTB FOREIGN KEY (CrewID) REFERENCES crew_tb(CrewID),
    CONSTRAINT fk_crewDirectors_DirectorsTB FOREIGN KEY (DirectorsID) REFERENCES directors_tb(DirectorsID)
);

SHOW TABLES;

SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'movieDB';

INSERT into language_tb (languageName) values ('english');