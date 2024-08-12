-- Crezione DB
CREATE DATABASE SECONDAUTO;
-- Utilizzo db
USE SECONDAUTO;

-- Creazione tabella auto
CREATE TABLE AUTO (
ID_AUTO INT PRIMARY KEY,
TARGA VARCHAR(50),
TIPI_CAMBIO  VARCHAR(50),
CILINDRATA VARCHAR(50),
COLORE VARCHAR(50),
MARCA VARCHAR(50),
VALORE INT);

-- Creazione tabella concessionario
create table concessionario (
ID_CONCESSIONARIO int primary key,
TELEFONO VARCHAR (25),
RESPONSABILE VARCHAR (25),
CITTA VARCHAR (25),
INDIRIZZO VARCHAR (25),
REGIONE  VARCHAR (25));

-- creazione tabella Proprietario 
Create table proprietario (
id_proprietario int primary key,
citta varchar(25),
nominativo VARCHAR (25),
regione VARCHAR(25));

-- Creazione tabella acquisto
CREATE TABLE ACQUISTO(
ID_ACQUISTO INT PRIMARY KEY,
ID_PROPRIETARIO INT,
ID_AUTO INT,
ID_CONCESSIONARIO INT,
DATA_ACQUISTO DATE,
PREZZO_ACQUISTO DECIMAL(10,2),
FOREIGN KEY (ID_PROPRIETARIO) REFERENCES proprietario(ID_PROPRIETARIO),
FOREIGN KEY (ID_CONCESSIONARIO) REFERENCES concessionario(ID_CONCESSIONARIO),
  FOREIGN KEY (ID_AUTO) REFERENCES auto(ID_AUTO));


-- Creazione tabella 
Create table vendita(
ID_VENDITA INT PRIMARY KEY,
ID_PROPRIETARIO INT,
ID_AUTO INT,
ID_CONCESSIONARIO INT,
DATA_VENDITA DATE,
PREZZO_VENDITA DECIMAL(10,2),
 FOREIGN KEY (ID_PROPRIETARIO) REFERENCES proprietario(ID_PROPRIETARIO),
  FOREIGN KEY (ID_CONCESSIONARIO) REFERENCES concessionario(ID_CONCESSIONARIO),
  FOREIGN KEY (ID_AUTO) REFERENCES auto(ID_AUTO));


