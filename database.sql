--create the database
CREATE DATABASE bookstore_db;

--use the database created
USE bookstore_db;

--create the table for publisher 
CREATE TABLE publisher (
publisher_ID INT AUTO_INCREMENT PRIMARY KEY,
publisher_name VARCHAR(100) NOT NULL
);

--create the table for author
CREATE TABLE author (
 author_ID INT PRIMARY KEY AUTO_INCREMENT,
 author_name VARCHAR(100) NOT NULL,
 author_age INT NOT NULL,
 author_nationality VARCHAR(100) NOT NULL,
 author_bio VARCHAR (100) 
);

--create the table for boook_language 
CREATE TABLE book_language (
 language_ID INT AUTO_INCREMENT PRIMARY KEY,
 language_code CHAR(2) NOT NULL,
 language_name VARCHAR(50) NOT NULL
);

--create the table for bookS
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_ID INT NOT NULL,
    publisher_ID INT,
    language_ID INT,
    publication_date DATE,
    genre VARCHAR(100),
    edition VARCHAR(40),
    price DECIMAL(10,2) NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    quantity_in_stock INT DEFAULT 0,
    page_count INT,
     FOREIGN KEY (publisher_ID) REFERENCES publisher(publisher_ID),
	FOREIGN KEY (language_ID) REFERENCES book_language(language_ID)
);