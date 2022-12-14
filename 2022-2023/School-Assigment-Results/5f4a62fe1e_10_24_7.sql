DROP DATABASE IF EXISTS MyDTB2;
CREATE DATABASE DTB;
USE DTB;

CREATE TABLE School
(
        id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Adress
(
        id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(50) NOT NULL
);

CREATE TABLE Class
(
        id int PRIMARY KEY AUTO_INCREMENT,
    class int NOT NULL check(class > 0 and class < 13),
    paralelka ENUM("A", "B", "V"),
    school_id int NOT NULL UNIQUE,
    FOREIGN KEY (school_id) REFERENCES School(id)
);

CREATE TABLE Student
(
        id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    age int NOT NULL check(age > 0),
    adress_id int NOT NULL UNIQUE,
    FOREIGN KEY (adress_id) REFERENCES Adress(id),
    class_id int NOT NULL UNIQUE,
    FOREIGN KEY (class_id) REFERENCES Class(id)
);

CREATE TABLE Subject
(
        id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Bel", "Math", "Sports")
);

CREATE TABLE Grade
(
        id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    grade float NOT NULL check(grade >= 2 && grade <= 6),
    date DATE NOT NULL,
    CONSTRAINT ones_per_day UNIQUE(student_id, subject_id, date)
);

INSERT INTO School(name) VALUES("NTBG");
INSERT INTO School(name) VALUES("SMG");
INSERT INTO School(name) VALUES("91");
INSERT INTO School(name) VALUES("NPMG");

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Sports");
INSERT INTO Subject(name) VALUES("Bel");

-- nqmam ideq kude se namirat , no znam do kakvo se namirat
INSERT INTO Adress(street) VALUES("do mileniuma");
INSERT INTO Adress(street) VALUES("stochna gara");
INSERT INTO Adress(street) VALUES("tova e na guza na geografiqta");
INSERT INTO Adress(street) VALUES("do kortovete maleevi");

INSERT INTO Class(class, paralelka, school_id) VALUES(10, "V", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(6, "A", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(2, "B", 3);

INSERT INTO Student(name, age, adress_id, class_id) VALUES("Rado1", 15, 1, 1);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Rado2", 12, 2, 2);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Rado3", 14, 3, 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 2, 3, "1998-7-1");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 1, 3, "1762-2-2");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 3, 4, "2013-2-20");
-- ne polzvam ednoto daskalo no jivi i zdravi
SELECT * FROM Student;
SELECT * FROM School;
SELECT * FROM Class;

--1
select School.name, count(Student.id) from School
left join Class on Class.school_id = School.id
left join Student on Student.class_id = Class.id
GROUP BY School.name
order by count(Student.id) desc;

-- 2
select School.name, avg(Grade.grade) from School
left join Class on Class.school_id = School.id
left join Student on Student.class_id = Class.id
left join Grade on Grade.student_id = Student.id
GROUP BY School.name
ORDER BY avg(Grade.grade) desc
limit 1;

-- 3
select Grade.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name from School
left join Class on Class.school_id = School.id
left join Student on Student.class_id = Class.id
left join Grade on Grade.student_id = Student.id
left join Subject on Subject.id = Grade.subject_id;

-- 4
select Student.name, avg(Grade.grade) from Student
left join Grade on Grade.student_id = Student.id
left join Subject on Subject.id = Grade.subject_id
where Student.name like "G%o" and 
month(Grade.date) not in (1,3,9) 
and year(date) = 2022
and Subject.name in ("Math", "Sports")
GROUP BY Student.name
order by avg(Grade.grade) desc
limit 1;

-- 5
select School.name, Class.class, Class.paralelka, avg(Grade.grade) from School
left join Class on Class.school_id = School.id
left join Student on Student.class_id = Class.id
left join Grade on Grade.student_id = Student.id
left join Subject on Subject.id = Grade.subject_id
group by School.name, Class.class, Class.paralelka
order by avg(Grade.grade) asc;


-- 6
select distinct Student.name, Subject.name from Student
left join Grade on Grade.student_id = Student.id
left join Subject on Grade.subject_id = Subject.id
where Grade.grade is not null;

-- 7
select School.name from School
left join Class on Class.school_id = School.id
left join Student on Student.class_id = Class.id
where Student.class_id is null;

