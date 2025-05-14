CALL insertar_fabricante('Asus');
CALL insertar_fabricante('Lenovo');
CALL insertar_fabricante('Hewlett-Packard');
CALL insertar_fabricante('Samsung');
CALL insertar_fabricante('Seagate');
CALL insertar_fabricante('Crucial');
CALL insertar_fabricante('Gigabyte');
CALL insertar_fabricante('Huawei');
CALL insertar_fabricante('Xiaomi');

select * from fabricante;

CALL insertar_producto('Disco duro SATA3 1TB', 86.99, 5);
CALL insertar_producto('Memoria RAM DDR4 8GB', 120, 6);
CALL insertar_producto('Disco SSD 1 TB', 150.99, 4);
CALL insertar_producto('GeForce GTX 1050Ti', 185, 7);
CALL insertar_producto('GeForce GTX 1080 Xtreme', 755, 6);
CALL insertar_producto('Monitor 24 LED Full HD', 202, 1);
CALL insertar_producto('Monitor 27 LED Full HD', 245.99, 1);
CALL insertar_producto('Portátil Yoga 520', 559, 2);
CALL insertar_producto('Portátil Ideapd 320',444, 2);
CALL insertar_producto('Impresora HP Deskjet 3720', 59.99, 3);
CALL insertar_producto('Impresora HP Laserjet Pro M26nw', 180, 3);

select * from producto;





SELECT nombre from producto;


SELECT nombre, precio from producto;


SELECT 
	nombre as producto,
	precio as precio_usd,
    ROUND(precio * 0.93, 2) as precio_eur
from producto;


SELECT	
	nombre as nombredeproducto,
    precio as dolares,
    ROUND(precio * 0.93, 2) as euros
from producto;

SELECT
	UPPER(nombre) as nombre,
    precio as dolares,
    round(precio * 0.93, 2) as euros
from producto;

SELECT 
	LOWER(nombre) as nombre,
    precio as dolares,
    round(precio * 0.93, 2) as euros
from producto;


SELECT 
nombre,
 CONCAT(
 UPPER (left(nombre, 2)),
 LOWER(SUBSTRING(nombre, 3))
 ) as nombre
 
 from fabricante;
	
 SELECT
	nombre,
    round(precio) as dolares,
    round(precio * 0.93) as euros
from producto;


SELECT 
	nombre,
	TRUNCATE(precio, 0) as dolares,
    TRUNCATE(precio * 0.93, 0) as euros
from producto;


SELECT codigo 
FROM fabricante 
WHERE codigo in(
	SELECT codigo_fabricante
    FROM producto
);


SELECT nombre
FROM fabricante 
ORDER BY nombre asc;


SELECT nombre
from producto
order by nombre asc, precio desc;


SELECT * FROM fabricante
LIMIT 5;


SELECT * FROM fabricante
LIMIT 6 offset 3;




