/* Personal Item Catalogue Database
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
