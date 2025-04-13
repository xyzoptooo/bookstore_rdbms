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


--create the table for country
CREATE TABLE country (
  country_ID INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(50) NOT NULL
);

--create the table for address status
CREATE TABLE address_status (
    status_ID INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(20) NOT NULL
);

--create the table for address
CREATE TABLE address (
    address_ID INT AUTO_INCREMENT PRIMARY KEY,
    street_number VARCHAR(10),
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country_id INT NOT NULL,
    FOREIGN KEY (country_ID) REFERENCES country(country_ID)
);

--create the table for customer 
CREATE TABLE customer (
    customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 

--create the table for customer address
CREATE TABLE customer_address (
    customer_ID INT NOT NULL,
    address_ID INT NOT NULL,
    status_id INT NOT NULL,
    PRIMARY KEY (customer_ID, address_ID),
     FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID),
     FOREIGN KEY (address_ID) REFERENCES address(address_ID),
     FOREIGN KEY (status_ID) REFERENCES address_status(status_ID)
);


--create the table for shipping_method
CREATE TABLE shipping_method (
    method_ID INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL,
    cost DECIMAL(10,2) NOT NULL
);

--create the table for order_status
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(20) NOT NULL
);

--create the table for customer_order
CREATE TABLE cust_order (
    order_ID INT AUTO_INCREMENT PRIMARY KEY,
    customer_ID INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    address_ID INT NOT NULL,
    order_total DECIMAL(10,2) NOT NULL,
    all_orders INT,
    shipping_method_ID INT,
     FOREIGN KEY (customer_id) REFERENCES customer(customer_ID),
     FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_ID),
     FOREIGN KEY (address_id) REFERENCES address(address_ID)
);

--create the table for order_LINE 
CREATE TABLE order_line (
    line_ID INT AUTO_INCREMENT PRIMARY KEY,
    order_ID INT NOT NULL,
    book_ID INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
	 FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
     FOREIGN KEY (book_id) REFERENCES book(book_id)
);

--Create the table for order_history
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (order_id) REFERENCES cust_order(order_id) ON DELETE CASCADE,
     FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);