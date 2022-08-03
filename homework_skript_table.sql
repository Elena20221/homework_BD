CREATE TABLE IF NOT EXISTS collections (
    id SERIAL PRIMARY KEY,
    collection_name varchar(100) NOT NULL,
    collection_date int NOT NULL);
    
CREATE TABLE IF NOT EXISTS albums(
    id SERIAL PRIMARY KEY,
    album_name varchar(100) NOT NULL,
    album_date int NOT NULL);
    
CREATE TABLE IF NOT EXISTS tracks(
    id SERIAL PRIMARY KEY,
    track_name varchar(100) NOT NULL,
    track_duration int NOT NULL,
    album_id int REFERENCES albums(id));

CREATE TABLE IF NOT EXISTS artists(
    id SERIAL PRIMARY KEY,
    artist_alias varchar(100) UNIQUE);

CREATE TABLE IF NOT EXISTS genres(
    id SERIAL PRIMARY KEY,
    genre_name varchar(100) NOT NULL UNIQUE);

CREATE TABLE IF NOT EXISTS artists_genres(
    artists_id int REFERENCES artists(id),
	genres_id int REFERENCES genres(id),
	CONSTRAINT artists_genres_pk PRIMARY KEY (artists_id, genres_id));   

CREATE TABLE IF NOT EXISTS artists_albums(
    artists_id int REFERENCES artists(id),
	albums_id int REFERENCES albums(id),
	CONSTRAINT artists_albums_pk PRIMARY KEY (artists_id, albums_id));
	
CREATE TABLE IF NOT EXISTS tracks_collections (
	track_id int REFERENCES tracks(id), 
	collection_id int REFERENCES collections(id), 
	CONSTRAINT track_collection_pk PRIMARY KEY (track_id, collection_id))
	

