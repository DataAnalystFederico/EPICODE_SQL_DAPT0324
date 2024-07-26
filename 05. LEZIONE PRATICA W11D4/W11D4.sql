-- 1. Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce.
SELECT 
    genre.Name AS nome_genere,
    COUNT(*) AS numero_tracce
FROM
    genre
        JOIN
    track ON genre.GenreId = track.GenreId
GROUP BY genre.Name
HAVING COUNT(track.name) >=10
ORDER BY numero_tracce DESC;

-- 2. Trovate le tre canzoni più costose.
select 
track.name as traccia,
track.MediaTypeId as tipo_media,
track.UnitPrice as prezzo
from
track 
where track.MediaTypeId <>3
limit 3
;

-- 3. Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.
SELECT DISTINCT
    (artist.name) AS artista
FROM
    track
        JOIN
    album ON track.AlbumId = album.AlbumId
        JOIN
    artist ON album.ArtistId = artist.ArtistId
WHERE
    track.Milliseconds > 360000
;

-- 4. Individuate la durata media delle tracce per ogni genere.
SELECT 
    genre.name AS genere,
    AVG(track.Milliseconds) AS durata_media
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
GROUP BY genre.name
;

-- 5. Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome.
SELECT 
    track.name AS traccia, genre.name AS genere
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
WHERE
    track.name LIKE '%love%'
        AND track.name NOT LIKE '%llove%'
        AND track.name NOT LIKE '%belove%'
        AND track.name NOT LIKE '%glove%'
ORDER BY genre.name , track.name
;

-- 6. Trovate il costo medio per ogni tipologia di media.
SELECT 
    mediatype.name AS tipo_media,
    AVG(track.UnitPrice) AS costo_medio
FROM
    track
        JOIN
    mediatype ON track.MediaTypeId = mediatype.MediaTypeId
GROUP BY tipo_media
;

-- 7. Individuate il genere con più tracce.
SELECT 
    genre.name AS genere,
    COUNT(track.name) AS n_tracce
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
GROUP BY genere
ORDER BY n_tracce DESC
LIMIT 1
;

-- 8. Esercizio Query Avanzate Trovate gli artisti che hanno lo stesso numero di album dei Rolling Stones.
SELECT 
    album.ArtistId, artist.name, COUNT(album.AlbumId) AS n_album
FROM
    album
        JOIN
    artist ON album.ArtistId = artist.ArtistId
GROUP BY album.ArtistId
HAVING n_album = (select count(*)
from artist join album on artist.ArtistId=album.ArtistId
where artist.Name = 'The Rolling Stones')
;
 
-- 9. Trovate l’artista con l’album più costoso.
SELECT 
    artist.Name AS artista,
    album.Title AS titolo_album,
    SUM(track.UnitPrice) AS totale_prezzo_tracce
FROM
    track
        JOIN
    artist ON track.composer = artist.Name
        JOIN
    album ON track.AlbumId = album.AlbumId
GROUP BY track.composer , titolo_album
ORDER BY totale_prezzo_tracce DESC
;

SELECT 
    artist.Name AS artista,
    album.Title,
    SUM(track.UnitPrice) AS costo_album
FROM
    track
        JOIN
    album ON track.AlbumId = album.AlbumId
        JOIN
    artist ON artist.ArtistId = album.ArtistId
GROUP BY artist.Name, album.AlbumId
order by costo_album desc
;