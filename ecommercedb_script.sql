

---create a table in ecommerce database --- 
CREATE TABLE Customers(customer_oder INT(5), customer_name VARCHAR(25), Customer_email VARCHAR(25), customer_number INT(15));

---detail tables---
SHOW TABLES;

DESC Customers;

---add primary in Customers tables ---
ALTER TABLE Customers ADD CONSTRAINT PK_Customers