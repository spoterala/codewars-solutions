-- You are given two tables in a PostgreSQL database: employees and employee_works. The employees table contains basic information about employees, while the employee_works table tracks the periods during which each employee has worked for the company.

-- Tables Structure:

-- employees:

-- id (int): primary key
-- employee_name (string): name of the employee
-- employee_works:

-- id (int): primary key
-- employee_id(int): foreign key referencing employees.id)
-- start_date(DateTime): date and time when employee started working
-- finish_date (DateTime, nullable): date and time when employee finished working
-- Note: A NULL value in finish_date indicates that the employee is currently working.

-- Write a SQL query to generate a report that provides the following information for each employee in the employees table:

-- id (int): Employee's ID.
-- employee_name (string): Employee's name.
-- status (string): A string that can be one of the following:
-- 'Still with us': If the employee is currently working (i.e., has an ongoing period with finish_date as NULL).
-- 'Left': If the employee has worked in the past but is not currently working.
-- 'Never worked': If the employee has never worked (i.e., no corresponding records in employee_works).
-- total_duration (interval): The total accumulated duration of employment for each employee, calculated as follows:
-- For employees currently working (finish_date is NULL for their latest period), calculate the duration from the start date of their first period to the current date. This includes aggregating any previous periods of employment. Use PostgreSQL's current_date function for ongoing employment calculations.
-- For past employees (those who have left and have a finish_date for their last period), aggregate the durations of all their work periods.
-- The interval datatype in PostgreSQL will automatically format this duration in a standardized and human-readable format, so don't worry about formatting. This will default to PostgreSQL's interval format, which primarily shows days and time.
-- Additional info:
-- Please note that this query assumes that each employee has at most one continuous employment period or multiple periods with no overlaps.
-- The PostgreSQL interval datatype, when summed up directly, often defaults to a format that primarily shows days and time (hours, minutes, seconds) and does not automatically convert this into years and months. This behavior is due to the inherent complexity in converting days to months or years, as the number of days in a month and year can vary. In this task, we will not focus on manually adjusting the interval to a specific format like years, months, and days.
-- Order the results by the employee's id in descending order.
-- Desired Output
-- The desired output should look like this:

-- id	employee_name	status	total_duration
-- 7	Employee G	Never worked	
-- 6	Employee F	Still with us	313 days
-- 5	Employee E	Never worked	
-- 4	Employee D	Left	1077 days
-- 3	Employee C	Never worked	
-- 2	Employee B	Still with us	342 days 20:00:00
-- 1	Employee A	Still with us	361 days

SELECT e.id, e.employee_name,
CASE WHEN MAX(ew.finish_date) IS NULL AND MAX(ew.start_date) IS NULL THEN 'Never worked'
        WHEN NULLIF(MAX(COALESCE(ew.finish_date,'9999-12-31')),'9999-12-31') IS NULL THEN 'Still with us'
        WHEN MAX(ew.finish_date) IS NOT NULL THEN 'Left'
END AS status,
SUM(COALESCE(ew.finish_date, current_date) - start_date) AS total_duration
FROM employees e
LEFT JOIN employee_works ew on ew.employee_id = e.id 
GROUP BY e.id, e.employee_name
ORDER BY e.id DESC;