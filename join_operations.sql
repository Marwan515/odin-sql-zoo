--1
SELECT id, title
 FROM movie
 WHERE yr=1962;
--2
SELECT yr FROM movie
 WHERE title = 'Citizen Kane';
--3
SELECT id, title, yr FROM movie
 WHERE title LIKE 'Star Trek%' ORDER BY yr;
--4
SELECT id FROM actor
 WHERE name = 'Glenn Close';
--5
SELECT id FROM movie
 WHERE title = 'Casablanca';
--6
SELECT actor.name 
  FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid
 WHERE movieid = 11768;
--7
SELECT actor.name 
  FROM actor JOIN casting ON actor.id = actorid JOIN movie ON movie.id = movieid
 WHERE movie.title = 'Alien';
--8
SELECT title 
  FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
 WHERE actor.name = 'Harrison Ford';
--9
SELECT title 
  FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
 WHERE actor.name = 'Harrison Ford' AND casting.ord != 1;
--10
SELECT title, actor.name
  FROM movie JOIN casting ON movie.id = movieid JOIN actor ON actor.id = actorid
 WHERE yr = 1962 AND casting.ord = 1;
--11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
--12
SELECT movie.title, actor.name
  FROM movie JOIN casting ON (movie.id = casting.movieid)
  JOIN actor ON (actor.id = casting.actorid)
 WHERE movie.id IN (SELECT movieid FROM casting WHERE actorid = ( SELECT id FROM actor WHERE name = 'Julie Andrews')) AND casting.ord = 1;
--13
SELECT name FROM actor JOIN casting ON actor.id = casting.actorid
 WHERE ord = 1 GROUP BY actor.name HAVING COUNT(*) >= 15 ORDER BY name;
--14
SELECT movie.title, COUNT(actorid) FROM movie JOIN casting ON (movie.id = casting.movieid)
 WHERE movie.yr = 1978 GROUP BY movie.title ORDER BY COUNT(actorid) DESC, movie.title;
--15
SELECT actor.name
  FROM actor JOIN casting ON (actor.id = casting.actorid)
  WHERE movieid IN (SELECT casting.movieid FROM casting JOIN movie ON casting.movieid = movie.id WHERE casting.actorid = (SELECT actor.id FROM actor WHERE name = 'Art Garfunkel'))
 AND actor.name != 'Art Garfunkel';
--END