--create database catalo_of_things
CREATE DATABASE catalog_of_things;

CREATE TABLE genre(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);

---Label table--
CREATE TABLE label (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	title TEXT,
	color TEXT
);

-- authors table
CREATE TABLE author (
 id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
 first_name VARCHAR(150) NOT NULL,
 last_name VARCHAR(150) NOT NULL,
);


CREATE TABLE music_album(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    name    VARCHAR(100),
    publish_date  DATE,
    archived      BOOLEAN,
    on_spotify    BOOLEAN

    CONSTRAINT fk_genre_id FOREIGN KEY(genre_id) REFERENCES genre(id),

    CONSTRAINT fk_author_id FOREIGN KEY(author_id) REFERENCES author(id),

    CONSTRAINT fk_label_id FOREIGN KEY(label_id) REFERENCES label(id)
);
--games table
CREATE TABLE games (
 id SERIAL PRIMARY KEY,
 multiplayer INT,
 last_played_at DATE NOT NULL,
 publish_date DATE NOT NULL,
 archived BOOLEAN
);

---Book class table--
CREATE TABLE book (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  author_id INT FOREIGN KEY REFERENCES author(id),
  genre_id INT FOREIGN KEY REFERENCES genre(id),
  label_id INT FOREIGN KEY REFERENCES label(id),
  publisher TEXT,
  cover_state TEXT,
  archived BOOLEAN
);
