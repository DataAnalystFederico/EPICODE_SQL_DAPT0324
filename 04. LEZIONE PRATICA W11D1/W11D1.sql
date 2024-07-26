-- 1.Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. Quali considerazioni/ragionamenti è necessario che tu faccia?
SELECT 
    count(ProductKey)
FROM
    dimproduct
GROUP BY ProductKey
HAVING COUNT(ProductKey) > 1
;

-- 2.Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
SELECT 
    SalesOrderNumber, SalesOrderLineNumber, COUNT(*)
FROM
    factresellersales
GROUP BY SalesOrderNumber , SalesOrderLineNumber
HAVING COUNT(*) > 1
;

-- 3.Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
SELECT 
    count(SalesOrderLineNumber),
    OrderDate
FROM
    factresellersales
WHERE
    OrderDate >= '2020-01-01'
GROUP BY OrderDate
;

-- 4.Calcola il fatturato totale (FactResellerSales.SalesAmount), la quantità totale venduta (FactResellerSales.OrderQuantity) e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020. Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. I campi in output devono essere parlanti!
SELECT 
    factresellersales.OrderDate,
    dimproduct.EnglishProductName,
    SUM(factresellersales.SalesAmount) AS fatturato_totale,
    SUM(factresellersales.OrderQuantity) AS quantità_totale_venduta,
    AVG(factresellersales.UnitPrice) AS prezzo_medio
FROM
    factresellersales
        JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
WHERE factresellersales.OrderDate >= '2020-01-01'
GROUP BY EnglishProductName
;

-- 5.Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta (FactResellerSales.OrderQuantity) per Categoria prodotto (DimProductCategory). Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. I campi in output devono essere parlanti!
SELECT 
    dimproductcategory.EnglishProductCategoryName AS nome_categoria_prodotto,
    SUM(factresellersales.SalesAmount) AS fatturato_totale,
    SUM(factresellersales.OrderQuantity) AS quantità_totale_venduta
FROM
    factresellersales
        JOIN
    dimproduct ON dimproduct.ProductKey = factresellersales.ProductKey
        JOIN
    dimproductsubcategory ON dimproductsubcategory.ProductSubcategoryKey = dimproduct.ProductSubcategoryKey
        JOIN
    dimproductcategory ON dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
GROUP BY dimproductcategory.EnglishProductCategoryName
;

-- 6.Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020. Il result set deve esporre l’elenco delle città con fatturato realizzato superiore a 60K.
SELECT 
    dimgeography.City,
    SUM(factresellersales.SalesAmount) AS fatturato_totale
FROM
    factresellersales
        JOIN
    dimgeography ON factresellersales.SalesTerritoryKey = dimgeography.SalesTerritoryKey
WHERE
orderdate >= '2020-01-01'  and factresellersales.SalesAmount > 60.000
GROUP BY dimgeography.City
-- having fatturato_totale > 60000
order by City
;
