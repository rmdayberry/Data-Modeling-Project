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

INSERT INTO players (first_name, last_name, team_id, position, jersey_number)
VALUES 
('Lionel', 'Messi', 1, 'Forward', 10),   -- Plays for Lions
('Cristiano', 'Ronaldo', 2, 'Forward', 7), -- Plays for Sharks
('Kylian', 'Mbappe', 3, 'Forward', 11),  -- Plays for Eagles
('Virgil', 'van Dijk', 1, 'Defender', 4), -- Plays for Lions
('Neymar', 'Jr', 2, 'Midfielder', 10),   -- Plays for Sharks
('Mohamed', 'Salah', 3, 'Forward', 11);  -- Plays for Eagles

INSERT INTO referees (first_name, last_name, years_of_experience)
VALUES 
('Mark', 'Clattenburg', 12),
('Bjorn', 'Kuipers', 18);

INSERT INTO seasons (start_date, end_date)
VALUES 
('2023-03-01', '2023-11-30'),
('2024-03-01', '2024-11-30');

INSERT INTO matches (home_team_id, away_team_id, referee_id, season_id, match_date, home_team_score, away_team_score)
VALUES 
(1, 2, 1, 1, '2023-05-05', 1, 1),  -- Lions vs Sharks
(3, 1, 2, 1, '2023-06-15', 3, 2),  -- Eagles vs Lions
(2, 3, 1, 2, '2024-04-20', 0, 1);  -- Sharks vs Eagles

