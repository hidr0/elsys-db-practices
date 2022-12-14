DROP DATABASE IF EXISTS School ;
CREATE DATABASE School;

use School;

CREATE TABLE School_T(
	id int primary key auto_increment,
    name VARCHAR(50) not null unique
  
);
INSERT INTO SCHOOL_T(name) Values("TUES");
INSERT INTO SCHOOL_T(name) Values("Purwa nemska");
INSERT INTO SCHOOL_T(name) Values("125 SU");
INSERT INTO SCHOOL_T(name) Values("31 SU");

CREATE TABLE CLASS(
	id int primary key auto_increment,
    class int not null check(class > 0 AND class < 13),
    paralelka ENUM("A", "B", "V"),
    school_id int not null ,
	foreign key(school_id) references School_T(id)    
);
INSERT INTO CLASS(class, paralelka, school_id) VALUES(11, "V", 1);
INSERT INTO CLASS(class, paralelka, school_id) VALUES(8, "B", 2);
INSERT INTO CLASS(class, paralelka, school_id) VALUES(7, "A", 3);



CREATE TABLE STUDENT(
	id int  primary key auto_increment,
    name VARCHAR(50) not null unique,
    age int check(age >= 6), -- шест понеже тогава се почва най рано училище
    class_id int not null, 
    foreign key(class_id) references Class(id)
);
INSERT INTO STUDENT(name, age, class_id) VALUES("Ivan", 17, 1 );
INSERT INTO STUDENT(name, age, class_id) VALUES("Martin", 14, 2 );
INSERT INTO STUDENT(name, age, class_id) VALUES("Mine", 13, 2);

CREATE TABLE Address(
	id int primary key auto_increment,
    street VARCHAR(20) not null unique,
	student_id int not null unique,
    foreign key(student_id) references Student(id)
);
INSERT INTO ADdRESS(street, student_id) VALUES("Raina Knqginiq 2", 1);
INSERT INTO ADdRESS(street, student_id) VALUES("Raina Knqginiq 3", 2);
INSERT INTO ADdRESS(street, student_id) VALUES("Novoselska", 3);

CREATE TABLE SUBJECT(	
	id int primary key auto_increment,
    name ENUM("BEL", "Math", "Sports")
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("BEL");
INSERT INTO Subject(name) VALUES("Sports");


CREATE TABLE GRADE(
	id int primary key auto_increment,
    grade int not null check(grade > 1 AND 	grade < 7),
    grade_date date,
    student_id int not null ,
    foreign key(student_id) references Student(id),
    subject_id int not null,
    foreign key(subject_id) references Subject(id)
);

INSERT INTO GRADE(grade, grade_date, student_id, subject_id) VALUES(6, "2022-12-5", 1, 1);
INSERT INTO GRADE(grade, grade_date, student_id, subject_id) VALUES(5, "2022-12-5", 1, 2);
INSERT INTO GRADE(grade, grade_date, student_id, subject_id) VALUES(5, "2022-12-5", 2, 1);
INSERT INTO GRADE(grade, grade_date, student_id, subject_id) VALUES(6, "2022-12-5", 3, 3);
INSERT INTO GRADE(grade, grade_date, student_id, subject_id) VALUES(6, "2022-12-5", 3, 3);

-- 1
 select School_t.name as "School", count(student.id) as "Students count" from School_t
 left join Class on class.school_id = School_t.id
 left join Student on student.class_id = class.id
 group by School_t.name
 order by count(student.id) desc;

 

-- 2
select School_t.name as "School", AVG(Grade.grade) as "Sreden uspeh" from school_t
left join Class on class.school_id = School_t.id
left join Student on student.class_id = class.id
left join GRADE on grade.student_id = student.id
group by School_t.name
 order by AVG(Grade.grade) desc limit 1;
 
 -- 3
 select Student.name as "Student", class.class, class.paralelka, school_t.name as "School", subject.name as "Subject", grade.grade, grade.grade_date from GRADE
 left join Student on student.id = grade.student_id
 left join Subject on subject.id = grade.subject_id
 left join class on class.id = student.class_id
 left join School_t on School_t.id = class.school_id;
 
 -- 4 
select Student.name, avg(grade.grade) from grade
left join Student on student.id = grade.student_id
left join Subject on subject.id = grade.subject_id
where student.name like "M%e" AND month(grade.grade_date) not in (3,9,5) and year(grade.grade_date) = 2022 AND (Subject.name like "Math" or Subject.name like "Sports") 
group by student.name
order by avg(grade.grade) asc limit 1;


-- 5 
 select School_t.name as "School", class.class, class.paralelka, avg(grade.grade) as "Sreden uspeh"from class
 right join School_t on class.school_id = School_t.id
left join student on class.id = student.class_id
left join Grade on grade.student_id = student.id
left join Subject on grade.subject_id = subject.id
group by school_t.name
order by  avg(grade.grade) asc ;


-- 6
select Distinct student.name as "Student", subject.name as "Subject" from Student
right join GRADE on grade.student_id = student.id
left join Subject on grade.subject_id = subject.id;  


-- 7 nowoto
 select School_t.name as "School", count(student.id) from School_t
 left join Class on class.school_id = School_t.id
 left join Student on student.class_id = class.id
 where student.id is null
 group by School_t.name;
 
 




 
 