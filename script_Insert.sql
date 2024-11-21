INSERT INTO genre(name_genre)
VALUES('поп'),
      ('рок'),
      ('хип-хоп'),
      ('рэп'),
      ('русский шансон');

INSERT INTO artist(nickname)
VALUES('Troye Sivan'),
      ('Игорь Крутой'),
      ('Игорь Николаев'),
      ('Денис Майданов'),
      ('Баста'),
      ('Михаил Шафутинский');
       
INSERT INTO artist_genre(genre_id, artist_id)
VALUES(1, 1),
      (1, 2),
      (1, 3),
      (1, 4),
      (2, 4),
      (1, 5),
      (2, 5),
      (3, 5),
      (4, 5),
      (1, 6),
      (5, 6);
      
INSERT INTO album(name_album, date_release)
VALUES('Bloom', '2018-08-31'),
      ('In a Dream', '2020-08-21'),
      ('Мой друг', '2013-07-01'),
      ('Небо над Россией', '2018-10-08'),
      ('Баста 40', '2020-11-20'),
      ('Гуляй, душа', '1994-01-01');
     
INSERT INTO album_artist(artist_id, album_id)
VALUES(1, 1),
      (1, 2),
      (2, 3),
      (3, 3),
      (3, 4),
      (4, 4),
      (5, 5),
      (6, 6);
     
INSERT INTO song(name_song, duration, album_id)
VALUES('My My My!', 205, 1),
      ('Bloom', 224, 1),
      ('Dance to This', 231, 1),
      ('In a Dream', 229, 2),
      ('Мой друг', 231, 3),
      ('Небо над Россией', 225, 4),
      ('Молодость', 290, 5),
      ('Звездопад', 279, 3),
      ('Третье сентября', 317, 3),
      ('3-е сентября', 378, 6);
     
INSERT INTO collection(name_collection, date_release)
VALUES('Всё о любви...', '2021-04-01'),
      ('Обречён на любовь', '2019-12-20'),
      ('Лучшее: Баста', '2021-01-01'),
      ('Линия жизни', '2014-12-10'),
      ('70 лучших песен', '2018-04-12');
     
INSERT INTO song_collection(song_id, collection_id)
VALUES(5, 1),
      (6, 2),
      (7, 3),
      (8, 4),
      (9, 1),
      (10, 5);

     


       
