use onlineExamDB;
-- STUDENT TABLE
CREATE TABLE Student (
	student_id INT PRIMARY KEY,
	student_name VARCHAR(100),
	email VARCHAR(100),
	gender VARCHAR(10),
	city VARCHAR(50),
	registration_date DATE
);

-- SUBJECT TABLE
CREATE TABLE Subject (
	subject_id INT PRIMARY KEY,
	subject_name VARCHAR(100),
	total_marks INT
);

-- EXAM SCHEDULE TABLE
CREATE TABLE ExamSchedule (
	exam_id INT PRIMARY KEY,
	subject_id INT,
	exam_date DATE,
	duration_minutes INT,
	FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

-- QUESTION TABLEa
CREATE TABLE Question (
	question_id INT PRIMARY KEY,
	question_text VARCHAR(500),
	difficulty_level VARCHAR(20),
	marks INT
);

-- SUBJECT-QUESTION (Many-to-Many)
CREATE TABLE SubjectQuestion (
	subject_id INT,
	question_id INT,
	PRIMARY KEY(subject_id, question_id),
	FOREIGN KEY (subject_id) REFERENCES Subject(subject_id),
	FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

-- RESULT TABLE
CREATE TABLE Result (
	result_id INT PRIMARY KEY,
	student_id INT,
	exam_id INT,
	marks_obtained INT,
	result_status VARCHAR(20),
	FOREIGN KEY (student_id) REFERENCES Student(student_id),
	FOREIGN KEY (exam_id) REFERENCES ExamSchedule(exam_id)
    );
    
# List all students

select  * from student;

# Show student names and emails

select student_name, email from student;

# Exams between two dates

select s.subject_name, e.exam_date, e.duration_minutes from examschedule e join subject s on s.subject_id = e.subject_id where exam_date between '2024-04-03' and '2024-04-10';

# Questions with difficulty = 'Hard'

select * from question where difficulty_level = 'Hard';

# Students whose name starts with 'A'

select * from student where student_name like 'A%';

# Students whose email ends with gmail.com

select * from student where email like '%gmail.com';

# Subjects containing 'Math'

select * from subject where subject_name like 'Math%';

# Questions having marks between 5 and 10

select * from question where marks between 5 and 10;

# Results where marks_obtained >= 40

select s.student_id, s.student_name, r.marks_obtained, r.result_status from student s inner join result r on s.student_id = r.student_id where r.marks_obtained >= 40 ;

# Students from multiple cities

select student_name, city from student;

# Exams longer than 90 minutes

select es.exam_date, sub.subject_name, es.duration_minutes from examschedule es join subject sub where es.duration_minutes > 90;

# Male students from Mumbai

select * from student where gender = 'male' and city = 'Mumbai';

# Subjects with total_marks between 50 and 100

select * from subject where total_marks between 50 and 100;

# Questions with marks = 5

select * from question where marks = 5;

# Students whose name contains 'hu'

select * from student where student_name like '%hu%';

# Results with status 'Pass'

select s.student_id, s.student_name, r.marks_obtained, r.result_status from student s join result r on r.student_id = s.student_id where r.result_status = 'pass';

# Students ordered by name

select * from student order by student_name;

# Students ordered by registration_date DESC

select * from student order by registration_date desc;

# Subjects ordered by total_marks DESC

select * from subject order by total_marks;

# Questions ordered by marks

select * from question order by marks;

# Results ordered by marks_obtained DESC

select s.student_id, s.student_name, r.marks_obtained from student s join result r on s.student_id = r.student_id order by r.marks_obtained desc;

# Exams ordered by date

select * from examschedule order by exam_date;

# Students ordered by city then name

select * from student order by city, student_name;

# Hard questions ordered by marks DESC

select * from question where difficulty_level = 'Hard' order by marks desc;

# Passed results ordered by marks

select * from result where result_status = 'Pass' order by marks_obtained;

# Subjects containing 'Science' ordered

select * from subject where subject_name = 'Physics' order by subject_id;

# Student with their exam results

select s.student_id, s.student_name, r.marks_obtained, r.result_status from student s inner join result r on s.student_id = r.student_id;

# Student with exam date

select s.student_id, s.student_name, ex.exam_date from student s join result r on r.student_id = s.student_id join examschedule ex on ex.exam_id = r.exam_id;

# Student with subject name

select s.student_id, s.student_name, sbj.subject_name,ex.exam_date from student s join result r on r.student_id = s.student_id join examschedule ex on ex.exam_id = r.exam_id join subject sbj on sbj.subject_id = ex.subject_id;

# Subject with questions

select sbj.subject_name, q.question_text from subject sbj join subjectquestion sq on sq.subject_id = sbj.subject_id join question q on sq.question_id = q.question_id;

# Left join students and results

select s.student_id, s.student_name, r.result_id, r.exam_id, r.marks_obtained, r.result_status from student s left join result r on s.student_id = r.student_id;

# Right join results and student

select s.student_id, s.student_name, r.exam_id, r.result_id, r.marks_obtained, r.result_status from result r right join student s on s.student_id = r.student_id;

# Students who passed with subject name

select s.student_id, s.student_name, r.result_status from student s join result r on s.student_id = r.student_id join examschedule ex on r.exam_id = ex.exam_id join subject sbj on sbj.subject_id = ex.subject_id where r.result_status = 'Pass';

# Count students by city

select count(student_id) as student_count, city from student group by city;

# Count students by gender

select gender, count(student_id) as count from student group by gender;

# Total exams per subject

select sbj.subject_name, count(e.exam_id) from subject sbj inner join examschedule e on e.subject_id = sbj.subject_id group by sbj.subject_name;

# Average marks per student

select s.student_id, s.student_name, avg(r.marks_obtained) as average_marks from student s join result r on s.student_id = r.student_id group by s.student_id, s.student_name order by average_marks desc;

# Students with avg marks > 60

select s.student_id, s.student_name, avg(r.marks_obtained) as avg_mark from student s join result r on s.student_id = r.student_id group by s.student_id, s.student_name having avg_mark > 60;

# Count questions per subject

select sbj.subject_name, count(sq.subject_id) from subjectquestion sq join subject sbj on sbj.subject_id = sq.subject_id group by sbj.subject_name;

# Subjects having more than 5 questions 

select sbj.subject_name, count(sq.question_id) as count from subject sbj join subjectquestion sq on sq.subject_id = sbj.subject_id group by sbj.subject_name having count > 1;

# Total marks obtained per exam

select ex.exam_id, ex.exam_date, sum(r.marks_obtained) as total_marks from examschedule ex join result r on ex.exam_id = r.exam_id group by ex.exam_id;

# Exams where total marks > 150

select ex.exam_id, ex.exam_date, sum(r.marks_obtained) as total_mark from examschedule ex inner join result r on ex.exam_id = r.exam_id group by ex.exam_id having total_mark > 150;

# Count pass and fail

select r.result_status, count(r.result_id) from result r group by r.result_status;

# Student Name, Subject Name, Exam Date, Marks

select s.student_name, sbj.subject_name, ex.exam_date, r.marks_obtained from student s inner join result r on s.student_id = r.student_id inner join examschedule ex on ex.exam_id = r.exam_id inner join subject sbj on ex.subject_id = sbj.subject_id;

# Students Who Scored More Than 70

select s.student_name, r.marks_obtained, r.result_status, sbj.subject_name, ex.exam_date, ex.duration_minutes from student s inner join result r on s.student_id = r.student_id inner join examschedule ex on ex.exam_id = r.exam_id inner join subject sbj on sbj.subject_id = ex.subject_id where r.marks_obtained > 70;

# Count of Exams Given by Each Student

select s.student_id,s.student_name ,count(r.exam_id) from student s left join result r on s.student_id = r.student_id group by s.student_id;