-- Popolamento tabella auto
INSERT INTO AUTO (ID_AUTO, TARGA, TIPI_CAMBIO, CILINDRATA, COLORE, MARCA,VALORE) VALUES 
(1, 'AA00001', 'MANUALE', '1200', 'ROSSO', 'FORD','16000'),
(2, 'AA00002', 'AUTOMATICO', '1400', 'ROSSO', 'FORD','20000'),
(3, 'AA00003', 'MANUALE', '1600', 'VERDE', 'FORD','22000'),
(4, 'AA00004', 'AUTOMATICO', '1800', 'GIALLO', 'FORD','23000'),
(5, 'AA00005', 'MANUALE', '1200', 'ROSSO', 'FORD','16000'),
(6, 'AA00006', 'MANUALE', '1200', 'ROSSO', 'FIAT','19000'),
(7, 'AA00007', 'AUTOMATICO', '1400', 'BLU', 'FIAT','21000'),
(8, 'AA00008', 'MANUALE', '1600', 'VERDE', 'FIAT','23000'),
(9, 'AA00009', 'AUTOMATICO', '1800', 'GIALLO', 'FIAT','16000'),
(10, 'AA00010', 'MANUALE', '1200', 'ROSSO', 'FIAT','19000'),
(11, 'AA00011', 'MANUALE', '1200', 'ROSSO', 'NISSAN','21000'),
(12, 'AA00012', 'AUTOMATICO', '1400', 'BLU', 'NISSAN','22000'),
(13, 'AA00013', 'MANUALE', '1600', 'VERDE', 'NISSAN','16000'),
(14, 'AA00014', 'AUTOMATICO', '1800', 'GIALLO', 'NISSAN','19000'),
(15, 'AA00015', 'MANUALE', '1200', 'ROSSO', 'NISSAN','20000'),
(16, 'AA00016', 'MANUALE', '1200', 'ROSSO', 'TOYOTA','16000'),
(17, 'AA00017', 'AUTOMATICO', '1400', 'BLU', 'TOYOTA','18000'),
(18, 'AA00018', 'MANUALE', '1600', 'VERDE', 'TOYOTA','19000'),
(19, 'AA00019', 'AUTOMATICO', '1800', 'GIALLO', 'TOYOTA','20000'),
(20, 'AA00020', 'MANUALE', '1200', 'ROSSO', 'TOYOTA','21000'),
(21, 'AA00021', 'MANUALE', '1000', 'BIANCO', 'FORD', 9000),
(22, 'AA00022', 'AUTOMATICO', '1200', 'ROSSO', 'FORD', 8500),
(23, 'AA00023', 'MANUALE', '1100', 'BLU', 'FIAT', 9500),
(24, 'AA00024', 'AUTOMATICO', '1300', 'VERDE', 'FIAT', 9200),
(25, 'AA00025', 'MANUALE', '1400', 'GIALLO', 'NISSAN', 9800),
(26, 'AA00026', 'AUTOMATICO', '1500', 'NERO', 'NISSAN', 7000),
(27, 'AA00027', 'MANUALE', '1200', 'GRIGIO', 'TOYOTA', 8800),
(28, 'AA00028', 'AUTOMATICO', '1400', 'ROSSO', 'TOYOTA', 9200),
(29, 'AA00029', 'MANUALE', '1000', 'BIANCO', 'FORD', 7500),
(30, 'AA00030', 'AUTOMATICO', '1100', 'BLU', 'FIAT', 8500),
(31, 'AA00031', 'MANUALE', '1200', 'VERDE', 'NISSAN', 9600),
(32, 'AA00032', 'AUTOMATICO', '1300', 'GIALLO', 'TOYOTA', 9400),
(33, 'AA00033', 'MANUALE', '1400', 'NERO', 'FORD', 9900),
(34, 'AA00034', 'AUTOMATICO', '1500', 'GRIGIO', 'FIAT', 9800),
(35, 'AA00035', 'MANUALE', '1600', 'ROSSO', 'NISSAN', 7000),
(36, 'AA00036', 'AUTOMATICO', '1700', 'BLU', 'TOYOTA', 8500),
(37, 'AA00037', 'MANUALE', '1200', 'VERDE', 'FORD', 9000),
(38, 'AA00038', 'AUTOMATICO', '1300', 'GIALLO', 'FIAT', 8700),
(39, 'AA00039', 'MANUALE', '1400', 'NERO', 'NISSAN', 8200),
(40, 'AA00040', 'AUTOMATICO', '1000', 'BIANCO', 'TOYOTA', 9500);

