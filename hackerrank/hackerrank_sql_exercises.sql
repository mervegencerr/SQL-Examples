# 1. Query all columns for all American cities in the CITY table with populations larger than 100000. 
#    The CountryCode for America is USA.

SELECT
 *
FROM city
WHERE 
 population > 100000
 AND countrycode = 'USA' ;
---------------------------------------------------------------------------------------------------------

# 2. Query all columns for a city in CITY with the ID 1661.

SELECT 
 *
FROM city
WHERE 
 id = 1661 ;
---------------------------------------------------------------------------------------------------------

# 3. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT
 *
FROM city
WHERE
 countrycode = 'JPN' ;
----------------------------------------------------------------------------------------------------------

# 4. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

SELECT
 name 
FROM city
WHERE
 countrycode = 'JPN' ;
-----------------------------------------------------------------------------------------------------------

# 5. Query a list of CITY and STATE from the STATION table.

SELECT
 city
 , state
FROM station ;
------------------------------------------------------------------------------------------------------------

# 6. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, 
#    but exclude duplicates from the answer.

SELECT DISTINCT
 city
FROM station
WHERE 
 MOD(ID, 2) = 0 ;
--------------------------------------------------------------------------------------------------------------

# 7. Find the difference between the total number of CITY entries in the table and the number of distinct CITY 
#    entries in the table.

SELECT
 COUNT(city) - COUNT(DISTINCT city)
FROM station ;
-------------------------------------------------------------------------------------------------------------

# 8. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths
#   (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one 
#   that comes first when ordered alphabetically.

(SELECT 
  city
  , LENGTH(city) AS length
 FROM station
 ORDER BY length ASC, city ASC
 LIMIT 1)
UNION
(SELECT 
  city
  , LENGTH(city) AS length
 FROM station
 ORDER BY length DESC, city ASC
 LIMIT 1);
---------------------------------------------------------------------------------------------------------------

# 9. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT 
 city
FROM station
WHERE 
 city LIKE 'a%' 
 OR city LIKE 'e%' 
 OR city LIKE 'i%' 
 OR city LIKE 'o%' 
 OR city LIKE 'u%' ;
----------------------------------------------------------------------------------------------------------------

# 10. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT 
 city
FROM station
WHERE 
 city LIKE '%a' 
 OR city LIKE '%e' 
 OR city LIKE '%i' 
 OR city LIKE '%o' 
 OR city LIKE '%u' ;
------------------------------------------------------------------------------------------------------------------

# 11. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and 
#     last characters. Your result cannot contain duplicates.

SELECT DISTINCT 
 city
FROM station
WHERE 
 (city LIKE 'a%' OR city LIKE 'e%'  OR city LIKE 'i%'  OR city LIKE 'o%'  OR city LIKE 'u%' ) 
 AND (city LIKE '%a' OR city LIKE '%e' OR city LIKE '%i' OR city LIKE '%o' OR city LIKE '%u') ;
---------------------------------------------------------------------------------------------------------------------

# 12. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT 
 city
FROM station
WHERE 
 city NOT LIKE 'a%' 
 AND city NOT LIKE 'e%' 
 AND city NOT LIKE 'i%' 
 AND city NOT LIKE 'o%' 
 AND city NOT LIKE 'u%' ;
---------------------------------------------------------------------------------------------------------------------

# 13. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT 
 city
FROM station
WHERE 
 city NOT LIKE '%a' 
 AND city NOT LIKE '%e' 
 AND city NOT LIKE '%i' 
 AND city NOT LIKE '%o' 
 AND city NOT LIKE '%u' ;
--------------------------------------------------------------------------------------------------------------------

# 14. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
#     Your result cannot contain duplicates.

SELECT DISTINCT
 city
FROM station
WHERE (city NOT LIKE 'a%' 
 AND city NOT LIKE 'e%' 
 AND city NOT LIKE 'i%' 
 AND city NOT LIKE 'o%' 
 AND city NOT LIKE 'u%')
 OR (city NOT LIKE '%a' 
 AND city NOT LIKE '%e' 
 AND city NOT LIKE '%i' 
 AND city NOT LIKE '%o' 
 AND city NOT LIKE '%u') ;
