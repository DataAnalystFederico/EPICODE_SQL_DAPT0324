-- 1. Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”.
SELECT 
    track.name AS nome_traccia, genre.Name
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
WHERE
    genre.name IN ('rock' , 'pop')
;

-- 2. Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”.
SELECT 
    artist.name AS artista, 
    album.Title
FROM
    artist
        LEFT JOIN
    album ON artist.ArtistId = album.ArtistId
WHERE
    artist.name LIKE 'a%'
        AND album.Title LIKE 'a%'
;
-- 3. Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti.
SELECT 
    track.name AS nome_traccia,
    genre.Name AS genere,
    track.Milliseconds
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
WHERE
    genre.Name = 'jazz'
        OR track.Milliseconds < 180000
order by Milliseconds 
;

-- 4. Recuperate tutte le tracce più lunghe della durata media.
SELECT 
    track.name AS nome_traccia,
    track.Milliseconds as durata
FROM
    track
where track.Milliseconds > (select AVG(track.Milliseconds) from track)
order by durata
;

-- 5. Esercizio Query Avanzate Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti.
SELECT 
    track.Name AS traccia,
    genre.Name AS genere,
    AVG(track.Milliseconds) AS durata_media
FROM
    track
        JOIN
    genre ON track.GenreId = genre.GenreId
GROUP BY genere , traccia
HAVING AVG(track.Milliseconds) > 240000
;

-- 6. Individuate gli artisti che hanno rilasciato più di un album.
SELECT 
    artist.Name AS artista, COUNT(album.AlbumId) AS id_album
FROM
    artist
        LEFT JOIN
    album ON artist.ArtistId = album.ArtistId
GROUP BY artista
HAVING id_album > 1
;

-- 7. Trovate la traccia più lunga in ogni album. 
SELECT 
    track.name AS brano,
    max(track.Milliseconds) as durata_massima,
    album.Title AS titolo
FROM
    track
        JOIN
    album ON track.AlbumId = album.AlbumId
group by brano,titolo
;

-- 8. Individuate la durata media delle tracce per ogni album.
SELECT 
    AVG(track.Milliseconds) AS durata_media,
    album.Title AS titolo
FROM
    track
        JOIN
    album ON track.AlbumId = album.AlbumId
GROUP BY album.Title
;

-- 9. Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute.
SELECT 
    album.Title AS titolo, COUNT(track.Name) AS n_tracce
FROM
    track
        JOIN
    album ON track.AlbumId = album.AlbumId
GROUP BY album.Title
HAVING COUNT(track.Name) > 20
;