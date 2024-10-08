-- 1. Esplora la tabelle dei prodotti (DimProduct)
SELECT 
    *
FROM
    AdventureWorksDW.dimproduct
    ;
    
-- 2. Interroga la tabella dei prodotti (DimProduct) ed esponi in output i campi ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag.
SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    AdventureWorksDW.dimproduct
;

-- 3. Partendo dalla query scritta nel passaggio precedente, esponi in output i soli prodotti finiti cioè quelli per cui il campo FinishedGoodsFlag è uguale a 1.
SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM
    dimproduct
WHERE
    FinishedGoodsFlag = 1
;

-- 4. Scrivi una nuova query al fine di esporre in output i prodotti il cui codice modello (ProductAlternateKey) comincia con FR oppure BK. Il result set deve contenere il codice prodotto (ProductKey), il modello, il nome del prodotto, il costo standard (StandardCost) e il prezzo di listino (ListPrice).
SELECT 
    ProductKey,
    EnglishProductName,
    ModelName,
    EnglishProductName,
    StandardCost,
    ListPrice,
    ProductAlternateKey
FROM
    dimproduct
WHERE
    ProductAlternateKey like'FR%' or 'BK%'
    ;

-- 5. Arricchisci il risultato della query scritta nel passaggio precedente del Markup applicato dall’azienda (ListPrice - StandardCost).
SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    ModelName,
    EnglishProductName,
    StandardCost,
    ListPrice,
    ListPrice - StandardCost AS Markup
FROM
    dimproduct
WHERE
    ProductAlternateKey LIKE 'FR%'
        OR ProductAlternateKey LIKE 'BK%'
;

-- 6. Scrivi un’altra query al fine di esporre l’elenco dei prodotti finiti il cui prezzo di listino è compreso tra 1000 e 2000.
SELECT 
    ProductKey, EnglishProductName, ModelName, Listprice
FROM
    dimproduct
WHERE
    Listprice BETWEEN 1000 AND 2000
;

-- 7. Esplora la tabella degli impiegati aziendali (DimEmployee)
SELECT 
    *
FROM
    dimemployee
;

-- 8. Esponi, interrogando la tabella degli impiegati aziendali, l’elenco dei soli agenti. Gli agenti sono i dipendenti per i quali il campo SalespersonFlag è uguale a 1.
SELECT 
    FirstName, Lastname, EmailAddress, DepartmentName, Position, SalesPersonFlag
FROM
    dimemployee
WHERE
    position IN ('Sales Representative')
        AND SalesPersonFlag = 1
;

-- 9. Interroga la tabella delle vendite (FactResellerSales). Esponi in output l’elenco delle transazioni registrate a partire dal 1 gennaio 2020 dei soli codici prodotto: 597, 598, 477, 214. Calcola per ciascuna transazione il profitto (SalesAmount - TotalProductCost).
SELECT 
    *
FROM
    factresellersales
;

SELECT 
    *,
     SalesAmount - TotalProductCost Profit
FROM
    factresellersales
WHERE
    ProductKey IN (597 , 598, 477, 214)
        AND OrderDate >= '2020-01-01'