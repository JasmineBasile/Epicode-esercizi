select * from dimproduct;
select productkey, productalternatekey, englishproductname, color, standardcost, finishedgoodsflag from dimproduct;
select productkey, productalternatekey, englishproductname, color, standardcost, finishedgoodsflag from dimproduct where FinishedGoodsFlag = 1;
select productkey, productalternatekey, englishproductname, color, standardcost, finishedgoodsflag from dimproduct;
select * from dimproduct;
select productkey, productalternatekey, englishproductname, color, standardcost, ListPrice, finishedgoodsflag from dimproduct where ProductAlternateKey like "FR%" or ProductAlternateKey like "BK%";
select productkey, productalternatekey, englishproductname, color, standardcost, ListPrice, ListPrice-StandardCost as Markup, finishedgoodsflag from dimproduct where ProductAlternateKey like "FR%" or ProductAlternateKey like "BK%";
select productkey, productalternatekey, englishproductname, color, standardcost, ListPrice, ListPrice-StandardCost as Markup, finishedgoodsflag from dimproduct where listprice between 1000 and 2000;

select * from dimproduct;
select productkey, englishproductname, ListPrice from dimproduct where FinishedGoodsFlag = 1 and listprice between 1000 and 2000;

select * from dimemployee;
select employeekey, FirstName, LastName from dimemployee where salespersonflag = 1;

select * from factresellersales;
select SalesOrderNumber, duedate, productkey, salesamount-totalproductcost as Markup from factresellersales where duedate >= '2020-01-01' and productkey in (597, 598, 477, 214);