--------------------------------------------------------------------------------------------------------------------

# 15. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
#     Your result cannot contain duplicates.

SELECT DISTINCT
 city
FROM station
WHERE (city NOT LIKE 'a%' 
 AND city NOT LIKE 'e%' 
 AND city NOT LIKE 'i%' 
 AND city NOT LIKE 'o%' 
 AND city NOT LIKE 'u%')
 AND (city NOT LIKE '%a' 
 AND city NOT LIKE '%e' 
 AND city NOT LIKE '%i' 
 AND city NOT LIKE '%o' 
 AND city NOT LIKE '%u') ;
--------------------------------------------------------------------------------------------------------------------

# 16. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters 
#     of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.),
#     secondary sort them by ascending ID.

SELECT 
 name
FROM students
WHERE 
 marks > 75
ORDER BY 
 SUBSTR(name, -3), ID ;
--------------------------------------------------------------------------------------------------------------------

# 17. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT
 name
FROM employee
ORDER BY name ;
--------------------------------------------------------------------------------------------------------------------

# 18. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having 
#     a salary greater than $2000  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

SELECT
 name
FROM employee
WHERE 
 salary > 2000 
 AND months < 10 
ORDER BY employee_id ;
-------------------------------------------------------------------------------------------------------------------

# 19. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
#     Truncate your answer to 4 decimal places.

SELECT 
 ROUND(SUM(lat_n),4)
FROM station
WHERE 
 lat_n BETWEEN 38.7880 AND 137.2345 ;
--------------------------------------------------------------------------------------------------------------------

# 20. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
#     Truncate your answer to 4 decimal places.

SELECT
 ROUND(MAX(lat_n),4)
FROM station
WHERE 
 lat_n < 137.2345 ;
---------------------------------------------------------------------------------------------------------------------

# 21. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. 
#     Round your answer to 4 decimal places.

SELECT
 ROUND(long_w, 4)
FROM station
WHERE 
 lat_n = (SELECT MAX(lat_n) 
          FROM station 
          WHERE lat_n < 137.2345);
----------------------------------------------------------------------------------------------------------------------

# 22. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

SELECT
  ROUND(MIN(lat_n),4)
FROM station
WHERE 
 lat_n > 38.7780 ;
--------------------------------------------------------------------------------------------------------------------

# 23. Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780.
#     Round your answer to 4 decimal places.

SELECT
 ROUND(long_w, 4)
FROM station 
WHERE
 lat_n = (SELECT MIN(lat_n)
          FROM station
          WHERE lat_n > 38.7780);
---------------------------------------------------------------------------------------------------------------------

# 24. Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
#     a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
#     b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
#     c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
#     d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
#     Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

SELECT 
    ROUND(ABS(MAX(lat_n) - MIN(lat_n)) + ABS(MAX(long_w) - MIN(long_w)), 4) AS manhattan_distance
FROM station;
------------------------------------------------------------------------------------------------------------------------

# 25. Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
#     Output one of the following statements for each record in the table:
#     Equilateral: It's a triangle with  sides of equal length.
#     Isosceles: It's a triangle with  sides of equal length.
#     Scalene: It's a triangle with  sides of differing lengths.
#     Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT CASE
WHEN A+B <= C OR A+C <= B OR B+C <= A THEN 'Not A Triangle' 
WHEN A = B AND B = C THEN 'Equilateral'
WHEN A = B OR B = C OR A = C THEN 'Isosceles'
ELSE 'Scalene'
END
FROM triangles;
------------------------------------------------------------------------------------------------------------------------

# 26. Generate the following two result sets: Query an alphabetically ordered list of all names in OCCUPATIONS, immediately 
#     followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A),
#     ADoctorName(D), AProfessorName(P), and ASingerName(S). Query the number of ocurrences of each occupation in OCCUPATIONS.
#     Sort the occurrences in ascending order, and output them in the following format:
#     There are a total of [occupation_count] [occupation]s.
#     where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name.
#     If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

