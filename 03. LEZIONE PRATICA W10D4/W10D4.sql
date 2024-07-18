-- 1. Esponi l’anagrafica dei prodotti indicando per ciascun prodotto anche la sua sottocategoria
SELECT 
    p.EnglishProductName,
    sp.EnglishProductSubcategoryName
FROM
    dimproduct p
        INNER JOIN
    dimproductsubcategory sp ON p.ProductSubcategoryKey = sp.ProductSubcategoryKey
;

-- 2.Esponi l’anagrafica dei prodotti indicando per ciascun prodotto la sua sottocategoria e la sua categoria (DimProduct, DimProductSubcategory, DimProductCategory).
SELECT 
    dimproductcategory.EnglishProductCategoryName,
    dimproductsubcategory.EnglishProductSubcategoryName,
    dimproduct.EnglishProductName
FROM
    dimproduct
        INNER JOIN
    dimproductsubcategory ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
        INNER JOIN
    dimproductcategory ON dimproductcategory.ProductCategoryKey = dimproductsubcategory.ProductCategoryKey
;

-- 3.Esponi l’elenco dei soli prodotti venduti (DimProduct, FactResellerSales).
SELECT distinct
    dimproduct.ProductKey,
    dimproduct.EnglishProductName,
    dimproduct.FinishedGoodsFlag
FROM
    dimproduct
        INNER JOIN
    factresellersales ON dimproduct.ProductKey = factresellersales.ProductKey
;

-- 4.Esponi l’elenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
SELECT 
    *
FROM
    dimproduct
WHERE
    dimproduct.ProductKey NOT IN (SELECT 
            ProductKey
        FROM
            factresellersales)
        AND FinishedGoodsFlag = 1
        ;
select
 p.ProductKey,
    p.ProductAlternateKey,
    p.EnglishProductName AS ProductName,
    s.ProductKey as ProductKeyFACT,
    FinishedGoodsFlag
FROM
    DimProduct p
        LEFT JOIN
    FactResellerSales s ON p.ProductKey = s.ProductKey
WHERE
    s.ProductKey IS NULL
        AND p.FinishedGoodsFlag = 1
;

-- 5.Esponi l’elenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
SELECT
    dimproduct.EnglishProductName,
    factresellersales.SalesOrderNumber,
    factresellersales.SalesOrderLineNumber
FROM
    factresellersales
        INNER JOIN
    dimproduct ON dimproduct.ProductKey = factresellersales.ProductKey
ORDER BY SalesOrderNumber, SalesOrderLineNumber
;

-- 6.Esponi l’elenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
SELECT 
    factresellersales.ProductKey,
    factresellersales.SalesOrderNumber,
    dimproduct.EnglishProductName,
    dimproductcategory.EnglishProductCategoryName
FROM
    dimproduct
        INNER JOIN
    dimproductsubcategory ON dimproductsubcategory.ProductSubcategoryKey = dimproduct.ProductSubcategoryKey
        INNER JOIN
    dimproductcategory ON dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
        INNER JOIN
    factresellersales ON factresellersales.ProductKey = dimproduct.ProductKey
ORDER BY ProductKey
;

-- 7.Esplora la tabella DimReseller.
SELECT 
    *
FROM
    dimreseller
;

-- 8.Esponi in output l’elenco dei reseller indicando, per ciascun reseller, anche la sua area geografica. 
SELECT DISTINCT
    dimreseller.ResellerName,
    dimsalesterritory.SalesTerritoryRegion,
    dimsalesterritory.SalesTerritoryCountry,
    dimsalesterritory.SalesTerritoryGroup
FROM
    dimreseller
        left JOIN
    factresellersales ON dimreseller.ResellerKey = factresellersales.ResellerKey
        left JOIN
    dimsalesterritory ON factresellersales.SalesTerritoryKey = dimsalesterritory.SalesTerritoryKey
;

SELECT 
    dimreseller.ResellerKey,
    dimreseller.ResellerName,
    dimgeography.City,
    dimgeography.StateProvinceName,
    dimgeography.EnglishCountryRegionName
FROM
    dimreseller
        JOIN
    dimgeography ON dimreseller.GeographyKey = dimgeography.GeographyKey
    ;
  
  -- 9.Esponi l’elenco delle transazioni di vendita. Il result set deve esporre i campi: SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, Quantity, TotalProductCost. Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, il nome del reseller e l’area geografica.
SELECT
    factresellersales.SalesOrderNumber,
    factresellersales.SalesOrderLineNumber,
    factresellersales.OrderDate,
    factresellersales.UnitPrice,
    factresellersales.OrderQuantity,
    factresellersales.TotalProductCost,
    dimproduct.EnglishProductName,
    dimproductcategory.EnglishProductCategoryName,
    dimreseller.ResellerName,
    dimsalesterritory.SalesTerritoryRegion,
    dimsalesterritory.SalesTerritoryCountry,
    dimsalesterritory.SalesTerritoryGroup
FROM
    dimreseller
        inner JOIN
    factresellersales ON dimreseller.ResellerKey = factresellersales.ResellerKey
        inner JOIN
    dimsalesterritory ON factresellersales.SalesTerritoryKey = dimsalesterritory.SalesTerritoryKey
        inner JOIN
    dimproduct ON factresellersales.ProductKey = dimproduct.ProductKey
        inner JOIN
    dimproductsubcategory ON dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
        inner JOIN
    dimproductcategory ON dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
;
