CREATE TABLE IF NOT EXISTS genre (
    genre_id SERIAL PRIMARY KEY,
    name_genre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
    artist_id SERIAL PRIMARY KEY,
    nickname VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist_genre (
    artist_id INTEGER REFERENCES artist(artist_id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genre(genre_id) ON DELETE CASCADE,
    CONSTRAINT pk_artist_genre PRIMARY KEY(artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS album (
    album_id SERIAL PRIMARY KEY,
    name_album VARCHAR(100) NOT NULL,
    date_release DATE NOT NULL CHECK(date_release BETWEEN '1860-01-01' AND CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS album_artist (
    album_id INTEGER REFERENCES album(album_id) ON DELETE CASCADE,
    artist_id INTEGER REFERENCES artist(artist_id) ON DELETE CASCADE,
    CONSTRAINT pk_album_artist PRIMARY KEY(album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS song (
    song_id SERIAL PRIMARY KEY,
    name_song VARCHAR(100) NOT NULL,
    duration INTEGER NOT NULL CHECK(duration < 504000),
    album_id INTEGER NOT NULL REFERENCES album(album_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS collection (
    collection_id SERIAL PRIMARY KEY,
    name_collection VARCHAR(100) NOT NULL,
    date_release DATE NOT NULL CHECK(date_release BETWEEN '1860-01-01' AND CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS song_collection (
    song_id INTEGER REFERENCES song(song_id) ON DELETE CASCADE,
    collection_id INTEGER REFERENCES collection(collection_id) ON DELETE CASCADE,
    CONSTRAINT pk_song_collection PRIMARY KEY(song_id, collection_id)
);