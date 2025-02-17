-- ESERCIZIO 1 Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa. 
-- La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto, il nome della sottocategoria associata e il nome della categoria associata.
select * from dimproduct;
select * from dimproductsubcategory;
select * from dimproductcategory;
Create view Product as
SELECT dimproduct.ProductKey, dimproduct.EnglishProductName as ProductName, ifnull(dimproductsubcategory.EnglishProductSubcategoryName, 'Not found') as Subcategory, ifnull(dimproductcategory.EnglishProductCategoryName, 'Not found') as Category, ifnull(dimreseller.ResellerKey, 'Not found') as resellerkey
from dimproduct 
left join dimproductsubcategory on dimproduct.ProductSubcategoryKey = dimproductsubcategory.ProductSubcategoryKey
LEFT JOIN dimproductcategory ON dimproductsubcategory.ProductCategoryKey = dimproductcategory.ProductCategoryKey
LEFT JOIN factresellersales on dimproduct.ProductKey = factresellersales.ProductKey
LEFT JOIN dimreseller on factresellersales.ResellerKey = dimreseller.ResellerKey;
select * from Product;



-- ESERCIZIO 2 Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa.
-- La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, il nome della città e il nome della regione.
select * from Product;
select * from dimreseller;
select * from factresellersales;
select * from dimgeography;
CREATE VIEW Reseller as
select dimreseller.ResellerKey, dimreseller.ResellerName as Reseller, ifnull(dimgeography.City, 'Not Found') as Citta, ifnull(dimgeography.EnglishCountryRegionName, 'Not Found') as Region
from dimreseller 
left join dimgeography on dimreseller.GeographyKey = dimgeography.GeographyKey;
select * from Reseller;

-- ESERCIZIO 3 -- base di partenza raggruppata per productkey
-- Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento, la riga di corpo del documento, la quantità venduta, lʼimporto totale e il profitto.
Create view Sales as
SELECT factresellersales.OrderDate, factresellersales.SalesOrderNumber, dimproduct.ProductKey, factresellersales.ResellerKey, factresellersales.OrderQuantity as Quantità, factresellersales.UnitPrice as Prezzounitario, factresellersales.SalesAmount as Totale_Vendite,
ROUND(SUM(factresellersales.SalesAmount - IFNULL(factresellersales.TotalProductCost, 0)), 2) as Profitto
FROM factresellersales 
LEFT JOIN dimreseller ON factresellersales.Resellerkey = dimreseller.ResellerKey
left join dimproduct on factresellersales.ProductKey = dimproduct.ProductKey
GROUP BY factresellersales.OrderDate, factresellersales.OrderQuantity, factresellersales.UnitPrice, factresellersales.SalesOrderNumber, factresellersales.SalesAmount, factresellersales.ResellerKey, dimproduct.ProductKey;
select * from Sales;

select * from factresellersales;


