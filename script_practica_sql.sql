create schema keepcoding_practica;

create table keepcoding_practica.coches (
	matricula varchar(50) primary key,
	kms_totales int4 not null,
	fecha_compra date not null,
	id_modelo smallint not null,
	id_color smallint not null
);

create table keepcoding_practica.revisiones (
	id serial primary key,
	kms_revision int4 not null,
	fecha_revision date not null,
	importe_revision float4 not null,
	matricula_coche varchar(50) not null,
	id_moneda smallint not null	
);

create table keepcoding_practica.moneda (
	id serial primary key,
	nombre varchar(50) not null
);

create table keepcoding_practica.color (
	id serial primary key,
	nombre varchar(50)
);

create table keepcoding_practica.modelo (
	id serial primary key,
	nombre varchar(50) not null,
	id_marca smallint not null
);

create table keepcoding_practica.marca (
	id serial primary key,
	nombre varchar(50) not null,
	id_grupo smallint not null
);

create table keepcoding_practica.grupo (
	id serial primary key,
	nombre varchar not null
);

create table keepcoding_practica.poliza (
	id serial primary key,
	id_aseguradora smallint not null,
	fecha_alta date not null,
	matricula_poliza varchar(50) not null
);


create table keepcoding_practica.aseguradora (
	id serial primary key,
	nombre varchar(50) not null
);

alter table keepcoding_practica.marca add constraint pk_grupo foreign key (id_grupo) references keepcoding_practica.grupo(id);
alter table keepcoding_practica.poliza add constraint pk_aseguradora foreign key (id_aseguradora) references keepcoding_practica.aseguradora(id);
alter table keepcoding_practica.modelo add constraint pk_marca foreign key (id_marca) references  keepcoding_practica.marca(id);
alter table keepcoding_practica.coches add constraint pk_modelo foreign key (id_modelo) references keepcoding_practica.modelo(id);
alter table keepcoding_practica.poliza add constraint pk_matricula_poliza foreign key (matricula_poliza) references keepcoding_practica.coches(matricula);
alter table keepcoding_practica.coches add constraint pk_color foreign key (id_color) references keepcoding_practica.color(id);
alter table keepcoding_practica.revisiones add constraint pk_coches foreign key (matricula_coche) references keepcoding_practica.coches(matricula);
alter table keepcoding_practica.revisiones add constraint pk_moneda foreign key (id_moneda) references keepcoding_practica.moneda(id);

