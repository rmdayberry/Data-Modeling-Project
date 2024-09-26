CREATE TABLE teams(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  founded_yr INT
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  team_id INT REFERENCES teams(id),
  position VARCHAR(50) NOT NULL,
  jersey_number INT
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  years_of_experience INT
);