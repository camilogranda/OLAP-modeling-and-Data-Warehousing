
create table dwh_adventureworks.dim_customers(
customer_id	integer
,customer_code	varchar(10)
,firstname	varchar(50)
,lastname	varchar(50)
,full_name	varchar(100)
,cell_phone_number	varchar(20)
,home_phone_number	varchar(20)
,work_phone_number	varchar(20)
,city	varchar(50)
,load_date timestamp
,update_date timestamp
,primary key (customer_id)
);

select * from dwh_adventureworks.dim_customers;

---------------------------------------------------
create table dwh_adventureworks.dim_products(
product_id	integer
,product_code	varchar(10)
,name	varchar(20)
,color	varchar(50)
,size	varchar(50)
,category	varchar(50)
,load_date timestamp
,update_date timestamp
,primary key (product_id)
);

select * from dwh_adventureworks.dim_products;

--------------------------------------------------------
create table dwh_adventureworks.dim_territories(
territory_id	integer
,territory_code	varchar(10)
,territory_name	varchar(50)
,continent	varchar(50)
,load_date timestamp
,update_date timestamp
,primary key (territory_id)
);

select * from dwh_adventureworks.dim_territories;

-----------------------------------------------------
create table dwh_adventureworks.dim_employees(
salesman_id	integer
,salesman_code	varchar(20)
,document	varchar(20)
,firstname	varchar(50)
,lastname	varchar(50)
,full_name	varchar(50)
,role	varchar(50)
,birth_date	date
,gender	varchar(10)
,active	boolean
,start_date	date
,end_date	date
,version integer
,load_date timestamp
,primary key (salesman_id)
);

select * from dwh_adventureworks.dim_employees;

---------------------------------------------------
create table dwh_adventureworks.fact_sales(
sale_id	integer not null
,detail_sale_code	varchar not null
,header_sale_code	varchar not null
,date_id	integer 
,territory_id	integer
,customer_id	integer
,salesman_id	integer
,product_id	integer
,quantity	integer
,value	decimal
,discount	decimal
,load_date timestamp
,update_date timestamp
,constraint fact_ventas_pkey primary key (sale_id)
);

select * from dwh_adventureworks.fact_sales;


create table dwh_adventureworks.dim_time
(
    date_id int not null,
    date date not null, 
    day smallint not null,
    month smallint not null,
    year smallint not null,
    week_day smallint not null,
    year_day smallint not null,
	primary key (date_id)
);

select * from dwh_adventureworks.dim_time;

