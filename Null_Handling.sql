SELECT*
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT*
FROM layoffs_staging2
WHERE company = 'Airbnb';


SELECT*
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company = t2.company
and t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry= '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1 
SET industry = t2.industry
FROM layoffs_staging2 t2
WHERE  t1.company = t2.company
AND t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT*
FROM layoffs_staging2
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL;


ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

#Exploratory analysis

SELECT*
FROM layoffs_staging2
WHERE percentage_laid_off IS NULL
OR percentage_laid_off='' ;


