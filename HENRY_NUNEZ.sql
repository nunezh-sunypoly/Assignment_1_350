/*
	Henry Nunez CS350 SECTION 11
	Assignment 1
	Due time: Thursday September 26th, 2024 at 12:00 midnight
*/
-- 	1. 	show the name of each country whose name contains the syllable ‘in’ or ‘In’

    SELECT  country_id, country_name, region_id
    FROM    countries
    WHERE   countries.country_id ~ '^[iI][nN]';

--	2. 	show how many countries there are in each region (show the region id and the count)

    SELECT  region_id, COUNT(*) AS country_count 
    FROM    countries GROUP BY region_id;

-- 	3. 	show the first and last names of each employee who is a manager (that is whose job
 		title contains the word ‘Manager’)

    SELECT  e.first_name, e.last_name
    FROM    employees e
    JOIN    jobs j
    ON      e.job_id = j.job_id
    WHERE   j.job_title LIKE '%Manager%';

-- 	4. 	show the first and last name of each employee managed by Nancy Greenberg

    SELECT  e.first_name, e.last_name
    FROM    employees e
    WHERE   e.manager_id = (
                                SELECT  employee_id
                                FROM    employees
                                WHERE   first_name = 'Nancy' AND last_name = 'Greenberg'
                            ); 
/*

 	5. 	show the first and last name of each employee who is paid more than Luis Popp but
 		less than Alexander Hunold

*/

    SELECT e.first_name, e.last_name
    FROM employees e
    WHERE e.salary > (
        SELECT salary
        FROM employees
        WHERE first_name = 'Luis' AND last_name = 'Popp'
    )
    AND e.salary < (
        SELECT salary
        FROM employees
        WHERE first_name = 'Alexander' AND last_name = 'Hunold'
    );

