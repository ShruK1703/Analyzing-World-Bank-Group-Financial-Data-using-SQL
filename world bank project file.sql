SELECT * FROM WB;

--NUMBER OF ROWS IN WB
SELECT COUNT(*) FROM WB;

--TOTAL NUMBER OF COUNTRIES
SELECT COUNT(DISTINCT(Country)) AS TOTAL_COUNTRY
FROM WB;

--TOP 5 COUNTRIES WITH HIGHEST BORROWING FROM WORLD BANK
SELECT DISTINCT("Country"), MAX("Original Principal Amount")
FROM WB 
GROUP BY Country 
ORDER BY MAX("Original Principal Amount") DESC 
LIMIT 5;

--TOP 5 COUNTRIES WITH LOWEST BORROWING FROM WORLD BANK
SELECT DISTINCT("Country"), "Original Principal Amount" as Min_amount
FROM WB
GROUP BY Country 
ORDER BY Min_amount
LIMIT 5;

--which region has the most borrowing?
SELECT DISTINCT ("Region"), MAX("Original Principal Amount")
FROM WB 
GROUP BY Region 
ORDER BY MAX("Original Principal Amount") DESC
limit 5;


--FOCUSING ON ONLY COUNTRY INDIA
SELECT *
FROM WB 
WHERE Country = 'India';

--TOTAL NUMBER OF PROJECTS OF INDIA THAT BORROWED FROM WB
SELECT COUNT(DISTINCT("Project Name"))
FROM WB
WHERE Country ='India';


--Which Project Borrowed the Most?
SELECT "Project Name", MAX("Original Principal Amount")
FROM WB 
WHERE Country = 'India'
GROUP BY "Project Name" 
ORDER BY MAX("Original Principal Amount") DESC
LIMIT 5;

--Which Project Borrowed the LEAST?
SELECT "Project Name", MIN("Original Principal Amount")
FROM WB 
WHERE Country = 'India'
GROUP BY "Project Name" 
ORDER BY MIN("Original Principal Amount") ASC
LIMIT 5;



--What is the TOTAL funding lended to Indian Projects by WB?
SELECT COUNT(DISTINCT("Project Name")), SUM("Original Principal Amount")
FROM WB
WHERE Country ='India' 
ORDER BY SUM("Original Principal Amount");


--What is the average funding lended to Indian Projects by WB?
SELECT COUNT(DISTINCT("Project Name")), AVG("Original Principal Amount")
FROM WB
WHERE Country ='India' 
ORDER BY AVG("Original Principal Amount");

--What is the average funding REPAID TO WB?
SELECT COUNT(DISTINCT("Project Name")), AVG("Repaid to IDA")
FROM WB
WHERE Country ='India' 
ORDER BY AVG("Repaid to IDA");


--BORROWERS FROM INDIA
SELECT DISTINCT("Borrower")
FROM WB
WHERE Country ='India';

--Most borrowering Amount from INDIA
SELECT "Borrower" , MAX("Original Principal Amount")
FROM WB 
WHERE Country = 'India'
GROUP BY "Borrower"  
ORDER BY MAX("Original Principal Amount") DESC;

--Least Borrowing Amount from INDIA
SELECT "Borrower" , MIN("Original Principal Amount")
FROM WB 
WHERE Country = 'India'
GROUP BY "Borrower"  
ORDER BY MIN("Original Principal Amount") DESC;

--Projects from India that has repaid
SELECT COUNT(DISTINCT("Project Name"))
FROM WB
WHERE Country ='India' AND "Credit Status" = 'Fully Repaid';

--Projects from India that are repaying
SELECT COUNT(DISTINCT("Project Name"))
FROM WB
WHERE Country ='India' AND "Credit Status" = 'Repaying';

--Projects from India that are Cancelled
SELECT COUNT(DISTINCT("Project Name"))
FROM WB
WHERE Country ='India' AND "Credit Status" = 'Fully Cancelled';