-- Popolamento tabella Proprietari
INSERT INTO proprietario (id_proprietario, citta, nominativo, regione) VALUES 
(1, 'Milano', 'Mario Rossi', 'Lombardia'),
(2, 'Roma', 'Anna Bianchi', 'Lazio'),
(3, 'Napoli', 'Luca Verdi', 'Campania'),
(4, 'Torino', 'Sara Neri', 'Piemonte'),
(5, 'Milano', 'Marco Gallo', 'Lombardia'),
(6, 'Roma', 'Elena Blu', 'Lazio'),
(7, 'Milano', 'Giovanni Fiori', 'Lombardia'),
(8, 'Napoli', 'Chiara Rossa', 'Campania'),
(9, 'Catanzaro', 'Paolo Verde', 'Calabria'),
(10, 'Catanzaro', 'Laura Nera', 'Calabria'),
(11, 'Genova', 'Alessio Colombo', 'Liguria'),
(12, 'Genova', 'Federica Moretti', 'Liguria'),
(13, 'Bologna', 'Lorenzo Esposito', 'Emilia-Romagna'),
(14, 'Bologna', 'Valentina D''Amico', 'Emilia-Romagna'),
(15, 'Firenze', 'Simone Greco', 'Toscana'),
(16, 'Firenze', 'Elisa Conti', 'Toscana'),
(17, 'Venezia', 'Davide Lombardi', 'Veneto'),
(18, 'Venezia', 'Silvia Ferrari', 'Veneto'),
(19, 'Bari', 'Giorgio Galli', 'Puglia'),
(20, 'Bari', 'Alessandra De Luca', 'Puglia'),
(21, 'Milano', 'Fabio Romano', 'Lombardia'),
(22, 'Roma', 'Giulia Cattaneo', 'Lazio'),
(23, 'Napoli', 'Roberto De Angelis', 'Campania'),
(24, 'Torino', 'Paola Fontana', 'Piemonte'),
(25, 'Catanzaro', 'Stefano Russo', 'Calabria'),
(26, 'Milano', 'Chiara Gentile', 'Lombardia'),
(27, 'Roma', 'Andrea Barbieri', 'Lazio'),
(28, 'Napoli', 'Francesca Pellegrini', 'Campania'),
(29, 'Torino', 'Luigi Longo', 'Piemonte'),
(30, 'Catanzaro', 'Martina Esposito', 'Calabria'),
(31, 'Milano', 'Alessandro Neri', 'Lombardia'),
(32, 'Milano', 'Francesca Martini', 'Lombardia'),
(33, 'Napoli', 'Giuseppe Russo', 'Campania'),
(34, 'Napoli', 'Claudia Bianchi', 'Campania'),
(35, 'Roma', 'Riccardo Ferri', 'Lazio'),
(36, 'Roma', 'Sara Colombo', 'Lazio'),
(37, 'Torino', 'Valerio Gallo', 'Piemonte'),
(38, 'Torino', 'Elena Conti', 'Piemonte'),
(39, 'Catanzaro', 'Giovanni De Luca', 'Calabria'),
(40, 'Catanzaro', 'Laura Morelli', 'Calabria'),
(41, 'Genova', 'Mauro Grassi', 'Liguria'),
(42, 'Genova', 'Alice Rinaldi', 'Liguria'),
(43, 'Bologna', 'Marco Ferrari', 'Emilia-Romagna'),
(44, 'Bologna', 'Giulia Berti', 'Emilia-Romagna'),
(45, 'Firenze', 'Antonio Ricci', 'Toscana'),
(46, 'Firenze', 'Martina Manfredi', 'Toscana'),
(47, 'Venezia', 'Simone Barone', 'Veneto'),
(48, 'Venezia', 'Caterina Russo', 'Veneto'),
(49, 'Bari', 'Francesco Santoro', 'Puglia'),
(50, 'Bari', 'Marta Esposito', 'Puglia'),
(51, 'Milano', 'Giorgio Bernardini', 'Lombardia'),
(52, 'Napoli', 'Giovanna Pugliese', 'Campania'),
(53, 'Roma', 'Antonio Lombardi', 'Lazio'),
(54, 'Torino', 'Carla Romano', 'Piemonte'),
(55, 'Genova', 'Paola Bertolini', 'Liguria'),
(56, 'Bologna', 'Davide Sarti', 'Emilia-Romagna'),
(57, 'Firenze', 'Francesco Marini', 'Toscana'),
(58, 'Venezia', 'Roberto Battaglia', 'Veneto'),
(59, 'Bari', 'Alessandra Vitale', 'Puglia'),
(60, 'Milano', 'Luca Cavalli', 'Lombardia');

