DROP DATABASE IF EXISTS DTB1;
CREATE DATABASE DTB1;
USE DTB1;

set sql_safe_updates=0;
set sql_mode=only_full_group_by;

CREATE TABLE School
(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100)
);

CREATE TABLE Class
(
	id int PRIMARY KEY AUTO_INCREMENT,
	class int check(class>=1 and class<=12),
    paralelka enum("A","B","V"),
    schoolId int NOT NULL,
    foreign key(schoolId) references School(id)
);

CREATE TABLE Student
(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL UNIQUE,
    age int NOT NULL CHECK(age>0),
    classId int NOT NULL,
	FOREIGN KEY (classId) REFERENCES Class(id)
);

CREATE TABLE Address
(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(100) NOT NULL UNIQUE,
	studentId int NOT NULL UNIQUE,
	FOREIGN KEY(studentId) REFERENCES Student(id)
);

CREATE TABLE Subject
(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100)
);

CREATE TABLE Grade
(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int NOT NULL CHECK(grade<=6 and grade>=2),
    dateOfGrade date,
    subjectId int NOT NULL,
    foreign key(subjectId) references Subject(id),
	studentId int NOT NULL,
    foreign key(studentId) references Student(id)
);





INSERT INTO School(name) values("TUES");
INSERT INTO School(name) values("SMG");
INSERT INTO School(name) values("NPMG");

INSERT INTO Class(class,paralelka,schoolId) values(10,"V",1);
INSERT INTO Class(class,paralelka,schoolId) values(8,"A",1);
INSERT INTO Class(class,paralelka,schoolId) values(11,"B",2);

INSERT INTO Student(name,age, classId) values("Madeline",16,1);
INSERT INTO Student(name,age, classId) values("Pesho",14,2);
INSERT INTO Student(name,age, classId) values("Mine",18,3);
INSERT INTO Student(name,age, classId) values("Misho",18,3);

INSERT INTO Subject(name) values("matematika");

INSERT INTO Subject(name) values("AE");
INSERT INTO Subject(name) values("sport");

INSERT INTO Grade(grade,dateOfGrade,subjectId,studentId) values(2,"2022-12-5",1,1);
INSERT INTO Grade(grade,dateOfGrade,subjectId,studentId) values(5,"2022-12-5",1,2);
INSERT INTO Grade(grade,dateOfGrade,subjectId,studentId) values(4,"2022-12-5",3,3);
INSERT INTO Grade(grade,dateOfGrade,subjectId,studentId) values(3,"2022-12-5",2,4);

INSERT INTO Address(street,studentId) values("a",1);
INSERT INTO Address(street,studentId) values("b",2);
INSERT INTO Address(street,studentId) values("c",3);
INSERT INTO Address(street,studentId) values("d",4);

-- 1

select School.name,Count(student.id) From School
left join class on class.schoolId=School.id
left join student on student.classId=Class.id
group by school.id
order by count(student.id) desc;

-- 2
select School.name,avg(Grade.grade) From School
left join class on class.schoolId=School.id
left join student on student.classId=Class.id
left join grade on student.id=grade.studentId
group by school.id
order by avg(Grade.grade) desc
limit 1;

-- 3
select Student.name,grade.grade, subject.name,class.class,class.paralelka,school.name,grade.dateOfGrade From School
right join class on class.schoolId=School.id
right join student on student.classId=Class.id
right join grade on student.id=grade.studentId
left join subject on subject.id=grade.subjectId;

-- 4
select Student.name,avg(grade.grade) as average From School
left join class on class.schoolId=School.id
left join student on student.classId=Class.id
left join grade on student.id=grade.studentId
left join subject on subject.id=grade.subjectId
where student.name like "M%e" and month(grade.dateOfGrade) NOT IN(1,3,9) and year(grade.dateOfGrade) = 2022 and subject.name IN("matematika", "sport")
group by student.id
order by average desc limit 1;

-- 5
select class.class,class.paralelka,School.name,avg(Grade.grade) as average From School
right join class on class.schoolId=School.id
left join student on student.classId=Class.id
left join grade on student.id=grade.studentId
group by class.id
order by average asc;

-- 6
select distinct Student.name,subject.name From School
left join class on class.schoolId=School.id
left join student on student.classId=Class.id
left join grade on student.id=grade.studentId
left join subject on subject.id=grade.subjectId;

-- 7
select school.name from school
left join class on class.schoolId=School.id
left join student on student.classId=Class.id
where student.id IS NULL;
