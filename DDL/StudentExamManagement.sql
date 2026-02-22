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