WITH deneme AS(
SELECT 
 CONCAT(name, '(',SUBSTRING(occupation,1,1),')') 
FROM occupations 
UNION ALL
SELECT
 CONCAT('There are a total of ', COUNT(occupation),' ', lower(occupation), 's.')
FROM occupations
GROUP BY occupation
)
SELECT * FROM deneme
ORDER BY 1 ;
-----------------------------------------------------------------------------------------------------------------------

# 27. Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its
#     corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
#     Note: Print NULL when there are no more names corresponding to an occupation.

SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor
    , MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor
    , MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer
    , MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor 
FROM ( SELECT Name, Occupation, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum FROM OCCUPATIONS ) AS Temp 
GROUP BY RowNum ORDER BY RowNum;
--------------------------------------------------------------------------------------------------------------------------

# 28. You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, 
#     and P is the parent of N. Write a query to find the node type of Binary Tree ordered by the value of the node. Output one
#     of the following for each node:
#     Root: If node is root node.
#     Leaf: If node is leaf node.
#     Inner: If node is neither root nor leaf node.

SELECT DISTINCT
 BST.N
 , CASE
     WHEN BST2.P IS NULL THEN 'Leaf'
     WHEN BST.P IS NULL THEN 'Root'
     ELSE 'Inner'
     END AS TYPE
FROM BST 
LEFT JOIN BST BST2 
ON BST.N = BST2.P
ORDER BY BST.N;
----------------------------------------------------------------------------------------------------------------------------

# 29. Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers,
#     total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

SELECT
 DISTINCT e.company_code
 , c.founder
 , COUNT(DISTINCT(e.lead_manager_code))
 , COUNT(DISTINCT(e.senior_manager_code))
 , COUNT(DISTINCT(e.manager_code))
 , COUNT(DISTINCT(e.employee_code))
FROM employee e
JOIN company c 
ON c.company_code = e.company_code
GROUP BY c.founder, e.company_code
ORDER BY company_code; 
---------------------------------------------------------------------------------------------------------------------------

# 30 . Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

SELECT 
 city.name
FROM city 
JOIN country 
ON city.countrycode = country.code
WHERE continent = 'Africa' ;
---------------------------------------------------------------------------------------------------------------------------

# 31 . Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average 
#      city populations (CITY.Population) rounded down to the nearest integer.

SELECT 
 country.continent
 , FLOOR(AVG(city.population))
FROM city
JOIN country
ON city.countrycode = country.code 
GROUP BY country.continent ;
-----------------------------------------------------------------------------------------------------------------------------

# 32. Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES 
#     of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades 
#     are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular 
#     students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their
#     grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular
#     students by their marks in ascending order. Write a query to help Eve.

SELECT  
 CASE
  WHEN grades.grade < 8 THEN NULL
  ELSE students.name
  END
 , grades.grade 
 , students.marks
FROM students
INNER JOIN grades
ON (students.marks >= grades.min_mark AND students.marks <= grades.max_mark)
ORDER BY grades.grade DESC, students.name ASC ;
-----------------------------------------------------------------------------------------------------------------------------

# 33. Query a count of the number of cities in CITY having a Population larger than 100,000.

SELECT
 COUNT(name)
FROM city
WHERE population > 100000 ;
---------------------------------------------------------------------------------------------------------------------------

# 34. Query the total population of all cities in CITY where District is California.

SELECT
 SUM(population)
FROM city
WHERE district = 'California' ;
-----------------------------------------------------------------------------------------------------------------------------

# 35. Query the average population of all cities in CITY where District is California.

SELECT
 AVG(population)
FROM city
WHERE district = 'California' ;
--------------------------------------------------------------------------------------------------------------------------

# 36. Query the average population for all cities in CITY, rounded down to the nearest integer.

SELECT
 FLOOR(AVG(population))
FROM city ;
------------------------------------------------------------------------------------------------------------------------

# 37. Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

SELECT 
 SUM(population)
FROM city
WHERE countrycode = 'JPN' ;
-----------------------------------------------------------------------------------------------------------------------

# 38. Query the difference between the maximum and minimum populations in CITY.

SELECT
 MAX(population) - MIN(population)
FROM city ;
-----------------------------------------------------------------------------------------------------------------------

