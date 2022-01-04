----------------------------------------------------------------------
 -- The dataset contains information about Data Scientist salary, Industry, Degree type, Company name, Revenue. I have separated the tables into two:
 -- Table 1: datascientist 
 -- Table 2: datascientist_salary
-----------------------------------------------------------------------
SELECT * 
FROM AMINAT.datascientist;

SELECT *

FROM AMINAT.datascientist_salary;

-- JOIN-- We want to combine both tables using Inner Join to see what is common in both tables

SELECT *
FROM AMINAT.datascientist
JOIN AMINAT.datascientist_salary
ON datascientist.index = datascientist_salary.index;


SELECT datascientist.salary, datascientist.Degree, datascientist.Title
FROM AMINAT.datascientist
JOIN AMINAT.datascientist_salary
ON datascientist.index = datascientist_salary.index
ORDER BY
Degree DESC;
-----------------------------------------------------------------------------------
-- CASE Statement:Change Degree type from M to Masters, na to No Degree and P to BSc
------------------------------------------------------------------------------------
SELECT Degree, Salary, industry, Sector, Title,
CASE When Degree = 'M' THEN 'Masters'
	When Degree = 'na' THEN 'NO Degree'
    When Degree = 'P' THEN 'BSC'
	ELSE 'Degree'
    END AS NewDegree
FROM AMINAT.datascientist_salary
WHERE Degree is NOT NULL
ORDER BY Degree;

---------------------------------------------------------------------------------
-- Group By to check how many Data Scientist have Masters, BSC and No Degree
 --------------------------------------------------------------------------------
SELECT datascientist.Degree, COUNT(datascientist.Degree)
FROM AMINAT.datascientist
JOIN AMINAT.datascientist_salary
ON datascientist.index = datascientist_salary.index
GROUP BY datascientist.Degree;


SELECT datascientist.Degree, COUNT(datascientist.Degree)
FROM AMINAT.datascientist
JOIN AMINAT.datascientist_salary
ON datascientist.index = datascientist_salary.index
GROUP BY datascientist.Degree
HAVING (datascientist.Degree) = 'na';


SELECT datascientist.salary, datascientist.Degree, datascientist.Title, datascientist.industry,
COUNT(datascientist.Degree) OVER (PARTITION BY datascientist.Degree) AS TotalDegree
FROM AMINAT.datascientist
JOIN AMINAT.datascientist_salary
ON datascientist.index = datascientist_salary.index;

-----------------------------------------------------------------------------------------------------------
-- Delete unused column. Also, I always use the Select statement to confirm what i want to Delete
-------------------------------------------------------------------------------------------------------------

SELECT *
FROM AMINAT.datascientist
WHERE datascientist.index = 20;

DELETE 
FROM AMINAT.datascientist
WHERE datascientist.index = 20;

-- CTE

WITH CTE_index as
(SELECT datascientist.salary, datascientist.Degree, datascientist.Title, datascientist.industry,
COUNT(datascientist.Degree) OVER (PARTITION BY datascientist.Degree) AS TotalDegree
FROM AMINAT.datascientist
JOIN AMINAT.datascientist_salary
ON datascientist.index = datascientist_salary.index
)
SELECT *
FROM CTE_index





       
      