--  create a games table
CREATE TABLE games (
 id SERIAL PRIMARY KEY,
 multiplayer INT,
 last_played_at DATE NOT NULL,
 item_id INT REFERENCES item(id)
 publish_date DATE NOT NULL,
 archived BOOLEAN
);

-- create authors table
CREATE TABLE authors (
 id SERIAL PRIMARY KEY,
 first_name VARCHAR(150) NOT NULL,
 last_name VARCHAR(150) NOT NULL,
 item_id INT REFERENCES item(id)
);