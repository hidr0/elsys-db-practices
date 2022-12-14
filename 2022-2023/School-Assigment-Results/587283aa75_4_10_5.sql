DROP DATABASE IF EXISTS MyDTB2;
CREATE DATABASE MyDTB2;
USE MyDTB2;

SET sql_safe_updates=0;
SET sql_mode=only_full_group_by;

CREATE TABLE Adress(
	id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(100) NOT NULL
);

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL check(class > 0 && class < 13),
    paralelka ENUM("A", "B", "V"),
    school_id int NOT NULL UNIQUE,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    age int NOT NULL check(age > 0),
    adress_id int NOT NULL UNIQUE,
    FOREIGN KEY (adress_id) REFERENCES Adress(id),
    class_id int NOT NULL UNIQUE,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Bel", "Maths", "FVS")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    grade float NOT NULL check(grade BETWEEN 2 AND 6),
    date DATE NOT NULL,
    CONSTRAINT edna_ocenka_na_den UNIQUE(student_id, subject_id, date)
);

INSERT INTO Subject(name) VALUES("Maths");
INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("FVS");

INSERT INTO School(name) VALUES("TUES");
INSERT INTO School(name) VALUES("NEG");
INSERT INTO School(name) VALUES("7");

INSERT INTO Adress(street) VALUES("str1");
INSERT INTO Adress(street) VALUES("str2");
INSERT INTO Adress(street) VALUES("str3");

INSERT INTO Class(class, paralelka, school_id) VALUES(12, "A", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(8, "B", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(3, "V", 3);

INSERT INTO Student(name, age, adress_id, class_id) VALUES("Momchi", 18, 1, 1);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Acho", 12, 2, 2);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Radi", 17, 3, 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-11-18");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 3, "2022-12-21");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 5, "2022-09-27");

-- 4)
SELECT Student.name, AVG(Grade.grade) FROM Grade
LEFT JOIN Student ON Grade.student_id = Student.id
LEFT JOIN Subject ON Subject.id = Grade.subject_id
WHERE (Student.name LIKE ("M%e") AND MONTH(Grade.date) NOT IN (1, 3, 9)
AND YEAR(Grade.date) = "2022" AND Subject.name IN ("Math", "FVS"))
GROUP BY Student.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1; 

-- 5)
SELECT School.name, Class.class, Class.paralelka, AVG(Grade.grade) FROM School
LEFT JOIN Class on Class.school_id = School.id
LEFT JOIN Student on Student.class_id = Class.id
LEFT JOIN Grade on Grade.student_id = Student.id
GROUP BY School.name, Class.class, Class.paralelka
ORDER BY AVG(Grade.grade);

-- 6)
SELECT DISTINCT Student.name, Subject.name FROM Subject
LEFT JOIN Grade ON Grade.subject_id = Subject.id
LEFT JOIN Student ON Student.id = Grade.student_id
WHERE Grade.grade IS NOT NULL;
