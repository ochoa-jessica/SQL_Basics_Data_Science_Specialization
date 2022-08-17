--1.
--We will be using the Salary by Job Range Table. This is a single table titled as salary_range_by_job_classification. This table contains the following columns:
--• SetID
--• Job_Code
--• Eff_Date
--• Sal_End_Date
--• Salary_setID
--• Sal_Plan
--• Grade
--• Step
--• Biweekly_High_Rate
--• Biweekly_Low_Rate
--• Union_Code
--• Extended_Step
--• Pay_Type

--2. Find the distinct values for the extended step. 
SELECT 
DISTINCT Extended_step
FROM salary_range_by_job_classification;
--Which of the following values is not a distinct value?
--5

--3. Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? 
SELECT 
	MIN(Biweekly_high_Rate)
FROM salary_range_by_job_classification
WHERE Biweekly_high_Rate <> '$0.00'
ORDER BY Biweekly_high_Rate ASC;
--$100.00

--4. What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? 
SELECT 
	MAX(Biweekly_high_Rate) 
FROM salary_range_by_job_classification;
--$9726.38

--5. What is the pay type for all the job codes that start with '03'? 
SELECT
	job_code,
	pay_type
FROM salary_range_by_job_classification
WHERE job_code LIKE "03%";
--B

--6.Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? 
SELECT
	grade,
	eff_date,
	sal_end_date
FROM salary_range_by_job_classification
WHERE grade = "Q90H0";
--What is the Effective Date (eff_date) for grade Q90H0? (include date and time)
--12/26/2009 12:00:00 AM

--7. Sort the Biweekly low rate in ascending order. 
SELECT Biweekly_Low_Rate 
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC
--Are these values properly sorted?
--No

 --8. What Step are Job Codes 0110-0400? Hint: there are 6 lines to run this query.
SELECT Step, Job_Code
FROM salary_range_by_job_classification
WHERE Job_Code BETWEEN 0110 AND 0400;
--1

--9. What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
SELECT Job_Code, 
Biweekly_High_Rate,
Biweekly_Low_Rate,
(Biweekly_High_Rate - Biweekly_Low_Rate ) AS temp
FROM salary_range_by_job_classification
WHERE Job_Code = "0170";
--0

--10. What is the Extended Step for Pay Types M, H, and D?
SELECT Extended_Step,
Pay_Type
FROM salary_range_by_job_classification
WHERE Pay_Type IN ('M', 'H', 'D');
--0

--11. What is the step for Union Code 990 and a Set ID of SFMTA or COMMN?
SELECT Step,
Union_Code,
SetID
FROM salary_range_by_job_classification
WHERE Union_Code = "990" AND (SetID = "SFMTA" OR SetID = "COMMN");
--1
