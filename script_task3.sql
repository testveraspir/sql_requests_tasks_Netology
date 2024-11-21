/* 1. Количество исполнителей
      в каждом жанре */

SELECT g.name_genre, COUNT(ag.genre_id) AS количество_исполнителей
FROM genre g 
JOIN artist_genre ag ON g.genre_id = ag.genre_id
GROUP BY g.name_genre , ag.genre_id
ORDER BY ag.genre_id DESC;

/* 2. Количество треков, 
   вошедших в альбомы 2019–2020 годов. */

SELECT COUNT(*)
FROM song s
JOIN album a ON s.album_id = a.album_id
WHERE a.date_release BETWEEN '2019-01-01' AND '2020-12-31';

/* 3. Средняя продолжительность треков 
   по каждому альбому. */

SELECT a.name_album , ROUND(AVG(duration), 2) AS средняя_продолжит_треков_сек
FROM album a 
JOIN song s ON a.album_id = s.album_id 
GROUP BY a.album_id;

/* 4. Все исполнители,которые
      не выпустили альбомы в 2020 году. */
-- 1 варинат

-- получаем всех исполнителей

SELECT nickname 
FROM artist

-- исключаем исполнителей,
-- которые выпустили альбомы в 2020 году

EXCEPT

SELECT a.nickname 
FROM artist a 
JOIN album_artist aa ON a.artist_id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.album_id 
WHERE a2.date_release BETWEEN '2020-01-01' AND '2020-12-31';

-- 2 варинат

SELECT nickname 
FROM artist
WHERE artist_id NOT IN 
     (SELECT a.artist_id  
      FROM artist a 
      JOIN album_artist aa ON a.artist_id = aa.artist_id 
      JOIN album a2 ON aa.album_id = a2.album_id 
      WHERE a2.date_release BETWEEN '2020-01-01' AND '2020-12-31'); 

/* 5. Названия сборников, в которых  
   присутствует исполнитель: Игорь Николаев */

SELECT DISTINCT(c.name_collection)
FROM collection c 
JOIN song_collection sc 
ON c.collection_id = sc.collection_id 
JOIN song s 
ON sc.song_id = s.song_id 
JOIN album a 
ON s.album_id = a.album_id 
JOIN album_artist aa 
ON a.album_id = aa.album_id 
JOIN artist a2 
ON aa.artist_id = a2.artist_id 
WHERE a2.nickname = 'Игорь Николаев';