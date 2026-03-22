#Exploratory analysis

SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off IS NULL
OR percentage_laid_off='' ;

SELECT MAX(percentage_laid_off), MAX(total_laid_off)
FROM layoffs_staging2;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


SELECT company, location,MAX(country),SUM(total_laid_off),
MIN(date),MAX(date)
FROM layoffs_staging2
GROUP BY company,location
ORDER BY 4 DESC;


SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT company,date,MAX(country), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,date
ORDER BY 3 DESC;

SELECT DISTINCT(country),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY DISTINCT(country)
ORDER BY 2 DESC;

SELECT stage,company,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage,company
ORDER BY 2 DESC;

WITH Rolling_Total AS (SELECT SUBSTRING(date,1,7) AS MONTH,
SUM(total_laid_off) AS TOTAL_SACKED
FROM layoffs_staging2
WHERE SUBSTRING(date,1,7) IS NOT NULL
GROUP BY MONTH
ORDER BY 2 DESC)

SELECT MONTH,TOTAL_SACKED,SUM(TOTAL_SACKED)OVER(ORDER BY MONTH) AS rolling_total
FROM Rolling_Total;

SELECT*
FROM layoffs_staging2;

WITH Company_Year(company,Year,total_laid_off) AS 
(
SELECT company,date, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,date
), Company_Year_Ranking AS
(SELECT* ,
DENSE_RANK() OVER (PARTITION BY Year ORDER BY total_laid_off DESC ) AS Ranking
FROM Company_Year
WHERE Year IS NOT NULL
ORDER BY Ranking ASC)

SELECT*
FROM Company_Year_Ranking
WHERE Ranking <=5;





