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
  referee_id INT REFERENCES referees(id),
  season_id INT REFERENCES seasons(id),
  match_date DATE NOT NULL,
  home_team_score INT DEFAULT 0,
  away_team_score INT DEFAULT 0
);

CREATE TABLE goals (
  id SERIAL PRIMARY KEY,
  match_id INT REFERENCES matches(id),
  player_id INT REFERENCES players(id),
  goal_time TIME,
  goal_type VARCHAR(50)
);

CREATE TABLE standings(
  id SERIAL PRIMARY KEY,
  season_id INT REFERENCES seasons(id),
  team_id INT REFERENCES teams(id),
  games_played INT DEFAULT 0,
  wins INT DEFAULT 0,
  losses INT DEFAULT 0,
  draws INT DEFAULT 0,
  points INT DEFAULT 0
);

INSERT INTO teams (name, city, founded_yr)
VALUES 
('Lions', 'Chicago', 1998),
('Sharks', 'Miami', 2000),
('Eagles', 'Philadelphia', 1994);

