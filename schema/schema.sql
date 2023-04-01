-- Create Books table
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR,
  cover_state VARCHAR,
  genre_id INT NULL REFERENCES genres(id),
  author_id INT NULL REFERENCES authors(id),
  label_id INT NULL REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

-- Create Labels tables
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL
);

-- Game class table
CREATE TABLE game (
  id SERIAL PRIMARY KEY ,
  item_id INT FOREIGN KEY REFERENCES item(id),
  multiplayer VARCHAR,
  last_played_at DATE,
  publish_date DATE,
);

-- Author class table
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  first_name VARCHAR,
  last_name VARCHAR
);