-- Creating a database called 'catalog_of_things'
CREATE DATABASE catalog_of_things;

--  create a games table
CREATE TABLE games (
 id SERIAL PRIMARY KEY,
 multiplayer INT,
 last_played_at DATE NOT NULL,
 item_id INT REFERENCES item(id)
 publish_date DATE NOT NULL,
 archived BOOLEAN
);
---create Book class table--
CREATE TABLE book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  publisher TEXT,
  cover_state TEXT,
);

---create Label table--
CREATE TABLE label (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  item_id INT FOREIGN KEY REFERENCES item(id),
	title TEXT,
	color TEXT
);

-- create authors table
CREATE TABLE authors (
 id SERIAL PRIMARY KEY,
 first_name VARCHAR(150) NOT NULL,
 last_name VARCHAR(150) NOT NULL,
 item_id INT REFERENCES item(id)
);

CREATE TABLE genre(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);