-- popolamento tabella concessionaria
INSERT INTO concessionario (ID_CONCESSIONARIO, TELEFONO, RESPONSABILE, CITTA, INDIRIZZO, REGIONE) VALUES 
(1, '0123456789', 'Marco Bianchi', 'Milano', 'Via Roma 1', 'Lombardia'),
(2, '0234567890', 'Luca Rossi', 'Napoli', 'Corso Italia 2', 'Campania'),
(3, '0345678901', 'Anna Verdi', 'Roma', 'Via Venezia 3', 'Lazio'),
(4, '0456789012', 'Giovanni Neri', 'Torino', 'Piazza San Carlo 4', 'Piemonte'),
(5, '0567890123', 'Sara Gallo', 'Catanzaro', 'Via della Libertà 5', 'Calabria'),
(6, '0678901234', 'Roberto Marini', 'Genova', 'Via del Mare 6', 'Liguria'),
(7, '0789012345', 'Francesca Rizzo', 'Bologna', 'Via Rizzoli 7', 'Emilia-Romagna'),
(8, '0890123456', 'Giulia Ferri', 'Firenze', 'Piazza della Signoria 8', 'Toscana'),
(9, '0901234567', 'Alessandro Russo', 'Venezia', 'Campo San Polo 9', 'Veneto'),
(10, '0912345678', 'Martina Bianchi', 'Bari', 'Corso Emanuele 10', 'Puglia');

-- Popolamento tabela Acquisto
INSERT INTO ACQUISTO (ID_ACQUISTO, ID_PROPRIETARIO, ID_AUTO, ID_CONCESSIONARIO, DATA_ACQUISTO, PREZZO_ACQUISTO) VALUES
(1, 1, 1, 1, '2022-01-15', 15000.00),
(2, 2, 2, 1, '2010-02-20', 18000.00),
(3, 3, 3, 2, '2014-03-05', 20000.00),
(4, 4, 4, 2, '2014-04-10', 22000.00),
(5, 5, 5, 3, '2022-05-15', 15000.00),
(6, 1, 6, 3, '2022-06-20', 18000.00),
(7, 2, 7, 4, '2022-07-05', 20000.00),
(8, 3, 8, 4, '2022-08-10', 22000.00),
(9, 4, 9, 5, '2022-09-15', 15000.00),
(10, 5, 10, 5, '2022-10-20', 18000.00),
(11, 1, 11, 1, '2023-01-15', 20000.00),
(12, 3, 12, 1, '2023-02-20', 22000.00),
(13, 4, 13, 2, '2023-03-05', 15000.00),
(14, 4, 14, 2, '2023-04-10', 18000.00),
(15, 5, 15, 3, '2023-05-15', 20000.00),
(16, 2, 16, 3, '2023-06-20', 22000.00),
(17, 4, 17, 4, '2023-07-05', 15000.00),
(18, 2, 18, 4, '2023-08-10', 18000.00),
(19, 2, 19, 5, '2023-09-15', 20000.00),
(20, 1, 20, 5, '2023-10-20', 22000.00),
(21, 6, 1, 1, '2023-10-20', 10000.00),
(22, 21, 21, 1, '2022-01-10', 8500.00),  -- Owner from Milano, buying Ford
(23, 22, 22, 3, '2022-02-15', 8000.00),  -- Owner from Roma, buying Ford (corrected to Roma)
(24, 23, 23, 2, '2022-03-20', 9200.00),  -- Owner from Napoli, buying Fiat (corrected to Napoli)
(25, 24, 24, 4, '2022-04-25', 8700.00),  -- Owner from Torino, buying Fiat
(26, 25, 25, 5, '2022-05-30', 9500.00),  -- Owner from Catanzaro, buying Nissan
(27, 26, 26, 6, '2022-06-05', 7000.00),  -- Owner from Genova, buying Nissan
(28, 27, 27, 7, '2022-07-10', 8800.00),  -- Owner from Bologna, buying Toyota
(29, 28, 28, 8, '2022-08-15', 9200.00),  -- Owner from Firenze, buying Toyota
(30, 29, 29, 9, '2022-09-20', 7500.00),  -- Owner from Venezia, buying Ford
(31, 30, 30, 10, '2022-09-20',8500.00),  -- Owner from Bari, buying Fiat
(32, 31, 31, 1, '2023-01-10', 9600.00),  -- Owner from Milano, buying Nissan
(33, 32, 32, 3, '2023-02-15', 9400.00),  -- Owner from Roma, buying Toyota
(34, 33, 33, 2, '2023-03-20', 9900.00),  -- Owner from Napoli, buying Ford
(35, 34, 34, 4, '2023-04-25', 9800.00),  -- Owner from Torino, buying Fiat
(36, 35, 35, 5, '2023-05-30', 7000.00),  -- Owner from Catanzaro, buying Nissan
(37, 36, 36, 6, '2023-06-05', 8500.00),  -- Owner from Genova, buying Toyota
(38, 37, 37, 7, '2023-07-10', 9000.00),  -- Owner from Bologna, buying Ford
(39, 38, 38, 8, '2023-08-15', 8700.00),  -- Owner from Firenze, buying Fiat
(40, 39, 39, 9, '2023-09-20', 8200.00),  -- Owner from Venezia, buying Nissan
(41, 40, 40, 10,'2023-09-20', 9500.00);  -- Owner from Bari, buying Toyota