CREATE TABLE keepcoding_practica.vehiculos (
	matricula varchar(50) NULL,
	grupo varchar(50) NULL,
	marca varchar(50) NULL,
	modelo varchar(50) NULL,
	fecha_compra date NULL,
	color varchar(50) NULL,
	aseguradora varchar(50) NULL,
	n_poliza int4 NULL,
	fecha_alta_seguro date NULL,
	importe_revision float4 NULL,
	moneda varchar(50) NULL,
	kms_revision int4 NULL,
	fecha_revision date NULL,
	kms_totales int4 NULL
);
INSERT INTO keepcoding_practica.vehiculos (matricula,grupo,marca,modelo,fecha_compra,color,aseguradora,n_poliza,fecha_alta_seguro,importe_revision,moneda,kms_revision,fecha_revision,kms_totales) VALUES
	 ('7343FRT','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','2009-06-01','Rojo','Allianz',25786,'2009-06-01',1076032.5,'Peso Colombiano',29564,'2020-07-07',47644),
	 ('2438GSV','PSA Peugeot S.A.','Citroën','DS4','2010-04-17','Gris Plateado','Allianz',195443,'2010-04-17',734.7,'Dólar',12028,'2010-05-13',52349),
	 ('9666FZC','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','2008-03-03','Blanco','Allianz',79841,'2008-03-03',344330.4,'Peso Colombiano',19543,'2017-12-13',39533),
	 ('7221BJG','Hyundai Motor Group','Kia','Ceed','1999-09-30','Blanco','Allianz',112320,'1999-09-30',1162115.1,'Peso Colombiano',12066,'2000-05-18',70197),
	 ('6756GXW','PSA Peugeot S.A.','Peugeot','206','2011-07-19','Negro','Generali',159753,'2012-10-22',3579.6,'Peso Mexicano',94670,'2013-06-24',112881),
	 ('9314JHS','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','2017-10-10','Negro','Allianz',67577,'2017-10-10',14695.2,'Peso Mexicano',24441,'2019-09-04',41064),
	 ('7987FXL','Hyundai Motor Group','Kia','Rio','2009-01-23','Blanco','Generali',32844,'2009-01-23',730.0,'Euro',11140,'2021-12-04',24726),
	 ('4325KMF','PSA Peugeot S.A.','Citroën','DS4','2020-04-13','Blanco','Mapfre',12534,'2020-04-13',7912.8,'Peso Mexicano',20410,'2022-07-08',49476),
	 ('3883DSH','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','2007-02-27','Blanco','Mapfre',54632,'2007-02-27',570.0,'Euro',19245,'2014-05-16',35949),
	 ('3242GQG','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','2013-03-06','Rojo','Mapfre',183813,'2013-03-06',120.9,'Dólar',16209,'2014-02-10',77662),
	 ('4315JKL','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','2017-08-27','Gris Plateado','Mapfre',9482,'2017-08-27',15825.6,'Peso Mexicano',20263,'2017-11-02',46145),
	 ('5426HDG','Hyundai Motor Group','Kia','Ceed','2015-04-01','Negro','Generali',186297,'2016-08-24',2883767.0,'Peso Colombiano',34964,'2019-08-24',46759),
	 ('6231KKQ','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','2019-04-10','Rojo','Allianz',34218,'2019-04-10',632.4,'Dólar',13755,'2021-04-04',39563),
	 ('7457BFT','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','2000-11-24','Negro','Mapfre',35103,'2000-11-24',90.0,'Euro',16226,'2018-09-24',39949),
	 ('5205DFJ','Hyundai Motor Group','Kia','Ceed','2006-03-04','Gris Plateado','Allianz',41930,'2006-03-04',14883.6,'Peso Mexicano',23043,'2022-05-24',50972),
	 ('3212HJW','Hyundai Motor Group','Kia','Rio','2014-08-04','Gris Plateado','Axa',117277,'2015-12-19',170.0,'Euro',14526,'2023-04-14',28986),
	 ('3313GGW','PSA Peugeot S.A.','Citroën','DS4','2013-04-01','Rojo','Mapfre',85225,'2013-04-01',1884.0,'Peso Mexicano',17187,'2017-12-13',35823),
	 ('6642GZP','Hyundai Motor Group','Hyundai','Tucson','2010-04-21','Verde','Mapfre',151249,'2010-04-21',3228097.5,'Peso Colombiano',21563,'2011-01-06',97183),
	 ('3306GYM','Renault-Nissan-Mitsubishi Alliance','Nissan','Leaf','2011-12-19','Verde','Generali',174969,'2011-12-19',1463404.2,'Peso Colombiano',18060,'2012-04-17',76024),
	 ('5303DCG','PSA Peugeot S.A.','Citroën','DS4','2007-08-30','Gris Plateado','Allianz',79203,'2007-08-30',11492.4,'Peso Mexicano',14181,'2022-05-31',35530),
	 ('0827DBB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','2006-07-24','Gris Plateado','Generali',40647,'2006-07-24',325.5,'Dólar',24407,'2019-02-23',39061),
	 ('5047FJK','PSA Peugeot S.A.','Citroën','DS4','2009-10-26','Blanco','Mapfre',172625,'2009-10-26',5086.8,'Peso Mexicano',18053,'2010-02-22',90641),
	 ('4366GZX','Hyundai Motor Group','Hyundai','Tucson','2013-11-03','Verde','Axa',40977,'2013-11-03',306.9,'Dólar',21132,'2017-08-27',44510),
	 ('7561CND','Hyundai Motor Group','Hyundai','i30','2004-09-22','Blanco','Mapfre',170914,'2004-09-22',12622.8,'Peso Mexicano',13171,'2006-01-18',71901),
	 ('5954DWX','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','2007-10-25','Negro','Allianz',121919,'2008-08-21',440.0,'Euro',25110,'2016-05-30',39775),
	 ('9157JVM','PSA Peugeot S.A.','Citroën','Berlingo','2017-09-18','Blanco','Allianz',96770,'2017-09-18',390.6,'Dólar',21421,'2020-12-29',41539),
	 ('0366CKQ','PSA Peugeot S.A.','Peugeot','5008','2003-04-10','Gris Plateado','Axa',172546,'2003-04-10',13941.6,'Peso Mexicano',24801,'2003-04-28',118687),
	 ('2907GNT','Hyundai Motor Group','Hyundai','i30','2012-11-08','Negro','Mapfre',92532,'2012-11-08',753.3,'Dólar',25366,'2016-03-09',51508),
	 ('2428HYB','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','2014-12-04','Verde','Generali',181054,'2014-12-04',269.7,'Dólar',17526,'2014-12-09',87006),
	 ('6743DYG','Hyundai Motor Group','Kia','Rio','2007-06-25','Gris Plateado','Axa',116336,'2007-06-25',8101.2,'Peso Mexicano',22761,'2008-01-13',76387),
	 ('8706FTV','Hyundai Motor Group','Hyundai','Tucson','2008-05-16','Verde','Mapfre',91503,'2008-05-16',3658510.5,'Peso Colombiano',25843,'2011-12-07',53733),
	 ('1567JPK','Hyundai Motor Group','Kia','Ceed','2016-12-03','Gris Plateado','Generali',19347,'2016-12-03',301289.1,'Peso Colombiano',28259,'2017-05-12',54278),
	 ('8802GQX','Renault-Nissan-Mitsubishi Alliance','Dacia','Duster','2013-04-23','Blanco','Generali',167291,'2014-05-02',820.0,'Euro',22523,'2015-06-15',34941),
	 ('0922JVF','PSA Peugeot S.A.','Peugeot','5008','2017-07-06','Negro','Mapfre',104210,'2017-07-06',602578.2,'Peso Colombiano',25300,'2018-11-25',97321),
	 ('5022JZD','Hyundai Motor Group','Hyundai','i30','2016-03-07','Verde','Mapfre',173686,'2016-03-07',430413.0,'Peso Colombiano',11715,'2016-05-13',63426),
	 ('8177JPM','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','2016-11-27','Gris Plateado','Allianz',119373,'2016-11-27',1678610.8,'Peso Colombiano',19822,'2017-01-24',77082),
	 ('8627FRY','Hyundai Motor Group','Hyundai','Tucson','2008-04-02','Blanco','Mapfre',51353,'2008-04-02',120.9,'Dólar',16181,'2020-04-28',30083),
	 ('7938HXH','Hyundai Motor Group','Hyundai','Tucson','2015-10-24','Gris Plateado','Mapfre',163498,'2015-10-24',186.0,'Dólar',20157,'2016-09-08',53342),
	 ('3230KTX','Renault-Nissan-Mitsubishi Alliance','Nissan','Qashqai','2019-04-16','Negro','Generali',146739,'2019-04-16',4898.4,'Peso Mexicano',25879,'2019-05-13',69200),
	 ('7710HMZ','PSA Peugeot S.A.','Peugeot','206','2014-04-09','Verde','Allianz',190446,'2015-09-03',3391.2,'Peso Mexicano',22300,'2022-08-28',45773),
	 ('4221JXR','Hyundai Motor Group','Kia','Rio','2018-03-19','Azul','Generali',174298,'2018-03-19',50.0,'Euro',18380,'2018-06-08',50166),
	 ('3272JJJ','Hyundai Motor Group','Kia','Rio','2018-06-03','Verde','Mapfre',89739,'2018-06-03',210.0,'Euro',11209,'2022-10-04',27503),
	 ('2633GJF','PSA Peugeot S.A.','Peugeot','206','2011-02-19','Rojo','Mapfre',124027,'2012-04-19',3055932.2,'Peso Colombiano',25614,'2023-07-13',41129),
	 ('5648JTZ','Hyundai Motor Group','Kia','Ceed','2016-04-14','Verde','Allianz',189152,'2016-04-14',16390.8,'Peso Mexicano',22988,'2017-11-12',61124),
	 ('1621CSY','PSA Peugeot S.A.','Citroën','DS4','2004-10-12','Rojo','Mapfre',89394,'2004-10-12',4898.4,'Peso Mexicano',29407,'2022-08-18',42218),
	 ('9428BCQ','Hyundai Motor Group','Kia','Ceed','2002-11-12','Verde','Allianz',96367,'2002-11-12',16956.0,'Peso Mexicano',14720,'2022-05-03',33451),
	 ('9412DTS','PSA Peugeot S.A.','Citroën','DS4','2007-01-31','Negro','Generali',82043,'2007-01-31',46.5,'Dólar',24707,'2015-05-30',54013),
	 ('9729KXJ','Renault-Nissan-Mitsubishi Alliance','Renault','Megane','2020-09-06','Verde','Allianz',184039,'2020-09-06',110.0,'Euro',14348,'2020-10-11',76972),
	 ('2890DSR','Hyundai Motor Group','Kia','Ceed','2006-07-13','Gris Plateado','Allianz',16848,'2006-07-13',213.9,'Dólar',13864,'2014-07-23',28530),
	 ('2066BYF','PSA Peugeot S.A.','Citroën','Berlingo','1999-03-14','Gris Plateado','Axa',105112,'1999-03-14',1162115.1,'Peso Colombiano',14097,'1999-09-04',57697),
	 ('7466DMG','Renault-Nissan-Mitsubishi Alliance','Renault','Clio','2007-03-31','Gris Plateado','Allianz',145462,'2007-03-31',200.0,'Euro',19536,'2007-06-16',85722),
	 ('0390DRK','PSA Peugeot S.A.','Citroën','DS4','2007-03-27','Verde','Axa',121129,'2008-05-01',6594.0,'Peso Mexicano',22339,'2015-12-01',38651),
	 ('6850KZW','Hyundai Motor Group','Kia','Ceed','2020-05-11','Blanco','Mapfre',66942,'2020-05-11',10173.6,'Peso Mexicano',15206,'2023-03-05',25227),
	 ('3960JYB','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','2017-09-15','Negro','Mapfre',8307,'2017-09-15',158.1,'Dólar',17211,'2018-08-22',30810),
	 ('9209KGR','PSA Peugeot S.A.','Peugeot','5008','2020-03-02','Rojo','Generali',174043,'2020-03-02',2637.6,'Peso Mexicano',12808,'2021-08-15',58260),
	 ('1323DQL','Renault-Nissan-Mitsubishi Alliance','Renault','Kangoo','2006-01-22','Negro','Mapfre',172309,'2006-01-22',3012891.0,'Peso Colombiano',26924,'2006-02-11',107492),
	 ('2684FZV','PSA Peugeot S.A.','Citroën','DS4','2008-05-10','Negro','Mapfre',50387,'2008-05-10',455.7,'Dólar',17713,'2008-06-07',36859);
	 
	select * from keepcoding_practica.vehiculos;

