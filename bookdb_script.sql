--create the book database --
CREATE DATABASE book_db;
USE book_db;

--Create table for book database --

--Author--
CREATE TABLE Authors(auth_id INT(5), auth_name VARCHAR(25), auth_email VARCHAR(25));

ALTER TABLE Authors CHANGE auth_code auth_id INT(5);
ALTER TABLE Authors ADD CONSTRAINT PK_Authors PRIMARY KEY (auth_id);

--Insert data on Author--
INSERT INTO Authors (auth_id, auth_name, auth_email) VALUES
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Robert Brown', 'robertbrown@example.com'),
(4, 'Emily Davis', 'emilydavis@example.com'),
(5, 'Michael Johnson', 'michaeljohnson@example.com');

--Book--
CREATE TABLE Books(isbn INT(5), book_name VARCHAR(25), publishers VARCHAR(25));

ALTER TABLE Books CHANGE isbn isbn_id INT(14);
ALTER TABLE Books ADD CONSTRAINT PK_Books PRIMARY KEY (isbn_id);

--Insert data on Books--
INSERT INTO Books (isbn_id, book_name, publishers) VALUES
(101, 'Introduction to SQL', 'Reilly Media'),
(102, 'Learning Python', 'Addison-Wesley'),
(103, 'Data Structures', 'McGraw-Hill'),
(104, 'Computer Networks', 'Pearson'),
(105, 'Operating Systems', 'Wiley');

--Author_Book--
CREATE TABLE Author_Book(auth_id INT(5), isbn_id INT(14));

--Add Foreign Key on Author_Book--
ALTER TABLE Author_Book
ADD CONSTRAINT FK_AuthorBook_AuthID FOREIGN KEY (auth_id) REFERENCES Authors(auth_id),
ADD CONSTRAINT FK_AuthorBook_ISBNID FOREIGN KEY (isbn_id) REFERENCES Books(isbn_id);

--Insert data to Auther_Book--
INSERT INTO Author_Book(auth_id, isbn_id) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);
 


--publisher--
CREATE TABLE publishers(publisher_id INT(5), publisher_name VARCHAR(25), publisher_email VARCHAR(25));

RENAME TABLE publishers to Publishers;
ALTER TABLE Publishers ADD CONSTRAINT PK_Publishers PRIMARY KEY (publisher_id);

--Insert data to Publisher--
INSERT INTO Publishers (publisher_id, publisher_name, publisher_email) VALUES
(1, 'Reilly Media', 'contact@oreilly.com'),
(2, 'Addison-Wesley', 'info@addisonwesley.com'),
(3, 'McGraw-Hill', 'support@mcgrawhill.com'),
(4, 'Pearson', 'help@pearson.com'),
(5, 'Wiley', 'service@wiley.com');


--Reviews--
CREATE TABLE Reviews(review_id INT(5), review_description VARCHAR(25), isbn VARCHAR(25));

ALTER TABLE Reviews ADD CONSTRAINT PK_Reviews PRIMARY KEY (review_id);

--Insert data to Reviews --
INSERT INTO Reviews (review_id, review_description, isbn) VALUES
(1, 'Great introduction!', '101'),
(2, 'Very informative.', '102'),
(3, 'Well written.', '103'),
(4, 'Comprehensive guide.', '104'),
(5, 'Excellent resource.', '105');