-- popolamento tabella vendita
INSERT INTO VENDITA (ID_VENDITA, ID_PROPRIETARIO, ID_AUTO, ID_CONCESSIONARIO, DATA_VENDITA, PREZZO_VENDITA) VALUES
(1, 6, 1, 1, '2023-01-15', 18000.00),
(2, 7, 2, 1, '2023-02-20', 20000.00),
(3, 8, 3, 2, '2015-03-05', 22000.00),
(4, 9, 4, 2, '2015-04-10', 25000.00),
(5, 10, 5, 3, '2023-05-15', 17000.00),
(6, 6, 6, 3, '2023-06-20', 20000.00),
(7, 7, 7, 4, '2023-07-05', 22000.00),
(8, 6, 8, 4, '2023-08-10', 25000.00),
(9, 6, 9, 5, '2023-09-15', 18000.00),
(10, 9, 10, 5, '2023-10-20', 20000.00),
(11, 10, 11, 1, '2024-01-15', 22000.00),
(12, 8, 12, 1, '2024-02-20', 25000.00),
(13, 6, 13, 2, '2024-03-05', 17000.00),
(14, 2, 14, 2, '2024-04-10', 18000.00),
(15, 8, 15, 3, '2024-05-15', 22000.00),
(16, 2, 1, 1, '2024-05-15', 13000.00),
(17, 1, 17, 1, '2024-06-15', 18000.00),  -- Owner from Milano, selling Toyota (VALORE 18000)
(18, 2, 18, 2, '2024-07-20', 19000.00),  -- Owner from Roma, selling Ford (VALORE 19000)
(19, 3, 19, 3, '2024-08-25', 20000.00),  -- Owner from Napoli, selling Toyota (VALORE 20000)
(20, 4, 20, 4, '2024-09-30', 21000.00),  -- Owner from Torino, selling Ford (VALORE 21000)
(21, 5, 26, 5, '2024-10-05', 7000.00),  -- Owner from Catanzaro, selling Nissan (VALORE 7000)
(22, 6, 27, 6, '2024-11-10', 8800.00),  -- Owner from Genova, selling Toyota (VALORE 8800)
(23, 7, 28, 7, '2024-12-15', 9200.00),  -- Owner from Bologna, selling Toyota (VALORE 9200)
(24, 8, 29, 8, '2025-01-20', 7500.00),  -- Owner from Firenze, selling Ford (VALORE 7500)
(25, 9, 30, 9, '2025-02-25', 8500.00),  -- Owner from Venezia, selling Fiat (VALORE 8500)
(26, 10, 31, 10, '2025-03-02', 9600.00),  -- Owner from Bari, selling Ford (VALORE 9600)
(27, 1, 32, 1, '2025-04-05', 9400.00),  -- Owner from Milano, selling Ford (VALORE 9400)
(28, 2, 33, 2, '2025-05-10', 9900.00),  -- Owner from Roma, selling Fiat (VALORE 9900)
(29, 3, 34, 3, '2025-06-15', 9800.00),  -- Owner from Napoli, selling Fiat (VALORE 9800)
(30, 4, 35, 4, '2025-07-20', 7000.00),  -- Owner from Torino, selling Nissan (VALORE 7000)
(31, 5, 36, 5, '2025-08-25', 8500.00);  -- Owner from Catanzaro, selling Toyota (VALORE 8500)

