--------------------------------------------------------
-- Archivo creado  - lunes-diciembre-09-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CLIENTE_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."CLIENTE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PAGOFIADO_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."PAGOFIADO_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_IDFAMILIAPRODUCTO
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."SEQUENCE_IDFAMILIAPRODUCTO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 112 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_IDORDENPEDIDO
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."SEQUENCE_IDORDENPEDIDO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_IDPAGOFIADO
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."SEQUENCE_IDPAGOFIADO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 124 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_IDPRODUCTO
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."SEQUENCE_IDPRODUCTO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 111 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_IDPROVEEDOR
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."SEQUENCE_IDPROVEEDOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 23 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQUENCE_IDRECEPCIONPEDIDO
--------------------------------------------------------

   CREATE SEQUENCE  "ADMINALMACEN"."SEQUENCE_IDRECEPCIONPEDIDO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOLETA
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."BOLETA" 
   (	"IDBOLETA" NUMBER(*,0), 
	"IDPRODUCTO" NUMBER(*,0), 
	"CANTIDAD" NUMBER(*,0), 
	"TOTAL" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."CLIENTE" 
   (	"IDCLIENTE" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(30 BYTE), 
	"CONTACTO" VARCHAR2(20 BYTE), 
	"IDBOLETA" NUMBER(*,0), 
	"DEUDA" NUMBER(*,0), 
	"RUT" VARCHAR2(35 BYTE), 
	"ESTADO" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FAMILIAPRODUCTO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."FAMILIAPRODUCTO" 
   (	"IDFAMILIA" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(39 BYTE), 
	"MEDIDA" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LOGIN
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."LOGIN" 
   (	"IDLOGIN" NUMBER(*,0), 
	"TIPO" VARCHAR2(15 BYTE), 
	"USUARIO" VARCHAR2(15 BYTE), 
	"CONTRASENA" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ORDENPEDIDO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."ORDENPEDIDO" 
   (	"IDORDENPEDIDO" NUMBER(*,0), 
	"IDPROVEEDOR" NUMBER(*,0), 
	"FECHA" DATE, 
	"IDPRODUCTOSPEDIDO" NUMBER(*,0), 
	"RECEPCION" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAGOFIADO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."PAGOFIADO" 
   (	"IDPAGOFIADO" NUMBER(*,0), 
	"IDCLIENTE" NUMBER(*,0), 
	"ABONO" NUMBER(*,0), 
	"FECHAABONO" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."PRODUCTO" 
   (	"IDPRODUCTO" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"PRECIOCOMPRA" NUMBER(*,0), 
	"PRECIOVENTA" NUMBER(*,0), 
	"IDFAMILIA" NUMBER(*,0), 
	"MARCA" VARCHAR2(30 BYTE), 
	"FECHAVENCIMIENTO" DATE, 
	"CODIGOBARRA" VARCHAR2(17 BYTE), 
	"DESCRIPCION" VARCHAR2(30 BYTE), 
	"STOCK" NUMBER(*,0), 
	"STOCKCRITICO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTOSPEDIDO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" 
   (	"IDPRODUCTOSPEDIDO" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"IDFAMILIA" NUMBER(*,0), 
	"FECHAVENCIMIENTO" DATE, 
	"IDTIPOPRODUCTO" NUMBER(*,0), 
	"MARCA" VARCHAR2(30 BYTE), 
	"CODIGOBARRA" VARCHAR2(17 BYTE), 
	"DESCRIPCION" VARCHAR2(30 BYTE), 
	"CANTIDAD" NUMBER(*,0), 
	"TOTALCOMPRA" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PROVEEDOR
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."PROVEEDOR" 
   (	"IDPROVEEDOR" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"DATOSCONTACTO" VARCHAR2(30 BYTE), 
	"RUBRO" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RECEPCIONPEDIDO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."RECEPCIONPEDIDO" 
   (	"IDRECEPCIONPEDIDO" NUMBER(*,0), 
	"IDORDENPEDIDO" NUMBER(*,0), 
	"IDUSUARIO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TIPOPRODUCTO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."TIPOPRODUCTO" 
   (	"IDTIPOPRODUCTO" NUMBER(*,0), 
	"NOMBRE" VARCHAR2(30 BYTE), 
	"DESCRIPCION" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."USUARIO" 
   (	"IDUSUARIO" NUMBER, 
	"NOMBRE" VARCHAR2(50 BYTE), 
	"CARGO" VARCHAR2(50 BYTE), 
	"CONTRASENA" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VENTA
--------------------------------------------------------

  CREATE TABLE "ADMINALMACEN"."VENTA" 
   (	"IDVENTA" NUMBER(*,0), 
	"IDBOLETA" NUMBER(*,0), 
	"FECHA" DATE, 
	"TOTAL" NUMBER(*,0), 
	"IDUSUARIO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

REM INSERTING into ADMINALMACEN.FAMILIAPRODUCTO
SET DEFINE OFF;
Insert into ADMINALMACEN.FAMILIAPRODUCTO (IDFAMILIA,NOMBRE,MEDIDA) values ('1','Aseo','UNIDADES');
Insert into ADMINALMACEN.FAMILIAPRODUCTO (IDFAMILIA,NOMBRE,MEDIDA) values ('2','Licores','UNIDADES');
Insert into ADMINALMACEN.FAMILIAPRODUCTO (IDFAMILIA,NOMBRE,MEDIDA) values ('3','Frutas','KILOS');
Insert into ADMINALMACEN.FAMILIAPRODUCTO (IDFAMILIA,NOMBRE,MEDIDA) values ('4','Verduras','UNIDADES');
Insert into ADMINALMACEN.FAMILIAPRODUCTO (IDFAMILIA,NOMBRE,MEDIDA) values ('5','Carnes','KILOS');
Insert into ADMINALMACEN.FAMILIAPRODUCTO (IDFAMILIA,NOMBRE,MEDIDA) values ('6','Bebidas','UNIDADES');

REM INSERTING into ADMINALMACEN.PRODUCTOSPEDIDO
SET DEFINE OFF;
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('1','Escobas','1',to_date('27/11/22','DD/MM/RR'),'4','SueloLimpio','proveedor','Escobas de gran calidad','50','50000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('2','Cloro','1',to_date('27/11/22','DD/MM/RR'),'11','Clorox','proveedor','Cloro limpia baños','50','20000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('3','Detergente','1',to_date('27/11/22','DD/MM/RR'),'11','Omo','proveedor','El Detergente Ideal','50','75000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('4','Pisco','2',to_date('27/11/22','DD/MM/RR'),'11','Mistral','proveedor','El mejor pisco para la piscola','20','40000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('5','Ron','2',to_date('27/11/22','DD/MM/RR'),'11','Barcelo','proveedor','Ron Añejo Botella Barcelo','20','50000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('6','Whiskey','2',to_date('27/11/22','DD/MM/RR'),'11','Jack Daniels','proveedor','Jennesse Whiskey','10','50000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('7','Naranja','3',to_date('27/11/22','DD/MM/RR'),'11','Vegita','proveedor','Puro jugo','50','25000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('8','Durazno','3',to_date('27/11/22','DD/MM/RR'),'11','Vegita','proveedor','El mejor Durazno de la zona','50','30000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('9','Platano','3',to_date('27/11/22','DD/MM/RR'),'11','Vegita','proveedor','Cambur o platano, es lo mismo','50','50000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('10','Lechuga','4',to_date('27/11/22','DD/MM/RR'),'11','Vega','proveedor','fresca para la ensalada','50','40000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('11','Apio','4',to_date('27/11/22','DD/MM/RR'),'11','Vega','proveedor','Apio fresco para la ensalada','50','50000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('12','Zapallo Italiano','4',to_date('27/11/22','DD/MM/RR'),'11','Vega','proveedor','Para el relleno o el budin','50','25000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('13','Corte Americano','5',to_date('27/11/22','DD/MM/RR'),'11','Carnes PF','proveedor','El mejor corte a la parrilla','15','37500');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('14','Filete Vacuno','5',to_date('27/11/22','DD/MM/RR'),'11','Carnes PF','proveedor','El que siempre cae bien','30','60000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('15','Pechuga de Pollo','5',to_date('27/11/22','DD/MM/RR'),'11','Carnes PF','proveedor','Pollo fresco ideal','30','60000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('16','Coca Cola','6',to_date('27/11/22','DD/MM/RR'),'11','The Company','proveedor','Destapa la Felicidad','30','30000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('17','Kem Piña','6',to_date('27/11/22','DD/MM/RR'),'11','Kem','proveedor','Tu sabor tropical','30','30000');
Insert into ADMINALMACEN.PRODUCTOSPEDIDO (IDPRODUCTOSPEDIDO,NOMBRE,IDFAMILIA,FECHAVENCIMIENTO,IDTIPOPRODUCTO,MARCA,CODIGOBARRA,DESCRIPCION,CANTIDAD,TOTALCOMPRA) values ('18','Fanta Orange','6',to_date('27/11/22','DD/MM/RR'),'11','The Company','proveedor','Hecho con jugo de fruta','30','30000');
REM INSERTING into ADMINALMACEN.PROVEEDOR
SET DEFINE OFF;
Insert into ADMINALMACEN.PROVEEDOR (IDPROVEEDOR,NOMBRE,DATOSCONTACTO,RUBRO) values ('1','Limpia Todo','+56999282956','Aseo');
Insert into ADMINALMACEN.PROVEEDOR (IDPROVEEDOR,NOMBRE,DATOSCONTACTO,RUBRO) values ('2','Dis. El Cielo','+56944343768','Licores');
Insert into ADMINALMACEN.PROVEEDOR (IDPROVEEDOR,NOMBRE,DATOSCONTACTO,RUBRO) values ('3','Vegita Mayorista','+56977767687','Frutas');
Insert into ADMINALMACEN.PROVEEDOR (IDPROVEEDOR,NOMBRE,DATOSCONTACTO,RUBRO) values ('4','Vega Central','+56975564567','Verduras');
Insert into ADMINALMACEN.PROVEEDOR (IDPROVEEDOR,NOMBRE,DATOSCONTACTO,RUBRO) values ('5','ProCarne','+56985647365','Carnes');
Insert into ADMINALMACEN.PROVEEDOR (IDPROVEEDOR,NOMBRE,DATOSCONTACTO,RUBRO) values ('6','CCU','+56985674321','Bebidas');

REM INSERTING into ADMINALMACEN.TIPOPRODUCTO
SET DEFINE OFF;
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('1','-','Integral 1 kilo');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('2','-','normal 1 kilo');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('3','-','tipo 3 500 gr');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('4','-','celdas finas');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('5','-','Retornable 2 litros');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('6','-','panaderia 1 kilo');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('7','-','pechuga 1 kilo');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('8','-','Bolsa 500 gr');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('9','-','Roja 1 kilo');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('10','-','bolsa de 400 gr');
Insert into ADMINALMACEN.TIPOPRODUCTO (IDTIPOPRODUCTO,NOMBRE,DESCRIPCION) values ('11','-','No Especifica');
REM INSERTING into ADMINALMACEN.USUARIO
SET DEFINE OFF;
Insert into ADMINALMACEN.USUARIO (IDUSUARIO,NOMBRE,CARGO,CONTRASENA) values ('1','Fernando G','Empleado','user');
Insert into ADMINALMACEN.USUARIO (IDUSUARIO,NOMBRE,CARGO,CONTRASENA) values ('2','Sra. Juanita','Admin','admin');

--------------------------------------------------------
--  DDL for Index SYS_C007062
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMINALMACEN"."SYS_C007062" ON "ADMINALMACEN"."USUARIO" ("IDUSUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_IDFAMILIAPRODUCTO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMINALMACEN"."TRIGGER_IDFAMILIAPRODUCTO" 
BEFORE INSERT ON FAMILIAPRODUCTO
FOR EACH ROW
   WHEN (new.IDFAMILIA IS NULL) BEGIN
  :new.IDFAMILIA := sequence_idfamiliaproducto.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINALMACEN"."TRIGGER_IDFAMILIAPRODUCTO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_IDPAGOFIADO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMINALMACEN"."TRIGGER_IDPAGOFIADO" 
BEFORE INSERT ON pagofiado
FOR EACH ROW
   WHEN (new.IDPAGOFIADO IS NULL) BEGIN
  :new.IDPAGOFIADO := sequence_idpagofiado.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINALMACEN"."TRIGGER_IDPAGOFIADO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_IDPRODUCTO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMINALMACEN"."TRIGGER_IDPRODUCTO" 
BEFORE INSERT ON PRODUCTO
FOR EACH ROW
   WHEN (new.IDPRODUCTO IS NULL) BEGIN
  :new.IDPRODUCTO := sequence_idproducto.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINALMACEN"."TRIGGER_IDPRODUCTO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_IDPROVEEDOR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMINALMACEN"."TRIGGER_IDPROVEEDOR" 
BEFORE INSERT ON proveedor
FOR EACH ROW
   WHEN (new.idproveedor IS NULL) BEGIN
  :new.idproveedor := sequence_idproveedor.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINALMACEN"."TRIGGER_IDPROVEEDOR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGGER_IDRECEPCIONPEDIDO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ADMINALMACEN"."TRIGGER_IDRECEPCIONPEDIDO" 
BEFORE INSERT ON RECEPCIONPEDIDO
FOR EACH ROW
   WHEN (new.IDRECEPCIONPEDIDO IS NULL) BEGIN
  :new.IDRECEPCIONPEDIDO := sequence_IDRECEPCIONPEDIDO.NEXTVAL;
END;
/
ALTER TRIGGER "ADMINALMACEN"."TRIGGER_IDRECEPCIONPEDIDO" ENABLE;

--------------------------------------------------------
--  DDL for Function FN_GENERAR_CODIGO
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "ADMINALMACEN"."FN_GENERAR_CODIGO" (idproveedor NUMBER,idfamilia NUMBER,fechavencimiento DATE,tipo VARCHAR2) RETURN VARCHAR2 IS
v_idproveedor proveedor.idproveedor%TYPE:=idproveedor;
v_idfamilia familiaproducto.idfamilia%TYPE:=idfamilia;
v_vencimiento DATE:=fechavencimiento;
v_tipo tipoproducto.idtipoproducto%TYPE:=tipo;
v_codigo VARCHAR2(20):='';
v_sector1 VARCHAR2(20):='';
v_sector2 VARCHAR2(20):='';
v_sector3 VARCHAR2(20):='';
v_sector4 VARCHAR2(20):='';
BEGIN
SELECT LPAD(idproveedor,3,0) INTO v_sector1 FROM proveedor WHERE idproveedor=v_idproveedor;
SELECT UPPER(SUBSTR(nombre,0,3)) INTO v_sector2 FROM familiaproducto WHERE idfamilia= v_idfamilia;
IF v_vencimiento = null THEN v_sector3:='00000000'; ELSE v_sector3:= TO_CHAR(v_vencimiento,'ddmmyyyy'); END IF;
SELECT LPAD(idtipoproducto,3,0) INTO v_sector4 FROM tipoproducto WHERE idtipoproducto = v_tipo;
v_codigo:= v_sector1||''||v_sector2||''||v_sector3||''||v_sector4;
RETURN v_codigo;
END fn_generar_codigo;

/
--------------------------------------------------------
--  Constraints for Table RECEPCIONPEDIDO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."RECEPCIONPEDIDO" MODIFY ("IDRECEPCIONPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."RECEPCIONPEDIDO" MODIFY ("IDORDENPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."RECEPCIONPEDIDO" MODIFY ("IDUSUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."CLIENTE" MODIFY ("IDCLIENTE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."CLIENTE" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."CLIENTE" MODIFY ("CONTACTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VENTA
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."VENTA" MODIFY ("IDVENTA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."VENTA" MODIFY ("IDBOLETA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."VENTA" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."VENTA" MODIFY ("TOTAL" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."VENTA" MODIFY ("IDUSUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAMILIAPRODUCTO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."FAMILIAPRODUCTO" MODIFY ("IDFAMILIA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."FAMILIAPRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."FAMILIAPRODUCTO" MODIFY ("MEDIDA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PROVEEDOR
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."PROVEEDOR" MODIFY ("IDPROVEEDOR" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PROVEEDOR" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PROVEEDOR" MODIFY ("DATOSCONTACTO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PROVEEDOR" MODIFY ("RUBRO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAGOFIADO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."PAGOFIADO" MODIFY ("IDPAGOFIADO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PAGOFIADO" MODIFY ("IDCLIENTE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PAGOFIADO" MODIFY ("ABONO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("IDPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("PRECIOCOMPRA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("PRECIOVENTA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("IDFAMILIA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("MARCA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("CODIGOBARRA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("STOCK" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTO" MODIFY ("STOCKCRITICO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDENPEDIDO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."ORDENPEDIDO" MODIFY ("IDORDENPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."ORDENPEDIDO" MODIFY ("IDPROVEEDOR" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."ORDENPEDIDO" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."ORDENPEDIDO" MODIFY ("IDPRODUCTOSPEDIDO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCTOSPEDIDO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("IDPRODUCTOSPEDIDO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("IDFAMILIA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("IDTIPOPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("MARCA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("CODIGOBARRA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."PRODUCTOSPEDIDO" MODIFY ("TOTALCOMPRA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOLETA
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."BOLETA" MODIFY ("IDBOLETA" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."BOLETA" MODIFY ("IDPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."BOLETA" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."BOLETA" MODIFY ("TOTAL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."USUARIO" ADD PRIMARY KEY ("IDUSUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGIN
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."LOGIN" MODIFY ("IDLOGIN" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."LOGIN" MODIFY ("TIPO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."LOGIN" MODIFY ("USUARIO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."LOGIN" MODIFY ("CONTRASENA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TIPOPRODUCTO
--------------------------------------------------------

  ALTER TABLE "ADMINALMACEN"."TIPOPRODUCTO" MODIFY ("IDTIPOPRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."TIPOPRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADMINALMACEN"."TIPOPRODUCTO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
