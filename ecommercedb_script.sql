-- Create the e-commerce database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Create the Category table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Create the Product table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create the Customer table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    address TEXT
);

-- Create the CustomerOrder table
CREATE TABLE CustomerOrder (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INT,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Create the OrderDetails table to link orders with products
CREATE TABLE OrderDetails (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES CustomerOrder(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Sample data insertion
INSERT INTO Category (category_name, description) VALUES 
('Electronics', 'Devices and gadgets'),
('Books', 'Various genres of books'),
('Clothing', 'Men, women, and kids clothing');

INSERT INTO Product (product_name, description, price, stock_quantity, category_id) VALUES 
('Smartphone', 'Latest model smartphone', 699.99, 50, 1),
('Laptop', 'High-performance laptop', 999.99, 30, 1),
('Novel', 'Bestselling novel', 19.99, 100, 2),
('T-shirt', 'Cotton T-shirt', 9.99, 200, 3);

INSERT INTO Customer (first_name, last_name, email, phone, address) VALUES 
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St, Anytown, USA'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Elm St, Anytown, USA');

INSERT INTO CustomerOrder (customer_id, total_amount) VALUES 
(1, 719.98),
(2, 19.99);

INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES 
(1, 1, 1, 699.99),
(1, 3, 1,
