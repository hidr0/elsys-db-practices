DROP DATABASE IF EXISTS DTB1;
CREATE DATABASE DTB1;
USE DTB1;

set sql_safe_updates=0;
set sql_mode=only_full_group_by;

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
	class int NOT NULL,
    CHECK(class>=1 AND class<=12),
    paralelka ENUM ('A', 'B', 'V'),
    school_id int NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    age int NOT NULL,
    CHECK(age>0),
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(200) NOT NULL, 
    student_id int NOT NULL UNIQUE,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM ('Bel', 'MATH', 'Sports')
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int NOT NULL,
    CHECK(grade >=2 AND grade <=6),
    date date NOT NULL,
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id), 
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id), 
    CONSTRAINT da_ne_suvpadat UNIQUE(date, student_id, subject_id)
); 

INSERT INTO School(name) VALUES("tues");
INSERT INTO School(name) VALUES("netues");
INSERT INTO School(name) VALUES("nenenetues");
INSERT INTO Class(class, paralelka, school_id) VALUES(5, 'A', 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(11, 'V', 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(9, 'B', 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(6, 'V', 2);
INSERT INTO Student(name, age, class_id) VALUES("ivka", 7, 1);
INSERT INTO Student(name, age, class_id) VALUES("Mqqqqqqqe", 7, 1);
INSERT INTO Student(name, age, class_id) VALUES("a", 8, 1);
INSERT INTO Student(name, age, class_id) VALUES("b", 9, 2);
INSERT INTO Student(name, age, class_id) VALUES("b2", 9, 3);
INSERT INTO Student(name, age, class_id) VALUES("b3", 9, 3);
INSERT INTO Student(name, age, class_id) VALUES("b4", 9, 4);
INSERT INTO Subject(name) VALUES('Bel');
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(5, '2008-11-11', 1, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(6, '2007-11-11', 1, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(3, '2006-11-11', 1, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(4, '2009-11-11', 2, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(4, '2009-10-11', 2, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(6, '2010-11-11', 3, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(3, '2010-11-11', 4, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(4, '2010-11-12', 5, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(5, '2010-11-13', 6, 1);
INSERT INTO Grade(grade, date, student_id, subject_id) VALUES(6, '2010-11-14', 7, 1);
-- 1
/*SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
GROUP BY School.name
ORDER BY COUNT(Student.id) DESC;*/

-- 2
/* SELECT School.name, AVG(Grade.grade) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY School.name
ORDER BY AVG(Grade.grade) DESC
LIMIT 1;*/

-- 3
/*SELECT Grade.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Subject.id = Grade.subject_id;*/

-- 4 
/*SELECT Student.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
WHERE Student.name LIKE("M%e")
AND MONTH(Grade.date) NOT IN(1, 3, 9)
GROUP BY Student.name
LIMIT 1;
*/

-- 5
/*SELECT School.name, Class.class, Class.paralelka, AVG(Grade.grade) FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY School.name, Class.class, Class.paralelka
ORDER BY AVG(Grade.grade) ASC;*/

-- 6
/*SELECT DISTINCT Student.name, Subject.name FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Subject.id = Grade.subject_id;*/

-- 7
/*SELECT School.name FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Class.id = Student.class_id
WHERE(Student.id IS NULL)*/