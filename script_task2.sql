/* 1. Название и продолжительность самого 
   длительного трека. */

SELECT name_song, duration 
FROM song
WHERE duration = (SELECT MAX(duration)
                  FROM song);

/* 2. Название треков, продолжительность 
   которых не менее 3,5 минут (210 секунд). */

SELECT name_song 
FROM song
WHERE duration >= 210;

/* 3. Названия сборников, вышедших 
   в период с 2018 по 2020 год включительно. */

SELECT name_collection
FROM collection 
WHERE date_release BETWEEN '2018-01-01' AND '2020-12-31';

/* 4. Исполнители, чьё имя состоит из одного слова. */

SELECT nickname
FROM artist  
WHERE LENGTH(nickname) = LENGTH(REPLACE(nickname, ' ', ''));

/* 5. Названия треков,  
   которые содержат слово «мой» или «my». */

SELECT name_song 
FROM song
WHERE (LOWER(name_song) LIKE '% мой %'
       OR LOWER(name_song) LIKE 'мой %'
       OR LOWER(name_song) LIKE '% мой'
       OR LOWER(name_song) LIKE '% my %'
       OR LOWER(name_song) LIKE 'my %'
       OR LOWER(name_song) LIKE '% my');