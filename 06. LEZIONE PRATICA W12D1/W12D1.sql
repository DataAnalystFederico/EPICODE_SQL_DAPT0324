-- 1. Esplorate le tabelle e prendete dimestichezza con i dati
 /* FATTO */

-- 2. Scoprite quanti clienti si sono registrati nel 2006. 
select
year(create_date) as _data,
count(customer.customer_id) as n_cliente
from
customer
where year(create_date) = 2006
group by year(create_date)
;

-- 3. Trovate il numero totale di noleggi effettuati il giorno 2005-05-24.
SELECT 
    -- DATE(rental_date) AS data_noleggio,
    COUNT(rental_id) AS n_totale_noleggi
FROM
    rental
WHERE
    DATE(rental_date) = '2005-05-24'
-- GROUP BY DATE(rental_date)
;

-- 4. Elencate tutti i film noleggiati nell’ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati.
SELECT 
    film.title AS titolo_film,
    customer.customer_id AS id_cliente,
    customer.first_name AS nome,
    customer.last_name AS cognome,
    customer.email AS email,
    rental.rental_date AS data_noleggio
FROM
    film
        JOIN
    inventory ON film.film_id = inventory.film_id
        JOIN
    rental ON inventory.inventory_id = rental.inventory_id
        JOIN
    customer ON rental.customer_id = customer.customer_id
    where  date(rental.rental_date) between '2006-02-08' and '2006-02-014'
ORDER BY data_noleggio DESC
;

-- 5. Calcolate la durata media del noleggio per ogni categoria di film.
SELECT 
    A.categoria,
    A.media_durata_noleggio,
    B.media_duarata_noleggio_datediff
FROM
    (SELECT 
        category.name AS categoria,
            AVG(film.rental_duration) AS media_durata_noleggio
    FROM
        film
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    GROUP BY category.name) AS A
        JOIN
    (SELECT 
        category.name AS categoria,
            AVG(DATEDIFF(return_date, rental_date)) AS media_duarata_noleggio_datediff
    FROM
        rental
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film ON inventory.film_id = film.film_id
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    GROUP BY category.name) AS B ON A.categoria = B.categoria
;

-- 6. Trovate la durata del noleggio più lungo.
select
max(film.rental_duration) as durata_massima_noleggio_film
from
film
;

select
max(datediff(return_date, rental_date)) as durata_massima_noleggio_datediff
from
rental
;