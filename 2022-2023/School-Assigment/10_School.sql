DROP DATABASE IF EXISTS DTB1;
CREATE DATABASE DTB1;
USE DTB1;

set sql_safe_updates = 0;
set sql_mode = only_full_group_by;

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL CHECK(class BETWEEN 1 AND 12),
    paralelka ENUM("A", "B", "V"),
    school_id int NOT NULL,
    FOREIGN KEY(school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL UNIQUE,
    age int NOT NULL CHECK(age > 0),
    class_id int NOT NULL,
    FOREIGN KEY(class_id) REFERENCES Class(id)
);

CREATE TABLE Address (
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(50) NOT NULL UNIQUE,
    student_id int NOT NULL UNIQUE,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Bel", "Math", "Sports")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int CHECK(grade BETWEEN 2 AND 6),
    date date NOT NULL,
    subject_id int NOT NULL,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY(student_id) REFERENCES Student(id)
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
INSERT INTO Student(name, age, class_id) VALUES("Ivan", 16, 3);

INSERT INTO Address(street, student_id) VALUES("Botev", 1);
INSERT INTO Address(street, student_id) VALUES("Lomsko shose", 2);
INSERT INTO Address(street, student_id) VALUES("Levski", 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-10-22");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 5, "2022-10-23");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 4, "2022-10-24");

-- 1)
SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
GROUP BY School.name
ORDER BY COUNT(Student.id) DESC;

-- 2)
SELECT School.name, AVG(Grade.grade) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY School.name
ORDER BY AVG(Grade.grade) DESC
LIMIT 1;

-- 3)
SELECT Student.name, Class.class, Class.paralelka, School.name, Grade.grade, Subject.name, Grade.date FROM Student
LEFT JOIN Class ON Student.class_id = Class.id
LEFT JOIN School ON School.id = Class.school_id
LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Subject.id = Grade.subject_id;

-- 4)
SELECT Student.name, AVG(Grade.grade) FROM Student, Class, Subject, Grade
WHERE Student.name LIKE("M%e")
AND Grade.student_id = Student.id
AND Grade.subject_id = Subject.id
AND Grade.date NOT LIKE("%-01-%") OR ("%-03-%") OR ("%-09-%")
AND Grade.date LIKE("%-%-2022")
GROUP BY Student.name;

-- 5)
SELECT School.name, Class.class, Class.paralelka, AVG(Grade.grade) FROM Class
LEFT JOIN School ON School.id = Class.school_id
LEFT JOIN Student ON Student.class_id = Class.id
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY Class.id
ORDER BY AVG(Grade.grade) ASC;

-- 6)
SELECT DISTINCT Student.name, Subject.name FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Grade.subject_id = Subject.id;

-- 7)
SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id WHERE Student.id IS NULL
GROUP BY School.name