DROP DATABASE IF EXISTS mitko1;
CREATE DATABASE mitko1;
USE mitko1;

SET sql_safe_updates=0;
SET sql_mode=only_full_group_by;

CREATE TABLE School
(
	id int primary key auto_increment,
	name varchar(100) not null unique
);

CREATE TABLE Class
(
	id int primary key auto_increment,
    class int not null check(class between 1 and 12),
    paralelka enum ("A", "B", "V", "G"),
    school_id int not null,
    foreign key (school_id) references School(id)
);

CREATE TABLE Subject
(
	id int primary key auto_increment,
    name enum ("Math", "BEL", "Sports")
);

CREATE TABLE Student
(
	id int primary key auto_increment,
    name varchar(50) not null unique,
    age int not null check(age > 0),
    class_id int not null,
    foreign key (class_id) references Class(id)
 );
 
CREATE TABLE Address
(
	id int primary key auto_increment,
    street varchar(100) not null,
	student_id int unique not null,
    foreign key (student_id) references Student(id)
);

CREATE TABLE Grade
(
	id int primary key auto_increment,
    grade int not null check(grade between 2 and 6),
    date date not null,
    subject_id int NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    UNIQUE(student_id, subject_id)
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bel");
INSERT INTO Subject(name) VALUES("Sports");

INSERT INTO School(name) VALUES("TUES");
INSERT INTO School(name) VALUES("NPMG");
INSERT INTO School(name) VALUES("15to");
INSERT INTO School(name) VALUES("150to");

INSERT INTO Address(street) VALUES("Botev");
INSERT INTO Address(street) VALUES("Lomsko shose");
INSERT INTO Address(street) VALUES("Levski");

INSERT INTO Class(class, paralelka, school_id) VALUES(9, "A", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(10, "B", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(6, "V", 3);

INSERT INTO Student(name, age, class_id) VALUES("Gosho", 15, 1);
INSERT INTO Student(name, age, class_id) VALUES("Pesho", 13, 2);
INSERT INTO Student(name, age, class_id) VALUES("Ivan", 16, 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-10-22");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 6, "2022-10-23");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 6, "2022-10-24");


-- 1
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