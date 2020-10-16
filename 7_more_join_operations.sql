-- 1
SELECT id, title FROM movie
WHERE yr=1962

-- 2
SELECT yr FROM movie WHERE title = 'Citizen Kane'

-- 3
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%'

-- 4
SELECT id FROM actor WHERE name = 'Glenn Close'

-- 5
SELECT id FROM movie WHERE title = 'Casablanca'

-- 6
SELECT name FROM actor 
JOIN casting ON (id=actorid)
WHERE movieid = 11768

-- 7
select a.name from casting c JOIN actor a ON (a.id=c.actorid)
JOIN movie m ON (m.id=c.movieid)
where m.title = 'Alien'

-- 8
SELECT m.title FROM casting c JOIN actor a ON (a.id=c.actorid)
JOIN movie m ON (m.id=c.movieid)
WHERE a.name = 'Harrison Ford'

-- 9
SELECT m.title FROM casting c JOIN actor a ON (a.id=c.actorid)
JOIN movie m ON (m.id=c.movieid)
WHERE a.name = 'Harrison Ford'
AND c.ord <> 1

-- 10
SELECT m.title, a.name FROM casting c JOIN actor a ON (a.id=c.actorid)
JOIN movie m ON (m.id=c.movieid)
WHERE c.ord = 1
AND m.yr = 1962

-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
SELECT m.title, a.name FROM casting c 
JOIN movie m ON (m.id = c.movieid AND c.ord = 1)
 JOIN actor a ON (a.id = c.actorid)
WHERE m.id in (SELECT movieid FROM casting WHERE actorid IN ( SELECT id FROM actor WHERE name='Julie Andrews' ) )

-- 13
SELECT name FROM actor
WHERE id IN (SELECT c.actorid from casting c
              WHERE c.ord = 1
              GROUP BY c.actorid
              HAVING SUM(c.ord) >= 30)
ORDER BY name

-- 14
SELECT m.title, count(a.id) n_actors
FROM casting c JOIN movie m ON m.id = c.movieid
               JOIN actor a ON a.id = c.actorid
WHERE m.yr = 1978
GROUP BY m.title
ORDER BY n_actors DESC, m.title

-- 15
SELECT a.name FROM casting c JOIN actor a on (a.id = c.actorid)
  WHERE movieid IN (SELECT movieid FROM casting c
                      JOIN actor a ON (a.id = c.actorid)
                    WHERE a.name = 'Art Garfunkel')
AND a.name <> 'Art Garfunkel'