-- 1. Marca e Colore delle Auto che costano più di 10.000 €
SELECT 
    auto.ID_AUTO AS id_auto,
    auto.MARCA AS marca,
    auto.COLORE AS colore,
    vendita.PREZZO_VENDITA AS prezzo_vendita,
    acquisto.PREZZO_ACQUISTO AS prezzo_acquisto
FROM
    auto
        JOIN
    vendita ON auto.ID_AUTO = vendita.ID_AUTO
        JOIN
    acquisto ON acquisto.ID_AUTO = auto.ID_AUTO
WHERE
    vendita.PREZZO_VENDITA > 10000
        AND acquisto.PREZZO_ACQUISTO > 10000
ORDER BY prezzo_vendita , prezzo_acquisto DESC;

-- 2. Tutti i proprietari di un’auto di colore ROSSO 
select 
proprietario.NOMINATIVO as nome,
acquisto.ID_AUTO as id_auto,
auto.TARGA as targa,
'a' as AcquistoVendita
from
proprietario
join acquisto on proprietario.ID_PROPRIETARIO=acquisto.ID_PROPRIETARIO
join auto on acquisto.ID_AUTO=auto.ID_AUTO
where auto.COLORE = 'ROSSO'

union 

select 
proprietario.NOMINATIVO as nome,
vendita.ID_AUTO as id_auto,
auto.TARGA as targa,
'v' as AcquistoVendita
from
proprietario
join vendita on proprietario.ID_PROPRIETARIO=vendita.ID_PROPRIETARIO
join auto on vendita.ID_AUTO=auto.ID_AUTO
where auto.COLORE = 'ROSSO'
;

-- 3. Costo totale di tutte le auto con Cilindrata superiore a 1600lo c14
SELECT 
    auto.ID_AUTO AS id_auto,
    auto.TARGA AS targa,
    SUM(ifnull(acquisto.PREZZO_ACQUISTO,0) + coalesce(vendita.PREZZO_VENDITA,0)) AS costo_totale
FROM
    auto
        left JOIN
    acquisto ON auto.ID_AUTO = acquisto.ID_AUTO
        left JOIN
    vendita ON auto.ID_AUTO = vendita.ID_AUTO
WHERE
    auto.CILINDRATA > 1600
GROUP BY id_auto , targa
;

-- 4. Targa e Nome del proprietario delle Auto in una concessionaria della Città di Roma 
create view TRANSAZIONI_ROMA as (SELECT 
    auto.TARGA AS targa,
    proprietario.NOMINATIVO AS nominativo,
    concessionario.CITTA AS città,
    acquisto.DATA_ACQUISTO AS data_transazione,
    'a' AS transazione
FROM
    auto
        JOIN
    acquisto ON auto.ID_AUTO = acquisto.ID_AUTO
        JOIN
    proprietario ON acquisto.ID_PROPRIETARIO = proprietario.ID_PROPRIETARIO
        JOIN
    concessionario ON acquisto.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
WHERE
    concessionario.CITTA = 'ROMA'
    
UNION

SELECT 
    auto.TARGA AS targa,
    proprietario.NOMINATIVO AS nominativo,
    concessionario.CITTA AS città,
    vendita.DATA_VENDITA AS data_transazione,
    'v' AS transazione
FROM
    auto
        JOIN
    vendita ON auto.ID_AUTO = vendita.ID_AUTO
        JOIN
    proprietario ON vendita.ID_PROPRIETARIO = proprietario.ID_PROPRIETARIO
        JOIN
    concessionario ON vendita.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
WHERE
    concessionario.CITTA = 'ROMA')
;

-- 5. Per ogni Concessionaria, il numero di Auto
SELECT 
    concessionario.ID_CONCESSIONARIO AS id_concessionario,
    concessionario.CITTA AS concessionario_di,
    COUNT(auto.ID_AUTO) AS n_auto,
    'a' AS AquistoVendita
FROM
    concessionario
        JOIN
    acquisto ON concessionario.ID_CONCESSIONARIO = acquisto.ID_CONCESSIONARIO
        JOIN
    auto ON acquisto.ID_AUTO = auto.ID_AUTO
