USE TECNO;

DROP PROCEDURE IF EXISTS insertar_fabricante;

DELIMITER //


CREATE PROCEDURE `insertar_fabricante`(
    IN p_nombre VARCHAR(100)
)
BEGIN
	INSERT INTO fabricante(nombre)
    VALUES (p_nombre);
END //

DELIMITER ;


Use tecno;
DROP PROCEDURE IF EXISTS insertar_producto;

DELIMITER //


CREATE PROCEDURE `insertar_producto`(
    IN nombre VARCHAR(100),
    IN precio_produc DOUBLE,
    IN cod_fabricante INT
)
BEGIN
	INSERT INTO producto(nombre, precio, codigo_fabricante)
    VALUES(nombre, precio_produc, cod_fabricante);
END //

DELIMITER ;
