CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(50),
    gender VARCHAR(10),
    year INT,
    class INT,
    maths INT,
    science INT,
    english INT,
    total INT,
    percentage DECIMAL(5,2),
    result VARCHAR(10),
    PRIMARY KEY (student_id, year)
);