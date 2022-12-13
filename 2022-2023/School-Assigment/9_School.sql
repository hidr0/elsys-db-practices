DROP DATABASE IF EXISTS School;
CREATE DATABASE School;
USE School;

CREATE TABLE School(
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    UNIQUE(name)

);

CREATE TABLE Class(
    id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL check ( 0<class<13),
    paralelka ENUM('A','B','V'),
    school_id int NOT NULL,
    FOREIGN KEY(school_id) REFERENCES School(id)
);

CREATE TABLE Address(
    id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(30) NOT NULL
);

CREATE TABLE Student(
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    UNIQUE(name),
    age int NOT NULL check (age > 0 ),
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class(id),
    address_id int NOT NULL,
    UNIQUE (address_id),
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

CREATE TABLE Subject(
  id int PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30)
);

CREATE TABLE Grade(
    id int PRIMARY KEY AUTO_INCREMENT,
    grade int check(1<grade<7),
    data date,
    student_id int,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    subject_id int,
    FOREIGN KEY (subject_id) REFERENCES Subject(id)
);

INSERT INTO School(name) VALUE ('TUES');
INSERT INTO School(name) VALUE ('NPMG');
INSERT INTO School(name) VALUE ('56-to');
INSERT INTO School(name) VALUE ('Prazno');

INSERT INTO Class(class, paralelka, school_id)VALUES (10, 'B', 1);
INSERT INTO Class(class, paralelka, school_id)VALUES (11, 'V', 2);
INSERT INTO Class(class, paralelka, school_id)VALUES (10, 'A', 3);

INSERT INTO Address(street)VALUE ('bul. Al');
INSERT INTO Address(street)VALUE ('bul. Bl');
INSERT INTO Address(street)VALUE ('bul. Cl');
INSERT INTO Address(street)VALUE ('bul. pop');

INSERT INTO Student(name, age, class_id, address_id)VALUES ('Iva', 17, 1, 1);
INSERT INTO Student(name, age, class_id, address_id)VALUES ('Moni', 17, 1, 4);
INSERT INTO Student(name, age, class_id, address_id)VALUES ('Bobi', 16, 2, 3);
INSERT INTO Student(name, age, class_id, address_id)VALUES ('Moke', 17, 3, 2);

INSERT INTO Subject(name)VALUE ('Bel');
INSERT INTO Subject(name)VALUE ('Math');
INSERT INTO Subject(name)VALUE ('Biology');

INSERT INTO Grade(grade, data, student_id, subject_id)VALUES (6,'2022-12-03',1,1);
INSERT INTO Grade(grade, data, student_id, subject_id)VALUES (5,'2022-12-03',1,3);
INSERT INTO Grade(grade, data, student_id, subject_id)VALUES (6,'2022-11-03',2,2);
INSERT INTO Grade(grade, data, student_id, subject_id)VALUES (4,'2021-12-12',3,1);
INSERT INTO Grade(grade, data, student_id, subject_id)VALUES (3,'2021-03-12',4,1);
INSERT INTO Grade(grade, data, student_id, subject_id)VALUES (6,'2021-11-12',4,2);

-- 1
-- SELECT School.name,COUNT(Student.name)
-- FROM School
-- LEFT JOIN Class on School.id = Class.school_id
-- LEFT JOIN Student on Class.id = Student.class_id
-- GROUP BY School.name
-- ORDER BY COUNT(Student.name) DESC;
-- 2
-- SELECT School.name, AVG(Grade.grade)
-- FROM Grade
-- LEFT JOIN Student on Student.id = Grade.student_id
-- LEFT JOIN Class on Student.class_id = Class.id
-- LEFT JOIN School on Class.school_id = School.id
-- GROUP BY  School.name
-- ORDER BY AVG(Grade.grade) DESC
-- LIMIT 1;

-- 3
-- SELECT Grade.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name, Grade.data
-- FROM Grade
-- LEFT JOIN Subject ON Grade.subject_id = Subject.id
-- LEFT JOIN Student ON Grade.student_id = Student.id
-- LEFT JOIN Class on Student.class_id = Class.id
-- LEFT JOIN School on Class.school_id = School.id
-- ORDER BY Student.name;

-- 4
-- SELECT Student.name, AVG(Grade.grade)
-- FROM Grade
-- LEFT JOIN Student on Student.id = Grade.student_id
-- LEFT JOIN Subject ON Grade.subject_id = Subject.id
-- WHERE Student.name LIKE 'M%' AND Student.name LIKE '%e'
-- AND MONTH(Grade.data) NOT IN ('1', '3', '9')
-- AND YEAR(Grade.data) IN ('2020')
-- AND Subject.name LIKE ('Sport') OR Subject.name LIKE ('Math')
-- GROUP BY Student.name
-- ORDER BY AVG(Grade.grade) DESC
-- LIMIT 1;

-- 5
-- SELECT School.name, Class.class, Class.paralelka, AVG(Grade.grade)
-- FROM Grade
-- LEFT JOIN Student ON Grade.student_id = Student.id
-- LEFT JOIN Class ON Student.class_id = Class.id
-- LEFT JOIN School ON Class.school_id = School.id
-- GROUP BY School.name, Class.class, Class.paralelka
-- ORDER BY AVG(Grade.grade) ASC;


-- 6
-- SELECT DISTINCT Student.name, Subject.name
-- FROM Grade
-- LEFT JOIN Student on Student.id = Grade.student_id
-- LEFT JOIN Subject on Grade.subject_id = Subject.id;

-- 7
-- SELECT School.name
-- FROM School
-- LEFT JOIN Class on School.id = Class.school_id
-- Where (Class.school_id is null);

