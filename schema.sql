/* Personal Item Catalogue Database
   Tables: Book, Game, MusicAlbum, Genre, Label, & Author
*/

-- Creating a database called 'catalog_of_things'
CREATE DATABASE catalog_of_things;

/* Creating 'Genre' table in 'catalog_of_things' database
   Table has columns: id, and name
   Constraints: id as the primary key
*/
CREATE TABLE genre(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);

/* Creating 'MusicAlbum' table in 'catalog_of_things' database
   Table has columns: id, genre_id, author_id, label_id, name,
                      publish_date, archived, and on_spotify
   Constraints: id as the primary key
                genre_id linked to id from genre table
                author_id linked to id from author table
                label_id linked to id from label table
*/

CREATE TABLE music_album(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    name    VARCHAR(100),
    publish_date  DATE,
    archived      BOOLEAN,
    on_spotify VARCHAR(100),

    CONSTRAINT fk_genre_id FOREIGN KEY(genre_id) REFERENCES genre(id),

    CONSTRAINT fk_author_id FOREIGN KEY(author_id) REFERENCES author(id),

    CONSTRAINT fk_label_id FOREIGN KEY(label_id) REFERENCES label(id)
);
