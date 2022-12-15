DROP DATABASE IF EXISTS MyDTB;
CREATE DATABASE MyDTB;
USE MyDTB;

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
    school_id int NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    age int NOT NULL check(age > 0),
    adress_id int NOT NULL UNIQUE,
    FOREIGN KEY (adress_id) REFERENCES Adress(id),
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(id)
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
    date DATE NOT NULL,
    CONSTRAINT edna_ocenka_na_den UNIQUE(student_id, subject_id, date)
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("Sports");

INSERT INTO School(name) VALUES("TUES");
INSERT INTO School(name) VALUES("NPMG");
INSERT INTO School(name) VALUES("15to");
INSERT INTO School(name) VALUES("150to");

INSERT INTO Adress(street) VALUES("Botev");
INSERT INTO Adress(street) VALUES("Lomsko shose");
INSERT INTO Adress(street) VALUES("Levski");
INSERT INTO Adress(street) VALUES("Svezhest");

INSERT INTO Class(class, paralelka, school_id) VALUES(9, "A", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(10, "B", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(6, "V", 3);


INSERT INTO Student(name, age, adress_id, class_id) VALUES("Mishele", 15, 1, 1);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Mahaisebe", 13, 2, 2);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Monke", 16, 3, 3);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Ivan4o", 12, 4, 2);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-10-22");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 5, "2022-10-23");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 4, "2022-10-24");

-- 1 how many students are in each school
SELECT School.name, COUNT(Student.id) AS students
FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.name
ORDER BY COUNT(Student.id) DESC;


-- 2 print which school has highest grade average
SELECT s.name, AVG(g.grade) AS average_grade
FROM School s
JOIN Class c ON s.id = c.school_id
JOIN Student st ON c.id = st.class_id
JOIN Grade g ON st.id = g.student_id
GROUP BY s.name
ORDER BY average_grade DESC
LIMIT 1;

-- 3 print every grade for every student
SELECT st.name, g.grade, c.class, c.paralelka, s.name, g.date
FROM Student st
JOIN Grade g ON st.id = g.student_id
JOIN Class c ON st.class_id = c.id
JOIN School s ON st.class_id = s.id
ORDER BY g.date;

-- 4 which student whose name starts with "M" ends with "e" has the highest grade
SELECT st.name, g.grade
FROM Student st
JOIN Grade g ON st.id = g.student_id
WHERE st.name LIKE "M%e"
ORDER BY g.grade DESC
LIMIT 1;

-- 5 average grade for every class in upgoing order
SELECT c.class, c.paralelka, s.name, AVG(g.grade) AS average_grade
FROM School s
JOIN Class c ON c.school_id = s.id
JOIN Student st ON st.class_id = c.id
JOIN Grade g ON st.id = g.student_id
GROUP BY c.id
ORDER BY average_grade;

-- 6 every student with every subject in which he/she has grade
SELECT DISTINCT st.name, sub.name 
FROM Student st
LEFT JOIN Grade g ON g.student_id = st.id
LEFT JOIN Subject sub ON sub.id = g.subject_id
WHERE (g.id IS NOT NULL);

-- 7 school that doesn't have students
SELECT s.name
FROM School s
LEFT JOIN Class c ON s.id = c.school_id
LEFT JOIN Student st ON c.id = st.class_id
WHERE st.name IS NULL;