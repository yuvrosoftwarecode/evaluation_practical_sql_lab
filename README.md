# College Academic Analytics

## Overview

Welcome to the **College Academic Analytics** evaluation lab. A university administration has pre-configured and populated a PostgreSQL database to analyze student academic performance, course enrollment, and departmental performance.

Your objective as a data analyst is to write standard, robust PostgreSQL queries that generate three specific reports for the university administration.

The database and data have already been seeded. Do not alter tables or modify data. Write your queries in the corresponding task files.

---

## Database Schema

The PostgreSQL database contains the following tables:

### 1. `departments`
- `department_id` (INTEGER, PRIMARY KEY)
- `department_name` (VARCHAR)

### 2. `faculty`
- `faculty_id` (INTEGER, PRIMARY KEY)
- `faculty_name` (VARCHAR)
- `department_id` (INTEGER, FOREIGN KEY -> `departments.department_id`)

### 3. `courses`
- `course_id` (INTEGER, PRIMARY KEY)
- `course_name` (VARCHAR)
- `department_id` (INTEGER, FOREIGN KEY -> `departments.department_id`)
- `credits` (INTEGER)

### 4. `students`
- `student_id` (INTEGER, PRIMARY KEY)
- `student_name` (VARCHAR)
- `email` (VARCHAR, UNIQUE)
- `department_id` (INTEGER, FOREIGN KEY -> `departments.department_id`)
- `admission_year` (INTEGER)

### 5. `enrollments`
- `enrollment_id` (INTEGER, PRIMARY KEY)
- `student_id` (INTEGER, FOREIGN KEY -> `students.student_id`)
- `course_id` (INTEGER, FOREIGN KEY -> `courses.course_id`)
- `faculty_id` (INTEGER, FOREIGN KEY -> `faculty.faculty_id`)
- `marks` (NUMERIC(5,2))
- `status` (VARCHAR: `'completed'`, `'active'`, `'dropped'`)
- `enrolled_on` (DATE)

---

## Tasks

### Task 1: Student Performance Report (`task1.sql`)
The university wants to identify high-performing students.

Write a SQL query that returns students whose average marks across their completed courses are greater than 75.

- **Columns:** `student_id`, `student_name`, `department_name`, `courses_completed`, `average_marks`
- **Requirements:**
  1. Consider only enrollments with status `completed`.
  2. Calculate the average using `marks`.
  3. Students must have completed at least 3 courses.
  4. Include only students whose average marks are greater than 75.
  5. Join the department information.
  6. Sort by `average_marks` descending.
  7. If averages are equal, sort by `student_id` ascending.
  8. Return each student only once.

### Task 2: Top Student in Each Department (`task2.sql`)
The university administration wants to identify the highest-performing students in every department.

Calculate each student's average marks using only completed enrollments and return the top-ranked student(s) in each department.
If multiple students have exactly the same highest average in a department, include all tied students.

- **Columns:** `department_name`, `student_id`, `student_name`, `average_marks`, `rank`
- **Requirements:**
  1. Consider only `completed` enrollments.
  2. Calculate each student's average marks.
  3. Rank students separately within each department using a PostgreSQL window function like `RANK() OVER (PARTITION BY ... ORDER BY ...)`.
  4. Include all students with rank `1`.
  5. Sort by `department_name` ascending and `student_id` ascending.

### Task 3: Course Enrollment Analysis (`task3.sql`)
The university wants to identify courses that have higher-than-average student enrollment.

Write a SQL query that returns courses whose enrollment count is greater than the overall average enrollment across all courses.
Only `active` and `completed` enrollments should be counted.

- **Columns:** `course_id`, `course_name`, `department_name`, `enrollment_count`, `average_course_enrollment`
- **Requirements:**
  1. Count only enrollments with status `active` or `completed`.
  2. Calculate enrollment count separately for each course.
  3. Calculate the overall average enrollment across all courses.
  4. Return only courses whose enrollment count is greater than the overall average.
  5. Include department name.
  6. `average_course_enrollment` should represent the overall average used for comparison.
  7. Sort by `enrollment_count` descending.
  8. If enrollment counts are equal, sort by `course_id` ascending.
