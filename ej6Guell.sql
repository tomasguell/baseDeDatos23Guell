USE SAKILA;

SELECT LAST_NAME, FIRST_NAME
FROM ACTOR AS A1
WHERE EXISTS (SELECT LAST_NAME FROM ACTOR AS A2 WHERE A1.LAST_NAME = A2.LAST_NAME AND A1.ACTOR_ID != A2.ACTOR_ID)
ORDER BY LAST_NAME;

SELECT *
FROM ACTOR AS A
WHERE NOT EXISTS(SELECT ACTOR_ID FROM FILM_ACTOR AS FM WHERE FM.ACTOR_ID = A.ACTOR_ID);

SELECT CUSTOMER_ID
FROM CUSTOMER AS C
WHERE EXISTS (SELECT R.CUSTOMER_ID FROM RENTAL AS R WHERE C.CUSTOMER_ID = R.CUSTOMER_ID GROUP BY C.CUSTOMER_ID HAVING COUNT(*) = 1)
ORDER BY CUSTOMER_ID;

SELECT CUSTOMER_ID
FROM CUSTOMER AS C
WHERE EXISTS (SELECT R.CUSTOMER_ID FROM RENTAL AS R WHERE C.CUSTOMER_ID = R.CUSTOMER_ID)
ORDER BY CUSTOMER_ID;


SELECT ACTOR_ID, FIRST_NAME, LAST_NAME
FROM ACTOR AS A
WHERE EXISTS(SELECT TITLE
             FROM FILM AS F
                      INNER JOIN FILM_ACTOR FA ON F.FILM_ID = FA.FILM_ID
             WHERE F.FILM_ID = FA.FILM_ID
               AND A.ACTOR_ID = FA.ACTOR_ID
               AND (F.TITLE = 'BETRAYED REAR'
                 OR F.TITLE = 'CATCH AMISTAD'));


SELECT ACTOR_ID, FIRST_NAME, LAST_NAME
FROM ACTOR AS A
WHERE EXISTS(SELECT TITLE
             FROM FILM AS F
                      INNER JOIN FILM_ACTOR FA ON F.FILM_ID = FA.FILM_ID
             WHERE F.FILM_ID = FA.FILM_ID
               AND A.ACTOR_ID = FA.ACTOR_ID
               AND F.TITLE = 'BETRAYED REAR')
AND NOT EXISTS (SELECT TITLE
             FROM FILM AS F
                      INNER JOIN FILM_ACTOR FA ON F.FILM_ID = FA.FILM_ID
             WHERE F.FILM_ID = FA.FILM_ID
               AND A.ACTOR_ID = FA.ACTOR_ID
                 AND F.TITLE = 'CATCH AMISTAD');


SELECT ACTOR_ID, FIRST_NAME, LAST_NAME
FROM ACTOR AS A
WHERE EXISTS(SELECT TITLE
             FROM FILM AS F
                      INNER JOIN FILM_ACTOR FA ON F.FILM_ID = FA.FILM_ID
             WHERE F.FILM_ID = FA.FILM_ID
               AND A.ACTOR_ID = FA.ACTOR_ID
               AND F.TITLE = 'BETRAYED REAR')
AND EXISTS (SELECT TITLE
             FROM FILM AS F
                      INNER JOIN FILM_ACTOR FA ON F.FILM_ID = FA.FILM_ID
             WHERE F.FILM_ID = FA.FILM_ID
               AND A.ACTOR_ID = FA.ACTOR_ID
                 AND F.TITLE = 'CATCH AMISTAD');


SELECT ACTOR_ID, FIRST_NAME, LAST_NAME
FROM ACTOR AS A
WHERE NOT EXISTS(SELECT TITLE
             FROM FILM AS F
                      INNER JOIN FILM_ACTOR FA ON F.FILM_ID = FA.FILM_ID
             WHERE F.FILM_ID = FA.FILM_ID
               AND A.ACTOR_ID = F		