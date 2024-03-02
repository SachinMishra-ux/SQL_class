-- Write a query to find the names of students who are older than the average age of all students.

SELECT student_name, age
FROM students
WHERE age > (SELECT AVG(age) FROM Students);

-- List the names of students who have taken more than two courses.

SELECT student_name
FROM students
WHERE student_id IN (SELECT student_id FROM enrollment GROUP BY student_id HAVING COUNT(course_id) > 2);

-- Find the names of students who have not taken the 'History' course.

SELECT student_name
FROM students
WHERE student_id NOT IN (SELECT student_id FROM enrollment WHERE course_id = 104);

-- Create a view that shows the student ID, name, age, and total number of credits taken by each student.

-- Write a query to find the course names along with their respective average credits taken by students.

