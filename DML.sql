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


-- 1
SELECT nombre from producto;

-- 2
SELECT nombre, precio from producto;

-- 3
select * from producto;

-- 4
SELECT 
	nombre as producto,
	precio as precio_usd,
    ROUND(precio * 0.93, 2) as precio_eur
from producto;

-- 5
SELECT	
	nombre as nombredeproducto,
    ROUND(precio * 0.93, 2) as euros,
    precio as dolares
from producto;

-- 6
SELECT
	UPPER(nombre) as nombre,
    precio as dolares,
    round(precio * 0.93, 2) as euros
from producto;

-- 7
SELECT 
	LOWER(nombre) as nombre,
    precio as dolares,
    round(precio * 0.93, 2) as euros
from producto;

-- 8
SELECT 
nombre,
 CONCAT(
 UPPER (left(nombre, 2)),
 LOWER(SUBSTRING(nombre, 3))
 ) as nombre
  from fabricante;

-- 9
SELECT
	nombre,
    round(precio) as dolares,
    round(precio * 0.93) as euros
from producto;

-- 10
SELECT 
	nombre,
	TRUNCATE(precio, 0) as dolares,
    TRUNCATE(precio * 0.93, 0) as euros
from producto;

-- 11 y 12
SELECT codigo 
FROM fabricante 
WHERE codigo in(
	SELECT codigo_fabricante
    FROM producto
);

-- 13 
SELECT nombre
FROM fabricante 
ORDER BY nombre asc;

-- 14
SELECT nombre
from producto
order by nombre asc, precio desc;

-- 15
SELECT * FROM fabricante
LIMIT 5;

-- 16
SELECT * FROM fabricante
LIMIT 6 offset 3;

-- 17
select * 
FROM fabricante
LIMIT 2 offset 3;

-- 18
select nombre, precio
from producto
order by precio ASC
limit 1;

-- 19
select nombre, precio
from producto
order by precio desc
limit 1;

-- 20
select nombre
from producto
where codigo_fabricante = 2;

-- 21
select nombre
from producto
where ROUND(precio * 0.93, 2) <= 120;

-- 22
select nombre
from producto
where ROUND(precio * 0.93,2) >= 400;

-- 23
select nombre
from producto
where NOT ROUND(precio * 0.93,2) >= 400;

-- 24
select nombre
from producto
where ROUND(precio * 0.93, 2) >= 80 AND ROUND(precio * 0.93, 2) <= 300;

-- 25
select nombre
from producto
where ROUND(precio * 0.93, 2) BETWEEN 60 AND 200;

-- 26
SELECT 
	nombre, 
    precio AS precio_usd, 
    ROUND(precio * 0.93, 2) AS precio_eur
FROM producto
WHERE codigo_fabricante = 6 AND ROUND(precio * 0.93, 2) >= 200;


-- 27
SELECT nombre as Nombre_producto
FROM producto
WHERE codigo_fabricante = 1 
OR codigo_fabricante = 3 
OR codigo_fabricante = 5;

-- 28
SELECT nombre as nombre_producto
FROM producto
WHERE codigo_fabricante IN (1, 3, 5);

-- 29
SELECT	
	nombre as nombredeproducto,
    precio as dolares,
    ROUND(precio * 0.93, 2) as euros,
    ROUND(precio * 100, 2) as centimos
from producto;

-- 30
SELECT nombre from fabricante
WHERE nombre LIKE 'S%';

-- 31
SELECT nombre from fabricante
WHERE nombre like '%e';
 
 -- 32
SELECT nombre from fabricante
WHERE nombre like '%w%'; 

-- 33
SELECT nombre
FROM fabricante
WHERE LENGTH(nombre) = 4;

-- 34
SELECT nombre
FROM producto
WHERE nombre like '%Portátil%';

-- 35
SELECT nombre
FROM producto
WHERE nombre like '%Monitor%' and ROUND(precio * 0.93, 2) <= 215;

-- 36
SELECT nombre, ROUND(precio * 0.93, 2) as euros
from producto 
where ROUND(precio * 0.93, 2) >= 180
order by precio desc, nombre asc;

-- 1.1.4

-- 1
SELECT p.nombre as producto, p.precio, f.nombre as fabricante
	from producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo;

-- 2
SELECT p.nombre as producto, p.precio, f.nombre as fabricante
	from producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo
order by f.nombre asc;

-- 3
select p.codigo as codigo_producto, p.nombre as producto, f.codigo as codigo_fabricante, f.nombre as fabricante
	from producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo;

-- 4 
select p.nombre as producto, p.precio, f.nombre as fabricante
	from producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo
order by p.precio asc
limit 1;

-- 5
SELECT 
    p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM
    producto AS p
        JOIN
    fabricante AS f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6 
SELECT p.nombre
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE TRIM(f.nombre) = 'Lenovo';

-- 7
SELECT p.nombre as producto
FROM producto as p
JOIN fabricante as f on p.codigo_fabricante = f.codigo 
where TRIM(f.nombre) = 'Crucial' and ROUND(precio * 0.93, 2) >= 200;

-- 8
SELECT p.nombre as producto
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE TRIM(f.nombre) = 'Asus' or trim(f.nombre) = 'Hewlett-Packard' or trim(f.nombre) = 'Seagate';

-- 9
SELECT p.nombre as producto
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
where f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10
SELECT p.nombre as producto, p.precio 
from producto as p
JOIN fabricante as f ON p.codigo_fabricante = f.codigo
where f.nombre like '%e';

