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


--To select the data from tables--
SELECT * FROM Subjects;

--Data Manipulation Language (DML)

INSERT INTO Courses VALUES(c_code, c_name, c_credit, c_duration, c_fee) VALUES(1, "BCA", 120, 4, 400000);

INSERT INTO Students VALUES(1, "Ram Thapa", "ram@gamil.com", 1);



--Insert to Subjects--
INSERT INTO Subjects VALUES(123, "Java", 120);
INSERT INTO Subjects VALUES(180, "Mathematics I", 60), (612, "Software Engineering", 150), (170, "Machine Learning", 170);

--Insert data to Course_Subjects--
INSERT INTO Course_Subjects VALUES