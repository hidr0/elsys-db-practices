DROP DATABASE IF EXISTS n15;
CREATE DATABASE n15;
USE n15;

SET sql_safe_updates = 0;
SET sql_mode = only_full_group_by;

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
    cl int NOT NULL CHECK(cl BETWEEN 1 AND 12),
    paralelka VARCHAR(1) NOT NULL CHECK(paralelka IN ("A", "B", "V")),
    school_id int NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    age int NOT NULL CHECK(age>0),
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(50) NOT NULL,
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);


CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL CHECK(name IN ("Bel", "Math", "Sport"))
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    gr int NOT NULL CHECK(gr BETWEEN 2 AND 6),
    date DATE NOT NULL,
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
	subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id)
);

INSERT INTO School(name) VALUES("Academy Academy");
INSERT INTO School(name) VALUES("Academy2 Academy");
INSERT INTO School(name) VALUES("Academy3 Academy");


INSERT INTO Class(cl, paralelka, school_id) VALUES(11, "B", 1);
INSERT INTO Class(cl, paralelka, school_id) VALUES(10, "B", 2);

INSERT INTO Student(name, age, class_id) VALUES("Peter Griffin", 40,1); 
INSERT INTO Student(name, age, class_id) VALUES("Joe Swanson", 35, 2);
INSERT INTO Student(name, age, class_id) VALUES("Minnie Mouse", 312, 2);

INSERT INTO Address(street, student_id) VALUES("1 St.", 1);
INSERT INTO Address(street, student_id) VALUES("2 St.", 2);

INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Sport");

INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(4, "2021-10-15", 1, 2);
INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(5, "2021-11-21", 1, 3);
INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(6, "2021-09-03", 2, 1);
INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(3, "2022-01-30", 2, 3);
INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(2, "2022-02-24", 1, 1);
INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(5, "2022-02-15", 1, 2);
INSERT INTO Grade(gr, date, student_id, subject_id) VALUES(6, "2022-01-09", 3, 2);

-- 1
SELECT Student.name FROM School 
LEFT JOIN Class ON Class.school_id=School.id
LEFT JOIN Student ON Student.class_id=Class.id;

-- 2
SELECT School.name, AVG(Grade.gr) FROM School
LEFT JOIN Class ON Class.school_id=School.id
LEFT JOIN Student ON Student.class_id=Class.id
LEFT JOIN Grade ON Grade.student_id=Student.id
GROUP BY School.id
ORDER BY AVG(Grade.gr) DESC LIMIT 1;

-- 3
SELECT Grade.gr As grade, Grade.date, Student.name AS student_name, Subject.name as subject_name, Class.cl as class, Class.paralelka, School.name as school_name FROM School
LEFT JOIN Class ON Class.school_id=School.id
LEFT JOIN Student ON Student.class_id=Class.id
LEFT JOIN Grade ON Grade.student_id=Student.id
LEFT JOIN Subject ON Grade.subject_id=Subject.id;

-- 4
SELECT Student.name AS student_name FROM Student
LEFT JOIN Grade ON Grade.student_id=Student.id
LEFT JOIN Subject ON Grade.subject_id=Subject.id
WHERE Student.name LIKE "M%e" 
AND Grade.date LIKE "%0[^139]%"
AND Grade.date LIKE "2022%"
AND Subject.name NOT LIKE "Bel"
GROUP BY Student.name
ORDER BY AVG(Grade.gr)
LIMIT 1;

-- 5
SELECT School.name, Class.cl, Class.paralelka, AVG(Grade.gr) FROM School
LEFT JOIN Class ON Class.school_id=School.id
LEFT JOIN Student ON Student.class_id=Class.id
LEFT JOIN Grade ON Grade.student_id=Student.id
GROUP BY School.name, Class.id;

-- 6
SELECT DISTINCT Student.name, Subject.name FROM Student
LEFT JOIN Grade ON Grade.student_id=Student.id
LEFT JOIN Subject ON Grade.subject_id=Subject.id;

-- 7
SELECT School.name FROM School
LEFT JOIN Class ON Class.school_id=School.id
LEFT JOIN Student ON Student.class_id=Class.id
Where Student.class_id IS NULL
GROUP BY School.name