-- 11
SELECT p.nombre as producto, p.precio 
from producto as p
JOIN fabricante as f ON p.codigo_fabricante = f.codigo
where f.nombre like '%w%';

-- 12
SELECT p.nombre as producto, p.precio, f.nombre
from producto as p
JOIN fabricante as f ON p.codigo_fabricante = f.codigo
where ROUND(precio * 0.93, 2) >= 180
order by p.precio desc , nombre asc; 

-- 13
SELECT f.codigo, f.nombre as producto
from producto as p
JOIN fabricante as f ON p.codigo_fabricante = f.codigo
GROUP BY f.codigo, f.nombre;



-- 1.1.5

-- 1
SELECT f.nombre as fabricante, p.nombre as producto
from fabricante as f
LEFT JOIN producto as p ON p.codigo_fabricante = f.codigo;

-- 2
SELECT f.nombre as fabricate
from fabricante as f
LEFT JOIN producto as p ON p.codigo_fabricante = f.codigo
where p.codigo is NULL;

-- 3
SELECT *
FROM producto AS p
LEFT JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.codigo IS NULL;



-- 1.1.6

-- 1
SELECT COUNT(*) AS total_productos
FROM producto;

-- 2
SELECT COUNT(*) AS total_fabricantes
FROM fabricante;

-- 3
SELECT COUNT(DISTINCT codigo_fabricante) AS fabricantes_diferentes
FROM producto;

-- 4
SELECT AVG(precio) AS media_precio
FROM producto;

-- 5
SELECT MIN(precio) AS precio_mas_barato
FROM producto;

-- 6
SELECT max(precio) AS precio_mas_caro
FROM producto;

-- 7
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

-- 8
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT max(precio) FROM producto);

-- 9 
SELECT SUM(precio) as suma_precios
FROM producto;

-- 10 
SELECT COUNT(*) AS cantidad_productos
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 11
SELECT avg(p.precio) AS media_precio_asus
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 12
SELECT MIN(p.precio) AS precio_minimo
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';


-- 13 
SELECT MAX(p.precio) AS precio_minimo
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 14
SELECT sum(p.precio) AS precio_minimo
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus';

-- 15 (IMPORTANTE)
SELECT MAX(p.precio) AS precio_maximo, MIN(p.precio) AS precio_minimo, AVG(p.precio) AS precio_medio, COUNT(*) AS total_productos
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Crucial';

-- 16
SELECT f.nombre AS fabricante, COUNT(p.codigo_fabricante) AS total_productos
FROM fabricante AS f
LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY total_productos DESC;


-- 17 
SELECT f.nombre AS fabricante, 
	MAX(p.precio) AS precio_maximo, 
    MIN(p.precio) AS precio_minimo, 
    AVG(p.precio) AS precio_medio
FROM fabricante AS f
LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;


-- 18
SELECT 
  p.codigo_fabricante,
  MAX(p.precio) AS precio_maximo,
  MIN(p.precio) AS precio_minimo,
  AVG(p.precio) AS precio_medio,
  COUNT(*) AS total_productos
FROM producto AS p
GROUP BY p.codigo_fabricante
HAVING AVG(p.precio)* 0.93  > 200;

-- 19
SELECT 
  p.codigo_fabricante,
  MAX(p.precio) AS precio_maximo,
  MIN(p.precio) AS precio_minimo,
  AVG(p.precio) AS precio_medio,
  COUNT(*) AS total_productos
FROM producto AS p
GROUP BY p.codigo_fabricante
HAVING AVG(p.precio )* 0.93 > 200;

-- 20
SELECT COUNT(*) AS cantidad_productos
FROM producto
WHERE (precio * 0.93) >= 180;

-- 21 
SELECT f.nombre AS fabricante, COUNT(*) AS cantidad_productos
FROM producto AS p
JOIN fabricante AS f ON p.codigo_fabricante = f.codigo
WHERE p.precio * 0.93 >= 180
GROUP BY f.codigo, f.nombre;

-- 22
SELECT p.codigo_fabricante AS fabricante_id, 
       p.precio AS precio
FROM producto AS p
GROUP BY p.codigo_fabricante;

-- 23
SELECT f.nombre AS fabricante,
       p.precio AS precio_medio_euros
FROM fabricante AS f
LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- 24 
SELECT f.nombre AS fabricante
FROM fabricante AS f
JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio * 0.93) >= 150;

-- 25
SELECT f.nombre AS fabricante
FROM fabricante AS f
JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) >= 2;

-- 26 
SELECT f.nombre AS nombre, COUNT(p.codigo) AS total
FROM fabricante AS f
JOIN producto AS p ON f.codigo = p.codigo_fabricante
WHERE ROUND(p.precio * 0.93, 2) >= 220
GROUP BY f.nombre;

-- 27
SELECT f.nombre AS nombre,
       COUNT(CASE WHEN ROUND(p.precio * 0.93, 2) >= 220 THEN 1 END) AS total
FROM fabricante AS f
LEFT JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY f.nombre;

-- 28 
SELECT f.nombre, SUM(ROUND(p.precio * 0.93, 2)) AS suma_en_euros
FROM fabricante AS f
JOIN producto AS p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;

-- 29
SELECT p.nombre AS producto, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE (p.codigo_fabricante, p.precio) IN (
    SELECT codigo_fabricante, MAX(precio)
    FROM producto
    GROUP BY codigo_fabricante
)
ORDER BY f.nombre ASC;




















