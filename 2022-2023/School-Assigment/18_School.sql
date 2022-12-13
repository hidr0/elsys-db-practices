DROP DATABASE IF EXISTS MyDTB1;
CREATE DATABASE MyDTB1;
USE MyDTB1;

SET sql_safe_updates=0;
SET sql_mode=only_full_group_by;

CREATE TABLE Adress
(
	id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(50) NOT NULL
);

CREATE TABLE School
(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Class
(
	id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL CHECK(class > 0 && class < 13),
    paralelka VARCHAR(50) CHECK(paralelka LIKE "A" || paralelka LIKE "B" || paralelka LIKE "V"),
    school_id int NOT NULL UNIQUE,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student
(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    age int NOT NULL CHECK(age > 0),
    adress_id int NOT NULL UNIQUE,
    FOREIGN KEY (adress_id) REFERENCES Adress(id),
    class_id int NOT NULL UNIQUE,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Subject
(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Bel", "Math", "Sports")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    grade float NOT NULL CHECK(grade > 1 && grade < 7),
    date DATE NOT NULL,
    CONSTRAINT one_grade UNIQUE(student_id, subject_id, date)
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("Sports");

INSERT INTO School(name) VALUES("TUES");
INSERT INTO School(name) VALUES("SMG");
INSERT INTO School(name) VALUES("76-to");
INSERT INTO School(name) VALUES("NTBG");

INSERT INTO Adress(street) VALUES("Malo Buchino");
INSERT INTO Adress(street) VALUES("Geo MileW");
INSERT INTO Adress(street) VALUES("Suhata Reka");

INSERT INTO Class(class, paralelka, school_id) VALUES(11, "V", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(11, "V", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(11, "V", 3);

INSERT INTO Student(name, age, adress_id, class_id) VALUES("Momchil", 18, 1, 1);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Nikola", 17, 2, 2);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Radoslav", 17, 3, 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-10-22");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 6, "2022-10-23");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 6, "2022-10-24");

-- 1
SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.name
ORDER BY COUNT(Student.id) desc;

