-- Exercício 1

SHOW TABLES;

-- Exercício 2

DESCRIBE ducks;

-- Exercício 3

select * from ducks

-- Exercício 4

select * from ducks where age<=2;

-- Exercício 5

select * from ducks order by age;

-- Exercício 6

select * from ducks order by age limit 3

-- Exercício 7

SELECT name, age * 12 AS age_in_months 
FROM ducks;

-- Exercício 8

SELECT DISTINCT species 
FROM ducks;

-- Exercício 9

SELECT * 
FROM duck_surveys 
USING SAMPLE 10;

-- Exercício 10

SELECT COUNT(*), AVG(age), MIN(age), MAX(age) 
FROM ducks;