GROUP BY id_concessionario , concessionario_di 

UNION

SELECT 
    concessionario.ID_CONCESSIONARIO AS id_concessionario,
    concessionario.CITTA AS concessionario_di,
    COUNT(auto.ID_AUTO) AS n_auto,
    'v'
FROM
    concessionario
        JOIN
    vendita ON concessionario.ID_CONCESSIONARIO = vendita.ID_CONCESSIONARIO
        JOIN
    auto ON vendita.ID_AUTO = auto.ID_AUTO
GROUP BY id_concessionario , concessionario_di
;

-- 6. Il Responsabile di Concessionaria di tutte le auto con Cambio Automatico e Anno Acquisto 2010
SELECT 
    concessionario.RESPONSABILE AS responsabile,
    concessionario.CITTA AS concessionario_di,
    auto.ID_AUTO AS id_auto,
    auto.TIPI_CAMBIO AS cambio,
    acquisto.DATA_ACQUISTO AS anno_acquisto
FROM
    concessionario
        JOIN
    acquisto ON concessionario.ID_CONCESSIONARIO = acquisto.ID_CONCESSIONARIO
        JOIN
    auto ON acquisto.ID_AUTO = auto.ID_AUTO
WHERE
    auto.TIPI_CAMBIO = 'AUTOMATICO' and YEAR(acquisto.DATA_ACQUISTO) = 2010
-- GROUP BY responsabile , concessionario_di , id_auto , cambio , anno_acquisto
-- HAVING YEAR(anno_acquisto) = '2010'
;

-- 7. Per ciascuna TARGA il colore, il prezzo e la città in cui si trova il veicolo
select
auto.TARGA as targa,
auto.COLORE,
acquisto.PREZZO_ACQUISTO,
proprietario.CITTA as città,
acquisto.DATA_ACQUISTO as data_acquisto,
'a' as AquistoVendita
from
auto
join acquisto on auto.ID_AUTO=acquisto.ID_AUTO
join proprietario on acquisto.ID_PROPRIETARIO=proprietario.ID_PROPRIETARIO
where year(acquisto.DATA_ACQUISTO) = '2024'

union

select
auto.TARGA as targa,
auto.COLORE,
vendita.PREZZO_VENDITA,
proprietario.CITTA as città,
vendita.DATA_VENDITA AS data_vendita,
'v'
from
auto
join vendita on auto.ID_AUTO=vendita.ID_AUTO
join proprietario on vendita.ID_PROPRIETARIO=proprietario.ID_PROPRIETARIO
where year(vendita.DATA_vendita) = '2024'
order by data_acquisto desc
;

-- 8. Le auto con almeno tre Proprietari
SELECT 
    auto.ID_AUTO AS id_auto,
    auto.TARGA AS targa,
    COUNT(acquisto.ID_AUTO) AS n_acquisti
FROM
    auto
        JOIN
    acquisto ON auto.ID_AUTO = acquisto.ID_AUTO
        JOIN
    proprietario ON acquisto.ID_PROPRIETARIO = proprietario.ID_PROPRIETARIO
GROUP BY id_auto , targa
HAVING COUNT(acquisto.ID_AUTO) >= 3
;

-- 9. La targa delle auto vendute nel 2015 
SELECT 
    auto.TARGA AS targa,
    YEAR(vendita.DATA_VENDITA) AS anno_vendita
FROM
    auto
        JOIN
    vendita ON auto.ID_AUTO = vendita.ID_AUTO
    where YEAR(vendita.DATA_VENDITA) = 2015
-- GROUP BY targa , anno_vendita
-- HAVING anno_vendita = '2015'
;

-- 10. La regione con più auto (trovare un modo per associare la Regione)
SELECT 
    COUNT(vendita.ID_AUTO) AS n_auto_vendute,
    concessionario.REGIONE AS regione
FROM
    concessionario
        JOIN
    vendita ON concessionario.ID_CONCESSIONARIO = vendita.ID_CONCESSIONARIO
