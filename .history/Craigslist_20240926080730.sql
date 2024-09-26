CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  preferred_region_id INT REFERENCES regions(id)
);
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  user_id INT REFERENCES users(id),
  location VARCHAR(100),
  region_id INT REFERENCES regions(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE post_categories (
  post_id INT REFERENCES posts(id),
  category_id INT REFERENCES categories(id),
  PRIMARY KEY (post_id, category_id)
);

INSERT INTO regions (name)
VALUES 
('San Francisco'),
('Austin'),
('Boston')
;

INSERT INTO users (username, email, preferred_region_id)
VALUES 
('marin_girl123', 'marin_girl123@hmail.com', 1), -- prefers SF
('cowboyqueen', 'yeehaw22@hmail.com', 2), -- prefers Austin
('harvardmed09', 'sarahmitchell@harvard.edu', 3) -- prefers Boston
;

INSERT INTO posts (title, content, user_id, location, region_id)
VALUES 
('Puppy Adoption', '8 week old cattle dog puppy available for adoption', 1, 'Marin', 1),
('Two-Step Lessons', 'Hourly two-step dance lessons-- meet at Texas Bar', 2, 'Downtown',2),
('Looking for Volunteers', 'Seeking volunteer physicians for health clinic', 3, 'Cambridge',3)
;

INSERT INTO categories (name)
VALUES 
('Volunteer'),
('Pets'),
('Lessons');

INSERT INTO post_categories (post_id, category_id)
VALUES
(1, 2),--Puppy adoption post in Pets Category
(2,3), -- Two Step lesson post in Lessons category 
(3,1);-- Volunteer Physicians post in Volunteer category

