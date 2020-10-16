-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2
SELECT name FROM world x
WHERE continent = 'Europe'
AND gdp / population > (SELECT gdp / population
                        FROM world
                        WHERE name = 'United Kingdom')

-- 3
SELECT name, continent FROM world
WHERE continent IN (SELECT continent
                    FROM world
                    WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

-- 4
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada')
AND population < (SELECT population FROM world WHERE name = 'Poland')

-- 5
SELECT name,
CONCAT(
  ROUND(100 * population / (SELECT population FROM world WHERE name = 'Germany'), 0),
  '%')
FROM world
WHERE continent = 'Europe'

-- 6
SELECT name FROM world
WHERE gdp >= ALL(SELECT gdp
                  FROM world
                  WHERE continent = 'Europe' AND gdp>0)
AND continent <> 'Europe'

-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0)

-- 8
SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world
              WHERE continent = x.continent
              ORDER BY continent, name
              LIMIT 1)

-- 9 
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL (SELECT population FROM world
    WHERE continent = y.continent
    AND population > 0)

-- 10
List each continent and the name of the country that comes first alphabetically.
SELECT name, continent
FROM world x
WHERE population / 3 >= all (SELECT MAX(population) FROM world
                              WHERE continent = x.continent
                              AND name <> x.name)
