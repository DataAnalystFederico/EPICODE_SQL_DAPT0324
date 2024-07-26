-- 1. Cominciate facendo un’analisi esplorativa del database, ad esempio: 
/*Fate un elenco di tutte le tabelle. Visualizzate le prime 10 righe della tabella Album. 
Trovate il numero totale di canzoni della tabella Tracks. 
Trovate i diversi generi presenti nella tabella Genre. */
SELECT 
    *
FROM
    album
LIMIT 10
;

select count(track.name) as totale_canzoni
from track
;

SELECT 
    genre.name
FROM
    genre
;

-- Esercizio 2 Recuperate il nome di tutte le tracce e del genere associato.
SELECT 
    track.name AS traccia, genre.Name
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
;

-- Esercizio 3 Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. 
/* Esistono artisti senza album nel database? */
SELECT DISTINCT
    artist.Name AS artista
FROM
    artist
        left JOIN
    album ON Artist.ArtistId = album.ArtistId
WHERE
    album.AlbumId >= 1
;

-- 4. Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. 
/* Esiste un modo per recuperare il nome della tipologia di media? */
SELECT 
    track.Name AS nome_traccia,
    genre.Name genere,
    mediatype.name tipo_media
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
        JOIN
    mediatype ON track.MediaTypeId = mediatype.MediaTypeId
;

-- Esercizio 5 Elencate i nomi di tutti gli artisti e dei loro album.
SELECT distinct
    -- track.composer AS artista,
    artist.Name,
    album.AlbumId AS album
FROM
    -- track
    artist
        JOIN
    -- album ON track.AlbumId = album.AlbumId
    album on artist.ArtistId=album.ArtistId
;
