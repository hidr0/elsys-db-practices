## Grading
- From the folder `./assignments/` download the files which have your number on them.

- Please copy this legend into a file with the name, grade and upload it.

```
hash-YOURNUMBER.txt
```

- Please write explanations on each 0 you put. If you do not put an explanation a point will be deducted from your score.

- Please be careful when grading the queries you will need to add/remove/update data in order to figure out if it is actually working.

- The way that you should grade is in parallel. You open the three examples you need to grade and grade the first 3 criteria, then you move to the next criteria.

## The criteria is this:


```
Address.street not null
Address.student_id not null
Address.student_id unique


Grade.grade [2,6] int
Grade.date
Grade.student_id
Grade.subject_id

Subject.name enum
Student.name not null
Student.name unique

Student.age not null
Student.age > 0
Student.class_id not null

Class.class not null
Class.class [1,12]

Class.paralelka [A,B,V]
Class.school_id not null

School.name not null
School.name unique

Has used foreign key 5 times

Task 1
Task 2
Task 3
Task 4
Task 5
Task 6
Task 6 without GROUP BY, but with DISTINCT
Task 7

Total points -
```


## People who have submitted after 930 and will have one point less:
```
commit b7d8cc66 (HEAD -> master, origin/master, origin/HEAD)
Author: ivayla44 <61330504+ivayla44@users.noreply.github.com>
Date:   Tue Dec 13 09:36:04 2022 +0200

    Add files via upload

commit b960f979
Author: Victor_Handzhiev <50800277+DeDaznam123@users.noreply.github.com>
Date:   Tue Dec 13 09:34:51 2022 +0200

    Update 4_school.sql

commit 93a6bf73
Author: Victor_Handzhiev <50800277+DeDaznam123@users.noreply.github.com>
Date:   Tue Dec 13 09:32:03 2022 +0200

    Add files via upload

commit a7403b74
Author: Radoslav Filipov <42972410+fedarrdi@users.noreply.github.com>
Date:   Tue Dec 13 03:30:21 2022 -0400

    Update Number_School.sql
```

## People who have submitted the wrong name during the test:

```
commit a7403b74
Author: Radoslav Filipov <42972410+fedarrdi@users.noreply.github.com>
Date:   Tue Dec 13 03:30:21 2022 -0400

    Update Number_School.sql
```

## Students that have less examples to grade:
```
Left over Students: [15, 16, 22, 23, 3, 6, 8, 9, 16, 17, 20, 3, 14, 15, 16]
Number of left over Students: 11
```