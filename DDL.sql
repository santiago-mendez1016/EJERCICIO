drop database if exists TECNO;
create database TECNO;
USE TECNO;

create table fabricante(
	codigo INT (10) PRIMARY KEY auto_increment ,
    nombre VARCHAR(100)
);

create table producto(
	codigo INT(10) PRIMARY KEY auto_increment,
    nombre VARCHAR(100),
    precio DOUBLE,
    codigo_fabricante INT(10)
);

ALTER TABLE producto ADD constraint fk_nombre foreign key (codigo_fabricante) references  fabricante(codigo);

