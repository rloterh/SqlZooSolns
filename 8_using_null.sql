-- 1
SELECT name FROM teacher WHERE dept is NULL

-- 2
SELECT teacher.name, dept.name
  FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- 2
SELECT teacher.name, dept.name
  FROM teacher JOIN dept
           ON (teacher.dept=dept.id)

-- 3
SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- 4
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

-- 5
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

-- 6
SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
Use COUNT to show the number of teachers and the number of mobile phones.

-- 7
SELECT ect count(name), count(mobile) from teacher

-- 8
SELECT d.name, COUNT(t.id)
FROM teacher t RIGHT JOIN dept d ON (t.dept = d.id)
GROUP BY d.name

-- 8
SELECT d.name, COUNT(t.id)
FROM dept d LEFT JOIN teacher t ON (d.id = t.dept)
GROUP BY d.name

-- 9
SELECT name, case WHEN dept <= 2 THEN 'Sci'
  ELSE 'Art'
  END
from teacher

-- 10
select name, case when dept <= 2 then 'Sci'
  when dept = 3 then 'Art'
  ELSE 'None'
  end
from teacher