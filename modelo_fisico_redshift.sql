
create table dim_customers(
customer_id	integer
,customer_code	varchar(10)
,firstname	varchar(50)
,lastname	varchar(50)
,fullname	varchar(100)
,cell_phone_number	varchar(20)
,home_phone_number	varchar(20)
,work_phone_number	varchar(20)
,city	varchar(50)
,load_date timestamp
,update_date timestamp
,primary key (customer_id)
);

select * from dwh_adventureworks.dim_customers;


create table dim_products(
id_producto	integer
,codigo_producto	varchar(10)
,nombre	varchar(20)
,color	varchar(50)
,tamanio	varchar(50)
,categoria	varchar(50)
,fecha_carga timestamp
,fecha_actualizacion timestamp
,primary key (id_producto)
);

select * from dwh_adventureworks.dim_products;


create table dim_territories(
id_territorio	integer
,codigo_territorio	varchar(10)
,nombre	varchar(50)
,continente	varchar(50)
,fecha_carga timestamp
,fecha_actualizacion timestamp
,primary key (id_territorio)
);

select * from dwh_adventureworks.dim_territories;


create table dim_sellers(
id_vendedor	integer
,codigo_vendedor	varchar(20)
,identificacion	varchar(20)
,nombre	varchar(50)
,apellido	varchar(50)
,nombre_completo	varchar(50)
,rol	varchar(50)
,fecha_nacimiento	date
,genero	varchar(10)
,ind_activo	boolean
,fecha_inicio	date
,fecha_fin	date
,version integer
,fecha_carga timestamp
,primary key (id_vendedor)
);

select * from dwh_adventureworks.dim_sellers;


create table dwh_adventureworks.fact_sales(
id_venta	integer not null
,codigo_venta_detalle	varchar not null
,codigo_venta_encabezado	varchar not null
,id_fecha	integer 
,id_territorio	integer
,id_cliente	integer
,id_vendedor	integer
,id_producto	integer
,cantidad	integer
,valor	decimal
,descuento	decimal
,fecha_carga timestamp
,fecha_actualizacion timestamp
,constraint fact_ventas_pkey primary key (id_venta)
);

select * from dwh_adventureworks.fact_sales;


create table dim_time
(
    id_fecha int not null,
    fecha date not null, 
    dia smallint not null,
    mes smallint not null,
    anio smallint not null,
    dia_semana smallint not null,
    dia_anio smallint not null,
	primary key (id_fecha)
);

select * from dwh_adventureworks.dim_time;


