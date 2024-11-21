/* 1. Названия альбомов, в которых присутствуют
      исполнители более чем одного жанра. */


SELECT a.name_album 
FROM album a 
JOIN album_artist aa ON a.album_id = aa.album_id 
WHERE aa.artist_id IN 
      (SELECT artist_id
       FROM artist_genre ag
       GROUP BY artist_id 
       HAVING COUNT(*) > 1);

/* 2. Наименования треков, которые
      не входят в сборники. */

SELECT s.name_song 
FROM song s 
LEFT JOIN song_collection sc ON s.song_id = sc.song_id 
WHERE sc.song_id IS NULL;


/* 3. Исполнитель или исполнители,
      написавшие самый короткий
      по продолжительности трек,
      таких треков может быть несколько. */

SELECT a.nickname 
FROM artist a 
JOIN album_artist aa ON a.artist_id = aa.artist_id 
JOIN album a2 ON aa.album_id = a2.album_id 
JOIN song s ON a2.album_id = s.album_id 
WHERE s.duration = (SELECT MIN(duration)
                    FROM song);

/* 4. Названия альбомов,
      содержащих наименьшее количество треков. */

SELECT a.name_album
FROM album a 
JOIN song s ON a.album_id = s.album_id 
GROUP BY a.album_id
HAVING COUNT(a.album_id) = (SELECT MIN(count_song)
                            FROM (SELECT a.name_album , COUNT(a.album_id) AS count_song
                                  FROM album a 
                                  JOIN song s ON a.album_id = s.album_id 
                                  GROUP BY a.album_id)); 




