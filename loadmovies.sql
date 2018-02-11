-- loadmovies.sql

DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS reviewers;

CREATE TABLE movies (
	movieID char(3) PRIMARY KEY,
    title varchar(75) NOT NULL,
    MPAARating char(5),
    length integer,
    CHECK (MPAARating in ('G','PG','PG-13','R','NC-17'))
	);
  
LOAD DATA LOCAL INFILE 'C:/Users/Steve Tipton/Documents/CUNY/R WD/Movies/movie.csv' 
INTO TABLE movies 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE reviewers (
	reviewerID char(3) PRIMARY KEY,
	firstName varchar(20) NOT NULL,
	lastName varchar(40) NOT NULL,
	age integer
	);
  
LOAD DATA LOCAL INFILE 'C:/Users/Steve Tipton/Documents/CUNY/R WD/Movies/reviewer.csv' 
INTO TABLE reviewers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE ratings (
	movieID char(3) NOT NULL,
    reviewerID char(3) NOT NULL,
    numStars integer NOT NULL,
    comments varchar(150),
    CONSTRAINT PK_ratings PRIMARY KEY (movieID, reviewerID),
    FOREIGN KEY (movieID) REFERENCES movies(movieID),
    FOREIGN KEY (reviewerID) REFERENCES reviewers(reviewerID),
    CHECK (numStars BETWEEN 1 AND 5)
	);

LOAD DATA LOCAL INFILE 'C:/Users/Steve Tipton/Documents/CUNY/R WD/Movies/rating.csv' 
INTO TABLE ratings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT 'movies', COUNT(*) FROM movies
  UNION
SELECT 'reviewers', COUNT(*) FROM reviewers
  UNION
SELECT 'ratings', COUNT(*) FROM ratings;