GROUP BY regione
ORDER BY n_auto_vendute DESC
LIMIT 1
;

-- 11. La Targa delle auto che si trovano a Milano, con cambio automatico, colore rosso, di proprietari residenti a Milano
SELECT DISTINCT
    auto.TARGA AS targa,
    auto.TIPI_CAMBIO AS cambio,
    auto.COLORE AS colore,
    proprietario.NOMINATIVO AS proprietario,
    proprietario.CITTA AS città,
    concessionario.CITTA AS concessionaria_di,
    'a' AS AcquistoVendita
FROM
    auto
        JOIN
    acquisto ON auto.ID_AUTO = acquisto.ID_AUTO
        JOIN
    proprietario ON acquisto.ID_AUTO = proprietario.ID_PROPRIETARIO
        JOIN
    concessionario ON acquisto.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
WHERE
    proprietario.CITTA = 'Milano'
        AND concessionario.CITTA = 'Milano' 
UNION SELECT DISTINCT
    auto.TARGA AS targa,
    auto.TIPI_CAMBIO AS cambio,
    auto.COLORE AS colore,
    proprietario.NOMINATIVO AS proprietario,
    proprietario.CITTA AS città,
    concessionario.CITTA AS concessionaria_di,
    'v' AS AcquistoVendita
FROM
    auto
        JOIN
    vendita ON auto.ID_AUTO = vendita.ID_AUTO
        JOIN
    proprietario ON vendita.ID_AUTO = proprietario.ID_PROPRIETARIO
        JOIN
    concessionario ON vendita.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
WHERE
    proprietario.CITTA = 'Milano'
        AND concessionario.CITTA = 'Milano'
;

-- 12. calcolare il ricavo di ogni concessionaria negli anni
SELECT 
    vendita.ID_CONCESSIONARIO as id_concessionario,
    concessionario.CITTA as città,
    SUM(PREZZO_VENDITA) as ricavo,
    YEAR(DATA_VENDITA) as anno
FROM
    vendita
    JOIN concessionario ON vendita.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
GROUP BY id_concessionario, città, anno
;

-- 13. calcolare i costi totali di ogni concessionaria negli anni
SELECT 
    acquisto.ID_CONCESSIONARIO AS id_concessionario,
    concessionario.CITTA AS città,
    SUM(PREZZO_ACQUISTO) AS costi,
    YEAR(DATA_acquisto) AS anno
FROM
    acquisto
        JOIN
    concessionario ON acquisto.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
GROUP BY id_concessionario , città, anno
;

-- 14. riportare graficamente su excel le auto vendute x concessionario, in base al tipo di cambio, negli anni
SELECT 
    vendita.ID_CONCESSIONARIO AS id_concessionario,
    vendita.ID_AUTO AS id_auto,
    auto.MARCA as marca,
    auto.TIPI_CAMBIO AS cambio,
    concessionario.CITTA AS città,
    YEAR(DATA_VENDITA) AS anno
FROM
    auto
        JOIN
    vendita ON auto.ID_AUTO = vendita.ID_AUTO
        JOIN
    concessionario ON vendita.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
;

-- 15. BONUS * creare unica tabella comprensiva degli acquisti e delle vendite per concessionario negli anni, indicando alcuni dettagli delle auto

SELECT 
    concessionario.CITTA AS città,
    acquisto.ID_AUTO AS id_auto,
    auto.TARGA AS targa,
    auto.MARCA AS marca,
    vendita.PREZZO_VENDITA AS ricavo,
    acquisto.PREZZO_ACQUISTO AS costo,
    YEAR(acquisto.DATA_ACQUISTO) AS anno_acquisto,
    YEAR(vendita.DATA_VENDITA) AS anno_vendita
FROM
    auto
        LEFT JOIN
    acquisto ON auto.ID_AUTO = acquisto.ID_AUTO
        LEFT JOIN
    vendita ON auto.id_auto = vendita.id_vendita
        JOIN
    concessionario ON acquisto.ID_CONCESSIONARIO = concessionario.ID_CONCESSIONARIO
ORDER BY id_auto
;