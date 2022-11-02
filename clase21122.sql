﻿CREATE DATABASE PRUEBA;
DROP DATABASE PRUEBA;
/*Commands completed successfully.

Completion time: 2022-10-31T09:27:41.4389607-06:00*/

--CREACION DE BD CON CONFIGURACI�N
CREATE DATABASE FBD2022
	ON PRIMARY
		(NAME='FBD2022',FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FBD2022.MDF',SIZE=200MB,MAXSIZE=500MB,FILEGROWTH=25%)
	LOG ON
		(NAME='FBD2022_LOG',FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FBD2022_LOG.LDF',SIZE=100MB,MAXSIZE=250MB,FILEGROWTH=25%)

USE FBD2022;
--CREACI�N DE ESQUEMA
CREATE SCHEMA RRHH;
CREATE SCHEMA FACULTAD;

--CREAR TABLAS Y CONSTRAINTS

CREATE TABLE RRHH.PERSONA
(
	CIF INT PRIMARY KEY, 
	NOMBRE VARCHAR (100) NOT NULL,
	TELEFONO INT,
	DIRECCION VARCHAR (150),
	FECHA_INGRESO DATETIME NOT NULL,
	EDAD INT -- CHECK (EDAD>17)
	--CONSTRAINT DF_DEFAULT DEFAULT 'MANAGUA' FOR DIRECCION,
	--CONSTRAINT DF_FECHAINGRESO DEFAULT (GETDATE()) FOR FECHA_INGRESO,
	--CONSTRAINT CK_EDAD CHECK(EDAD>17)

)

ALTER TABLE [RRHH].[PERSONA]
--DROP CONSTRAINT [PK__PERSONA__C1F8DC5F962F496D]
--ADD CONSTRAINT PK_CIF PRIMARY KEY (CIF)
--ADD CONSTRAINT DF_DIRECCION DEFAULT 'MANAGUA' FOR DIRECCION
--ADD CONSTRAINT DF_FECHAINGRESO DEFAULT (GETDATE()) FOR FECHA_INGRESO
--ADD CONSTRAINT CK_EDAD CHECK(EDAD>17)

CREATE TABLE RRHH.ESTUDIANTE(

CIF INT,
PADRE VARCHAR (100) DEFAULT 'N/A',
MADRE VARCHAR (100) DEFAULT ('N/A'),
SEGURO INT,
CONSTRAINT PK_CIF_ESTUDIANTE PRIMARY KEY (CIF),
CONSTRAINT FK_CIF_PERSONA_ESTUDIANTE FOREIGN KEY (CIF) REFERENCES [RRHH].[PERSONA] 
)