DROP DATABASE IF EXISTS DTB1;
CREATE DATABASE DTB1;
USE DTB1;

CREATE TABLE School(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(50) NOT NULL UNIQUE
);

CREATE TABLE Class(
	id int PRIMARY KEY AUTO_INCREMENT,
	class int not null check (class BETWEEN 1 and 12),
	paralelka enum("A", "B", "V"),
	school_id int not null,
	FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
	name enum ("Bel", "Math", "Sports")
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(50) not null unique,
	age int not null check(age > 0),
	class_id int not null,
	FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
	Street varchar(50) not null,
	student_id int not null unique,
	FOREIGN KEY (student_id) REFERENCES Student(id)
);

CREATE TABLE Student_subjects(
	id int PRIMARY KEY AUTO_INCREMENT,
	subject_id int NOT NULL,
	FOREIGN KEY (subject_id) REFERENCES Subject(id),
	student_id int NOT NULL,
	FOREIGN KEY (student_id) REFERENCES Student(id),
	grade float NOT NULL check(grade BETWEEN 2 AND 6),
	date DATE NOT NULL,
	CONSTRAINT edna_ocenka_na_den UNIQUE(student_id, subject_id, date)
);


INSERT INTO School (name) VALUES ("TUES");
INSERT INTO School (name) VALUES ("SMG");
INSERT INTO School (name) VALUES ("Angliiskata");

INSERT INTO Class (class, paralelka, school_id) VALUES (11, "V", 1);
INSERT INTO Class (class, paralelka, school_id) VALUES (9, "B", 3);

INSERT INTO Student (name, age, class_id) VALUES ("Nikola", 17, 1);
INSERT INTO Student (name, age, class_id) VALUES ("Madeline", 17, 2);
INSERT INTO Student (name, age, class_id) VALUES ("Maisie", 17, 1);

INSERT INTO Address (Street, student_id) VALUES ("Sofia, Vitoshka 39", 1);
INSERT INTO Address (Street, student_id) VALUES ("Sofia, Vitoshka 50", 2);
INSERT INTO Address (Street, student_id) VALUES ("Sofia, Vitoshka 73", 3);

INSERT INTO Subject (name) VALUES ("Bel");
INSERT INTO Subject (name) VALUES ("Math");
INSERT INTO Subject (name) VALUES ("Sports");

INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(1,1,5,"2022-10-22");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(1,1,4,"2022-10-23");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(2,1,6,"2022-10-23");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(3,1,6,"2022-10-24");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(1,2,4,"2022-10-22");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(2,2,3,"2022-10-23");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(3,2,5,"2022-10-24");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(1,3,6,"2022-10-22");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(2,3,6,"2022-10-23");
INSERT INTO Student_subjects(subject_id, student_id, grade, date) VALUES(3,3,6,"2022-10-24");

-- 1
SELECT School.name, COUNT(Student.id) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
GROUP BY School.name
ORDER BY COUNT(Student.id) desc;

-- 2
Select School.name, avg(Student_subjects.grade) FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
LEFT JOIN Student_subjects ON Student_subjects.student_id = Student.id
GROUP BY School.name
ORDER BY avg(Student_subjects.grade) desc
LIMIT 1;

-- 3
SELECT Student_subjects.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name, Student_subjects.date FROM Student
LEFT JOIN Class ON Student.class_id = Class.id
LEFT JOIN Student_subjects ON Student_subjects.student_id = Student.id
LEFT JOIN Subject ON Student_subjects.subject_id = Subject.id
LEFT JOIN School ON Class.school_id = School.id;

-- 4
SELECT Student.name FROM Student
LEFT JOIN Student_subjects ON Student_subjects.student_id = Student.id
LEFT JOIN Subject ON Student_subjects.subject_id = Subject.id
WHERE Student.name like('M%e') and (Student_subjects.date between '2022-2-1' and '2022-2-28' 
or Student_subjects.date between '2022-4-1' and '2022-8-31' or Student_subjects.date between '2022-10-1' and '2022-12-31') 
and (Subject.name like ('Sports') or Subject.name like ('Math'))
GROUP BY (Student.name)
ORDER BY avg(Student_subjects.grade) desc
LIMIT 1;

-- 5
SELECT School.name, Class.class, Class.paralelka, AVG(Student_subjects.grade) FROM Class
LEFT JOIN School on Class.school_id = School.id
LEFT JOIN Student on Student.class_id = Class.id
LEFT JOIN Student_subjects on Student_subjects.student_id = Student.id
GROUP BY School.name, Class.class, Class.paralelka
ORDER BY avg(Student_subjects.grade) asc;

-- 6
SELECT DISTINCT Student.name, Subject.name FROM Student
LEFT JOIN Student_subjects ON Student_subjects.student_id = Student.id
LEFT JOIN Subject on Student_subjects.subject_id = Subject.id;

-- 7
SELECT School.name FROM School
LEFT JOIN Class ON Class.school_id = School.id
LEFT JOIN Student ON Student.class_id = Class.id
where Student.id is null;
