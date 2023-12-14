CREATE DATABASE ise;
USE ise;

CREATE TABLE students (
  prn INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  marks INT NOT NULL,
  PRIMARY KEY (prn)
);
INSERT INTO students (prn, name, marks)
VALUES
  (1, 'Ron', 85),
  (2, 'Martin', 80),
  (3, 'Irwin', 74),
  (4, 'Dave', 75),
  (5, 'Rock', 70),
  (6, 'Frank', 65),
  (7, 'Mark', 80),
  (8, 'Henry', 65),
  (9, 'Ivan', 80),
  (10,'Jack', 70);

-- BASIC QUERIES

	
SELECT * FROM students;
SELECT * FROM students WHERE marks >= 70;
SELECT * FROM students WHERE name LIKE 'A%';
SELECT AVG(marks) FROM students;
SELECT MAX(marks) AS highest_mark FROM students;
SELECT MIN(marks) AS lowest_mark FROM students;
SELECT COUNT(*) AS student_count FROM students;

SELECT marks, COUNT(*)  FROM students GROUP BY marks;
-- Group the students in the students table by their mark and count the number of students in each group

SELECT * FROM students ORDER BY marks DESC LIMIT 3;
-- Select the top 3 students in the students table by their mark

SELECT * FROM students ORDER BY marks ASC LIMIT 3;
-- Select the bottom 3 students in the students table by their mark

SELECT name FROM students WHERE marks >= 90 AND LENGTH(name) > 5;
-- Select the names of all of the students in the students table who have a mark that is greater than or equal to 90 and whose name is longer than 5 characters

SELECT marks FROM students WHERE name LIKE '%E%';
-- Select the marks of all of the students in the students table whose name contains the letter "E"

SELECT marks FROM students GROUP BY marks HAVING COUNT(*) = 1;
-- Select the marks of all of the students in the students table whose name is unique

SELECT name FROM students WHERE marks IN (SELECT marks FROM students GROUP BY marks HAVING COUNT(*) > 1);
-- Select the names of all of the students in the students table who have the same mark as another student

SELECT name FROM students WHERE marks > (SELECT marks FROM students WHERE prn = 5);
-- Select the names of all of the students in the students table who have a higher mark than the student with the PRN of 5

SELECT name FROM students WHERE marks <= (SELECT marks FROM students WHERE prn = 7);
-- Select the names of all of the students in the students table whose mark is less than or equal to the mark of the student with the PRN of 7

SELECT name FROM students WHERE marks BETWEEN (SELECT marks FROM students WHERE prn = 3) - 10 AND (SELECT marks FROM students WHERE prn = 3) + 10;
-- Select the names of all of the students in the students table who have a mark that is within 10 points of the mark of the student with the PRN of 3

-- COMPARION QUERIES
 
SELECT * FROM students WHERE marks >= 90;
SELECT * FROM students WHERE marks IN (90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100);

SELECT name FROM students WHERE prn <= 5;
SELECT name FROM students WHERE name IN ('Alice', 'Bob', 'Carol', 'Dave', 'Eve');


SELECT * FROM students WHERE marks > (SELECT AVG(marks) FROM students);
SELECT * FROM students WHERE LENGTH(name) > (SELECT LENGTH(name) FROM students WHERE prn = 1);
SELECT * FROM students WHERE marks <= (SELECT MAX(marks) FROM students);
SELECT * FROM students WHERE name IN (SELECT name FROM students GROUP BY name HAVING COUNT(*) > 1);
SELECT * FROM students WHERE marks IN (SELECT marks FROM students GROUP BY marks HAVING COUNT(*) > 1);
SELECT name FROM students WHERE marks BETWEEN (SELECT marks FROM students WHERE prn = 5) - 10 AND (SELECT marks FROM students WHERE prn = 5) + 10;
SELECT marks FROM students WHERE name <> 'Alice';
SELECT name FROM students WHERE marks > (SELECT AVG(marks) FROM students) AND name LIKE 'B%';
SELECT marks FROM students WHERE name IN (SELECT name FROM students GROUP BY name HAVING COUNT(*) = 1) AND marks > (SELECT AVG(marks) FROM students);
SELECT name FROM students WHERE marks > (SELECT marks FROM students WHERE prn = 3) AND name <> 'Bob';


