DROP DATABASE IF EXISTS dtb1;
CREATE DATABASE dtb1;
USE dtb1;

set sql_safe_updates=0;
set sql_mode=only_full_group_by;

CREATE TABLE School
(
	id int primary key auto_increment,
    name varchar(50) unique
);

CREATE TABLE Class
(
	id int PRIMARY KEY AUTO_INCREMENT,
    class int check(class >=1 && class<=12),
    paralelka char(1) check(paralelka in('A', 'B', 'V')),
    school int not null,
    foreign key (school) references School(id)
);

CREATE TABLE Student
(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) NOT NULL UNIQUE,
    age int not null check(age > 0),
    class int NOT NULL,
    foreign key (class) references Class(id)
);

CREATE TABLE Adress
(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(100) NOT NULL unique,
    student int NOT NULL unique,
    FOREIGN KEY (student) REFERENCES Student(id)
);

CREATE TABLE Subject
(
	id int PRIMARY KEY auto_increment,
    name varchar(10) check(name in("BEL", "Math", "Sports"))
);

CREATE TABLE Grade
(
	id int PRIMARY KEY auto_increment,
    grade float check(grade between 2 and 6),
    date_of_write date check(year(date_of_write) > '2000'),
    subject_id int not null,
    foreign key (subject_id) references Subject(id),
    student_id int not null,
    foreign key (student_id) references Student(id)
);

insert into School(name) values ("TUES");
insert into School(name) values ("NPMG");
insert into School(name) values ("SMG");

insert into Class(class, paralelka, school) values (8, 'A', 1);
insert into Class(class, paralelka, school) values (9, 'V', 1);
insert into Class(class, paralelka, school) values (10, 'B', 1);
insert into Class(class, paralelka, school) values (8, 'A', 2);
insert into Class(class, paralelka, school) values (11, 'V', 2);

insert into Student(name, age, class) values("acho", 17, 3);
insert into Student(name, age, class) values("gosho", 17, 3);
insert into Student(name, age, class) values("tosho", 17, 3);
insert into Student(name, age, class) values("pesho", 15, 1);
insert into Student(name, age, class) values("Mishelle", 16, 4);
insert into Student(name, age, class) values("arcan", 17, 4);
insert into Student(name, age, class) values("mishe", 25, 5);

insert into Adress(Street, student) values ("a", 1);
insert into Adress(Street, student) values ("o", 2);
insert into Adress(Street, student) values ("r", 3);
insert into Adress(Street, student) values ("d", 4);
insert into Adress(Street, student) values ("e", 5);
insert into Adress(Street, student) values ("c", 6);
insert into Adress(Street, student) values ("b", 7);

insert into Subject(name) values("BEL");
insert into Subject(name) values("Sports");
insert into Subject(name) values("Math");

insert into Grade(grade, subject_id, student_id, date_of_write) values(5, 1, 1, "2022-11-10");
insert into Grade(grade, subject_id, student_id, date_of_write) values(6, 1, 2, "2022-9-10");
insert into Grade(grade, subject_id, student_id, date_of_write) values(5, 2, 3, "2022-8-20");
insert into Grade(grade, subject_id, student_id, date_of_write) values(6, 1, 4, "2022-5-15");
insert into Grade(grade, subject_id, student_id, date_of_write) values(3, 2, 5, "2022-2-1");
insert into Grade(grade, subject_id, student_id, date_of_write) values(3, 3, 6, "2022-2-1");
insert into Grade(grade, subject_id, student_id, date_of_write) values(2, 1, 7, "2022-3-4");
insert into Grade(grade, subject_id, student_id, date_of_write) values(3, 1, 7, "2022-3-4");

select School.name, Count(Student.id) from School
LEFT JOIN Class on School.id = Class.school
left join Student ON Class.id = Student.class
group by School.name 
order by count(Student.id) desc;

select School.name, AVG(Grade.grade) from School
LEFT JOIN Class on School.id = Class.school
left join Student ON Class.id = Student.class
left join Grade on Student.id = Grade.student_id
right join Subject on Grade.subject_id = Subject.id
group by School.name, Subject.name
order by AVG(Grade.grade) desc;

Select Grade.grade, Subject.name, Student.name, Class.class, Class.paralelka, School.name, Grade.date_of_write from Grade
right join Subject on Subject.id = Grade.subject_id
left join Student on Student.id = Grade.student_id
left join Class on Student.class = Class.id
left join School on School.id = Class.school;

Select Student.name, AVG(Grade.grade) from Grade
Right join Student on Student.id = Grade.student_id
left join Subject on Grade.subject_id = Subject.id
where  Student.name like 'M%e' and Month(Grade.date_of_write) not in ("1", "3" "9") and Year(Grade.date_of_write) = "2022" and Subject.name in ("Math", "Sports")
group by Student.name
order by AVG(Grade.grade) DESC
limit 1;

select School.name, Class.class, Class.paralelka, avg(Grade.grade) from School
left join Class on Class.school = School.id
left join Student on Student.class = Class.id
left join Grade on Grade.student_id = Student.id
left join Subject on Grade.subject_id = Subject.id
group by School.name, Class.class, Class.paralelka
order by avg(Grade.grade);

select distinct Student.name, Subject.name, Grade.grade from Grade
right join Student on Grade.student_id = Student.id
left join Subject on Subject.id = Grade.subject_id;

select School.name from School
left join Class on Class.school = School.id
left join Student on Student.class = Class.id
group by School.name
having COUNT(Student.id) = 0;