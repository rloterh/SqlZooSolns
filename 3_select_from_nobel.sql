-- 1.
SELECT yr, subject, winner
  FROM nobel
WHERE yr = 1950

-- 2
SELECT winner FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

-- 3
SELECT yr, subject from nobel where winner = 'Albert Einstein'
Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel WHERE subject = 'Peace' AND yr >= 2000

-- 4
SELECT yr, subject, winner FROM nobel
WHERE subject = 'Literature'
AND yr between 1980 AND 1989

-- 5
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                   'Woodrow Wilson',
                   'Jimmy Carter',
                   'Barack Obama')

-- 6
SELECT winner FROM nobel WHERE winner LIKE 'John%'

-- 7
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Physics'
  AND yr = 1980
  OR subject = 'Chemistry'
  AND yr = 1984

-- 8
SELECT yr, subject, winner FROM nobel
WHERE yr = 1980
  AND subject NOT IN ('Chemistry', 'Medicine')

-- 9
SELECT yr, subject, winner FROM nobel
WHERE subject = 'Medicine'
AND yr < 1910 OR
subject = 'Literature'
AND yr >= 2004

-- 10
SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- 11
SELECT * FROM nobel
WHERE winner = "EUGENE O\'NEILL\"
Knights in order

-- 12
SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

-- 13
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'), subject, winner
