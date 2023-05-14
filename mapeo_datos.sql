-- Mapeo de datos
-- 1. Tabla productos
select * from production.productcategory p ;
select * from production.product p ;
select * from production.productcategory p ;

select p.name, c.name
from production.product p
inner join production.productsubcategory sc
on sc.productsubcategoryid = p.productsubcategoryid
inner join production.productcategory c
on sc.productcategoryid = c.productcategoryid;

-- 2. Tabla vendedor
select * from humanresources.employee e;

select * from humanresources.employeedepartmenthistory e ;

select * from person.person
where businessentityid is not null;

select * from sales.salesperson;

select * from person.person;
select distinct persontype  from person.person;

-- 3. Tabla territorio
select * from sales.salesterritory;

-- 4. Tabla fact_ventas
select * from sales.salesorderdetail s ;
select * from sales.salesorderheader s2 ;

