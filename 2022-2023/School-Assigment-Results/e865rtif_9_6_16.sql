DROP DATABASE IF EXISTS SCHOOLDB;
CREATE DATABASE SCHOOLDB;
USE SCHOOLDB;

set sql_safe_updates = 0;
set sql_mode = only_full_group_by;

CREATE TABLE School (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL UNIQUE
);

CREATE TABLE Class (
    id int PRIMARY KEY AUTO_INCREMENT,
    class int CHECK(class>0 AND class<13),
    paralelka ENUM("A","B","V") NOT NULL,
    school_id int NOT NULL,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL UNIQUE,
    age int NOT NULL CHECK(age>0),
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Subject (
    id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Bel","Math","Sports") NOT NULL
    -- student_id int NOT NULL,
    -- FOREIGN KEY (student_id) REFERENCES Student(id)
);

CREATE TABLE Grade(
    id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY(student_id) REFERENCES Student(id),
    grade float NOT NULL check(grade>1 AND grade<7),
    date date NOT NULL
);

CREATE TABLE Address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    street varchar(50) NOT NULL,
    student_id int NOT NULL UNIQUE,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);


INSERT INTO School(name) VALUES("TUES");
INSERT INTO School(name) VALUES("Jonka");
INSERT INTO School(name) VALUES("Empty School :(");

INSERT INTO Class (class,paralelka,school_id) VALUES(11,"V",1);
INSERT INTO Class (class,paralelka,school_id) VALUES(11,"B",1);
INSERT INTO Class (class,paralelka,school_id) VALUES(10,"A",2);
INSERT INTO Class (class,paralelka,school_id) VALUES(8,"A",2);

INSERT INTO Class (class,paralelka,school_id) VALUES(8,"A",3); -- prazna paralelka v prazno uchilishte

INSERT INTO Student(name,age,class_id) VALUES("Yoan",17, 1);
INSERT INTO Student(name,age,class_id) VALUES("Kris",17, 1);
INSERT INTO Student(name,age,class_id) VALUES("Burak",17, 1);
INSERT INTO Student(name,age,class_id) VALUES("Tor",17, 2);
INSERT INTO Student(name,age,class_id) VALUES("Madeline",17, 2);
INSERT INTO Student(name,age,class_id) VALUES("Ibrahim",16, 3);
INSERT INTO Student(name,age,class_id) VALUES("Ahmed",15, 3);

INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Sports");

INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,1,6,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,1,4,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,2,5,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,2,6,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,3,6,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,4,6,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(2,5,6,"2022-02-02");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,6,6,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,6,2,"2022-01-01");
INSERT INTO Grade (subject_id,student_id,grade,date) VALUES(1,7,3,"2022-01-01");


-- 1
SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.id;

-- 2 
SELECT School.name, AVG(Grade.grade) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id 
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY School.name
ORDER BY AVG(Grade.grade) DESC
LIMIT 1;

-- 3
select Student.name,Subject.name,Grade.grade,Class.class,Class.paralelka,Grade.date,School.name from Student
LEFT JOIN Class ON Class.id = Student.class_id 
LEFT JOIN School ON School.id = Class.school_id
LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Subject.id = Grade.subject_id;

-- 4
SELECT Student.name, AVG(Grade.grade) FROM Grade
LEFT JOIN Student ON Student.id = Grade.student_id 
LEFT JOIN Subject ON Subject.id = Grade.subject_id
WHERE Student.name LIKE ("M%e") 
AND MONTH(Grade.date) NOT IN (1, 3, 9) AND YEAR(Grade.date) = "2022" 
AND Subject.name IN ("Math", "Sports")
GROUP BY Student.name
ORDER BY AVG(Grade.grade) DESC
LIMIT 1;

-- 5 
SELECT School.name, Class.class, Class.paralelka, AVG(Grade.grade) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id 
LEFT JOIN Grade ON Grade.student_id = Student.id
GROUP BY School.name, Class.class, Class.paralelka
ORDER BY AVG(Grade.grade) ASC;

-- 6
SELECT DISTINCT Student.name, Subject.name FROM Subject
LEFT JOIN Grade ON Grade.subject_id = Subject.id
LEFT JOIN Student ON Grade.student_id = Student.id
WHERE Grade.grade IS NOT NULL;

-- 7
SELECT School.name FROM School
LEFT JOIN Class ON School.id = Class.school_id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.name
HAVING COUNT(Student.id) = 0;
