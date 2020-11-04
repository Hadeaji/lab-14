-- Query 1: This query will create a table named AUTHORS in lab14_normal database
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Query 2: This one will insert unique author names from the books table
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

-- Query 3: Alter the books table to add a column named author_id.
ALTER TABLE books ADD COLUMN author_id INT;

-- Query 4: will prepare the connection by stting the id value for the author table as the value for the author_id
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

-- Query 5: Removing the authors column from the books table 
ALTER TABLE books DROP COLUMN author;

-- Query 6: This query will set author_id as a foreign key for authors table. Now PostgreSQL knows HOW these 2 tables are connected.
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
