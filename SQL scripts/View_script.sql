-- Create the students table

CREATE TABLE students (

id SERIAL PRIMARY KEY, -- Unique ID for each student

name VARCHAR(50) NOT NULL -- Name of the student

);


-- Create the courses table

CREATE TABLE courses (

id SERIAL PRIMARY KEY, -- Unique ID for each course

name VARCHAR(100) NOT NULL -- Name of the course

);


-- Create the enrollments table

CREATE TABLE enrollments (

id SERIAL PRIMARY KEY, -- Unique ID for each enrollment record

student_id INT REFERENCES students(id), -- Foreign key linking to the students table

course_id INT REFERENCES courses(id) -- Foreign key linking to the courses table

);


-- Insert sample data into the students table

INSERT INTO students (name) VALUES

('Ali'),

('Sarah'),

('Ahmed'),

('Fatima');


-- Insert sample data into the courses table

INSERT INTO courses (name) VALUES

('Mathematics'),

('Physics'),

('Computer Science');


-- Insert sample data into the enrollments table

INSERT INTO enrollments (student_id, course_id) VALUES

(1, 1), -- Ali enrolled in Mathematics

(2, 1), -- Sarah enrolled in Mathematics

(3, 2), -- Ahmed enrolled in Physics

(4, 1), -- Fatima enrolled in Mathematics

(3, 3); -- Ahmed enrolled in Computer Science


-- Retrieve courses with more than one enrollment using a subquery

SELECT c.name, sub.enrollments

FROM courses c

JOIN (

-- Subquery to count the number of enrollments per course

SELECT course_id, COUNT(id) AS enrollments

FROM enrollments

GROUP BY course_id

) sub ON c.id = sub.course_id

WHERE sub.enrollments > 1; -- Filter to include only courses with more than one enrollment


-- Retrieve all courses with their enrollment counts (optional)

SELECT c.name, COUNT(e.id) AS enrollments

FROM courses c

LEFT JOIN enrollments e ON c.id = e.course_id

GROUP BY c.id; -- Group by course ID to calculate enrollments for each course



CREATE VIEW all_enrollments AS
SELECT 
	e.id AS enrollment_id,
	s.name AS student_name,
	c.name AS course_name
FROM enrollments e
JOIN students s ON e.student_id = s.id
JOIN courses c ON e.course_id = c.id;

SELECT * FROM all_enrollments;


CREATE VIEW no_courses2 AS
SELECT
	c.id AS course_id,
	c.name AS course_name
FROM courses c
LEFT JOIN enrollments ON c.id <> enrollments.course_id
WHERE enrollments.id IS NULL;

SELECT * FROM no_courses2;


CREATE VIEW count_enrollments AS
SELECT 
	s.name AS studnet_name,
	COUNT(e.id) AS counter
FROM students s
JOIN enrollments e ON s.id = e.student_id
GROUP BY s.name;

SELECT * FROM count_enrollments;


CREATE VIEW popular_enrollments AS
SELECT 
	c.name AS course_name,
	COUNT(e.course_id) AS counter
FROM courses c
JOIN enrollments e ON e.course_id = c.id
GROUP BY c.name HAVING count (e.id) >=2;

SELECT * FROM popular_enrollments;


CREATE VIEW courses_enrollments AS
SELECT
	s.name AS student_name,
	c.name AS course_name
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id;

SELECT * FROM courses_enrollments;


DROP VIEW IF EXISTS all_enrollments;


