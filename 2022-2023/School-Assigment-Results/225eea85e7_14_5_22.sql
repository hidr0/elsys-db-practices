DROP DATABASE IF EXISTS DTB1;
CREATE DATABASE DTB1;
USE DTB1;

set sql_safe_updates=0;
set sql_mode=only_full_group_by;

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL check(class BETWEEN 1 AND 12),
    paralelka enum("A", "B", "V"),
    school_id int NOT NULL,
    FOREIGN KEY(school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL UNIQUE,
    age int NOT NULL check(age > 0),
    class_id int NOT NULL,
    FOREIGN KEY(class_id) REFERENCES Class(id)
);

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(100) NOT NULL,
    student_id int NOT NULL UNIQUE,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name enum("Bel", "Math", "Sports")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    grade int NOT NULL check(grade BETWEEN 2 AND 6),
    date date NOT NULL
);

INSERT INTO School(name) VALUES("TUES");
INSERT INTO Class(class, paralelka, school_id) VALUES(11, "V", 1);
INSERT INTO Student(name, age, class_id) VALUES("Pesho", 17, 1);
INSERT INTO Student(name, age, class_id) VALUES("Madeline", 17, 1);
INSERT INTO Address(street, student_id) VALUES("Zlaten klas", 1);
INSERT INTO Address(street, student_id) VALUES("rusalka", 2);
INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Grade(student_id, subject_id, grade, date) VALUES(1, 1, 6, "2022-12-09");
INSERT INTO Grade(student_id, subject_id, grade, date) VALUES(1, 2, 5, "2022-12-05");
INSERT INTO Grade(student_id, subject_id, grade, date) VALUES(2, 1, 6, "2022-12-08");

INSERT INTO School(name) VALUES("Jonkata");
INSERT INTO Class(class, paralelka, school_id) VALUES(11, "B", 2);
INSERT INTO Student(name, age, class_id) VALUES("Ivancho", 17, 2);
INSERT INTO Student(name, age, class_id) VALUES("Kalko", 17, 2);
INSERT INTO Address(street, student_id) VALUES("Voluyak", 3);
INSERT INTO Grade(student_id, subject_id, grade, date) VALUES(3, 2, 5, "2022-12-07");
INSERT INTO Grade(student_id, subject_id, grade, date) VALUES(4, 2, 4, "2022-12-07");

INSERT INTO School(name) VALUES("NPMG");

-- 1 --
SELECT School.name, count(Student.id) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.name
ORDER BY count(Student.id) DESC;

-- 2 --
SELECT School.name, avg(Grade.grade) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY School.name
ORDER BY avg(Grade.grade) DESC
LIMIT 1;

-- 3 --
SELECT Grade.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name, Grade.date FROM Grade
LEFT JOIN Subject ON Subject.id = Grade.subject_id
LEFT JOIN Student ON Student.id = Grade.student_id
LEFT JOIN Class ON Student.class_id = Class.id
LEFT JOIN School ON School.id = Class.school_id;

-- 4 --
SELECT Student.name, avg(Grade.grade) FROM Student
LEFT JOIN Grade ON Grade.student_id = Student.id
LEFT JOIN Subject ON Subject.id = Grade.subject_id
WHERE LEFT(Student.name, 1) = "M" AND RIGHT(Student.name, 1) = "e" AND MONTH(Grade.date) NOT IN (1, 3, 9) AND YEAR(Grade.date) = 2022 AND Subject.name IN ("Math", "Sports")
GROUP BY Student.name
ORDER BY avg(Grade.grade) DESC
LIMIT 1;

-- 5 --
SELECT School.name, Class.class, Class.paralelka, avg(Grade.grade) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY School.name, Class.class, Class.paralelka
ORDER BY avg(Grade.grade) ASC;

-- 6 --
SELECT DISTINCT Student.name, Subject.name FROM Student
LEFT JOIN Grade ON Grade.student_id = Student.id
LEFT JOIN Subject ON Grade.subject_id = Subject.id;

-- 7 --
SELECT School.name FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
WHERE (Student.class_id IS NULL);