insert into keepcoding_practica.moneda(nombre) select moneda from keepcoding_practica.vehiculos group by moneda;
insert into keepcoding_practica.color(nombre) select color from keepcoding_practica.vehiculos group by color;
insert into keepcoding_practica.aseguradora(nombre) select aseguradora from keepcoding_practica.vehiculos group by aseguradora;
insert into keepcoding_practica.grupo(nombre) select grupo from keepcoding_practica.vehiculos group by grupo;
insert into keepcoding_practica.marca(nombre, id_grupo) select v.marca, g.id from keepcoding_practica.vehiculos v inner join keepcoding_practica.grupo g on g.nombre = v.grupo group by v.marca, g.id; 
insert into keepcoding_practica.modelo(nombre, id_marca) select v.modelo, m.id from keepcoding_practica.vehiculos v inner join keepcoding_practica.marca m on m.nombre = v.marca group by v.modelo, m.id order by m.id;
insert into keepcoding_practica.coches(matricula, id_modelo, id_color, kms_totales, fecha_compra) select v.matricula, m.id, c.id, v.kms_totales, v.fecha_compra from keepcoding_practica.vehiculos v inner join keepcoding_practica.modelo m on m.nombre = v.modelo inner join keepcoding_practica.color c on c.nombre = v.color;
insert into keepcoding_practica.revisiones(kms_revision, fecha_revision, importe_revision, matricula_coche, id_moneda) select v.importe_revision, v.fecha_revision, v.importe_revision, v.matricula, m.id from keepcoding_practica.vehiculos v inner join keepcoding_practica.coches r on r.matricula = v.matricula inner join keepcoding_practica.moneda m on v.moneda = m.nombre;
insert into keepcoding_practica.poliza(id_aseguradora, fecha_alta, matricula_poliza) select a.id, v.fecha_alta_seguro, v.matricula from keepcoding_practica.vehiculos v inner join keepcoding_practica.coches p on p.matricula = v.matricula inner join keepcoding_practica.aseguradora a on a.nombre = v.aseguradora;

select c.matricula, c.fecha_compra, c.kms_totales, cc.nombre as color, mc.nombre as modelo, mc2.nombre as marca, g.nombre as grupo, ca.nombre as aseguradora from keepcoding_practica.coches c inner join keepcoding_practica.modelo mc on c.id_modelo = mc.id
	inner join keepcoding_practica.marca mc2 on mc2.id = mc.id_marca
	inner join keepcoding_practica.grupo g on g.id = mc2.id_grupo
	inner join keepcoding_practica.color cc on cc.id = c.id_color
	inner join keepcoding_practica.poliza p on p.matricula_poliza = c.matricula
	inner join keepcoding_practica.aseguradora ca on p.id_aseguradora = ca.id;