CREATE DATABASE IF NOT EXISTS c23210inmobiliaria;
USE c23210inmobiliaria;

CREATE TABLE IF NOT EXISTS duenios(
    dni VARCHAR(10) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    telefono VARCHAR(25) DEFAULT NULL,
    PRIMARY KEY(dni)
);

CREATE TABLE IF NOT EXISTS inmuebles(
    codigo INT(11) NOT NULL,
    direccion VARCHAR(80) NOT NULL,
    tipo VARCHAR(10) DEFAULT NULL,
    dni_duenio VARCHAR(10) NOT NULL,
    PRIMARY KEY(codigo),
    FOREIGN KEY(dni_duenio) REFERENCES duenios(dni)
);

CREATE TABLE IF NOT EXISTS inquilinos(
    dni VARCHAR(10) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    garantia VARCHAR(15) DEFAULT NULL,
    codigo_inm INT(11) NOT NULL,
    PRIMARY KEY(dni),
    FOREIGN KEY(codigo_inm) REFERENCES inmuebles(codigo)
);

INSERT INTO duenios VALUES 
(48444985,'Asdrúbal','Gomez',11564121);

INSERT INTO duenios VALUES 
(38457985,'Ariel','Gutierrez',11654121),
(1457841,'Jorge','Esposito',1137842164),
(25874121,'Lucia','Nanni',1168542194),
(10587954,'Marta','Castro',1147845124),
(32586425,'Carlos','Baldo',1134587415);

INSERT INTO inmuebles VALUES 
(123, 'Av.Acoyte 1242', "Loft",38457985),
(245, 'Av.Corrientes 1423', "Casa",1457841),
(221, 'Av.Monroe 123', "PH",38457985),
(575, 'Boyaca 4754', "Loft",25874121),
(645, 'Av.Chiclana 53', "Casa",25874121),
(478, 'Galicia 4325', "Departamento",10587954),
(542, 'Av.Scalabrini Ortiz 4223', "Departamento",32586425),
(457, 'Av.Gaona 2141', "PH",1457841);

INSERT INTO inquilinos VALUES 
(245489452, "Juan", "Gómez", "Dpto familiar", 123),
(321456547, "Mónica", "López", "Seguro caución", 457),
(145874598, "Roberto", "Gallo", "Casa esposa", 245),
(254786521, "Julia", "Antuñez", "Seguro caución", 542),
(256353212, "Sergio", "Falvera", "Dpto familiar", 221),
(357845213, "Lucas", "Astudillo", "Dpto familiar", 478); 