# 39 . Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
#      but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help 
#      finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
#      Write a query calculating the amount of error (i.e.: actual - miscalculated  average monthly salaries), and round 
#      it up to the next integer.

SELECT 
 CEIL(AVG(salary) - AVG(REPLACE(salary,0,''))) 
FROM employees;
----------------------------------------------------------------------------------------------------------------------

# 40 . We define an employee's total earnings to be their monthly salary*months worked, and the maximum total earnings
#      to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total
#      earnings for all employees as well as the total number of employees who have maximum total earnings. Then print 
#      these values as 2 space-separated integers.

SELECT
 CONCAT(MAX(salary*months), ' ', COUNT(*))
FROM employee 
GROUP BY salary*months
ORDER BY salary*months DESC
LIMIT 1 ;
-----------------------------------------------------------------------------------------------------------------------

# 41. Query the following two values from the STATION table:
#     The sum of all values in LAT_N rounded to a scale of  decimal places.
#     The sum of all values in LONG_W rounded to a scale of  decimal places.

SELECT
 ROUND(SUM(lat_n), 2)
 , ROUND(SUM(long_w), 2)
FROM station ;
-----------------------------------------------------------------------------------------------------------------------

# 42. Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum 
#     values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
#     Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

SELECT 
 ROUND(SQRT(POWER(MAX(lat_n)-MIN(lat_n),2) + POWER(MAX(long_w)-MIN(long_w),2)),4) 
FROM station;
-----------------------------------------------------------------------------------------------------------------------

# 43. A median is defined as a number separating the higher half of a data set from the lower half. Query the median of 
#     the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

SELECT 
 ROUND(AVG(lat_n),4) AS median
FROM (SELECT lat_n
       , ROW_NUMBER() OVER (ORDER BY lat_n) AS row_num
       , COUNT(*) OVER () AS total_rows
      FROM station) sub
WHERE row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
---------------------------------------------------------------------------------------------------------------------------

# 44. Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the 
#     ampersand (&) character as your separator (instead of a space). 

WITH RECURSIVE deneme AS (
    SELECT 2 AS num
    UNION ALL
    SELECT num + 1 FROM deneme WHERE num <= 999
)
, deneme2 AS(
    SELECT *
    FROM deneme a
    WHERE NOT EXISTS (
        SELECT 1 
        FROM deneme b
        WHERE b.num < a.num 
        AND b.num > 1 
        AND a.num % b.num = 0)
) 
    SELECT GROUP_CONCAT(num SEPARATOR '&')
    FROM deneme2;
----------------------------------------------------------------------------------------------------------------------------

# 45. Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

SELECT
 SUM(city.population)
FROM city
LEFT JOIN country
ON city.countrycode = country.code
WHERE continent = 'Asia' ;
------------------------------------------------------------------------------------------------------------------------------

# 46. Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print
#     the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in 
#     descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received 
#     full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT
 h.hacker_id
 , h.name
FROM hackers AS h
INNER JOIN submissions AS s ON h.hacker_id = s.hacker_id
INNER JOIN challenges AS c ON s.challenge_id = c.challenge_id
INNER JOIN difficulty AS d ON c.difficulty_level = d.difficulty_level
WHERE 
 d.score = s.score AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ;
------------------------------------------------------------------------------------------------------------------------------

# 47. Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand. Hermione decides 
#     the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power 
#     and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order 
#     of descending power. If more than one wand has same power, sort the result in order of descending age.

SELECT
 w.id
 , wp.age
 , w.coins_needed
 , w.power
FROM wands w
JOIN wands_property wp
ON w.code = wp.code
WHERE
 wp.is_evil = 0
 AND w.coins_needed = (SELECT MIN(coins_needed) FROM wands w2 WHERE w2.code = w.code AND w2.power = w.power)
ORDER BY w.power DESC, wp.age DESC ;
------------------------------------------------------------------------------------------------------------------------------

# 48. Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number 
#     of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than
#     one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the 
#     same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

