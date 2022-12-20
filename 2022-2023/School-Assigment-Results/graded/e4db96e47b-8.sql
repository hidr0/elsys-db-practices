1 Address.street not null
1 Address.student_id not null
1 Address.student_id unique
 
0 Grade.grade [2,6] int
1 Grade.date
1 Grade.student_id
1 Grade.subject_id
 
1 Subject.name enum
0 Student.name not null
0 Student.name unique

1 Student.age not null
1 Student.age > 0
1 Student.class_id not null
 
1 Class.class not null
1 Class.class [1,12]
 
1 Class.paralelka [A,B,V]
1 Class.school_id not null
 
1 School.name not null
1 School.name unique
 
1 Has used foreign key 5 times
 
1 Task 1
0 Task 2
0 Task 3
1 Task 4
0 Task 5
0 Task 6
0 Task 6 without GROUP BY, but with DISTINCT
1 Task 7
 
Total points - 20