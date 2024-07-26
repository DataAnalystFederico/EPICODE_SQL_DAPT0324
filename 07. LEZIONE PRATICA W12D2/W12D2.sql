-- 1. Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.
SELECT DISTINCT
    customer.customer_id AS id_cliente,
    customer.first_name AS nome,
    customer.last_name AS cognome,
    customer.email AS email
FROM
    rental
	JOIN
    customer ON rental.customer_id = customer.customer_id
WHERE
    MONTH(rental_date) <> '1' IN (SELECT
            YEAR(rental_date)
        FROM
            rental
        WHERE
            YEAR(rental_date) <> '2006')
ORDER BY id_cliente
;

SELECT DISTINCT
    customer.customer_id AS id_cliente,
    customer.first_name AS nome,
    customer.last_name AS cognome,
    customer.email AS email
FROM
    customer
        JOIN
    rental ON customer.customer_id = rental.customer_id
WHERE
    rental.rental_date NOT IN (SELECT DISTINCT
            rental.rental_date
        FROM
            rental
        WHERE
            MONTH(rental.rental_date) = 1
                AND YEAR(rental.rental_date) = 2006)
ORDER BY id_cliente
;

SELECT 
    customer.customer_id AS id_cliente,
    customer.first_name AS nome,
    customer.last_name AS cognome,
    customer.email AS email
FROM
    customer
WHERE
    customer.customer_id NOT IN (SELECT 
            rental.customer_id
        FROM
            rental
        WHERE
            YEAR(rental_date) = '2006'
                AND MONTH(rental_date) = '1')
order by id_cliente
;

-- 2. Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005
SELECT 
    film.film_id AS id_film,
    film.title AS titolo,
    COUNT(rental.rental_id) AS n_film_noleggiati
FROM
    rental
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
WHERE QUARTER(rental_date) = 4 AND YEAR(rental_date) = 2005
GROUP BY id_film , titolo
having n_film_noleggiati > 10
;

-- 3. Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.
SELECT 
    COUNT(rental_id) AS n_totale_noleggi
FROM
    rental
WHERE
    DATE(rental_date) = '2006-01-01'
;

-- 4. Calcolate la somma degli incassi generati nei weekend (sabato e domenica).
select
dayofweek(payment.payment_date) as giorno,
sum(payment.amount) as totale_incassi
from
payment
where dayofweek(payment.payment_date) in (1,7)
group by giorno
;

-- 5. Individuate il cliente che ha speso di più in noleggi. 
SELECT 
    customer.customer_id AS id_cliente,
    customer.first_name as nome,
    customer.last_name as cognome,
    customer.email as email,
    SUM(payment.amount) AS totale_pagamenti
FROM
    customer
        JOIN
    payment ON customer.customer_id = payment.customer_id
GROUP BY id_cliente, nome, cognome, email
ORDER BY totale_pagamenti DESC
LIMIT 1
;

-- 6. Elencate i 5 film con la maggior durata media di noleggio.
select
film.title as titolo,
avg(film.rental_duration) as durata_media_noleggio
from film
group by titolo
order by durata_media_noleggio desc
limit 5
;

SELECT 
    f.title AS titolo,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS durata_media_noleggio_datediff
FROM
    rental r
        JOIN
    inventory i ON r.inventory_id = i.inventory_id
        JOIN
    film f ON i.film_id = f.film_id
GROUP BY titolo
ORDER BY durata_media_noleggio_datediff DESC
LIMIT 5
;

-- 7. Calcolate il tempo medio tra due noleggi consecutivi da parte di un cliente.
SELECT 
    t1.customer_id,
    AVG(DATEDIFF(t2.rental_date, t1.rental_date)) AS tempo_medio_tra_noleggi
FROM 
    rental t1
JOIN 
    rental t2 
    ON t1.customer_id = t2.customer_id 
    AND t2.rental_date = (SELECT MIN(t3.rental_date)
                          FROM rental t3
                          WHERE t3.customer_id = t1.customer_id
                          AND t3.rental_date > t1.rental_date)
GROUP BY 
    t1.customer_id;
;

-- 8. Individuate il numero di noleggi per ogni mese del 2005.
SELECT 
    COUNT(rental.rental_id) AS n_noleggi,
    MONTH(rental.rental_date) AS mese,
    year(rental_date) as anno
FROM
    rental
WHERE
    YEAR(rental_date) = '2005'
GROUP BY mese, anno
ORDER BY mese, anno
;

-- 9. Trovate i film che sono stati noleggiati almeno due volte lo stesso giorno.
SELECT 
    film.film_id AS id_film,
    film.title AS titolo,
    DAY(rental.rental_date) AS giorno_di_noleggio,
    COUNT(film.film_id) AS n_film
FROM
    rental
        JOIN
    inventory ON rental.inventory_id = inventory.inventory_id
        JOIN
    film ON inventory.film_id = film.film_id
GROUP BY id_film , titolo , giorno_di_noleggio
HAVING n_film > 2
;

-- 10. Calcolate il tempo medio di noleggio
SELECT 
    AVG(DATEDIFF(rental.return_date, rental.rental_date)) AS tempo_medio_noleggio_datediff
FROM
    rental
;
    
SELECT 
    AVG(film.rental_duration) AS tempo_medio_noleggio
FROM
    film
;