WITH hc AS (
    SELECT 
        hacker_id AS id
        , COUNT(*) AS c
        , RANK() OVER (ORDER BY COUNT(*) DESC) AS r
    FROM challenges
    GROUP BY hacker_id
)
, unique_counts AS (
    SELECT 
        c 
        , COUNT(*) AS cnt
    FROM hc
    GROUP BY c
)
SELECT
    h.hacker_id
    , h.name
    , hc.c
FROM hackers h
JOIN hc ON hc.id = h.hacker_id
JOIN unique_counts uc 
ON uc.c = hc.c
WHERE hc.r = 1 
   OR uc.cnt = 1 
ORDER BY hc.c DESC, h.hacker_id ;
-------------------------------------------------------------------------------------------------------------------------------

# 49. The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the 
#     hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same 
#     total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of 0 from your result.

WITH deneme AS( 
    SELECT hacker_id
           , challenge_id
           , MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
)
SELECT 
 h.hacker_id
 , h.name
 , SUM(d.max_score) AS total_score
FROM hackers h
LEFT JOIN deneme d
ON h.hacker_id = d.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(d.max_score) > 0 
ORDER BY total_score DESC, h.hacker_id ASC ; 
---------------------------------------------------------------------------------------------------------------------------

# 50. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
#     * * * * * 
#     * * * * 
#     * * * 
#     * * 
#     *
#     Write a query to print the pattern P(20).

WITH RECURSIVE deneme AS ( 
 SELECT 20 AS s, REPEAT('* ', 20) AS stars
    UNION ALL
    SELECT s - 1, REPEAT('* ', s - 1) 
    FROM deneme 
    WHERE s > 1
)
SELECT stars
FROM deneme ;
---------------------------------------------------------------------------------------------------------------------------

# 51. P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
#     * 
#     * * 
#     * * * 
#     * * * * 
#     * * * * *
#     Write a query to print the pattern P(20).

WITH RECURSIVE deneme AS (
    SELECT 1 AS s
    UNION ALL
    SELECT s + 1
    FROM deneme
    WHERE s < 20
)
SELECT 
    REPEAT('* ', s) AS stars
FROM deneme;
--------------------------------------------------------------------------------------------------------------------------

# 52. You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains 
#     two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary 
#     in $ thousands per month). Write a query to output the names of those students whose best friends got offered a higher 
#     salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two 
#     students got same salary offer.

WITH deneme AS(
SELECT 
 s.id s_id
 , s.name s_name
 , f.friend_id f_id
 , s2.name s2_name
FROM students s
JOIN friends f
ON s.id = f.id
JOIN students s2
ON f.friend_id = s2.id
)
SELECT 
 s_name
FROM friends f
JOIN packages p 
ON f.id = p.id
JOIN packages p2 
ON p2.id = f.friend_id
JOIN deneme 
ON deneme.s_id = f.id AND deneme.f_id = f.friend_id 
WHERE p2.salary > p.salary 
ORDER BY p2.salary ;
-------------------------------------------------------------------------------------------------------------------------------

# 53. You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference
#     between the End_Date and the Start_Date is equal to 1 day for each row in the table. If the End_Date of the tasks are consecutive,
#     then they are part of the same project. Samantha is interested in finding the total number of different projects completed.
#     Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
#     If there is more than one project that have the same number of completion days, then order by the start date of the project.

-- total num of different projects
-- print start and end date of diffrerent projects
-- order by days to complete asc
-- order start date

WITH con_groups AS (
    SELECT 
        task_id
        , start_date
        , end_date
        , row_number() over (order by end_date)
        , end_date - ROW_NUMBER() OVER (ORDER BY end_date) AS grp
    FROM projects
)
, days AS (
    SELECT
        MIN(start_date) project_start
        , MAX(end_date) project_end
        , COUNT(*) AS num
    FROM con_groups
    GROUP BY grp
)
SELECT 
    project_start 
    , project_end
FROM days
ORDER BY num, project_start ;
-----------------------------------------------------------------------------------------------------------------------------

# 54. You are given a table, Functions, containing two columns: X and Y. Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric 
#     pairs if X1 = Y2 and X2 = Y1. Write a query to output all such symmetric pairs in ascending order by the value of X. List the
#     rows such that X1 ≤ Y1.

SELECT 
 DISTINCT f1.x
 , f1.y 
