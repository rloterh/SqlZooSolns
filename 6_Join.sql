-- 1
SELECT matchid, player name FROM goal
WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2 FROM game WHERE id = 1012

-- 3
SELECT * FROM game
JOIN goal ON (id=matchid)
The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say ON (game.id=goal.matchid)

-- 4
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

-- 5
SELECT team1, team2, player ROM game 
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- 6
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
WHERE gtime<=10

-- 7
select mdate, teamname
from game JOIN eteam ON (team1=eteam.id)
where coach = 'Fernando Santos'

-- 8
SELECT player FROM game 
JOIN goal ON (id=matchid)
WHERE stadium = 'National Stadium, Warsaw'
The example query shows all goals scored in the Germany-Greece quarterfinal.

-- 9
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id
    WHERE (team1 = 'GER' or team2 = 'GER')
AND teamid <> 'GER'
Show teamname and the total number of goals scored.
COUNT and GROUP BY

-- 10
SELECT teamname, count(gtime)
  FROM eteam JOIN goal ON id=teamid
GROUP by teamname
Show the stadium and the number of goals scored in each stadium.
select distinct stadium, count(gtime) from game JOIN goal ON (id=matchid)
group by stadium

-- 11
SELECT matchid, mdate, count(gtime)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid, mdate

-- 12
SELECT id, mdate, COUNT(teamid)
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'
GROUP BY id, mdate

-- 13
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON id = matchid
GROUP BY mdate, team1, team2
ORDER BY mdate, id, team1, team21