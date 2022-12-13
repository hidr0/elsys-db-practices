DROP DATABASE IF EXISTS DTB;
CREATE DATABASE DTB;
USE DTB;

set sql_safe_updates=0;
set sql_mode=only_full_group_by;

create table School(
	id int primary key auto_increment,
	name varchar(50) not null unique
);
create Table Adress(
	id int primary key auto_increment,
	street varchar(100) not null
);
create table Class(
	id int PRIMARY KEY AUTO_INCREMENT,
	class int not null check(class>=1 and class<=12),
	paralelka varchar(1) check(paralelka='A' or paralelka='B' or paralelka='V'),
	school_id int not null unique,
	foreign key (school_id) references School(id)
);



create Table Student(
	id int primary key auto_increment,
	name varchar(50) not null unique,
	age int not null CHECK(age>0),
	class_id int not null unique,   -- tuka nz dali traa e taka
	foreign key (class_id) references Class(id),
	adress_id int not null unique,
	foreign key(adress_id) references Adress(id)
);

create table Subject(
id int primary key auto_increment,
name varchar(50) check (name="Bel"or name="Math" or name="Sports")
);

create table Grade(
	id int primary key auto_increment,
    subject_id int not null,
    foreign key (subject_id) references Subject(id),
    student_id int not null,
    foreign key (student_id) references Student(id),
    grade float not null check(grade between 2 and 6),
    date DATE NOT NULL,
    constraint one_grade_per_day UNIQUE(student_id, subject_id, date)
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

INSERT INTO Class(class, paralelka, school_id) VALUES(9, "A", 1);
INSERT INTO Class(class, paralelka, school_id) VALUES(10, "B", 2);
INSERT INTO Class(class, paralelka, school_id) VALUES(6, "V", 3);

INSERT INTO Student(name, age, adress_id, class_id) VALUES("Gosho", 15, 1, 1);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Pesho", 13, 2, 2);
INSERT INTO Student(name, age, adress_id, class_id) VALUES("Ivan", 16, 3, 3);

INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(1, 1, 6, "2022-10-22");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(2, 2, 6, "2022-10-23");
INSERT INTO Grade(subject_id, student_id, grade, date) VALUES(3, 3, 4, "2022-10-24");

-- 1
select School.name, count(Student.id) from Student
left join Class on Class.id= class_id
left join School on School.id=school_id
group by School.name
order by count(Student.id) desc;

-- 2
select School.name, AVG(Grade.grade) from School
left join Class on School.id=Class.school_id
left join Student on Class.id= Student.class_id
left join Grade on Student.id=Grade.student_id
group by School.name
order by AVG(Grade.grade) limit 1;

-- 3
 Select Subject.name, Student.name, Class.class, Class.paralelka, School.name, Grade.date from Student
left join Grade on Student.id=Grade.student_id
left join Subject on Subject.id= Grade.subject_id
left join Class on Class.id=Student.class_id
left join School on School.id=Class.school_id;

-- 4
 select Student.name, AVG(Grade.grade) from Grade
 left join Subject on Subject.id= Grade.subject_id
 left join Student on Student.id= Grade.student_id
 where Student.name like "M%e" and month(Grade.date) not in ("1", "3", "9")
 and year(Grade.date) in ("2022") and Subject.name in ("Sports", "Math")
 group by Student.name
 order by AVG(Grade.grade) limit 1;
 
-- 5
select School.name, Class.class, Class.paralelka, AVG(Grade.grade) from Grade
left join Student on Student.id= Grade.student_id
left join Class on Class.id=Student.class_id
left join School on School.id=Class.school_id
group by  School.name, Class.class, Class.paralelka
order by AVG(Grade.grade) desc;

-- 6
select distinct Student.name, Subject.name from Subject
left join Grade on Subject.id=Grade.subject_id
left join Student on Student.id= Grade.student_id;

-- 7
 select School.name from School
 left join Class on School.id=Class.school_id
 left join Student on Class.id=Student.class_id
 where Student.class_id is null;