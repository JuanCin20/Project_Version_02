-- ELIMINACIÓN DE LA BASE DE DATOS
-- DROP DATABASE IF EXISTS Project_Version_01;
-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE Project_Version_01;

USE Project_Version_01;

-- CREACIÓN DE LAS TABLAS
CREATE TABLE `Tabla_Tipo_Usuario` (
    `ID_Tipo_Usuario` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `Nombre_Tipo_Usuario` VARCHAR (50) NOT NULL,
    `Fecha_Registro_Tipo_Usuario` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Usuario` (
    `ID_Usuario` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `ID_Tipo_Usuario` INT (10) NOT NULL,
    `DNI_Usuario` INT (10) NOT NULL,
    `E_Mail_Usuario` VARCHAR (50) NOT NULL,
    `Password_Usuario` VARCHAR (150) NOT NULL,
    `Nombre_Usuario` VARCHAR (50) NOT NULL,
    `Apellido_Usuario` VARCHAR (50) NOT NULL,
    `Telefono_Usuario` INT (10) NOT NULL,
    `Direccion_Usuario` VARCHAR (50) NOT NULL,
    `Fecha_Nacimiento_Usuario` VARCHAR (10) NOT NULL,
    `Estado_Usuario` BIT DEFAULT 1 NOT NULL,
    `Fecha_Registro_Usuario` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Cliente` (
    `ID_Cliente` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `DNI_Cliente` INT (10) NOT NULL,
    `Nombre_Cliente` VARCHAR (50) NOT NULL,
    `Apellido_Cliente` VARCHAR (50) NOT NULL,
    `Direccion_Cliente` VARCHAR (50) NOT NULL,
    `Fecha_Nacimiento_Cliente` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Categoria_Producto` (
    `ID_Categoria_Producto` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `Nombre_Categoria_Producto` VARCHAR (50) NOT NULL,
    `Descripcion_Categoria_Producto` VARCHAR (260) NOT NULL,
    `Estado_Categoria_Producto` BIT DEFAULT 1 NOT NULL,
    `Fecha_Registro_Categoria_Producto` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Marca_Producto` (
    `ID_Marca_Producto` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `Nombre_Marca_Producto` VARCHAR(50) NOT NULL,
    `Telefono_Marca_Producto` INT (10) NOT NULL,
    `E_Mail_Marca_Producto` VARCHAR (50) NOT NULL,
    `Direccion_Marca_Producto` VARCHAR (50) NOT NULL,
    `Estado_Marca_Producto` BIT DEFAULT 1 NOT NULL,
    `Fecha_Registro_Marca_Producto` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Producto` (
    `ID_Producto` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `ID_Categoria_Producto` INT (10) NOT NULL,
    `ID_Marca_Producto` INT (10) NOT NULL,
    `Nombre_Producto` VARCHAR (150) NOT NULL,
    `Stock_Producto` INT (10) NOT NULL,
    `Precio_Producto` DECIMAL (10, 2) NOT NULL,
    `Descripcion_Producto` VARCHAR (260) NOT NULL,
    `Estado_Producto` BIT DEFAULT 1 NOT NULL,
    `Fecha_Registro_Producto` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Boleta_Venta` (
    `ID_Boleta_Venta` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `ID_Usuario` INT (10) NOT NULL,
    `ID_Cliente` INT (10) NOT NULL,
    `Total_Boleta_Venta` DECIMAL (10, 2) NOT NULL,
    `Fecha_Boleta_Venta` VARCHAR (10) NOT NULL
);

CREATE TABLE `Tabla_Detalle_Boleta_Venta` (
    `ID_Detalle_Boleta_Venta` INT (10) AUTO_INCREMENT PRIMARY KEY,
    `ID_Boleta_Venta` INT (10) NOT NULL,
    `ID_Producto` INT (10) NOT NULL,
    `Precio_Producto` DECIMAL (10, 2) NOT NULL,
    `Cantidad_Producto` INT (10) NOT NULL,
    `Subtotal_Detalle_Boleta_Venta` DECIMAL (10, 2) NOT NULL,
    `Descuento_Detalle_Boleta_Venta` DECIMAL (10, 2) NOT NULL,
    `IGV_Detalle_Boleta_Venta` DECIMAL (10, 2) NOT NULL,
    `Total_Detalle_Boleta_Venta` DECIMAL (10, 2) NOT NULL
);

-- CONSTRAINTS
ALTER TABLE
    `Tabla_Usuario`
ADD
    KEY `ID_Tipo_Usuario` (`ID_Tipo_Usuario`);

ALTER TABLE
    `Tabla_Usuario`
ADD
    CONSTRAINT `Tabla_Usuario_IBFK_1` FOREIGN KEY (`ID_Tipo_Usuario`) REFERENCES `Tabla_Tipo_Usuario` (`ID_Tipo_Usuario`);

COMMIT;

ALTER TABLE
    `Tabla_Producto`
ADD
    KEY `ID_Categoria_Producto` (`ID_Categoria_Producto`);

ALTER TABLE
    `Tabla_Producto`
ADD
    CONSTRAINT `Tabla_Producto_IBFK_1` FOREIGN KEY (`ID_Categoria_Producto`) REFERENCES `Tabla_Categoria_Producto` (`ID_Categoria_Producto`);

COMMIT;

ALTER TABLE
    `Tabla_Producto`
ADD
    KEY `ID_Marca_Producto` (`ID_Marca_Producto`);

ALTER TABLE
    `Tabla_Producto`
ADD
    CONSTRAINT `Tabla_Producto_IBFK_2` FOREIGN KEY (`ID_Marca_Producto`) REFERENCES `Tabla_Marca_Producto` (`ID_Marca_Producto`);

COMMIT;

ALTER TABLE
    `Tabla_Boleta_Venta`
ADD
    KEY `ID_Usuario` (`ID_Usuario`);

ALTER TABLE
    `Tabla_Boleta_Venta`
ADD
    CONSTRAINT `Tabla_Boleta_Venta_IBFK_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Tabla_Usuario` (`ID_Usuario`);

COMMIT;

ALTER TABLE
    `Tabla_Boleta_Venta`
ADD
    KEY `ID_Cliente` (`ID_Cliente`);

ALTER TABLE
    `Tabla_Boleta_Venta`
ADD
    CONSTRAINT `Tabla_Boleta_Venta_IBFK_2` FOREIGN KEY (`ID_Cliente`) REFERENCES `Tabla_Cliente` (`ID_Cliente`);

COMMIT;

ALTER TABLE
    `Tabla_Detalle_Boleta_Venta`
ADD
    KEY `ID_Boleta_Venta` (`ID_Boleta_Venta`);

ALTER TABLE
    `Tabla_Detalle_Boleta_Venta`
ADD
    CONSTRAINT `Tabla_Detalle_Boleta_Venta_IBFK_1` FOREIGN KEY (`ID_Boleta_Venta`) REFERENCES `Tabla_Boleta_Venta` (`ID_Boleta_Venta`);

COMMIT;

ALTER TABLE
    `Tabla_Detalle_Boleta_Venta`
ADD
    KEY `ID_Producto` (`ID_Producto`);

ALTER TABLE
    `Tabla_Detalle_Boleta_Venta`
ADD
    CONSTRAINT `Tabla_Detalle_Boleta_Venta_IBFK_2` FOREIGN KEY (`ID_Producto`) REFERENCES `Tabla_Producto` (`ID_Producto`);

COMMIT;

-- MOSTRAR TABLAS
SHOW TABLES;

SELECT
    *
FROM
    Tabla_Tipo_Usuario;

SELECT
    *
FROM
    Tabla_Usuario;

SELECT
    *
FROM
    Tabla_Cliente;

SELECT
    *
FROM
    Tabla_Categoria_Producto;

SELECT
    *
FROM
    Tabla_Marca_Producto;

SELECT
    *
FROM
    Tabla_Producto;

SELECT
    *
FROM
    Tabla_Boleta_Venta;

SELECT
    *
FROM
    Tabla_Detalle_Boleta_Venta;

-- QUERY
-- SELECT TCP.ID_Categoria_Producto, TCP.Nombre_Categoria_Producto, TCP.Descripcion_Categoria_Producto, TCP.Estado_Categoria_Producto, TCP.Fecha_Registro_Categoria_Producto, COUNT(TP.ID_Categoria_Producto) AS Product_Number FROM Tabla_Categoria_Producto TCP LEFT JOIN Tabla_Producto TP ON TCP.ID_Categoria_Producto = TP.ID_Categoria_Producto GROUP BY TCP.ID_Categoria_Producto, TCP.Nombre_Categoria_Producto, TCP.Descripcion_Categoria_Producto, TCP.Estado_Categoria_Producto, TCP.Fecha_Registro_Categoria_Producto, TP.ID_Categoria_Producto;
-- SELECT TMP.ID_Marca_Producto, TMP.Nombre_Marca_Producto, TMP.Telefono_Marca_Producto, TMP.E_Mail_Marca_Producto, TMP.Direccion_Marca_Producto, TMP.Estado_Marca_Producto, TMP.Fecha_Registro_Marca_Producto, COUNT(TP.ID_Marca_Producto) AS Product_Number FROM Tabla_Marca_Producto TMP LEFT JOIN Tabla_Producto TP ON TMP.ID_Marca_Producto = TP.ID_Marca_Producto GROUP BY TMP.ID_Marca_Producto, TMP.Nombre_Marca_Producto, TMP.Telefono_Marca_Producto, TMP.E_Mail_Marca_Producto, TMP.Direccion_Marca_Producto, TMP.Estado_Marca_Producto, TMP.Fecha_Registro_Marca_Producto, TP.ID_Marca_Producto;
-- SELECT TP.ID_Producto, TCP.Nombre_Categoria_Producto, TMP.Nombre_Marca_Producto, TP.Nombre_Producto, TP.Stock_Producto, TP.Precio_Producto, TP.Descripcion_Producto, TP.Estado_Producto, TP.Fecha_Registro_Producto FROM Tabla_Producto TP INNER JOIN Tabla_Categoria_Producto TCP ON TP.ID_Categoria_Producto = TCP.ID_Categoria_Producto INNER JOIN Tabla_Marca_Producto TMP ON TP.ID_Marca_Producto = TMP.ID_Marca_Producto GROUP BY TP.ID_Producto, TCP.Nombre_Categoria_Producto, TMP.Nombre_Marca_Producto, TP.Nombre_Producto, TP.Stock_Producto, TP.Precio_Producto, TP.Descripcion_Producto, TP.Estado_Producto, TP.Fecha_Registro_Producto;
-- SELECT TBV.ID_Boleta_Venta, TU.Nombre_Usuario, TU.Apellido_Usuario, TC.Nombre_Cliente, TC.Apellido_Cliente, TC.Direccion_Cliente, TC.DNI_Cliente, TBV.Fecha_Boleta_Venta, TDBV.Cantidad_Producto, TP.Nombre_Producto, TP.Precio_Producto, TDBV.Subtotal_Detalle_Boleta_Venta, TDBV.Descuento_Detalle_Boleta_Venta, TDBV.IGV_Detalle_Boleta_Venta, TDBV.Total_Detalle_Boleta_Venta FROM Tabla_Detalle_Boleta_Venta TDBV INNER JOIN Tabla_Boleta_Venta TBV ON TDBV.ID_Boleta_Venta = TBV.ID_Boleta_Venta INNER JOIN Tabla_Usuario TU ON TBV.ID_Usuario = TU.ID_Usuario INNER JOIN Tabla_Cliente TC on TBV.ID_Cliente = TC.ID_Cliente INNER JOIN Tabla_Producto TP ON TDBV.ID_Producto = TP.ID_Producto WHERE TBV.ID_Boleta_Venta = 1;
-- SELECT Fecha_Boleta_Venta, COUNT(Fecha_Boleta_Venta) AS Sell_Number FROM Tabla_Boleta_Venta WHERE Fecha_Boleta_Venta BETWEEN '21/03/2025' AND '21/03/2025' GROUP BY Fecha_Boleta_Venta;

SELECT TBV.ID_Boleta_Venta,
	   TU.Nombre_Usuario,
       TU.Apellido_Usuario,
       TC.Nombre_Cliente,
       TC.Apellido_Cliente,
       TC.Direccion_Cliente,
       TC.DNI_Cliente,
       TBV.Fecha_Boleta_Venta,
       TDBV.Cantidad_Producto,
       TP.Nombre_Producto,
       TP.Precio_Producto,
       TDBV.Subtotal_Detalle_Boleta_Venta,
       TDBV.Descuento_Detalle_Boleta_Venta,
       TDBV.IGV_Detalle_Boleta_Venta,
       TDBV.Total_Detalle_Boleta_Venta
FROM Tabla_Detalle_Boleta_Venta TDBV
INNER JOIN Tabla_Boleta_Venta TBV ON TDBV.ID_Boleta_Venta = TBV.ID_Boleta_Venta
INNER JOIN Tabla_Usuario TU ON TBV.ID_Usuario = TU.ID_Usuario
INNER JOIN Tabla_Cliente TC on TBV.ID_Cliente = TC.ID_Cliente
INNER JOIN Tabla_Producto TP ON TDBV.ID_Producto = TP.ID_Producto
WHERE TBV.ID_Boleta_Venta = 1;

-- LIMPIAR TABLAS
-- TRUNCATE TABLE Tabla_Tipo_Usuario;
-- TRUNCATE TABLE Tabla_Usuario;
-- TRUNCATE TABLE Tabla_Cliente;
-- TRUNCATE TABLE Tabla_Categoria_Producto;
-- TRUNCATE TABLE Tabla_Marca_Producto;
-- TRUNCATE TABLE Tabla_Producto;
-- TRUNCATE TABLE Tabla_Boleta_Venta;
-- TRUNCATE TABLE Tabla_Detalle_Boleta_Venta;
-- FILL PART
INSERT INTO
    `Tabla_Tipo_Usuario` (
        `Nombre_Tipo_Usuario`,
        `Fecha_Registro_Tipo_Usuario`
    )
VALUES
    ('Administrador', '02/02/2025');

INSERT INTO
    `Tabla_Tipo_Usuario` (
        `Nombre_Tipo_Usuario`,
        `Fecha_Registro_Tipo_Usuario`
    )
VALUES
    ('Empleado', '02/02/2025');

 /* INSERT INTO
    `Tabla_Tipo_Usuario` (
        `Nombre_Tipo_Usuario`,
        `Fecha_Registro_Tipo_Usuario`
    )
VALUES
    ('Cliente', '02/02/2025'); */

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '1',
        '73216070',
        'JuanCin080604@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Juan Carlos',
        'Aronés Peña',
        '959748008',
        'Calle los Milanos 161 Santa Anita',
        '08/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216072',
        'Lola@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Lola Hernández',
        'Maria Cervera',
        '965845403',
        'Chancay 894',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216073',
        'Rita@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Rita Coca',
        'Tatiana Salguero',
        '956745696',
        'Merida 216',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216074',
        'Vidal@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Vidal Pavon',
        'Josue Pedrosa',
        '956745667',
        'Santiago de Surco 33',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216075',
        'Roberto@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Roberto Carlos',
        'Karim Quero',
        '956974566',
        'Tomas Ramsey 904',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216076',
        'Maria@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Maria Encarnacion',
        'Almudena de La Rosa',
        '956754566',
        'Av República de Panamá 6355',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216077',
        'Fernando@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Fernando Nuñez',
        'de las Heras',
        '956781356',
        'Av José Pardo 1453',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216078',
        'Rebeca@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Rebeca Pinto',
        'Melania Moreira',
        '978945268',
        'Calle Los Libertadores 302',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216079',
        'Paul@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Paul Vidal',
        'Javier Huertas',
        '978940733',
        'Ferreyros 376',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216081',
        'Estrella@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Maria Estrella',
        'June Fraga',
        '978940734',
        'Victor A Belaunde 161',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216082',
        'Ezequiel@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Ezequiel Barcelo',
        'Antonio Cuesta',
        '978685704',
        'Av. Túpac Amaru 310',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216083',
        'Pilar@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Maria Pilar Lloret',
        'Carla Moyano',
        '956574566',
        'Ate Vitarte 856',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216084',
        'Pedro@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Pedro Javier',
        'Jamal Soria',
        '956758466',
        'Jesus Maria 784',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216085',
        'Irati@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Irati Santiago',
        'Mohammed Carrion',
        '956745566',
        'Avenida Javier Prado Este 984',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216086',
        'Castillo@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Bienvenido del Castillo',
        'Luis Enrique',
        '945634857',
        'Jirón Huiracocha 323',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216087',
        'Prado@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Maria Prado',
        'Angelica Bravo',
        '974606417',
        'Jirón Domingo Cueto 329',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216088',
        'Zafra@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Melchor Zafra',
        'Angel Carpio',
        '956745626',
        'Los Proceres Mzn1 Int. Lt 5',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216089',
        'Lillo@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Desamparados Lillo',
        'Zakaria Sempere',
        '989757823',
        'Azángaro 105',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216091',
        'David@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Juan David',
        'Youssef Capdevila',
        '995835639',
        '31th Street 195 Urbanizacion Corpac San Isidro',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216092',
        'Olga@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Maria Olga',
        'Mariona Padron',
        '996546534',
        'Frederic Remington 180',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216093',
        'Roldan@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Saturnino Roldan',
        'Samir Arnau',
        '952678958',
        'Calle Berlin 536',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216094',
        'Torrejon@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Virginia Torrejon',
        'Martina Valero',
        '977894073',
        'Av.Bolivar 598',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216095',
        'Morera@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Camilo Morera',
        'Asier Arranz',
        '976985704',
        'Av La Libertad 111',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Usuario` (
        `ID_Tipo_Usuario`,
        `DNI_Usuario`,
        `E_Mail_Usuario`,
        `Password_Usuario`,
        `Nombre_Usuario`,
        `Apellido_Usuario`,
        `Telefono_Usuario`,
        `Direccion_Usuario`,
        `Fecha_Nacimiento_Usuario`,
        `Fecha_Registro_Usuario`
    )
VALUES
    (
        '2',
        '73216096',
        'Carreras@gmail.com',
        'axqGxwLQM76AsveD/nUOyA==',
        'Matilde Carreras',
        'Patrocinio Vilar',
        '956574566',
        'Jr Libertad 9462',
        '03/06/2004',
        '03/02/2025'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216097',
        'Mauro Mateos',
        'Fernando del Campo',
        'Calle Independencia 141',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216098',
        'Marcelina Mariño',
        'Alfonsa Sabater',
        'Bolognesi 430',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216099',
        'Modesto Rosa',
        'Yassine Martínez',
        'Grimaldo del Solar 139',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216001',
        'Alba Serrano',
        'Natividad Orellana',
        'Avenida Javier Prado Este 1142',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216002',
        'Emilia Guisado',
        'Natividad Pozo',
        'Calle Alfredo Salazar 894',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216003',
        'Florentino Montoya',
        'Narciso Echeverria',
        'Av Los Constructores 1027',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216004',
        'Jose Joaquin',
        'Miguel Rovira',
        'Carretera Central Km 19.5 Ñaña',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216005',
        'Manel Melero',
        'Jacobo Rodenas',
        'Av Andrés Aramburú 964',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216006',
        'Purificacion Carrasco',
        'Marcelino Prados',
        'Av Lima 878',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216007',
        'Jonathan Teruel',
        'Ramon Ferrando',
        'Av Washington 222',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216008',
        'Berta Moreira',
        'Antia Esteban',
        'Avenida Arequipa 781',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216009',
        'Arturo Piqueras',
        'Jesus Duarte',
        'Rimac 15333',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216101',
        'Aida Sanchis',
        'Arantxa Meseguer',
        'Luis Felipe De Las Casas 121',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216102',
        'Simon Cuevas',
        'Ferran Prieto',
        'Los Ingenieros 2503',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216103',
        'Rufina Romo',
        'Cristina Acuña',
        'Primavera 1530',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216104',
        'Emiliana Guerra',
        'Virginia Montiel',
        'Jirón Hipolito Unanue 444',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216105',
        'Ildefonso Zafra',
        'Gregorio Cañete',
        'Tomas Marsano 4717',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216106',
        'Agustina Verdugo',
        'Ane Lima',
        'Enrique Palacios 598',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216107',
        'Pedro Antonio',
        'Biel Frutos',
        'Av. Las Leyendas 580',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216108',
        'Matias Alcaide',
        'Francisco Prieto',
        'Escardo 935',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216109',
        'Naia Calderon',
        'Azucena Ortiz',
        'Ernesto Diez Canseco 696',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216201',
        'Rafael Davila',
        'Aurelio Holgado',
        'Alcanfores 475',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216202',
        'Chloe Tudela',
        'Paloma Gallego',
        'Jr. Juan Olaechea Arnao 1381',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216203',
        'Idoia Martorell',
        'Pino Uriarte',
        'Alcazar 814',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216204',
        'Ignacio Nicolas',
        'Domingo Cardenas',
        'Esteban Salmon 870',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Cliente` (
        `DNI_Cliente`,
        `Nombre_Cliente`,
        `Apellido_Cliente`,
        `Direccion_Cliente`,
        `Fecha_Nacimiento_Cliente`
    )
VALUES
    (
        '73216205',
        'Maria Angela',
        'Alexia Quiroga',
        'Jose Manuel Iturregui 1280',
        '03/06/2004'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Smartphones',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Celulares Básicos',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Wearables',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios Celulares',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Laptops',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Tablets',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Escritorio',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios Tablets',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios Laptops',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Mouses y Teclados',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Ilustración y Diseño',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Procesadores',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Placas Madres',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Memorias',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Tarjetas Gráficas',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Almacenamiento',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Gabinetes',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Fuentes de Poder (PSU)',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Refrigeración',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Sillas Gamer',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'TV y Smart TV',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Video / Audio TV',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios TV y Video',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Consolas',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios Consolas',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Juegos',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Controles',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Access Point',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Extensores de Red',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Routers',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Switches',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Tarjetas de Red / USB',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Internet Satelital',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Seguridad',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Categoria_Producto` (
        `Nombre_Categoria_Producto`,
        `Descripcion_Categoria_Producto`,
        `Fecha_Registro_Categoria_Producto`
    )
VALUES
    (
        'Accesorios Red',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '04/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Apple',
        '912345567',
        'novik3055@haddenelectrical.com',
        'Calle 27 de Noviembre 169/189 Miraflores',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Motorola',
        '965845403',
        'andersonpereiraap@aliexchangevn.com',
        'Chancay 894',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Nokia',
        '956745696',
        'merikejenk@somebodyswrong.com',
        'Merida 216',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Realme',
        '956745667',
        'kiera1@lasersimage.com',
        'Santiago de Surco 33',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Samsung',
        '956974566',
        'legerald@rippleofvie.com',
        'Tomas Ramsey 904',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Xiaomi',
        '956754566',
        'nozhenkoolga@ticemail.xyz',
        'Av República de Panamá 6355',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'ZTE',
        '956781356',
        'liptonicetea@solaravenue.org',
        'Av José Pardo 1453',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Belkin',
        '978945268',
        'jojisuzuki@solarino.pl',
        'Calle Los Libertadores 302',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Catalyst',
        '978940733',
        'smoothconcord200620@gpaemail.xyz',
        'Ferreyros 376',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'DJI',
        '978940734',
        'lenacher41@xaudep.com',
        'Victor A Belaunde 161',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Klip',
        '978685704',
        'olegfisun@upscalebp.com',
        'Av. Túpac Amaru 310',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Kuzler',
        '956574566',
        'y2annd@comfortstride.studio',
        'Ate Vitarte 856',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Scosche',
        '956758466',
        'vspyrh2010@virtual-generations.com',
        'Jesus Maria 784',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Spektra',
        '956745566',
        'ginanm@s-hope.com',
        'Avenida Javier Prado Este 984',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Targus',
        '945634857',
        'lia1991ufa@uqkemail.eu',
        'Jirón Huiracocha 323',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Usams',
        '974606417',
        'chaameleon@haqoci.com',
        'Jirón Domingo Cueto 329',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'XTech',
        '956745626',
        'soyelrobert1@virtual-generations.com',
        'Los Proceres Mzn1 Int. Lt 5',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Acer',
        '989757823',
        'cryjsn@friendsack.com',
        'Azángaro 105',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Asus',
        '995835639',
        'shadowgeek@besttimenews.xyz',
        '31th Street 195 Urbanizacion Corpac San Isidro',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Dell',
        '996546534',
        'chay398@marmaryta.email',
        'Frederic Remington 180',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Gigabyte',
        '952678958',
        'ajarik88@kimfetme.com',
        'Calle Berlin 536',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'HP',
        '977894073',
        'eropkazzz1@getfollowers24.biz',
        'Av.Bolivar 598',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Lenovo',
        '976985704',
        'ksyunechkadanchenko@bmffightwear.com',
        'Av La Libertad 111',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'MSI',
        '956574566',
        'termovihr@tldemail.top',
        'Jr Libertad 9462',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'AMD',
        '956778466',
        'newsactu@hdstream247.com',
        'Calle Independencia 141',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Antryx',
        '956748566',
        'lisnyiivan@newdestinyhomes.com',
        'Bolognesi 430',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'CoolerMaster',
        '945634957',
        'displeasures@hnoodt.com',
        'Grimaldo del Solar 139',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Deepcool',
        '974606477',
        'logustlt@visblackbox.com',
        'Avenida Javier Prado Este 1142',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Forza',
        '956874566',
        'ashfaquesindhi47@beanlignt.com',
        'Calle Alfredo Salazar 894',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Logitech',
        '989975783',
        'bordy12@sikatan.co',
        'Av Los Constructores 1027',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Microsoft',
        '995883569',
        'gnsvladimir@lotuzvending.com',
        'Carretera Central Km 19.5 Ñaña',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Vivitar',
        '965946534',
        'giese@tuku26012023.xyz',
        'Av Andrés Aramburú 964',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Gear Gamer',
        '926753958',
        'pifagorstar@inspirationzuhause.me',
        'Av Lima 878',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'HyperX',
        '927654138',
        'prostotina@ltlseguridad.com',
        'Av Washington 222',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Primus Gaming',
        '979876728',
        'msdubin@rotecproperty.xyz',
        'Avenida Arequipa 781',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Redragon',
        '946523128',
        'nikkrasnovfiftik@gpbemail.top',
        'Rimac 15333',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'TEROS',
        '979845628',
        'ricardoduarte19@mundodigital.me',
        'Luis Felipe De Las Casas 121',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Wacom',
        '946864628',
        'novelkkh@gpaemail.in',
        'Los Ingenieros 2503',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Intel',
        '927987988',
        'doperion@eliwakhaliljb.site',
        'Primavera 1530',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Adata',
        '924654668',
        'alenaaam@xtsimilar.com',
        'Jirón Hipolito Unanue 444',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Corsair',
        '946849892',
        'joesinglerdish@entobio.com',
        'Tomas Marsano 4717',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Kingston',
        '965748972',
        'xavkitsune@appliedphytogenetics.com',
        'Enrique Palacios 598',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'SanDisk',
        '929789848',
        'dim0173@byui.me',
        'Av. Las Leyendas 580',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'TeamGroup',
        '928465493',
        'nurlanaliyev85@badutquinza.com',
        'Escardo 935',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'XFX',
        '925879845',
        'wolfcoollya@baubionest.com',
        'Ernesto Diez Canseco 696',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Zotac',
        '925879547',
        'hifvbgwsv2@newbreedapps.com',
        'Alcanfores 475',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Seagate',
        '986427958',
        'nighttrain@cuanmarket.xyz',
        'Jr. Juan Olaechea Arnao 1381',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Toshiba',
        '927879958',
        'egafal12@coolmailcool.com',
        'Alcazar 814',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'WD',
        '927899858',
        'tatianabreus@maghyg.xyz',
        'Esteban Salmon 870',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Cougar',
        '928958777',
        'vergle@jottobricks.com',
        'Jose Manuel Iturregui 1280',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Gear',
        '999887111',
        '999887111@gmail.com',
        'Lima',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Lvlup',
        '999887112',
        '999887112@gmail.com',
        'Ancón',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Playseat',
        '999887113',
        '999887113@gmail.com',
        'Ate',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'AOC',
        '999887114',
        '999887114@gmail.com',
        'Barranco',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Philips',
        '999887115',
        '999887115@gmail.com',
        'Breña',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'TCL',
        '999887116',
        '999887116@gmail.com',
        'Carabayllo',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'JBL',
        '999887117',
        '999887117@gmail.com',
        'Chaclacayo',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Roku',
        '999887118',
        '999887118@gmail.com',
        'Chorrillos',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Nintendo',
        '999887119',
        '999887119@gmail.com',
        'Cieneguilla',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Sony',
        '999887110',
        '999887110@gmail.com',
        'Comas',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Activision',
        '999887121',
        '999887121@gmail.com',
        'El Agustino',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Bandai Namco',
        '999887122',
        '999887122@gmail.com',
        'Independencia',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Capcom',
        '999887123',
        '999887123@gmail.com',
        'Jesús María',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Electronic Arts',
        '999887124',
        '999887124@gmail.com',
        'La Molina',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Take 2',
        '999887125',
        '999887125@gmail.com',
        'La Victoria',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Ubisoft',
        '999887126',
        '999887126@gmail.com',
        'Lince',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Warner',
        '999887127',
        '999887127@gmail.com',
        'Los Olivos',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'T-Dagger',
        '999887128',
        '999887128@gmail.com',
        'Lurigancho',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Linksys',
        '999887129',
        '999887129@gmail.com',
        'Lurin',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Mercusys',
        '999887120',
        '999887120@gmail.com',
        'Magdalena del Mar',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'TPLink',
        '999887131',
        '999887131@gmail.com',
        'Pueblo Libre',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Starlink',
        '999887132',
        '999887132@gmail.com',
        'Miraflores',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'HIKVISION',
        '999887133',
        '999887133@gmail.com',
        'Pachacamac',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Marca_Producto` (
        `Nombre_Marca_Producto`,
        `Telefono_Marca_Producto`,
        `E_Mail_Marca_Producto`,
        `Direccion_Marca_Producto`,
        `Fecha_Registro_Marca_Producto`
    )
VALUES
    (
        'Nexxt',
        '999887134',
        '999887134@gmail.com',
        'Pucusana',
        '05/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 11 128GB Black',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 11 128GB Blanco',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 11 64GB White',
        '200',
        '1799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 12 128GB Black',
        '200',
        '2899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 12 128GB White',
        '200',
        '2899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 13 128GB Blue',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 13 128GB Midnight',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 13 128GB Red',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 13 128GB Starlight',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 14 128GB Midnight',
        '200',
        '3699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 14 128GB Purple',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 14 128GB Red',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 14 128GB Starlight',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 128GB Black',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 128GB Blue',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 128GB Green',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 128GB Yellow',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Plus 128GB Pink ',
        '200',
        '4699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Plus128GB Black',
        '200',
        '4699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro 128GB Black',
        '200',
        '5199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro 128GB Blue',
        '200',
        '5199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro 128GB Natural',
        '200',
        '5199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro 128GB White',
        '200',
        '5199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro 256GB Black',
        '200',
        '5799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro 256GB Blue',
        '200',
        '5699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro Max 256GB Black',
        '200',
        '6199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro Max 256GB Blue',
        '200',
        '6199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro Max 256GB Natural',
        '200',
        '6199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro Max 256GB White',
        '200',
        '6199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 15 Pro Max 512GB White',
        '200',
        '7199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '1',
        'iPhone 16 128GB Black',
        '200',
        '4099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone Blade A34 2GB 64GB Gris Liberado',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone Blade A54 4GB 128GB Gris Liberado',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone Blade V50 8550 VITA 4GB 256GB Azul Liberado',
        '200',
        '439.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone Blade V50 8550 VITA 4GB 256GB Negro Liberado',
        '200',
        '439.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone V40 Design 6GB 128GB Negro Liberado',
        '200',
        '469.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone V40Vita 4GB 128GB Negro Liberado',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone V50 Design 8050 6GB 256GB Negro Liberado',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '7',
        'Smartphone V50 Design 8050 6GB 256GB Verde Liberado',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '3',
        'Smartphone C2 2E TA-1446 2GB 32GB LTAU Azul',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '3',
        'Smartphone C21 Plus 2GB 64GB Gris Liberado',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '3',
        'Smartphone C21 Plus 3GB 32GB LTAU Gris TA-1425',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '3',
        'Smartphone G10 3GB 64GB Azul Liberado',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '4',
        'Smartphone C35 4GB 128GB Negro Liberado',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '4',
        'Smartphone Realme Note 50 128GB 4GB Sky Blue Liberado',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '4',
        'Smartphone Realme Note 50 64GB 3GB Midnight Black Liberado',
        '200',
        '389.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A04s 4GB 64GB Negro Liberado',
        '200',
        '646.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A14 4GB 128GB Negro Liberado',
        '200',
        '799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A24 4GB 128GB Negro Liberado',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A34 8GB 256GB 5G Negro Liberado',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A34 8GB 256GB 5G Violeta Liberado',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A54 8GB 256GB 5G Negro Liberado',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy A54 8GB 256GB 5G Violeta Liberado',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy S21 Fe 6GB 128GB 5G Gris Liberado',
        '200',
        '2499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy S23 8GB 256GB 5G Misty Lilac Liberado',
        '200',
        '4299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy S23 8GB 256GB 5G Phantom Black Liberado',
        '200',
        '4299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy S23 Ultra 12GB 512GB 5G Phantom Black Liberado',
        '200',
        '6399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone Galaxy S23+ 8GB 512GB 5G Phantom Black Liberado',
        '200',
        '5299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone ZFlip5 8GB 512GB Graphite Liberado + Smart UX Case + Travel Adapter 25W',
        '200',
        '4799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '5',
        'Smartphone ZFlip5 8GB 512GB Mint Liberado+ Smart UX Case + Travel Adapter 25W',
        '200',
        '4799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto E14 2GB 64GB Gris',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto Edge 40 8GB 256GB Azul Nebula Liberado',
        '200',
        '1899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto Edge 50 12GB 256GB Gris Carbón + Moto Buds',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto Edge 50 Fusion 8GB 256GB Azul Ártico Liberado + Moto Buds',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto Edge 50 Fusion 8GB 256GB Rosa Fragola Liberado + Moto Buds',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto Edge 50 Pro 12GB 512GB Negro Eclipse + Moto Buds+',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G04S 4GB 128GB Naranja Amanecer Liberado',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G04S 4GB 128GB Negro Cósmico',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G04S 4GB 128GB Verde Aurora Liberado',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G24 4GB 256GB Gris Acero Liberado',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G24 4GB 256GB Lavanda Liberado',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G34 5G 8GB 256GB Negro Meteorito Liberado',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G34 5G 8GB 256GB Verde Oceano Liberado',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G84 8GB 256GB Negro Espacial',
        '200',
        '949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G84 8GB 256GB Viva Magenta',
        '200',
        '949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto G85 8GB 256GB Gris',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto razr 40 Ultra 12GB 512GB Naranja Liberado',
        '200',
        '4799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto razr 40 Ultra 12GB 512GB Negro Infinito Liberado',
        '200',
        '4799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '2',
        'Smartphone Moto Razr 50 12GB 512GB Gris Carbón + Moto Buds+',
        '200',
        '3299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone POCO M5s 6GB 128GB Gris Liberado',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi 14C Midnight Black 4GB RAM 256GB ROM',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi 14C Starry Blue 4GB RAM 256GB ROM',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi A3 3GB 64GB Azul Liberado',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi A3 3GB 64GB Negro Liberado',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi Note 12 4GB 128GB Onyx Gray Liberado ',
        '200',
        '949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi Note 12 Pro+ 8GB 256GB 5G Sky Blue Liberado',
        '200',
        '1899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi Note 13 8GB 256GB Azul Liberado',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi Note 13 8GB 256GB Negro Liberado',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi Note 13Pro 8GB 256GB Negro Liberado',
        '200',
        '979.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Redmi Note 13Pro+ 5G 12GB 512GB Negro Liberado',
        '200',
        '1679.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Xiaomi 14T 12+512 Negro+Buds5',
        '200',
        '2299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Xiaomi 14T Titan Black 12GB RAM 512GB ROM',
        '200',
        '2299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '1',
        '6',
        'Smartphone Xiaomi 14T Titan Gray 12GB RAM 512GB ROM',
        '200',
        '2299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '2',
        '3',
        'Celular básico Nokia 105 4G TA-1547 LTAU Charcoal',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '2',
        '3',
        'Celular básico Nokia 110 4G TA-1563 LTAU Azul',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '2',
        '3',
        'Celular básico Nokia 6300 4G TA-1307 Charcoal',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch SE 40mm GPS Starlight',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch SE 44mm GPS Midnight',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch SE GPS 40mm Midnight Talla S/M',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch SE GPS 44mm Plata - Correa Azul',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch SE GPS 44mm Starlight',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS 45mm Pink',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS 41mm Plata Talla S/M',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS 45mm Blanco Estrella Talla S/M',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS 45mm Blanco Estrella Talla M/L',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS 45mm Medianoche - Correa loop deportiva',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS Medianoche 41 mm - Correa deportiva Medianoche - Talla M/L',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS Medianoche de 41mm - Correa Loop deportiva color medianoche',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '1',
        'Apple Watch Series 9 GPS Plata 45mm - Correa deportiva azul tempestad Talla S/M',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '5',
        'Galaxy Watch 6 Small Graphite + Fabric Band Black',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '5',
        'Galaxy Watch5 40mm BT Rose Gold',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '6',
        'Correa Xiaomi Watch S1 Active Braided Nylon Graphite Black',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '6',
        'Smartband Xiaomi Redmi Smart Band 2 GL Ivory',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '3',
        '6',
        'Xiaomi Redmi Watch 3 Negro',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '10',
        'Accesorio Osmo Mobile 6',
        '200',
        '799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '5',
        'Adaptador de carga rápida USB-C (15W) sin cable',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '5',
        'Batería Portátil 10,000 mAh Beige',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Adaptador Universal 4en1 USB Dual 12W Negro',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Batería Portátil 10,000 mAh + Cinta Blanco',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Batería Portátil 10,000 mAh + Cinta Negro',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Tipo C a Lightning 2m Blanco',
        '200',
        '64.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Tipo C a Lightning 2m Negro',
        '200',
        '64.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado Tipo C a Lightning 1.2m Blanco',
        '200',
        '54.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado Tipo C a Lightning 1.2m Negro',
        '200',
        '54.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado Tipo C a Tipo C 1.2m Lila',
        '200',
        '54.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado Tipo C a Tipo C 1.2m Negro',
        '200',
        '54.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado Tipo C a Tipo C 1.2m Negro',
        '200',
        '54.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado USB a Lightning 1m Negro',
        '200',
        '32.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cable Trenzado USB a Tipo C 1.2m Lila',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cargador Auto Digital Dual Fast USB+Type-C 72W Acero',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cargador Inalámbrico Magnético para Auto Air Vent 15W Negro',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Cargador para auto Dual 42.5W USB 22.5W+PD 20W Negro',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Kit Cargador de pared + Cable de Iphone Blanco',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Kit Cargador Pared + Cable Type-C Blanco ',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Set Cargador Auto Dual 2.1A + Cable 3 En 1 Negro',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Soporte Celular Auto Negro y gris',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Soporte Celular Mesa Negro',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '16',
        'Soporte Retráctil de Mesa para Celular/Tablet Blanco',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '6',
        'Adaptador Xiaomi 67W GaN (2C1A) Blanco',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '6',
        'Correa Xiaomi Watch S1 Active Braided Nylon Graphite Black',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '13',
        'Base de carga inalámbrica y batería portatil Blanco',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '13',
        'Cable LED USB a Lightning 1m Blanco',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '13',
        'Cargador de pared SuperCube Azul',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '13',
        'Soporte magnético de teléfono para automóvil con ventosa Magic Mount',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '13',
        'Soporte magnético de teléfono para automóvil Magic Mount',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Batería Externa Spektra 10.000 mAh Carga Rápida BT-10S93 Negra ',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Batería Externa Spektra 20.000 mAh Carga Rápida BT-20S63 Negra ',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Batería Externa Spektra 30.000 mAh Carga Rápida BT-30S55 Blanca',
        '200',
        '169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cable Carga rápida Tipo C a Lightning 1m Negro',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cable Lightning a USB 1.2m Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cable Micro USB a USB 1.2m Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cargador (Adaptador) de casa Spektra 10.5W con cable Tipo C SEC',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cargador (Adaptador) de casa Universal Spektra con puerto USB sin Cable',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cargador de auto Spektra carga rápida blanco con 2 puertos USB 3.0 y luz LED SK-144',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cargador de auto Spektra carga rápida blanco con 2 puertos USB 3.0 y luz LED SK-144',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Cargador Múltiple USB Inteligente Matte Black (Alargador)',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Estación de Carga Inalámbrica Spektra 3 en 1 para iPhone/iPad/AirPods/Apple Watch',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Selfie Stick con Luz de Relleno y Trípode',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '14',
        'Soporte de Celular para Automóvil con Ventosa Spektra ST-110 Negro',
        '200',
        '14.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '12',
        'Batería Portátil 20,000 mAh Ultra Carga rápida (Para Laptop)',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '12',
        'Cable Trenzado Tipo C a Tipo C 1m Negro',
        '200',
        '15.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '12',
        'Cargador de Pared 20W Blanco',
        '200',
        '20.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '12',
        'Luz Led brillo regulable para celular',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '12',
        'Powerbank Laptop 20,000 mah carga ultra rapida 65W PD (Power Delivery)',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '12',
        'Tripode Selfie Stick Multifuncional',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '1',
        'Cable de carga USB-C 240W 2m',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '1',
        'Cable de carga USB-C 60W 1m',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '1',
        'Cable de Lightning a USB 2 m',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '1',
        'Cable de USB-C a Lightning 2 m',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '1',
        'Cable USB-C a Lightning 1m',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cable Tipo C a Lightning 1m Blanco',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cable Tipo C a Lightning 1m Negro',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cable USB-A a Lightning 1m Blanco',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cable USB-A a Lightning 1m Negro',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cable USB-A a Lightning 2m Blanco',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador de pared Doble 37W',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador de pared Doble USB-C 68W',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador Inalámbrico 10W + Altavoz Bluetooth Negro',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador inalámbrico 3 in 1 para dispositivos de Apple',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador inalámbrico Pad 10W Qi Negro',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador inalámbrico Pad 15W Blanco',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador para automóvil Doble 24W USB-A Negro',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Cargador para automóvil Doble 37W (USB-C 25W + USB-A 12W) Negro',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '8',
        'Soporte de cargador inalámbrico magnético 7.5W con cargador de 20W',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '17',
        'Cable Tipo C a Tipo C 1.8m Negro',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '17',
        'Cable Tipo C a USB-A 1.8m Negro',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '17',
        'Cable USB-A a Micro USB Macho 1.8m Negro',
        '200',
        '14.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '11',
        'Cable Trenzado 2 en 1 USB a Lightning / Micro-USB 1m Blanco',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '9',
        'Case Airpods Gen 1/2 Waterproof Anaranjado',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '9',
        'Case Airpods Gen 1/2 Waterproof Azul',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '9',
        'Case Airpods Gen 1/2 Waterproof Coral',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '9',
        'Case Airpods Pro (2da Gen) Glacial Blue',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '4',
        '15',
        'Lapiz para smartphone Slim Stylus Negro AMM12US',
        '200',
        '27.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '18',
        'Laptop Acer Aspire 3 15.6" FHD Intel Core i5-1235U 16GB 512GB SSD Windows 11',
        '200',
        '2199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '18',
        'Laptop Acer Aspire 5 15.6" FHD Intel Core 7 150U 16GB 1TB SSD Windows 11',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '18',
        'Laptop Acer Aspire 5 15.6" FHD Intel Core i9-13900H 16GB 512GB SSD Windows 11',
        '200',
        '3399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '18',
        'Laptop Gamer Acer Nitro 5 15.6" FHD Intel Core i7-11800H 8GB 512GB SSD NVIDIA RTX3050 4GB Windows 11 Negro (AN515-57-79F8)',
        '200',
        '4899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '18',
        'Laptop Gamer Acer Nitro V 15.6″ FHD Intel Core I5-13420H 16GB 512GB SSD NVIDIA RTX 3050 Windows 11',
        '200',
        '3499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '18',
        'Laptop Gamer Acer Predator Helios Neo 16 16" 165 Hz Intel Core™ i7-13650HX NVIDIA RTX4060 16GB RAM 1TB SSD Windows 11',
        '200',
        '6799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M1 16GB 256GB SSD Gris espacial',
        '200',
        '3599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M2 8GB 256GB SSD Medianoche',
        '200',
        '4699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M2 8GB 512GB SSD Medianoche',
        '200',
        '5799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M3 8GB 256GB SSD Blanco estelar',
        '200',
        '5299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M3 8GB 256GB SSD Gris espacial',
        '200',
        '5299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M3 8GB 256GB SSD Medianoche',
        '200',
        '5299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Air 13" Chip M3 8GB 256GB SSD Plata',
        '200',
        '5299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Pro 14" Chip M3 8GB 1TB SSD Gris Espacial',
        '200',
        '8949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Pro 14" Chip M3 8GB 1TB SSD Plata',
        '200',
        '8949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Pro 14" Chip M3 8GB 512GB SSD Gris espacial',
        '200',
        '7949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Pro 14" Chip M3 8GB 512GB SSD Plata',
        '200',
        '7949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Pro 16" Chip M3 Pro 18GB 512GB SSD Negro espacial',
        '200',
        '12499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '1',
        'MacBook Pro 16" Chip M3 Pro 18GB 512GB SSD Plata',
        '200',
        '12499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 15.6" FHD Intel Core i5-1235U 8GB 512GB SSD Windows 11 (90NB1022-M00CR0)',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 16" AMD Ryzen R7 7730U 8GB 512GB SSD Windows 11 Negro (M1605YA-MB136W)',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 16" Intel Core i5-12500H 12GB 512GB SSD Windows 11',
        '200',
        '2199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 16" Intel Core i7-12700H 16GB 512GB SSD Windows 11',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 16" Intel Core i9-13900H 16GB 1TB SSD Windows 11',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 16" WUXGA Intel Core i5-12500H 8GB 512GB SSD Windows 11 Negro (X1605ZA-MB252W)',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Vivobook 16X 16" AMD Ryzen 7 7730U 16GB 512GB SSD Windows 11',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Asus Zenbook 14" OLED Intel Core Ultra 7 16GB 1TB SSD Windows 11',
        '200',
        '5099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus ROG Strix G18 18" 240Hz Intel Core i9-14900HX 32GB DDR5 2TB SSD NVIDIA GeForce RTX4080 12GB GDDR6',
        '200',
        '13999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus ROG Zephyrus G14 14" OLED AMD Ryzen™ 9 8945HS 32GB 1TB SSD NVIDIA RTX4060  Windows 11 ',
        '200',
        '9099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus ROG Zephyrus G16 16" 240Hz Ryzen AI 9 HX 370 32GB DDR5 1TB SSD NVIDIA GeForce RTX4070 8GB',
        '200',
        '11999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus ROG Zephyrus G16 16" OLED Intel Core™ Ultra 9 32GB 1TB SSD NVIDIA RTX4070 Windows 11',
        '200',
        '11699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus TUF A16 AMD Ryzen AI 9 HX 370 32GB DDR5X 1TB SSD NVIDIA Geforce RTX4060 8GB',
        '200',
        '8099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus TUF F15 15.6" FHD Intel Core i5-12500H 8GB 512GB SSD NVIDIA RTX3050 4GB Windows 11 Mecha Gray (FX507ZC4-HN005W)',
        '200',
        '3199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus TUF F15 15.6" FHD Intel Core i7-12700H 16GB 1TB SSD NVIDIA RTX3050 4GB Windows 11 Mecha Gray (FX507ZC4-HN132W)',
        '200',
        '4199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '19',
        'Laptop Gamer Asus TUF F15 Intel Core i7-13620H 16GB DDR4 1TB SSD NVIDIA GeForce RTX4060 8GB',
        '200',
        '5799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '20',
        'Laptop Gamer Dell Alienware m16 R1 16" QHD Intel Core i7-13700HX 16GB 1TB SSD RTX4070 8GB Windows 11',
        '200',
        '11999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '21',
        'Laptop Gigabyte AERO 14 OLED 14" QHD Intel Core i5-12500H 16GB 1TB SSD NVIDIA RTX4050 6GB Windows 11',
        '200',
        '6799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '21',
        'Laptop Gigabyte AERO 5 KE4 15.6" UHD Intel Core i7-12700H 16GB 1TB SSD NVIDIA RTX3060 6GB Windows 11',
        '200',
        '7699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop Gamer HP OMEN 16.1" FHD AMD Ryzen R7-5800H 16GB 512GB SSD AMD Radeon RX6600M 8GB Windows 11 (16-c0503la)',
        '200',
        '6199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop Gamer HP OMEN Transcend 14" OLED 120Hz Intel Core Ultra 7-155H 16GB 1TB SSD NVIDIA GeForce RTX4060 Windows 11 Shadow Black (14-fb0001la)',
        '200',
        '7979.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop Gamer HP Victus 15.6" FHD 144Hz AMD Ryzen 5-8645HS 8GB 512GB SSD NVIDIA GeForce RTX3050 Windows 11 Mica Silver (15-fb2002la)',
        '200',
        '3249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop Gamer HP Victus 15.6" FHD AMD Ryzen 5-5600H 8GB 512GB SSD NVIDIA RTX3050 4GB Windows 11 Plata mica (15-fb0103la)',
        '200',
        '3399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop Gamer HP Victus 15.6" FHD Intel Core i7-12650H 16GB 512GB SSD NVIDIA RTX3050 4GB Windows 11 (15-fa0007la)',
        '200',
        '4499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6 FHD NT Ryzen 5-7520U 8GB 512GB Windows 11 (15-FC0071LA)',
        '200',
        '1799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6 HD NT Core i5-1235U - U15 8GB 512GB Windows 11 (15-FD0048LA)',
        '200',
        '2049.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6" FHD Intel Core i5-1335U 8GB 512GB SSD Windows 11 (15-fd0007la)',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6" FHD NT Intel Core i3-N305 8GB 512GB SSD Windows 11 Moonlight Blue (15-fd0004la)',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6" HD NT Ryzen 7-5700U 16GB 512GB SSD Windows 11 Silver (15-ef2500la)',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6" Intel Core i7-10510U 8GB 256GB SSD Windows 11 Plateado (15-dw1073la)',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP 15.6" WXGA Intel Core i5-1135G7 12GB 512GB SSD Windows 11 Plateado (15-dy2505la)',
        '200',
        '2299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP Envy x360 15.6" AMD Ryzen 7 7730U 16GB 1TB Windows 11',
        '200',
        '5199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '22',
        'Laptop HP ProBook 455 G10 AMD Ryzen 7-7730U 32GB 1TB SSD Windows 11 Pro (9F4F5LT)',
        '200',
        '4099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo IdeaPad Gaming 3 15ARH7 15.6" FHD AMD Ryzen R5-6600H 16GB 512G SSD NVIDIA RTX 3050 4GB Windows 11 (82SB00HPLM)',
        '200',
        '4999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo IdeaPad Gaming3 15.6" FHD AMD Ryzen R7-5800H 16GB 512GB SSD NVIDIA RTX3060 6GB Windows 11 (82K2009WLM)',
        '200',
        '4299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo Legion Pro5 16" WXQGA AMD Ryzen 7-7745HX 32GB 1TB SSD NVIDIA RTX4070 Windows 11 (82WM009LLM)',
        '200',
        '7299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo Legion Slim 5 16IRH8 16" Intel Core i7-13700H 16GB 512GB NVIDIA GeForce RTX4060 8GB Windows 11',
        '200',
        '6499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo LOQ 15APH8 15.6" FHD AMD Ryzen 7-7840HS 16GB 512GB SSD NVIDIA RTX4050 6GB Windows 11 (82XT002PLM) ',
        '200',
        '4699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo LOQ 15ARP9 15.6" FHD AMD Ryzen 7 7435HS 12GB 512GB NVIDIA GeForce RTX 4050 6 GB Windows 11',
        '200',
        '3999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Gamer Lenovo LOQ 15IAX9 15.6" FHD Intel Core i5-12450HX 8GB 512GB SSD NVIDIA GeForce RTX 3050 6GB Windows 11',
        '200',
        '3099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad 5 15.6" FHD AMD Ryzen 5-5500U 8GB 512GB SSD Windows 11 Azul (82LN00AKLM)',
        '200',
        '2199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad Slim 3 15.6" FHD Intel Core i5-12450H 8GB 256GB SSD Windows 11 (83ER0018LM)',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad Slim 3 15ABR8 AMD Ryzen R7- 7730U 16GB 1TB SSD Windows 11 (82XM00BRLM)',
        '200',
        '2599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad Slim 3 15IAH8 15.6" FHD Intel Core i5-12450H 16GB 512GB SSD Windows 11 (83ER0019LM)',
        '200',
        '2199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad Slim 5 16IRL8 16" WUXGA Intel Core i7-13620H 16GB 512GB SSD Windows 11 (82XF0071LM)',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo Yoga Slim 7 14IMH9 14" OLED Intel Core Ultra 7 32GB 1T Windows 11',
        '200',
        '4699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad 1 15AMN7 15.6" FHD AMD Ryzen 3 7320U 8 GB 512GB SSD Windows 11',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo IdeaPad Slim 3 15IAN8 15.6" FHD Intel Core i3-N305 8 GB 512 SSD Windows 11',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '23',
        'Laptop Lenovo Yoga Slim 7 14IMH9 14" WUXGA Intel Core Ultra 5 125H, 16GB 512GB SSD Windows 11',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Alpha 17 C7VG 17.3" AMD Ryzen 9-7945HX 16GB 1TB SSD RTX4070 8GB Windows 11 (9S7-17KK11-045)',
        '200',
        '9299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Cyborg 15 A12VF 15.6" FHD 144Hz Intel Core i7-12650H 16GB 512GB SSD NVIDIA GeForce RTX4060',
        '200',
        '4599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Cyborg 15 A13VFK 15,6" FHD Intel Core i7-13620H 16GB DDR5 512GB SSD NVIDIA GeForce RTX4060 8GB GDDR6',
        '200',
        '4999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Cyborg 15 AI A1VFK 15,6" FHD  Intel Core Ultra 7-155H DDR5 8GB*2 512 GB SSD NVIDIA GeForce RTX 4060 8 GB GDDR6',
        '200',
        '6649.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Katana 17 B13VFK 17.3" FHD Intel Core i7-13620H 16GB 512GB SSD NVIDIA RTX4060 8GB Windows 11 (9S7-17L541-1206)',
        '200',
        '5849.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Pulse 17 AI C1VGKG 17" FHD+  Intel Core Ultra 7-155H DDR5 8GB*2 1 TB SSD NVIDIA GeForce RTX 4070 8 GB GDDR6',
        '200',
        '9549.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Stealth 16 AI Studio A1VFG 16" QHD+ Intel Core Ultra 7-155H 2x16GB 1TB SSD NVIDIA RTX4060 8GB Windows 11 (9S7-15F412-048)',
        '200',
        '9349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Thin 15 B12UDX 15.6" FHD Core i5 12450H 16GB 512GB RTX 3050 6GB GDDR6 + Mochila',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Thin 15 B13VE 15.6" FHD  Intel Core i5-13420H DDR IV 8GB*2 512GB SSD NVIDIA GeForce RTX 4050 6 GB GDDR6',
        '200',
        '3999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Thin B12VE 15.6" FHD Intel Core i5- 12450H 2x8GB 512GB SSD NVIDIA RTX4050 6GB (9S7-16R831-2099)',
        '200',
        '3199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '5',
        '24',
        'Laptop Gamer MSI Vector 17 HX A14VGG 17" QHD+ Intel Core i9-14900HX 16GB*2 1TB SSD NVIDIA RTX4070, GDDR6 8GB',
        '200',
        '11149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '1',
        'iPad 10.2" 9na Gen 64GB WiFi Space Gray',
        '200',
        '1599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '1',
        'iPad 10.9" 10ma Gen 64GB WiFi Silver',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '1',
        'iPad 9na Gen 64GB Plata',
        '200',
        '1599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '1',
        'iPad Pro 12.9" 6ta Gen 128GB WiFi Space Gray',
        '200',
        '4999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet M10 10.1" 4GB 64GB LTE Storm Grey',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet M10 10.1" 4GB 64GB WiFi Storm Grey',
        '200',
        '549.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet M8 (4th Gen) 8" 4GB 64GB LTE Artic Grey',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet P11 11.5" 6GB 128GB 4G LTE Storm Grey con pencil',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet P11 Pro 11.5" 6GB 128GB WiFi Slate Grey + Teclado y Lapiz ',
        '200',
        '2499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet Yoga Tab 11 11" 4GB 128GB WiFi Storm Grey',
        '200',
        '799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '23',
        'Tablet Yoga Tab 13 13" 8GB 128GB WiFi Shadow Black',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '6',
        '5',
        'Tablet Galaxy Tab S9 11" 12GB 256GB Graphite + Travel Adapter 25W',
        '200',
        '4299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '25',
        'Computadora Escolar - AMD',
        '200',
        '1680.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '19',
        'All In One 23.8" FHD Intel Core i5-1235U 8GB 512GB SSD ',
        '200',
        '2599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '19',
        'All In One 23.8" FHD Intel Core i7-1255U 16GB 512GB SSD Black',
        '200',
        '3299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '19',
        'All In One Asus 23.8" FHD Intel Core i5-1335U 8GB 512GB SSD Black',
        '200',
        '2899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '20',
        'Desktop Dell Optiplex 7000 SFF i7-12700 8GB 512GB SSD Windows 10 pro',
        '200',
        '4199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '20',
        'Desktop Dell Vostro 3000 SFF i5-12500 16GB 256GB SSD Windows 11',
        '200',
        '3199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '20',
        'Desktop Dell Vostro 3710 SFF i5-12400 8GB 256GB SSD Windows 10 pro',
        '200',
        '2799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '20',
        'Desktop Dell Vostro 3710 SFF i7-12700 16GB 512GB SSD Windows 10 pro',
        '200',
        '3999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '20',
        'Desktop Gamer DT Aurora R15 Intel Core i9-13900KF 32GB 1TB SSD + 2TB HDD NVIDIA RTX4090 Windows 11',
        '200',
        '18999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '22',
        'All In One 23.8" FHD Intel Core i3-1125G4 8GB 1TB HDD+256GB SSD Windows 11 Negro',
        '200',
        '2599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '22',
        'Desktop HP OMEN Intel Core i7-12700F 16GB 512 GB SSD  NVIDIA GeForce RTX 3060 Windows 11 GT15-0011la',
        '200',
        '8999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '23',
        'All In One 23.8" FHD Intel Core i5-12450H 8GB 512GB SSD Windows 11 Negro',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '7',
        '23',
        'All in One Lenovo IdeaCentre AIO 3 23.8" FHD Intel Core i3-1215U 8GB 512GB SSD Windows 11 (F0GH0102LD)',
        '200',
        '1899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '8',
        '14',
        'Lápiz Tablet Android Blanco',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '26',
        'Cooler para laptop de Aluminio Antryx Xtreme N280 black',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '26',
        'Cooler para laptop de Aluminio Antryx Xtreme N280 silver',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '26',
        'Cooler para laptop de Aluminio Antryx Xtreme N300 black',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '26',
        'Cooler para laptop de Aluminio Antryx Xtreme N300 silver ',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '26',
        'Cooler para laptop Gamer 17.3" Antryx X500 black con RGB',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '8',
        'Docking Laptop Multipuerto USB-C 4 en 1',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '8',
        'Docking Laptop USB-C Multimedia + Carga USB-C (100W)',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '27',
        'Base Cooler Laptop Ergostand IV (R9-NBS-E42K-GP)',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '27',
        'Base Cooler Laptop Ergostand LITE',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '28',
        'Cooler Laptop N200',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '28',
        'Cooler Laptop U-PAL',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '28',
        'Cooler para Laptop Gamer de 17.3" N80 de metal c/iluminación LED RGB',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '29',
        'Cargador universal de 90W, USB y 7 puntas modulares-110V/220V',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '22',
        'Funda Protectora Reversible para Laptop 14" Negro/Plata',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '11',
        'Bloqueo de cable de seguridad 1.5m KSD-330',
        '200',
        '54.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '11',
        'Bloqueo de cable de seguridad 1.5m KSD-335',
        '200',
        '64.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '11',
        'Webcam Full HD 1080p KWC-500 ',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '12',
        'Mochila de viaje 15.6" puerto cargador y bolsillo antirobo Beige',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '12',
        'Mochila de viaje 15.6" puerto cargador y bolsillo antirobo Rosada',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '12',
        'Mochila para Laptop hasta 17"',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '30',
        'Webcam Full HD 1080p C922 Stream',
        '200',
        '449.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '30',
        'Webcam HD 720p C270',
        '200',
        '144.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '30',
        'Webcam HD 720p C505',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '31',
        'Webcam LifeCam Studio Color',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '31',
        'Webcam Modern Color',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Cargador alternativo para Notebook 5-20V/ 2.25A, Usb tipo C',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Cargador alternativo para Notebook Asus, 65W, 19V, 3.42A, conector 5.5mm*2.5mm',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Cargador alternativo para notebook Asus/MSI, 120W, 19V, 632A, conector 5.5mm*2.5mm',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Cargador alternativo para Notebook Gamer Asus,180W 19V, 9.5A, conector 5.5*2.5mm',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Cargador alternativo para Notebook Gamer Lenovo, 170W 20V, 8.5A, conector USB',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Cargador alternativo para Notebook HP, 45W, 19.5V, 2.31A, conector 4.5mm*3mm C/Cable de Poder',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Docking Portable Ipad Pro',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Docking Portable USB C  UC-301',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '14',
        'Docking Portable USB C  UC-801',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'Cooler para laptop Chill Mat Dual',
        '200',
        '194.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'Docking station USB-C HDMI VGA DOCK419USZ',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'Hub USB 3.0 4 puertos ACH124US',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'HUB USB-C 4 puertos USB-A 3.0 Gris ACH226BT',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'Mochila Targus Drifter II 17.3" Negro/Gris',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'Mochila Targus Octave II 15.6" Azul',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '15',
        'Mochila Targus Octave II 15.6" Morado',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '16',
        'Docking Multifunción 6 en 1 (Type-C a 2USB+TypeC+MicroSD+SD+HDMI)',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '16',
        'Docking Type-C Mini HUB a Type-C + USB 3.0 + Micro SD Gris oscuro',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '16',
        'Soporte para Laptop Negro',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '32',
        'Webcam para Laptop y Desktop Negro',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '17',
        'Base Laptop Xtech hasta 14" con un ventilador grande de 16mm XTA-150',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '17',
        'Base Laptop Xtech hasta 15.6" con 2 ventiladores XTA-155',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '9',
        '17',
        'Docking Laptop Multipuerto USB Tipo C 3 en 1 XTC-565',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '27',
        'Combo Teclado + Mouse MS111 RGB (MS-111-KKMF1-LS)',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '27',
        'Mousepad MP511/CORDURA/XXL Size',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '27',
        'Teclado Gamer mecanico Inalámbrico para juegos MK770 color negro y gris',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '27',
        'Teclado Gamer mecanico Inalámbrico para juegos MK770 modelo "Macaron"',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '33',
        'Mouse Gamer Hourglass Óptico RGB  USB Negro',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '33',
        'Teclado Gamer Centurion Mecánico Ingles',
        '200',
        '139.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '33',
        'Teclado Gamer Volt Mecánico USB Inglés Negro',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '34',
        'Mouse Gamer Pulsefire Core Global USB Negro',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '34',
        'Mouse Pulsefire Haste 2 White',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '34',
        'Mousepad Pulsefire Mat Cloth L',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '34',
        'Teclado Gamer Alloy Origins 60 US HX Aqua',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '34',
        'Teclado Gamer Alloy Origins ABS HX Red',
        '200',
        '619.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '11',
        'Mouse ergonómico inalambrico USB 2.4Ghz y Bluetooth blanco modelo KMB-501BK',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '11',
        'Mouse óptico modelo Furtive compatible con Bluetooth® (KMB-001GR)',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '11',
        'Mouse vertical inalámbrico EverRest - KMW-390',
        '200',
        '63.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '11',
        'Presentador inalámbrico USB 2.4GHz',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '11',
        'Teclado inalámbrico con panel tactil en español KeyGlider modelo KCK-550S',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '11',
        'Teclado premium ergonómico e inalámbrico Transcend modelo KBK-530S',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '12',
        'Mouse Inalámbrico Bluetooth Negro',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Combo Teclado + Mouse MK120 USB Negro',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Combo Teclado + Mouse MK235 Wireless',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Combo Teclado + Mouse Optico MK270 Wireless',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Combo Teclado + Mouse Slim MK470 Wireless',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Combo Teclado + Mouse Slim MK470 Wireless Rosado',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G Pro RGB Hero 25K USB Negro',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G203 RGB Lightsync USB Azul',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G203 RGB Lightsync USB Blanco',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G203 RGB Lightsync USB Negro',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G300S Óptico USB',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G305 Lightspeed Wireless Negro',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G502 RGB Hero 25K USB Negro',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Gamer G502 X Blanco',
        '200',
        '419.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse inalámbrico Bluetooth M240 Rosado',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Logitech inalámbrico M185 Azul',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Logitech inalámbrico M185 Gris',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Logitech inalámbrico M185 Rojo',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse M110 Silent USB Negro',
        '200',
        '32.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse M170 Wireless Negro',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse M280 Wireless Azul',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse M280 Wireless Negro',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse M720 Triathlon Wireless / Bluetooth Negro',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse MX Vertical Ergonomic Wireless Negro',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Pebble M350 Wireless Rose',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Wireless Bluetooth M240 Blanco',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mouse Wireless Bluetooth M240 Negro',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mousepad Gamer Logitech G240 Medium',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mousepad Gamer Logitech G640 Cloth Large',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Mousepad Logitech Deskpad Light Grey',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Presentador Logitech Wireless R400',
        '200',
        '194.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Teclado Gamer G213 Prodigy Membrana Inglés USB',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Teclado K120 USB Negro Español',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Teclado K380 Multi-Device Bluetooth Blanco',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '30',
        'Teclado K380 Multi-Device Bluetooth Rosado',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '35',
        'Mouse Gamer Ahsoka GLADIUS 12400T',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '35',
        'Mouse Gamer Darth Vader GLADIUS 12400T',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '35',
        'MousePad Gamer XXL Ahsoka',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '35',
        'MousePad Medium Ahsoka',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '35',
        'MousePad Medium Primus Darth Vader',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '35',
        'Primus Gaming MousePad XXL con diseño',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse INVADER PRO M719 RGB Wireless Black',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse M607 Griffin Negro',
        '200',
        '94.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse M711 Cobra Negro',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse M719 Invader Negro',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse Redragon GAINER M656 Wireless',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse Redragon K1NG M724 (1K HZ) BLACK',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse Redragon K1NG PRO (1K HZ) Wireless BLACK',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mouse Redragon K1NG PRO (4K HZ) Wireless BLACK',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mousepad FLICK M P030',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mousepad Redragon FLICK L P031',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Mousepad Redragon FLICK XL P032',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Gamer Español Kumara Blanco - Red Switch (K552W-RGB)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Gamer Español Kumara Negro - Blue Switch (K552RGB)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Gamer Español Kumara Negro - Red Switch (K552RGB)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Gamer Español Kumara Rainbow Blanco (K552W-KR-SP)',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Gamer Español Kumara Rainbow Negro (K552-KR-SP)',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Gamer Español Mitra Negro (K551RGB)',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Redragon EISA K686-RGB-PRO Wireless English WB WHITE/BLUE',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '36',
        'Teclado Redragon FIZZ PRO Wireless, Spanish K616-RGB-WG WHITE/GREY',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '14',
        'Combo Teclado + Mouse  USB Negro KM-500',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '14',
        'Funda con Teclado para iPad Pro 12.9"',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '14',
        'Mouse Óptico USB Negro MS-500',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '14',
        'Mouse Óptico Wireless Negro MS-600W',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '14',
        'Teclado KB-500 con Number Pad USB Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '14',
        'Teclado KB-700W  Multimedia Wireless Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '37',
        'Combo Teros Teclado, Mouse, MousePad y Audífonos Headset (TE4063) + Mochila ACS9017 15.6" Negra (TE9017)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '37',
        'Combo Teros Teclado, Mouse, MousePad y Audífonos Headset (TE4063) + Mochila ACS9018 15.6" Negra (TE9018)',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '15',
        'Mouse Targus inalámbrico B584 Bluetrace Ergonómico Negro AMW584GL',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '15',
        'Mouse Targus inalámbrico Negro AMW575',
        '200',
        '64.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '15',
        'Mouse Targus óptico USB Negro AMU80US',
        '200',
        '31.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '15',
        'Presentador inalámbrico con puntero láser AMP16US',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '32',
        'Mouse Óptico Wireless Blanco',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '32',
        'Mouse Óptico Wireless Negro',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '32',
        'Mouse Óptico Wireless Rosado',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Alfombrilla para mouse Edición Spider-Man Miles Morales tamaño XL (XTA-M190SM)',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mouse Galos Wireless de 4 botones Negro XTM-310',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mouse Gamer De 6 botones Blue Venom XTM-710',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mouse Óptico con cable Negro XTM-165',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mouse Pad Negro - Xtech tamaño S',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mouse Wireless de 4 botones Negro XTM-300',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mousepad Gamer Xtech STRATEGA 100% Poliester XTA-182',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Mousepad Xtech de gel con apoyo para la muñeca XTA-526',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Teclado estándar XTK-092S Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Teclado Gamer Armiger con iluminación LED Multicolor XTK-510S',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Teclado Gamer Chevalier XTK-505S',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Teclado multimedia XTK- 130 Negro',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '10',
        '17',
        'Xtech Marvel Spider-Man Mouse óptico de 7 botones para videojuegos XTM-M520SM',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '11',
        '38',
        'Tableta Digitalizadora One By Wacom Medium Negra',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '11',
        '38',
        'Tableta Digitalizadora Wacom Intuos Medium Verde Pistacho',
        '200',
        '929.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '11',
        '38',
        'Tableta Digitalizadora Wacom Intuos Small Negra',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '11',
        '38',
        'Tableta Digitalizadora Wacom One - Small',
        '200',
        '449.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 3 4100 3.8/4Ghz 4MB_Cache AM4',
        '200',
        '309.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 5300G 4.0/4.2Ghz 16MB_Cache AM4 Video_Radeon ',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 5500 3.6/4.2Ghz 16MB_Cache AM4  ',
        '200',
        '459.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 5600 3.5/4.4Ghz 32MB_Cache AM4',
        '200',
        '619.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 5600G 3.9/4.4Ghz 16MB_Cache AM4 Video_Radeon ',
        '200',
        '619.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 5600GT 3.6/4.6Ghz 16MB_Cache AM4 Video_Radeon ',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 5600X 3.7/4.6Ghz 32MB_Cache AM4 ',
        '200',
        '759.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 7600 3.8/5.1Ghz 32MB_Cache AM5 Video_Radeon ',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 7600X 4.7/5.3Ghz 32MB_Cache AM5 Video_Radeon s/cooler',
        '200',
        '1129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 8500G 3.5/5.0Ghz 16MB_Cache AM5 Video_Radeon™740M ',
        '200',
        '939.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 8600G 4.3/5.0Ghz 16MB_Cache AM5 Video_Radeon™760M ',
        '200',
        '1199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 5 9600X 3.90 / 5.40 GHz, 32MB L3 Cache, 6-Cores, 4nm, TDP: 65W',
        '200',
        '1279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 7 5700G 3.8/4.6Ghz 16MB_Cache AM4 Video_Radeon',
        '200',
        '759.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 7 5700X 3.5/4.6Ghz 32MB_Cache AM4  s/cooler',
        '200',
        '829.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 7 7700X 4.5/5.4Ghz 32MB_Cache AM5 Video_Radeon s/cooler',
        '200',
        '1649.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 7 8700G 4.2/5.1Ghz 16MB_Cache AM5 Video_Radeon™780M ',
        '200',
        '1729.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 7 9700X 3.80 / 5.50 GHz, 32MB L3 Cache, 8-Cores, 4nm, TDP: 65W',
        '200',
        '1779.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '25',
        'Procesador AMD Ryzen 9 7900X 4.7/5.6Ghz 64MB_Cache AM5 Video_Radeon s/cooler',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i3-10105 3.7/4.4Ghz 6MB_Cache LGA1200 Video Intel UHD',
        '200',
        '449.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i3-12100F 3.3/4.3Ghz 12MB_Cache LGA1700 ',
        '200',
        '449.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i3-13100 3.4/4.5Ghz 12MB_Cache LGA1700 Video Intel UHD',
        '200',
        '729.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i5-10400 2.9/4.3Ghz 12MB_Cache LGA1200 Video Intel UHD',
        '200',
        '639.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i5-12400 2.5/4.4Ghz 18MB_Cache LGA1700  ',
        '200',
        '749.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i5-12400F 2.5/4.4Ghz 18MB_Cache LGA1700  ',
        '200',
        '579.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i5-13400 hasta 4.60Ghz 20MB_Cache LGA1700 Video Intel UHD',
        '200',
        '1189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i5-14600K hasta 5.3Ghz 24MB_Cache LGA1700 Video Intel UHD s/cooler',
        '200',
        '1629.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i7-12700F hasta 4.9Ghz 25MB_Cache LGA1700',
        '200',
        '1279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i7-13700 hasta 5.2Ghz 30MB_Cache LGA1700 Video Intel UHD',
        '200',
        '2169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i7-13700F hasta 5.2Ghz 30MB_Cache LGA1700',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i7-14700F hasta 5.4Ghz 33MB_Cache LGA1700',
        '200',
        '1799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i7-14700K hasta 5.6Ghz 33MB_Cache LGA1700 Video Intel UHD s/cooler',
        '200',
        '2499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i7-14700KF hasta 5.6Ghz 33MB_Cache LGA1700  s/cooler',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i9-11900 2.5/5.5Ghz 16MB_Cache LGA1200 Video Intel UHD ',
        '200',
        '1359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i9-13900F hasta 5.6Ghz 36MB_Cache LGA1700  s/cooler',
        '200',
        '3199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i9-14900K hasta 6.0Ghz 36MB_Cache LGA1700 Video Intel UHD s/cooler',
        '200',
        '3499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core  i9-14900KF hasta 6.0Ghz 36MB_Cache LGA1700  s/cooler',
        '200',
        '3399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core i5-11400 2.6/4.4Ghz 12MB_Cache LGA1200 Video Intel UHD',
        '200',
        '659.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core i5-13400F hasta 4.60Ghz 20MB_Cache LGA1700',
        '200',
        '899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '12',
        '39',
        'Procesador Intel Core i5-14400F hasta 4.70Ghz 20MB_Cache LGA1700',
        '200',
        '1069.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'ASUS Placa ProArt B760-CREATOR WIFI DDR5 LGA 1700',
        '200',
        '1229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus H510M-K R2.0 mATX DDR4 (Para Intel Socket LGA1200)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME A520M-A II/CSM mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME A620M-A-CSM mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '649.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME B550M-A AC (Para AMD socket AM4)',
        '200',
        '519.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME B650M-A AX II mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '859.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME B760M-A CSM mATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME H610M-K D4 mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME X870-P WIFI DDR5 (Para AMD Socket AM5)',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME Z790-P mATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PRIME Z790M-PLUS mATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '1059.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus PROART X670E-CREATOR WIFI ATX DDR5 (Para AMD Socket AM5)',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus ROG STRIX X670E-E GAMING WIFI ATX DDR5 (Para AMD Socket AM5)',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre ASUS TUF GAMING B550M-PLUS WIFI II mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '839.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus TUF Gaming B650M-PLUS WiFi mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '779.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus TUF Gaming X570-PLUS (WI-FI) ATX DDR4 (Para AMD Socket AM4)',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre Asus TUF Gaming Z790-PLUS WIFI ATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '19',
        'Placa Madre ROG STRIX Z790-A GAMING WIFID4 ATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '1599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Gigabyte Motherboard Z790 EAGLE AX G10 DDR5 4 DIMM',
        '200',
        '1159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte  B760M DS3H mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte  Z790 AORUS ELITE AX ATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte  Z790 UD AC ATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte A520M-K V2 mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte B450M DS3H V2 mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte B550 GAMING X V2 mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '569.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte B550M-K mATX DDR4 (para AMD Socket AM4)',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte B650M K mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte B760 GAMING X AX ATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte H510M K V2 mATX DDR4 (Para Intel Socket LGA1200)',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '21',
        'Placa Madre Gigabyte H610M H V2 G10 mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI  B450M PRO-VDH MAX mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI  B650M GAMING PLUS WIFI mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '829.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI B450M-A PRO MAX II',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI B760M GAMING PLUS WIFI mATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI MAG B550 Tomahawk ATX DDR4 (Para AMD Socket AM4)',
        '200',
        '899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI MAG B760 TOMAHAWK WIFI mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '1019.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI MAG B760M MORTAR WIFI mATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '979.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO A520M-A mATX DDR4 (Para AMD Socket AM4)',
        '200',
        '269.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO A620M-E mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO B650M-P mATX DDR5 (Para AMD Socket AM5)',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO B760M-E DDR4 mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO B760M-P DDR4 mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO B760M-P DDR5 mATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '569.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO H610M-G DDR4 mATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '369.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO Z790-P DDR4 ATX DDR4 (Para Intel Socket LGA1700)',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '13',
        '24',
        'Placa Madre MSI PRO Z790-P WIFI ATX DDR5 (Para Intel Socket LGA1700)',
        '200',
        '1159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '40',
        'Memoria RAM XPG LANCER DDR5 16Gb 5200MT/s Black para PC (soporta Intel XMP 3.0 y AMD EXPO)',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '40',
        'Memoria RAM XPG SPECTRIX D50 (ROG) DDR4 16Gb (2x8) 3600MT/s mirror black para PC (soporta Intel XMP 3.0 y AMD EXPO)',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '41',
        'KIT memoria RAM Corsair DOMINATOR PLATINUM RGB DDR5 64Gb (2x32) 6000MT/s Black para PC',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '41',
        'KIT memoria RAM Corsair VENGEANCE RGB DDR5 64Gb (2x32) 6000MT/s White para PC',
        '200',
        '1199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '41',
        'Memoria RAM Corsair VENGEANCE RGB DDR4 16Gb 3200Mhz Black para PC',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '22',
        'Memoria RAM HP V6 Series DDR4 16Gb 3200MHz Black para PC',
        '200',
        '169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '22',
        'Memoria RAM HP V6 Series DDR4 8Gb 3200MHz Black para PC',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '22',
        'Memoria RAM HP V8 Series RGB DDR4 16Gb 3200HHz Black para PC',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '22',
        'Memoria RAM HP V8 Series RGB DDR4 8Gb 3200MHz Black para PC',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '22',
        'Memoria SO-DIMM HP S1 DDR4 16Gb 3200Mhz para laptop',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '22',
        'Memoria SO-DIMM HP S1 DDR4 8Gb 3200Mhz para laptop ',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 128GB microSDXC (100MB/s) UHS-I U1 A1 Canvas Select Plus',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 128GB microSDXC (170MB/s) A2 U3 V30 Canvas Go! Plus',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 256GB microSDXC (170MB/s) A2 U3 V30 Canvas Go! Plus',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 512GB microSDXC (100MB/s) UHS-I U3 V3 A1 Canvas Select Plus',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 64GB microSDXC (100MB/s) UHS-I U1 A1 Canvas Select Plus',
        '200',
        '21.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 64GB microSDXC (170MB/s) A2 U3 V30 Canvas Go! Plus',
        '200',
        '35.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria Flash 64GB SDXC (100MB/s) UHS-I U1 Canvas Select Plus',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston KVR DDR3 4Gb 1600MHz para PC',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston KVR DDR3 8Gb 1600MHz  para PC',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston KVR DDR4 8Gb 2666MHz  para PC',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KCP DDR4 16Gb 3200Mhz para laptop',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KCP DDR4 8Gb 2666Mhz para laptop',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KCP DDR4 8Gb 3200Mhz para laptop',
        '200',
        '124.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KCP DDR5 32Gb 4800MT/s para laptop',
        '200',
        '549.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KVR DDR4 16Gb 3200Mhz para laptop',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KVR DDR4 4Gb 2666Mhz para laptop',
        '200',
        '84.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KVR DDR4 8Gb 3200Mhz para laptop',
        '200',
        '139.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KVR DDR5 32Gb 4800MT/s para laptop ',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston KVR DDR5 8Gb 4800MT/s para laptop',
        '200',
        '184.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 128GB USB 3.2 DataTraveler Exodia',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 128GB USB 3.2 DataTraveler Exodia M red',
        '200',
        '41.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 128GB USB 3.2 DataTraveler Exodia onyx black',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 128GB USB 3.2 DT70 Tipo-C',
        '200',
        '41.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 128GB USB 3.2 DTKN',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 256GB USB 3.2 DataTraveler Exodia',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 32GB USB 3.2 DataTraveler Kyson',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 64GB USB 3.2 DataTraveler Exodia blue',
        '200',
        '21.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 64GB USB 3.2 DataTraveler Exodia white',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 64GB USB 3.2 DT70 Tipo-C',
        '200',
        '21.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria USB 64GB USB 3.2 DTKN',
        '200',
        '41.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR4 8Gb 3200MHz Black para PC',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR4 8Gb 3600MHz Black para PC',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR5 16Gb 5200MT/s White para PC (soporta Intel XMP 3.0 y AMD EXPO)',
        '200',
        '214.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR5 16Gb 5600MT/s Black para PC (soporta Intel XMP 3.0)',
        '200',
        '269.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR5 32Gb 5200MT/s Black para PC (soporta Intel XMP 3.0)',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR5 8Gb 4800MT/s Black para PC',
        '200',
        '184.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast DDR5 8Gb 5600MT/s Black para PC (soporta Intel XMP 3.0)',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast RGB DDR4 16Gb 3200Mhz Black para PC (soporta Intel XMP 2.0)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast RGB DDR4 16Gb 3600MHz Black para PC',
        '200',
        '244.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast RGB DDR4 8Gb 3200MHz Black para PC',
        '200',
        '124.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast RGB DDR4 8Gb 3200Mhz Black para PC (soporta Intel XMP 2.0)',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast RGB DDR5 16Gb 5600MT/s Black para PC',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Beast RGB DDR5 16Gb 6000MT/s Black para PC',
        '200',
        '324.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Renegade RGB DDR5 16Gb 6400MT/s Black para PC (soporta Intel XMP 3.0)',
        '200',
        '419.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria RAM Kingston FURY Renegade RGB DDR5 32Gb 6000MT/s Silver para PC',
        '200',
        '679.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston FURY DDR4 16Gb 3200Mhz para laptop',
        '200',
        '214.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '42',
        'Memoria SO-DIMM Kingston FURY DDR4 8Gb 3200Mhz para laptop ',
        '200',
        '114.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '43',
        'Memoria Flash 64GB microSDHC (100MB/s) UHS-I U1',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '43',
        'Memoria Flash SanDisk MicroSD Nintendo Switch 128GB',
        '200',
        '139.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '43',
        'Memoria USB 32GB USB 2.0 Cruzer Blade',
        '200',
        '16.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '44',
        'Memoria RAM TeamGroup Vulcan Z DDR5 32Gb (2x16) 5200MT/s Red para PC (soporta Intel XMP 3.0)',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '14',
        '16',
        'Memoria USB Rotable TypeC+USB3.0 64GB',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video ASUS Dual GeForce RTX 4060 OC Edition 8GB GDDR6 White',
        '200',
        '1679.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus Dual Geforce RTX3050 v2 8Gb GDDR6 128-bit OC_Edition',
        '200',
        '1169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus DUAL Geforce RTX3060 12Gb GDDR6 192-bit V2 OC_Edition',
        '200',
        '1569.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus DUAL Geforce RTX3060 8Gb GDDR6 128-bit WHITE Edition',
        '200',
        '1559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus DUAL Geforce RTX4060Ti 8Gb GDDR6 128-bit OC Edition',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus DUAL Geforce RTX4070 Super 12Gb GDDR6X 192-bit OC_Edition',
        '200',
        '3199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video ASUS GEFORCE RTX4070 ASUS PROART 12G GDDR6X',
        '200',
        '2899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video ASUS Radeon RX 7600 8GB GDDR6',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video ASUS RADEON RX7700XT ASUS DUAL 12GB 192-bit',
        '200',
        '2299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus ROG Strix Geforce RTX4060 8Gb GDDR6 192-bit OC_Edition',
        '200',
        '2099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video ASUS TUF Gaming GeForce RTX 4060 Ti 8GB GDDR6 OC Edition',
        '200',
        '2399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '19',
        'Tarjeta de video Asus TUF Geforce RTX4080 16Gb GDDR6X 256-bit OC_Edition',
        '200',
        '7099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '21',
        'Tarjeta de video Gigabyte GAMING Geforce RTX3060 12Gb GDDR6 192-bit OC_Edition',
        '200',
        '1699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '21',
        'Tarjeta de video Gigabyte Radeon RX7600XT 16GB GDDR6 GAMING',
        '200',
        '1799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '21',
        'Tarjeta de video Gigabyte RTX4070 Super EAGLE GDDR6X 12Gb',
        '200',
        '3299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'GeForce RTX 4060 Ti VENTUS 2X BLACK 8G OC',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video GEFORCE MSI RTX 4080 SUPER VENTUS 3X OC 16GB',
        '200',
        '5449.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI GAMING_X_SLIM black Geforce RTX4060Ti 16Gb GDDR6 128-bit',
        '200',
        '2599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI GeForce RTX 3060 VENTUS 2X 12G OC, 12GB GDDR6',
        '200',
        '1549.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI GeForce RTX 4060 Ti GAMING X 8G, 8GB GDDR6',
        '200',
        '2199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI GeForce RTX 4080 SUPER 16Gb GAMING X SLIM GDDR6X 256Bits',
        '200',
        '5699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI Radeon RX7600 MECH 2X Classic 8Gb Gddr6 128Bit',
        '200',
        '1399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI RTX4060 VENTUS 2X black 8Gb Gddr6',
        '200',
        '1559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI RTX4060Ti VENTUS 3X black 16Gb Gddr6',
        '200',
        '2559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI Ventus_2X Geforce RTX4070 Super 12Gb GDDR6X 192-bit OC_Edition',
        '200',
        '3099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI Ventus_3X Geforce RTX4070 12Gb GDDR6X 192-bit OC_Edition',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '24',
        'Tarjeta de video MSI Ventus_3X Geforce RTX4070 Super 12Gb GDDR6X 192-bit OC_Edition',
        '200',
        '3199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '45',
        'Tarjeta de video RADEON™ XFX SPEEDSTER SWFT210 RADEON RX 7600XT 16Gb',
        '200',
        '1849.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '45',
        'Tarjeta de video XFX Radeon RX6650XT 8Gb GDDR6 128Bit SPEEDSTER SWFT210',
        '200',
        '1259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '15',
        '46',
        'ZOTAC GAMING GEFORCE RTX 4060 Ti 8GB TWIN EDGE OC GDDR6, 128bit, 2550/18000, HDCP, Three DP, HDMI, Medium Pack',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '41',
        'Unidad SSD Corsair PRO LPX 1Tb PCIe Gen4 M.2 c/disipador de bajo perfil Para PC y PS5',
        '200',
        '489.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '41',
        'Unidad SSD Corsair PRO XT 1Tb PCIe Gen4 M.2 c/disipador de aluminio alto Para PC',
        '200',
        '559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '22',
        'Unidad SSD HP EX900 1Tb PCIe Gen3 M.2  Para PC y laptop',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '22',
        'Unidad SSD HP EX900 500Gb PCIe Gen3 M.2  Para PC y laptop',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '22',
        'Unidad SSD HP EX900Plus 256Gb PCIe Gen3 M.2 Para PC y laptop',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad de estado sólido externa (SSD) XS1000 de 1Tb con conexión USB 3.2 Gen 2 color negro',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad de estado sólido externa (SSD) XS1000 de 2Tb con conexión USB 3.2 Gen 2 color negro',
        '200',
        '559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad de estado sólido externa (SSD) XS1000R de 1Tb con conexión USB 3.2 Gen 2 color rojo',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston A400 480Gb Sata3 2.5"  Para PC y laptop ',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston A400 960Gb Sata3 2.5"  Para PC y laptop ',
        '200',
        '269.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston KC3000 1Tb PCIe Gen4 M.2 c/difusor de calor Para PC, laptop',
        '200',
        '519.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston KC3000 2Tb PCIe Gen4 M.2 c/difusor de calor Para PC, laptop',
        '200',
        '849.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston KC600 2048Gb Sata3 2.5" Para PC y laptop',
        '200',
        '869.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston NV2 1Tb PCIe Gen4 M.2  Para PC y laptop ',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston NV2 250Gb PCIe Gen4 M.2  Para PC y laptop ',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston NV2 2Tb PCIe Gen4 M.2 Para PC y laptop',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston NV2 500Gb PCIe Gen4 M.2  Para PC y laptop',
        '200',
        '169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Sólido Externa 1TB XS2000 Plateado',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 1Tb PCIe Gen4 M.2 c/difusor de calor Para PC y laptop',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 1Tb PCIe Gen4 M.2 c/disipador de calor Para PC y PS5',
        '200',
        '579.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 2Tb PCIe Gen4 M.2 c/disipador de calor Para PC y PS5',
        '200',
        '829.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 2Tb PCIe Gen4 M.2 Para PC, laptop y PS5',
        '200',
        '849.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 4Tb PCIe Gen4 M.2 c/disipador de calor Para PC y PS5',
        '200',
        '1899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 500Gb PCIe Gen4 M.2 c/disipador de calor Para Laptop y  PC',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '42',
        'Unidad SSD Kingston Fury Renegade 500Gb PCIe Gen4 M.2 Para PC y laptop',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '47',
        'Disco Externo Mecánico HDD 1TB 2.5" USB 3.0 Basic Negro',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '14',
        'Cofre 2.5" HDD SATA USB 3.0 Aluminio - SP-M250',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '14',
        'Cofre 2.5" HDD SATA USB 3.0 Plástico - SP-P250',
        '200',
        '34.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '48',
        'Disco Duro Laptop 1TB Sata 3 2.5" L200',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '48',
        'Disco Externo Mecánico HDD 1TB 2.5" USB 3.0 Canvio Basics Negro',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '48',
        'Disco Externo Mecánico HDD 4TB 2.5" USB 3.0 Canvio Advance Negro',
        '200',
        '649.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '48',
        'Disco Externo Mecánico HDD 4TB 2.5" USB 3.0 Canvio Basics Negro',
        '200',
        '489.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Duro PC WD 2TB BLUE',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Duro PC WD NAS 10TB Red Plus',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Duro PC WD NAS 4TB Red Plus',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Duro PC WD NAS 6TB Red Plus',
        '200',
        '799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Duro PC WD NAS 8TB Red Plus',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Externo Mecánico HDD 1TB 2.5" USB 3.0 Elements Negro',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Externo Mecánico HDD 2TB 2.5" USB 3.0 Elements Negro ',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Disco Externo Mecánico HDD 5TB 2.5" USB 3.0 Elements Negro',
        '200',
        '569.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD Sólido Externa 1TB Elements SE Negro',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD Sólido Externa 2TB Elements SE Negro',
        '200',
        '659.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD Sólido Externa 480GB Elements SE Negro',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD black SN770 1Tb PCIe Gen4 M.2  Para PC y laptop ',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD black SN770 500Gb PCIe Gen4 M.2 Para PC y laptop',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD blue SN580 1Tb PCIe Gen4 M.2 Para PC y laptop',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD green SATA 480Gb Sata3 2.5" Para PC y laptop',
        '200',
        '139.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD green SN350 1Tb PCIe Gen3 M.2 Para PC y laptop ',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD green SN350 250Gb PCIe Gen3 M.2  Para PC y laptop ',
        '200',
        '154.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '16',
        '49',
        'Unidad SSD WD green SN350 500Gb PCIe Gen3 M.2 Para PC y laptop ',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'CASE ANTRYX FX 740 BLACK, ARGB FAN X3, USB TIPO-C (AC-FX740K)',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'CASE ANTRYX RX 560 BLACK, ARGB FAN X3, VIDRIO TEMPLADO (AC-RX560K)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx Case NEO II (500W)',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx FX CRUISER WHITE',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx FX950 White',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx RX-250 Black c/vidrio templado, USB3.0, FRGB, FANx4 (con malla frontal)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx RX-260 Black c/vidrio templado, USB3.0, FRGB, FANx4',
        '200',
        '209.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx Xtreme micro XM-330 (500w)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '26',
        'Gabinete Antryx Xtreme micro XM-420 (500w)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '19',
        'Gabinete sin fuente ASUS TUF Gaming GT301 ARGB BLACK',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '19',
        'Gabinete sin fuente ASUS TUF Gaming GT502, Mid-Tower, ATX, Negro',
        '200',
        '869.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '27',
        'Gabiente sin fuente HAF 500 ATX Blanco (H500-WGNN-S00)',
        '200',
        '589.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '27',
        'Gabinete con Fuente ATX B600L V2 ODD + FDP 500W ELITE NEX',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '27',
        'Gabinete Cooler Master Masterbox 520 Mesh white',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '27',
        'Gabinete Cooler Master Qube 500 Flatpack black',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '27',
        'Gabinete Cooler Master Qube 500 Flatpack White',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '27',
        'Gabinete sin fuente MasterBox 520 Mesh Negro (MB520-KGNN-S00)',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '41',
        'Gabinete sin fuente c/vidrio templado Airflow 5000D blanco',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '41',
        'ICUE 5000T RGB TEMPERED GLASS MIDTW BK',
        '200',
        '1249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '41',
        'ICUE 5000T RGB TEMPERED GLASS MIDTW WH',
        '200',
        '1259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '41',
        'ICUE 5000X RGB TEMPERED GLASS MIDT BLACK',
        '200',
        '669.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '41',
        'ICUE 5000X RGB TEMPERED GLASS MIDTOW WH',
        '200',
        '659.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '50',
        'Gabinete sin fuente Cougar MX360 black con RGB',
        '200',
        '209.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabiente sin fuente CC560 Mid-Tower ATX Negro',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabiente sin fuente CC560 Mid-Tower ATX Negro ARGB',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabinete CH560 DIGITAL white',
        '200',
        '629.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabinete sin fuente Cyclops ATX Blanco con ARGB',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabinete sin fuente Cyclops ATX Negro con ARGB',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabinete sin fuente MATREXX 40 3FS',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabinete sin fuente MATREXX 50 4F A-RGB Mid-Tower Negro',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '28',
        'Gabinete sin fuente MATREXX 70 3F Mid-Tower Negro',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '51',
        'Gabinete sin Fuente mATX 230W G08',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '51',
        'Gabinete sin fuente S610 SLIM mATX ',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '24',
        'Gabinete sin fuente MAG VAMPIRIC 100R ATX Mid Tower ARGB',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '24',
        'Gabinete sin fuente MPG GUNGNIR 111R Mid-Tower ATX Negro',
        '200',
        '459.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '37',
        'Case ATX 250W TE1075N',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '37',
        'Case ATX 250W TE1076N',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '17',
        '37',
        'Case ATX 450W TE1149N',
        '200',
        '144.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '26',
        'Fuente de poder Antryx 500W reales ATX 2.3 B500 V3',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '26',
        'Fuente de poder Antryx 550W 80+ bronce ATX 2.3 (FP550)',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '26',
        'Fuente de poder Antryx 650W 80+ bronce ATX 2.31',
        '200',
        '224.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '26',
        'Fuente de poder Antryx Kirin 80+ bronze ATX 2.3 750W',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '27',
        'Fuente de poder Cooler  Master MWE BRONZE V2 230V 750W A/US CABLE ',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '27',
        'Fuente de Poder Cooler Master MWE Bronze V2 650W A/US CABLE MPE-6501-ACAAB-US	',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '27',
        'Fuente de Poder Cooler Master MWE Gold V2 FM1250W ATX3.0 MPE-C501-AFCAG-3U2	',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '27',
        'Fuente de Poder Cooler Master MWE Gold V2, FM 1050W ATX3.0 MPE-A501-AFCAG-3U2	',
        '200',
        '919.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '27',
        'Fuente de poder CoolerMaster 750W V3 80+ bronce ATX 3.1',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '50',
        'Fuente de Poder Cougar Atlas 650W 80 Plus Bronze',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '50',
        'Fuente de Poder Cougar Atlas 750W 80+ Plus Bronze',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '50',
        'Fuente de Poder Cougar GEX X2 Modular de 850W 80+ Plus Gold',
        '200',
        '589.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '21',
        'Fuente de Poder Gigabyte 1000W UD 80Plus Gold FM ATX3.0',
        '200',
        '759.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '21',
        'Fuente de Poder Gigabyte 850W 80+G FM PCI-EG5',
        '200',
        '479.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '21',
        'Fuente de Poder UD1000GM PG5, 1000W, 80 PLUS Gold Certified, Formato ATX',
        '200',
        '849.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '24',
        'Fuente de Poder MSI MPG A750G PCIE5',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '24',
        'Fuente de Poder MSI MPG A850G PCIE5',
        '200',
        '569.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '14',
        'Fuente de Poder 500W',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '14',
        'Fuente de Poder 650W',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '14',
        'Fuente de Poder 650W mITX',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '14',
        'Fuente de Poder 800W',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '37',
        'Fuente de Poder Teros ATX 600W 80 Plus Bronze 100-240VAC',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '18',
        '37',
        'Fuente de Poder Teros MATX 600W 115V/230V',
        '200',
        '64.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '26',
        'PASTA TERMICA ANTRYX TP-580, 1.5GR (ATP580-1P5GR)',
        '200',
        '21.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '26',
        'PASTA TERMICA ANTRYX TP-900 PRO, 2GR (ATP900P-2GR)',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '26',
        'SISTEMA DE ENFRIAMIENTO LIQUIDO TRITON INFINITY 240 BLACK, ARGB',
        '200',
        '369.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '26',
        'SISTEMA DE ENFRIAMIENTO LIQUIDO TRITON INFINITY 360 BLACK, ARGB',
        '200',
        '489.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'Refrigeración de CPU Hyper 212 RGB Black Edition con LGA1700 (RR-212S-20PC-R2)',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'Refrigeración de CPU Hyper 212 Spectrum V3 (RR-S4NA-17PA-R1)',
        '200',
        '124.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'Refrigeración líquida de CPU MasterLiquid 240L Core Blanco ARGB (MLW-D24M-A18PZ-RW)',
        '200',
        '439.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'Refrigeración líquida de CPU MasterLiquid 240L Core Negr ARGB (MLW-D24M-A18PZ-R1)',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'Refrigeración líquida de CPU MasterLiquid 360L Core ARGB (MLW-D36M-A18PZ-R1)',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'Refrigeración líquida de CPU MasterLiquid 360L Core ARGB White',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '27',
        'SickleFlow 120 ARGB 3 in 1 black (Pack x 3 unid)',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '41',
        'Ventilador individual PWM de 120 mm iCUE QL120 RGB',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '41',
        'Ventilador RGB LED PWM con doble halo de luz LL140 RGB pack x2 ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '50',
        'Refrigeración de CPU  Cougar Air Cooler FORZA 85 ESSENTIAL',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '50',
        'Refrigeración de CPU Cougar Air Cooler FORZA 50 ESSENTIAL',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Disipador CPU AG400',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Disipador CPU AK400',
        '200',
        '159.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Disipador CPU GAMMAXX 300 ',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Pasta Térmica EX750 5g',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Refrigeración de CPU AG200',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Refrigeración de CPU AG400 ARGB',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Refrigeración de CPU SIST. LIQUIDO GAMMAXX L240 A-RGB WH',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'refrigeración líquida para CPU LE720 ARGB black de 360mm',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Refrigeración liquida para CPU modelo LE520 ARGB de 240mm black',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Refrigeración liquida para CPU modelo LE520 WH ARGB de 240mm blanco',
        '200',
        '369.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador CF120 PLUS (3 en 1) 120 mm. Blanco',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador MF 120 GT 120 mm. RGB',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador RF120 BLUE VENT. CPU 120 mm. LED AZUL',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador RF120 FS (3 en 1)  120 mm.',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador RF120 FS Single 3 colores 120 mm.',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador RF120 RED VENT. CPU 120mm. LED ROJO',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador RF120 SINGLE VENT. CPU 120 mm. RGB',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '28',
        'Ventilador XFAN 120 CPU 120mm',
        '200',
        '14.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '24',
        'Refrigeración líquida de CPU MAG CORELIQUID C240',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '24',
        'Refrigeración líquida de CPU MAG CORELIQUID P240',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '14',
        'Pasta Termal Mr. Grey - 30g',
        '200',
        '31.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '37',
        'Refrigeración líquida de CPU TEROS TE8163N 120 Negro',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '19',
        '37',
        'Refrigeración líquida de CPU TEROS TE8164N 240 Negro',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '27',
        'Silla Gamer CALIBER R3 BLACK color negro y gris',
        '200',
        '899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '27',
        'Silla Gamer CALIBER R3 PURPLE color negro y gris con borde purpura',
        '200',
        '999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer ARMOR ELITE BLACK color negro de cuero PU',
        '200',
        '729.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer ARMOR ELITE color negro con bordes naranja de cuero PU',
        '200',
        '729.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer ARMOR ELITE EVA color negro y rosado de cuero PU',
        '200',
        '729.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer ARMOR ELITE WHITE color gris y blanco de cuerpo PU',
        '200',
        '729.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer FUSION S color negro con bordes naranja de cuero PU',
        '200',
        '559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer FUSION S color negro de cuero PU',
        '200',
        '549.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer FUSION SF color negro con bordes naranja de tejido transpirable de PVC',
        '200',
        '559.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '50',
        'Silla gamer modelo HOTROD color negro y naranja de fibra de vidrio y Cuero sintético Hyper-Durable ',
        '200',
        '1069.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '12',
        'Silla gamer con luces LED y base metálica ergonómica ajustable',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '12',
        'Silla Gamer con Masajeador Lumbar Negra',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '12',
        'Silla Gamer con Masajeador Lumbar Rosada',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '12',
        'Silla gamer con masajeador lumbar, reposapies y base metalica color Azul y negro',
        '200',
        '569.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '12',
        'Silla gamer morada con masajeador lumbar, reposapiés y base metálica',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '52',
        'Silla Gamer Guardian Roja',
        '200',
        '449.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '53',
        'Silla Playseat Puma Active',
        '200',
        '669.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '53',
        'Simulador Playseat Trophy',
        '200',
        '3799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '53',
        'Simulador Playseat Trophy by Logitech',
        '200',
        '3759.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '20',
        '17',
        'Silla Gamer Edicion Spider-Man Miles Morales color negro y rojo',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '21',
        '28',
        'Controlador Periférico FH-04',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '21',
        '14',
        'Caddy SSD 9,5mm A100',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '54',
        'Smart TV 55" UHD LED Roku (55U6125)',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '55',
        'Smart TV Philips 50" UHD Ambilight 50PUD7908',
        '200',
        '1899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '55',
        'Smart TV Philips 65" UHD Ambilight 65PUD7908',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '55',
        'Smart TV Philips 75" UHD Ambilight 75PUD7908',
        '200',
        '3499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '5',
        'Smart TV Samsung 50" Neo QLED 4K Mini LED QN50QN90BAGXPE',
        '200',
        '2899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '56',
        'Smart TV TCL 50" Google TV 50C655 QLED 4K Ultra HD',
        '200',
        '1249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '56',
        'Smart TV TCL 55" Google TV 55C655 QLED 4K Ultra HD',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '56',
        'Smart TV TCL 55" Google TV 55P635 4K Ultra HD',
        '200',
        '1199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '56',
        'Smart TV TCL 65" Google TV 65C655 QLED 4K Ultra HD',
        '200',
        '1949.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '56',
        'Smart TV TCL 65" Google TV 65C755 Mini-LED 4K Ultra HD',
        '200',
        '2849.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '22',
        '56',
        'Smart TV TCL 75" Google TV 75C655 QLED 4K Ultra HD',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '23',
        '57',
        'Barra de Sonido Cinema SB170 Negro',
        '200',
        '1199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '23',
        '58',
        'Roku Streaming Express 3960MX',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '23',
        '58',
        'Roku Streaming Express 4K 3940MX',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '23',
        '58',
        'Roku Streaming Stick 4K 3820MX',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '8',
        'Cable Video HDMI Macho a HDMI Macho 2m Negro',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Adaptador de DVI-I macho a VGA hembra Negro',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Adaptador HDMI Hembra a HDMI Macho 90° Negro',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Adaptador Mini Display Port macho a HDMI Hembra Blanco',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Adaptador Video Tipo C a VGA 0.15m Blanco',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI  3m Negro',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI 1.8m Negro',
        '200',
        '14.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI 1.8m Negro',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI 10m Negro',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI 3m Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI 3m Turquesa',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video HDMI a HDMI 5m Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video VGA a VGA 1.8m Negro',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Cable Video VGA macho a VGA macho 1.8m Negro',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Soporte TV Articulado 26” a 55” / S055A',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '14',
        'Soporte TV inclinable 32” – 70” S070I',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '16',
        'Cable Video Trenzado HDMI a HDMI 3m Negro',
        '200',
        '59.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Adaptador HDMI Hembra a HDMI Hembra Negro',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Cable Video HDMI Macho a HDMI Macho 1.8m Negro',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Cable Video HDMI macho a HDMI macho 3m Negro',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Cable Video HDMI Macho a HDMI Macho 4.5m Negro',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Cable Video HDMI Macho a HDMI Macho 7.6m Negro',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Cable Video Tipo C Macho a DisplayPort Hembra 10cm Blanco',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Cable Video VGA Macho a VGA Macho 1.8m Negro',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Soporte TV de 32" a 70" con inclinación de hasta 10° XTA-375',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '24',
        '17',
        'Soporte TV de 32" a 90" con inclinación de hasta 10° XTA-380',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '19',
        'Consola Portátil ROG Ally AMD Z1 Extreme 512GB SSD 16GB 7" FHD IPS 120Hz Windows 11	',
        '200',
        '2299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '19',
        'Consola Portátil ROG Ally X AMD Z1 Extreme 1 TB SSD 24 GB 7" FHD IPS 120Hz Windows 11',
        '200',
        '3599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '31',
        'Consola Xbox Series S 512 GB Blanco (Versión EU)',
        '200',
        '1999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '31',
        'Consola Xbox Series X 1TB Negro',
        '200',
        '2699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Consola Nintendo Switch Lite Turquesa',
        '200',
        '899.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Consola Nintendo Switch Neon Mario Kart 8 Bundle + 3 Meses Switch Online',
        '200',
        '1519.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Consola Nintendo Switch OLED Mario Kart 8 Bundle',
        '200',
        '1769.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Consola Nintendo Switch OLED Super Mario Bros. Wonder Holiday Bundle',
        '200',
        '1769.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Consola Nintendo Switch Rojo Azul Neon',
        '200',
        '1629.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Nintendo Switch Lite Coral + Animal Crossing Bundle',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '59',
        'Nintendo Switch Lite Turquesa + Animal Crossing Bundle',
        '200',
        '1099.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Consola PlayStation 5 (PS5) Edición Spiderman 2',
        '200',
        '3499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Consola Playstation 5 (PS5) Slim Standard',
        '200',
        '2799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Consola PS5 Slim Spiderman 2 Japanese Specs ',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Consola Sony PlayStation 5 Pro 2TB Edición Digital',
        '200',
        '3999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'PlayStation 5 Consola Disc Edition God Of War Ragnarok Bundle USA',
        '200',
        '2999.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Playstation 5 Digital 1TB Japan Specs',
        '200',
        '2599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Playstation 5 Slim PS5 Digital Bundle RTRN-R&C ',
        '200',
        '2229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '25',
        '60',
        'Playstation 5 Slim PS5 Standard Bundle RTRN-R&C ',
        '200',
        '2799.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '26',
        '34',
        'Audífono Gamer Cloud Stinger Core 2 PS5 Blanco',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '26',
        '34',
        'Audífono Gamer Cloud Stinger Core 2 PS5 Negro',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '26',
        '12',
        'Protector de silicona para control PS5',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '26',
        '60',
        'Audífonos Playstation PS5 Headset Midnight Black',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '26',
        '60',
        'Cámara HD para Playstation PS5',
        '200',
        '299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '26',
        '60',
        'Estación de Carga para Control Playstation PS5',
        '200',
        '169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '61',
        'Juego PS4 Crash Bandicoot 4: Its About Time',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '62',
        'Juego PS4 Elden Ring - LATAM',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '62',
        'Juego PS5 Elden Ring',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '63',
        'Juego PS4 Resident Evil Village',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '63',
        'Juego PS5 Resident Evil Village Gold Edition',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '63',
        'Juego PS5 Street Fighter 6',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '64',
        'Juego PS4 Sports FC 24 - LATAM',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '64',
        'Juego PS5 Sports FC 24 - LATAM ',
        '200',
        '369.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Animal Crossing: New Horizons',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Detective Pikachu Returns',
        '200',
        '173.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Fae Farm',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Luigis Mansion 3',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Mario and Luigi: Brothership',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Mario Kart 8 Deluxe',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Mario Party Super Stars',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Mario vs Donkey Kong',
        '200',
        '173.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch New Super Mario Bros. U Deluxe',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Pikmin 1 + 2',
        '200',
        '173.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Pikmin 4',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Pokemon Legends Arceus',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Pokemon Scarlet',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Pokemon Violet',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Mario 3D World and Bowsers Fury',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Mario Maker 2',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Mario Odyssey',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Mario Party',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Mario RPG',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Mario Wonder',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch Super Smash Bros. Ultimate',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch The Legend of Zelda: Breath of the Wild',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch The Legend of Zelda: Echoes of Wisdom',
        '200',
        '213.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '59',
        'Juego Nintendo Switch The Legend of Zelda: Tears of the Kingdom',
        '200',
        '253.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 Call of Duty Modern Warfare 3',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 God Of War HITS',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 God Of War Ragnarok',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 God Of War Remasterizado ',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 Horizon Zero Dawn Complete ED',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 Ratchet & Clank HITS - LATAM',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 Spiderman GOTY',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 Spiderman Miles Morales - LATAM',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 The Last of Us 2',
        '200',
        '209.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 The Last of Us Remastered',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS4 Uncharted: The Nathan Drake Collection - HITS',
        '200',
        '109.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Astro Bot - LATAM',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Call of Duty Modern Warfare 3',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Ghost Of Tsushima Remasterizado',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 God Of War Ragnarok',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Gran Turismo 7',
        '200',
        '389.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Horizon Forbbiden West Completed Ed - LATAM',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Horizon Forbidden West',
        '200',
        '389.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Rise of the Ronin - LATAM',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Spiderman 2 Day 1 - LATAM ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Spiderman Miles Morales',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 The Last of Us Part 2 Remastered LATAM',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 The Last Of Us Part I ',
        '200',
        '399.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '60',
        'Juego PS5 Uncharted Legacy of Thieves Collection',
        '200',
        '279.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '65',
        'Juego PS4 Grand Theft Auto V Premium Edition',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '65',
        'Juego PS5 Grand Theft Auto V',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '66',
        'Juego PS5 Just Dance 2023',
        '200',
        '309.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '67',
        'Juego PS4 Hogwarts Legacy',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '67',
        'Juego PS4 Mortal Kombat 11 Ultimate',
        '200',
        '179.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '67',
        'Juego PS5 Hogwarts Legacy',
        '200',
        '359.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '67',
        'Juego PS5 Mortal Kombat 1 - LATAM',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '27',
        '67',
        'Juego PS5 Mortal Kombat 11 Ultimate Edition',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '30',
        'Control Inalámbrico F710',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '30',
        'Palanca de Cambio para Volante Logitech G29 / G920 / G923',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '30',
        'Volante + Pedal Logitech G29 Racing Wheel PC/PS3/PS4/PS5',
        '200',
        '1299.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '31',
        'Control inalámbrico para Xbox Blanco Robot',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '31',
        'Control inalámbrico para Xbox Negro Carbon + Cable USB-C',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '59',
        'Control Nintendo Switch Pro Controller',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '59',
        'Joy Con Nintendo Switch Morado/Naranja Neon',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '59',
        'Joy Con Nintendo Switch Rojo/Azul Neon',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '59',
        'Joy Con Nintendo Switch Rosado Pastel',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '36',
        'Gamepad JUNO G818 Wireless',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '36',
        'Gamepad Redragon HARROW PRO Wireless G808PRO',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico para Consola PlayStation PS5 Dualsense Rojo',
        '200',
        '369.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control inalámbrico para PlayStation DualSense Blanco  ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 Dualsense Cobalt Blue ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 DUALSENSE COSMIC RED AMER (LB)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 Dualsense Galactic Purple ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 Dualsense Midnight Black ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 DUALSENSE STARLIGHT BLUE AMER (LB)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 Dualsense STL Silver ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 Dualsense Volcanic Red ',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '60',
        'Control Inalámbrico PlayStation PS5 DUALSENSE WHITE AMER (LB)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '28',
        '68',
        'Control Scorpio T-TGP802 Blanco',
        '200',
        '189.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '29',
        '69',
        'Access Point AC1300 WiFi 5 Wireless',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '29',
        '70',
        'Sistema Wi-Fi (2 enrutadores) hasta 2800 pies cuadrados Halo S12',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '29',
        '71',
        'Punto de acceso 300 Mbps Wireless Outdoor (EAP110-OUTDOOR)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '29',
        '71',
        'Punto de acceso inalámbrico Wi-Fi 5  (TL-EAP225)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '30',
        '70',
        'Extensor de Red Wi-Fi AC1200 ME30',
        '200',
        '139.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '30',
        '71',
        'Extensor de Red TP-Link Kit Powerline WiFi AV600 300 Mbps (TL-WPA4220)',
        '200',
        '259.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '30',
        '71',
        'Extensor de Red TP-Link Rango Inalámbrico WiFi 300Mbps (TL-WA850RE)',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '30',
        '71',
        'Extensor de Red TP-Link Wi-Fi Dual-Band AC750 (RE200)',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '69',
        'Router Dual Band AX1800 WiFi 6 E7350',
        '200',
        '489.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '69',
        'Router Mesh WiFi 6 Dual Band AX1800',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '69',
        'Router Wireless Linksys AC1200 W (E5600)',
        '200',
        '219.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '69',
        'Sistema Mesh Velop Dual Band AC2600 WiFi 5 2-pack ',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'AX1500 Wi-Fi 6 Router',
        '200',
        '169.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Enrutador 4G LTE Inalámbrico N 300Mbps (TL-MR6400)',
        '200',
        '339.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Dual Band AC1200 WiFi (ARCHER C64)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Dual Band AC750 WiFi (Archer C20)',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Dual Band AX3000 Wi-Fi (ARCHER AX53)',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Dual-Band AC1200 WiFi (ARCHER C50)',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Inalámbrico Dual Band AC1350 (ARCHER C58HP)',
        '200',
        '379.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Inalámbrico Dual Band AC1900 MU-MIMO (Archer C80)',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Mesh Sistema Wi-Fi Inteligente Dual Band AC1900 (Deco S7 2 pack)',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Router Mesh Sistema Wi-Fi Inteligente Dual Band AC1900 (Deco S7 3 Pack)',
        '200',
        '699.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Sistema Mesh AC1200 Pack x2 Doble banda (Deco E4 2-pack)',
        '200',
        '309.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Sistema Mesh AC1200, Pack x3 Doble Banda (Deco E4 3-pack)',
        '200',
        '479.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Sistema Wi-Fi (2 enrutadores) - hasta 4500 pies cuadrados (Deco M5 2 pack)',
        '200',
        '599.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Sistema WiFi 6 en malla para todo el hogar AX1800 - Deco X20(2-pack)',
        '200',
        '689.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Sistema WiFi 6 en malla para todo el hogar AX1800 - Deco X20(3-pack)',
        '200',
        '889.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'Sistema WiFi 6 en malla para todo el hogar AX3000 - Deco X50(2-pack)',
        '200',
        '749.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '31',
        '71',
        'WIFI Mesh, Sistema Wi-Fi Inteligente DECO X10(2-Pack)',
        '200',
        '499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '69',
        'Switch 05b SE3005 10/100/1000',
        '200',
        '99.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '69',
        'Switch 08b SE3008 10/100/1000',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '69',
        'Switch Linksys 24 Port Gigabit Metalic',
        '200',
        '429.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '69',
        'Switch Linksys LGS108P 8-Port Gigabit PoE External',
        '200',
        '269.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '69',
        'Switch POE 24 puertos ',
        '200',
        '1499.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '71',
        'Switch de escritorio 16 puertos Gigabit 10/100/1000 Mbps Steel Case (TL-SG1016D)',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '71',
        'Switch de escritorio 24 puertos Gigabit 10/100/1000 Mbps Steel Case (TL-SG1024D)',
        '200',
        '419.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '71',
        'Switch de escritorio 8 puertos Gigabit 10/100/1000 Mbps Plastic Case (TL-SG1008D)',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '71',
        'Switch de escritorio de 5 puertos 10/100Mbps (TL-SF1005D)',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '71',
        'Switch de escritorio de 5 puertos 10/100Mbps LiteWave (LS1005)',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '32',
        '71',
        'Switch de escritorio de 5 puertos Gigabit 10/100/1000 Mbps Plastic Case (TL-SG1005D)',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '14',
        'Adaptador USB 3.0 a Ethernet 10/100 + 3 Puertos USB 3.0 AD-100U',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '14',
        'Adaptador USB-C a Ethernet Gigabit',
        '200',
        '64.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador de red PCI AX3000 (ARCHER TX55E)',
        '200',
        '239.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador Inalámbrico USB Banda Dual AC600 (ARCHER T2U)',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB 2 en 1 con Hub de 3 Puertos USB 3.0 y Adaptador Ethernet Gigabit (UE330)',
        '200',
        '129.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB 2.0 A Ethernet 10/100 Mbps (UE200)',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB 3.0 a Gigabit Ethernet (UE300)',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB Inalámbrico Alta ganancia 150 Mbps (TL-WN722N)',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB Inalámbrico Alta ganancia 300 Mbps (TL-WN822N)',
        '200',
        '79.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB Tipo-C a Gigabit Ethernet (UE300C)',
        '200',
        '81.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Adaptador USB Wireless Banda Dual AC600 (ARCHER T2U PLUS)',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Mini Adaptador Inalámbrico 300 Mbps (TL-WN823N)',
        '200',
        '49.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Tarjeta de Red Interna PCI Express AC1200 (ARCHER T4E)',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '71',
        'Tarjeta de Red Interna PCI Express AC1300 (ARCHER T6E)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '33',
        '17',
        'Adaptador de red con conector USB 3.0 a RJ-45',
        '200',
        '69.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '34',
        '72',
        'Kit de internet satelital estándar Starlink Dual Band Wi-Fi System',
        '200',
        '909.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '73',
        'Cámara IP Bullet 4MP 2.8mm',
        '200',
        '319.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '73',
        'Cámara IP Domo 2MP',
        '200',
        '529.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '73',
        'Cámara IP Domo Varifocal 5MP',
        '200',
        '749.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '73',
        'Cámara IP Turret 4MP 2.8mm',
        '200',
        '329.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '74',
        'Cámara IP Para exterior e interior con batería 1080p',
        '200',
        '349.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '71',
        'Camara IP Vigilancia Inteligente Wi-Fi 360° (Tapo C500)',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '71',
        'Cámara IP Vigilancia para casa 360º Wi-Fi (Tapo C200)',
        '200',
        '114.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '71',
        'Cámara IP Vigilancia para casa Wi-Fi (Tapo C100)',
        '200',
        '89.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '71',
        'Cámara IP Vigilancia para exterior a color Wi-Fi (Tapo C320WS)',
        '200',
        '229.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '71',
        'Cámara IP Vigilancia para exteriores Wi-Fi (Tapo C310)',
        '200',
        '199.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '71',
        'Camara tp link tapo C211',
        '200',
        '149.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '35',
        '32',
        'Kit de monitoreo para el hogar para exteriores',
        '200',
        '249.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '74',
        'Cable de Red UTP Trenzado Multifilar Cat5E 1m Gris',
        '200',
        '14.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '74',
        'Cable de Red UTP Trenzado Multifilar Cat5E 2m Azul',
        '200',
        '24.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '74',
        'Cable de Red UTP Trenzado Multifilar Cat5E 3m Azul',
        '200',
        '29.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '74',
        'Cable de Red UTP Trenzado Multifilar Cat6 0.3m Gris',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '74',
        'Cable de Red UTP Trenzado Multifilar Cat6 2m Azul',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '74',
        'Cable de Red UTP Trenzado Multifilar Cat6 2m Azul',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat5e + Conectores RJ45 1m Negro',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat5e + Conectores RJ45 20m Negro',
        '200',
        '39.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat5e + Conectores RJ45 2m Azul',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat5e + Conectores RJ45 3m Negro',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat5e + Conectores RJ45 7m Negro',
        '200',
        '44.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat6 + Conectores RJ45 1m Azul',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat6 + Conectores RJ45 20m Azul',
        '200',
        '119.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat6 + Conectores RJ45 2m Azul',
        '200',
        '14.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable de Red UTP Cat6 + Conectores RJ45 3m Azul',
        '200',
        '19.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '14',
        'Cable Red UTP Cat6 + Conectores RJ45 0.9m Azul',
        '200',
        '9.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

INSERT INTO
    `Tabla_Producto` (
        `ID_Categoria_Producto`,
        `ID_Marca_Producto`,
        `Nombre_Producto`,
        `Stock_Producto`,
        `Precio_Producto`,
        `Descripcion_Producto`,
        `Fecha_Registro_Producto`
    )
VALUES
    (
        '36',
        '72',
        'Starlink Adaptador Ethernet 1Gbps para red cableada',
        '200',
        '289.90',
        'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ad voluptates aspernatur reprehenderit porro fuga, temporibus mollitia ipsam quis nesciunt ut optio pariatur excepturi adipisci, magni quam deserunt accusantium. Ratione, culpa.',
        '06/02/2025'
    );

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '1';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '2';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '3';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '4';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '5';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '6';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '7';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '8';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '9';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '10';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '11';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '12';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '13';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '14';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '15';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '16';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '17';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '18';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '19';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '20';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '21';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '22';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '23';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '24';

/* UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '25';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '26';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '27';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '28';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '29';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '30';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '31';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '32';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '33';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '34';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '35';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '36';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '37';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '38';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '39';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '40';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '41';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'0'
WHERE
    `ID_Usuario` = '42';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '43';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '44';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '45';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '46';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '47';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '48';

UPDATE
    `Tabla_Usuario`
SET
    `Estado_Usuario` = b'1'
WHERE
    `ID_Usuario` = '49'; */

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '21/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '21/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '21/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '21/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '21/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '22/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');
    
INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');

INSERT INTO
    `Tabla_Boleta_Venta` (
        `ID_Usuario`,
        `ID_Cliente`,
        `Total_Boleta_Venta`,
        `Fecha_Boleta_Venta`
    )
VALUES
    ('1', '10', '52797.36', '23/03/2025');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('1', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('1', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('1', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('2', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('2', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('2', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('3', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('3', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('3', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('4', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('4', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('4', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('5', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('5', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('5', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('6', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('6', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('6', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('7', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('7', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('7', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('8', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('8', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('8', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('9', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('9', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('9', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('10', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('10', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('10', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('11', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('11', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('11', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('12', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('12', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('12', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('13', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('13', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('13', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('14', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('14', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('14', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('15', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('15', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('15', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('16', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('16', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('16', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('17', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('17', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('17', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('18', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('18', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('18', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('19', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('19', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('19', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('20', '1', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');

INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('20', '2', '2099.90', '10', '20999.00', '6299.70', '3779.82', '18479.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('20', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('21', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('21', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('21', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('22', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('22', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('22', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('23', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('23', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('23', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('24', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('24', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('24', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('25', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('25', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('25', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('26', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('26', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('26', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('27', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('27', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('27', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('28', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('28', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('28', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('29', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('29', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('29', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('30', '1', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('30', '2', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');
    
INSERT INTO
    `Tabla_Detalle_Boleta_Venta` (
        `ID_Boleta_Venta`,
        `ID_Producto`,
        `Precio_Producto`,
        `Cantidad_Producto`,
        `Subtotal_Detalle_Boleta_Venta`,
        `Descuento_Detalle_Boleta_Venta`,
        `IGV_Detalle_Boleta_Venta`,
        `Total_Detalle_Boleta_Venta`
    )
VALUES
    ('30', '3', '1799.90', '10', '17999.00', '5399.70', '3239.82', '15839.12');