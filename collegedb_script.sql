/*
@Author: Sujan Magar
@date: 2024 - 08 - 09



*/


mysql -u root -p
SHOW DATABASE;
CREATE DATABASE collegedb;
USE collegedb;
CREATE TABLE Course(c_code INT(5), c_name VARCHAR(25), c_credit INT(3), c_duration INT(2));
RENAME TABLE Course to Courses;
SHOW TABLES;
DESC Course;

ALTER TABLE Courses ADD CONSTRAINT PK_Courses PRIMARY KEY (c_code);
ALTER TABLE Courses ADD total_fee INT(10);

--setting constraints name (UC--> unique constraints)
ALTER TABLE Courses ADD CONSTRAINT UC_Coursename UNIQUE (c_name):

--does not work
ALTER TABLE Courses RENAME COLUMN total_fee TO c_fee;

ALTER TABLE Courses CHANGE COLUMN `total_fee` `c_fee` INT(10);


---create Student table ---

--create student table with foreign key
CREATE TABLE Students(roll_name INT(5) PRIMARY KEY, name VARCHAR(30) NOT NULL,
email VARCHAR(30) UNIQUE, Course_code INT(5) NOT NULL,
FOREIGN KEY(Course_code) REFERENCES Courses(c_code));

---create Subject Table---
CREATE TABLE Subjects(s_code INT(5) PRIMARY KEY, s_name VARCHAR(25), s_credit INT(3));


CREATE TABLE Course_Subjects(Course_code INT(5), subject_code INT(5),
PRIMARY KEY(Course_code, subject_code),
FOREIGN KEY(Course_code) REFERENCES Courses(c_code),
FOREIGN KEY(subject_code) REFERENCES Subjects(s_code));