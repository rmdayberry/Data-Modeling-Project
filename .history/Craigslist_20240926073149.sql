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
  name VARCHAR(50) NOT NULL
);