CREATE TABLE item (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre TEXT,
  author TEXT,
  label TEXT,
  publish_date DATE,
  archived BOOLEAN,
);

-- Book class table
CREATE TABLE book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  publisher TEXT,
  cover_state TEXT,
);

-- Label class table
CREATE TABLE label (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT FOREIGN KEY REFERENCES item(id),
	title TEXT,
	color TEXT
);

-- Create a Game class table
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

-- Genre class table
CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  name VARCHAR
);

-- Music Album class table
CREATE TABLE music_album (
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
);
