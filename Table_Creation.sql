SELECT*
FROM world_layoffs;

CREATE TABLE layoffs_staging
(LIKE world_layoffs);

SELECT* 
FROM layoffs_staging;

INSERT INTO layoffs_staging
SELECT* 
FROM world_layoffs;

With duplicate_cte AS (
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,industry,
total_laid_off,location,
country,funds_raised_millions,
stage,'date') AS row_num FROM layoffs_staging
) 

SELECT*
FROM duplicate_cte
WHERE row_num>1;

CREATE TABLE layoffs_staging2 (
    company TEXT,
    location TEXT,
    industry TEXT,
    total_laid_off INT,
    percentage_laid_off TEXT,
    date TEXT,
    stage TEXT,
    country TEXT,
    funds_raised_millions INT,
	row_num INT
);

SELECT*
FROM layoffs_staging2;
