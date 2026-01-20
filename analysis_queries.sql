-- ==========================================================
-- STUDENT PERFORMANCE ANALYSIS QUERIES
-- Project: 300 Records (60 Students x 5 Years)
-- ==========================================================

-- 1. DATA VERIFICATION
-- Checks if all 300 records are successfully loaded
SELECT COUNT(*) AS total_records FROM students;

-- 2. INDIVIDUAL STUDENT TRACKING (5-YEAR HISTORY)
-- These queries retrieve the academic journey of a single student over 5 years.

-- Search by Student ID (e.g., Student 1)
SELECT year, class, maths, science, english, total, percentage, result 
FROM students 
WHERE student_id = 1 
ORDER BY year ASC;

-- Search by Student Name (e.g., 'Ananya')
SELECT year, class, maths, science, english, total, percentage, result 
FROM students 
WHERE student_name = 'Ananya' 
ORDER BY year ASC;

-- 3. OVERALL PERFORMANCE STATISTICS
-- Calculating averages across the entire dataset

-- Average score of all students who passed
SELECT ROUND(AVG(percentage), 2) AS avg_pass_percentage 
FROM students 
WHERE result = 'Pass';

-- Subject-wise average marks per year
SELECT year, 
       ROUND(AVG(maths), 2) AS avg_maths, 
       ROUND(AVG(science), 2) AS avg_science, 
       ROUND(AVG(english), 2) AS avg_english 
FROM students 
GROUP BY year;

-- 4. GRADING & RANKING
-- Identifying top performers and assigning letter grades

-- Automated Grading System using CASE logic
SELECT student_name, year, percentage,
CASE 
    WHEN percentage >= 90 THEN 'A+'
    WHEN percentage >= 75 THEN 'A'
    WHEN percentage >= 60 THEN 'B'
    WHEN percentage >= 50 THEN 'C'
    ELSE 'D/Fail'
END AS letter_grade 
FROM students;

-- Year-wise Toppers (Highest percentage for each year)
SELECT year, student_name, percentage
FROM students s1
WHERE percentage = (SELECT MAX(percentage) 
                    FROM students s2 
                    WHERE s2.year = s1.year);

-- The "Gold Medalist" (Highest total marks in the entire database)
SELECT student_name, year, class, total 
FROM students 
WHERE total = (SELECT MAX(total) FROM students);

-- 5. RESULT TRENDS & GENDER ANALYSIS
-- Analyzing Pass/Fail distribution and gender performance

-- Count of Pass vs Fail per Year
SELECT year, result, COUNT(*) AS student_count 
FROM students 
GROUP BY year, result 
ORDER BY year, result DESC;

-- Performance comparison between Male and Female students
SELECT gender, 
       ROUND(AVG(percentage), 2) AS average_score,
       MAX(percentage) AS highest_score
FROM students 
GROUP BY gender;

-- 6. AT-RISK STUDENT ANALYSIS
-- Identifying subject weaknesses and persistent failures

-- Counting total failures by specific subject (Marks < 35)
SELECT 
    SUM(CASE WHEN maths < 35 THEN 1 ELSE 0 END) AS maths_fails,
    SUM(CASE WHEN science < 35 THEN 1 ELSE 0 END) AS science_fails,
    SUM(CASE WHEN english < 35 THEN 1 ELSE 0 END) AS english_fails
FROM students;

-- Students who have failed more than twice across the 5-year period
SELECT student_name, COUNT(*) AS fail_years 
FROM students 
WHERE result = 'Fail' 
GROUP BY student_name 
HAVING fail_years > 2;

-- 7. CLASS-WISE PERFORMANCE
-- Summarizing performance for each grade level (Class 1 to 10)
SELECT class, 
       COUNT(*) AS total_students,
       ROUND(AVG(percentage), 2) AS class_average
FROM students 
GROUP BY class 
ORDER BY class;