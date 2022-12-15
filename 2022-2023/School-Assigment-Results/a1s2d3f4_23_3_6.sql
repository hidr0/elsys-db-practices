DROP DATABASE IF EXISTS MyDTB2;
CREATE DATABASE MyDTB2;
USE MyDTB2;

SET sql_safe_updates=0;
SET sql_mode=only_full_group_by;

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL check(class > 0 && class < 13),
    paralelka ENUM("A", "B", "V"),
    school_id int NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    age int NOT NULL check(age > 0),
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Adress(
	id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100) NOT NULL,
    student_id int NOT NULL UNIQUE,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Bel", "Math", "Sports")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    grade float NOT NULL check(grade BETWEEN 2 AND 6),
    date DATE NOT NULL
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("Sports");

INSERT INTO School(name) VALUES("TUES");
INSERT INTO School(name) VALUES("NPMG");
INSERT INTO School(name) VALUES("15to");
INSERT INTO School(name) VALUES("150to");

INSERT INTO Class(class, paralelka, school_id) VALUES(9, "A", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(10, "B", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(6, "V", 3);

INSERT INTO Student(name, age, class_id) VALUES("Gosho", 15, 1);
INSERT INTO Student(name, age, class_id) VALUES("Pesho", 13, 2);
INSERT INTO Student(name, age, class_id) VALUES("Maisie", 16, 3);

INSERT INTO Adress(street, student_id) VALUES("Botev", 1);
INSERT INTO Adress(street, student_id) VALUES("Lomsko shose", 2);
INSERT INTO Adress(street, student_id) VALUES("Levski", 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-10-22");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 6, "2022-10-23");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 6, "2022-10-24");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 2, 2, "2022-10-24");

-- 1

SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.name
ORDER BY COUNT(Student.id) DESC;

-- 2

SELECT School.name, AVG(Grade.grade) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Student.class_id = Class.id
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY School.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1;

-- 3

SELECT Grade.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name, Grade.date FROM Student
LEFT JOIN Grade ON Grade.student_id = Student.id
LEFT JOIN Subject ON Grade.subject_id = Subject.id
LEFT JOIN Class ON Class.id = Student.id
LEFT JOIN School ON School.id = Class.school_id;

-- 4

SELECT Student.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade ON Grade.student_id = Student.id
LEFT JOIN Subject ON Grade.subject_id = Subject.id
WHERE Student.name LIKE "M%e" AND MONTH(Grade.date) NOT IN (1,3,9) AND YEAR(Grade.date) = 2022 AND Subject.name IN ("Math", "Sports")
GROUP BY Student.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1; 

-- 5

SELECT School.name, Class.class, Class.paralelka, AVG(Grade.grade) FROM Class
LEFT JOIN School ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY Class.id
ORDER BY AVG(Grade.grade) ASC;

-- 6

SELECT DISTINCT Student.name, Subject.name FROM Student
LEFT JOIN Grade ON Grade.student_id = Student.id
LEFT JOIN Subject ON Grade.subject_id = Subject.id;

-- 7

SELECT School.name FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
WHERE Student.id IS NULL;
