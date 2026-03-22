SELECT*
FROM layoffs_staging2
WHERE country='United States';

SELECT*
FROM layoffs_staging2;

SELECT TO_DATE(date, 'MM/DD/YYYY')
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET date = TO_DATE(date, 'MM/DD/YYYY'); 

SELECT DISTINCT date
FROM layoffs_staging2
LIMIT 20;

ALTER TABLE layoffs_staging2
ALTER COLUMN date TYPE DATE
USING date::DATE;





