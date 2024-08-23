
--- the CREATE DATABASE staments is used to create a new SQL statement ---
CREATE DATABASE learndb;

--- the DROP DATABASE statement is used to drop an existing SQL databases ---
DROP DATABASE learndb;

--- the BACKUP DATABASE statement is used in SQL server to create a full back up of an existing SQL Database ---
BACKUP DATABASE learndb
TO DISK = 'filepath';

--- the CREATE TABLE statements is used to create a new table in a datbase;
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Location  varchar(255),
    City varchar(255),
    
);