FROM functions f1 
INNER JOIN functions f2 
ON f1.x = f2.y AND f1.y = f2.x 
WHERE f1.x < f1.y 
OR f1.x IN (SELECT x FROM functions WHERE x = y GROUP BY x HAVING COUNT(*) > 1 ) 
ORDER BY f1.x ;
-----------------------------------------------------------------------------------------------------------------------------------

# 55. Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the 
#     contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views
#     for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0 . 
#     Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  1 screening contest.

WITH agg_views AS(
    SELECT
        c.challenge_id
        , SUM(total_views) AS total_views
        , SUM(total_unique_views) AS total_unique_views
    FROM challenges AS c
    LEFT JOIN view_stats AS v ON c.challenge_id = v.challenge_id
    GROUP BY c.challenge_id
)
, agg_submissions AS(
    SELECT
        c.challenge_id
        , SUM(total_submissions) AS total_submissions
        , SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM challenges AS c
    LEFT JOIN submission_stats AS s ON c.challenge_id = s.challenge_id
    GROUP BY c.challenge_id
)
SELECT 
    c.contest_id
    , c.hacker_id
    , c.name
    , SUM(total_submissions) AS total_submissions
    , SUM(total_accepted_submissions) AS total_accepted_submissions
    , SUM(total_views) AS total_views
    , SUM(total_unique_views) AS total_unique_views
FROM contests AS c
LEFT JOIN colleges AS col ON c.contest_id = col.contest_id
LEFT JOIN challenges AS cha ON col.college_id = cha.college_id
LEFT JOIN agg_views AS v ON cha.challenge_id = v.challenge_id
LEFT JOIN agg_submissions AS s ON cha.challenge_id = s.challenge_id
GROUP BY 
    c.contest_id
    , c.hacker_id
    , c.name
HAVING
    SUM(total_submissions) <> 0
    AND SUM(total_accepted_submissions) <> 0
    AND SUM(total_views) <> 0
    AND SUM(total_unique_views) <> 0
ORDER BY c.contest_id ;
-------------------------------------------------------------------------------------------------------------------------

# 56. Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.
#     Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest),
#     and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum 
#     number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

WITH each_day_submissions AS(
    SELECT 
        submission_date
        , hacker_id
        , COUNT(*) AS submission_counts
    FROM submissions
    GROUP BY submission_date, hacker_id
)
, max_submissions_each_day AS(
    SELECT
        submission_date
        , hacker_id
        , RANK() OVER(PARTITION BY submission_date ORDER BY submission_counts DESC, hacker_id) AS rn
    FROM each_day_submissions
)
, day_wise_rank AS (
    SELECT 
        submission_date
        , hacker_id
        , DENSE_RANK() OVER(ORDER BY submission_date) AS day_rn
    FROM submissions
    GROUP BY submission_date, hacker_id

)
, hacker_control_previous_day AS (
SELECT 
    dwr.submission_date
    , dwr.hacker_id
    , CASE WHEN dwr.submission_date = '2016-03-01' THEN 1 
        ELSE 1+(
                SELECT COUNT(DISTINCT a.submission_date) FROM submissions a 
                WHERE a.hacker_id = dwr.hacker_id AND a.submission_date < dwr.submission_date
    ) END AS prev_count
    , dwr.day_rn
FROM day_wise_rank AS dwr
)
, hacker_submission_each_day AS (
    SELECT 
        submission_date
        , COUNT(DISTINCT hacker_id) hacker_count
    FROM hacker_control_previous_day
    WHERE prev_count = day_rn
    GROUP BY submission_date
)
SELECT 
    hacker_submission_each_day.submission_date
    , hacker_submission_each_day.hacker_count
    , max_submissions_each_day.hacker_id
    , hackers.name
FROM hacker_submission_each_day
INNER JOIN max_submissions_each_day ON hacker_submission_each_day.submission_date = max_submissions_each_day.submission_date
INNER JOIN hackers ON hackers.hacker_id = max_submissions_each_day.hacker_id
WHERE max_submissions_each_day.rn = 1 ;
------------------------------------------------------------------------------------------------------------------------------