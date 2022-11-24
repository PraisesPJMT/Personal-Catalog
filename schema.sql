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
