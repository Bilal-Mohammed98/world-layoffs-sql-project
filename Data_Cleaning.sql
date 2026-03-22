SELECT*
FROM layoffs_staging2
WHERE row_num>1;

SELECT*
FROM layoffs_staging2
WHERE country='Israel'
AND row_num>1;

SELECT*
FROM layoffs_staging2
WHERE row_num>1;

DELETE
FROM layoffs_staging2
WHERE row_num>1;

SELECT*
FROM layoffs_staging2;

SELECT company,TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company= TRIM(company);


SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY 1;

SELECT*
FROM layoffs_staging2
WHERE industry like 'Crypto%';

UPDATE layoffs_staging2
SET industry='Crypto'
WHERE industry like 'Crypto%';

SELECT*
FROM layoffs_staging2
WHERE country like 'United States';

SELECT DISTINCT country,TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

UPDATE layoffs_staging2
SET country=TRIM(TRAILING '.' FROM country)
WHERE country like 'United States%';

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

