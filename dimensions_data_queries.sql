-- 1. Query dim_customer data
select c.customerid as customer_code
	   ,p.firstname as firstname
	   ,p.lastname as lastname
	   ,p.firstname || ' ' || p.lastname as full_name
	   ,case when p2.phonenumbertypeid = 1 then p2.phonenumber else null end as cell_phone_number
	   ,case when p2.phonenumbertypeid = 2 then p2.phonenumber else null end as home_phone_number
	   ,case when p2.phonenumbertypeid = 1 then p2.phonenumber else null end as work_phone_number
	   ,a.city as city
	   ,c.modifieddate as modified_date
from sales.customer c
left join person.person p
on c.customerid = p.businessentityid
left join person.personphone p2 
on p.businessentityid = p2.businessentityid
left join person.businessentity b 
on p2.businessentityid = b.businessentityid 
left join person.businessentityaddress b2 
on b.businessentityid = b2.businessentityid and b2.addresstypeid = 2
left join person.address a
on b2.addressid = a.addressid
;

------------------------------------------------------------------------
-- 2. Query dim_products data
select p.productid as product_code
	  ,p.name as product_name
	  ,p.color as color 
	  ,p.size as size
	  ,c.name as category
from production.product	p
left join production.productsubcategory p2
on p.productsubcategoryid = p2.productsubcategoryid
left join production.productcategory c
on p2.productcategoryid = c.productcategoryid;

--------------------------------------------------------------------------
-- 3. Query dim_territories
select t.territoryid as territory_id
	  ,t.name as territory_name
	  ,t.group as continent
from sales.salesterritory t;

-------------------------------------------------------------------------------
-- 4. Query dim_employees
select s.businessentityid as salesman_code
	  ,e.nationalidnumber as document
	  ,p.firstname as first_name
	  ,p.lastname as last_name
	  --,concat(p.firstname, ' ', p.lastname) as full_name
	  ,(p.firstname || ' ' || p.lastname) as full_name
	  ,e.jobtitle as role
	  ,e.birthdate as birth_date
	  ,e.gender as gender
	  ,e.currentflag as active
from sales.salesperson s
left join humanresources.employee e 
on s.businessentityid = e.businessentityid 
left join person.person p 
on s.businessentityid = p.businessentityid;

-----------------------------------------------------------------------------------
-- 5. Query fact table sales data
select s.salesorderid as order_id
	  ,s.salesorderdetailid as order_detail
	  ,s2.orderdate as order_date
	  ,s2.customerid as customer_code
	  ,s2.territoryid as territory_id
	  ,s2.salespersonid  as salesperson_id
	  ,s.productid  as product_id
	  ,s.orderqty as order_quantity
	  ,(s.unitprice * s.orderqty) as total_price
	  ,(s.unitpricediscount * s.orderqty) as discount
from sales.salesorderdetail s
left join sales.salesorderheader s2
	on (s.salesorderid = s2.salesorderid);

select * from dwh_adventureworks.dim_customers;
select * from dwh_adventureworks.dim_time;



