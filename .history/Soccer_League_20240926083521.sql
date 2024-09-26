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

CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  home_team_id INT REFERENCES teams(id),
  away_team_id INT REFERENCES teams(id),
  referees_id INT REFERENCES referees(id),
  season_id INT REFERENCES seasons(id),
  match_date DATE NOT NULL,
  home_team_score INT DEFAULT 0,
  away_team_score INT DEFAULT 0,
)