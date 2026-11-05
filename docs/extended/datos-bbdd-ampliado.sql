-- =====================================================================
-- Pago de Jotrón · Datos de prueba (versión ampliada) · modelo ampliado (36 tablas)
-- Los cambios respecto a docs/tarea02 van marcados con [Ampliación].
-- Se ejecuta después de crear-bbdd.sql.
-- Fecha de referencia de los datos: 6 de octubre de 2026.
-- Todos los usuarios de prueba entran con la contraseña Password123!
-- =====================================================================

-- Fuerzo UTF-8 en la conexión para que las tildes y la ñ se guarden bien.
SET NAMES utf8mb4;
USE Jotron;


-- Usuarios: un administrador, editores y clientes (todos mayores de edad)
INSERT INTO User (Name, LastName, BirthDate, PasswordHash, IDCard, Email, Phone, Role, IsActive, RegistrationDate) VALUES
('Juan', 'Pérez Moreno', '1985-05-15', '$2y$12$F4UkpGliCLoiXcddnvqQ/OFnhMuJ1v6ZXtK6xDlbB2/oqzfpAgo56', '28764512E', 'juan.perez@example.com', '600123456', 'Cliente', TRUE, '2025-11-03 18:22:00'),
('Ana', 'Gómez Ruiz', '1990-08-20', '$2y$12$MdboPlb9kL2Hq1bypTt.DOOlfJdvGO7/tISIsyl2w3QQai7k1EmAy', '74851236J', 'ana.gomez@example.com', '600654321', 'Cliente', TRUE, '2025-12-12 10:05:00'),
('Luis', 'Martínez Soto', '1975-12-30', '$2y$12$.cnn0XsxhoVRZF5Ex85lwujS58VxFujXFNWRDjNOx1gZnB6NEEaUq', '25098734F', 'luis.martinez@pagodejotron.com', '600987654', 'Editor', TRUE, '2025-09-01 09:00:00'),
('María', 'Fernández Vega', '1988-02-14', '$2y$12$Kt54mIH8eIr0AlX72auxV.aEF4Wqcarx7WbaFPTVnDZL6oUAE3rEG', '28945167N', 'maria.fernandez@example.com', '600321987', 'Cliente', TRUE, '2026-01-20 21:40:00'),
('Rosario', 'Jiménez Campos', '1980-06-01', '$2y$12$w0cfqYduqyiuGr9BoJVObu5e.ptjGbT/Q0saI35ygSparp7nZWwUu', '25167890W', 'admin@pagodejotron.com', '600111222', 'Administrador', TRUE, '2025-09-01 08:30:00'),
('Carlos', 'Sánchez Mora', '1992-03-10', '$2y$12$LyzO03ho1KpehdnXtUarsudNAbz537AvQ5uafzoTYFXZa1B623.fO', '77456123N', 'carlos.sanchez@pagodejotron.com', '600222333', 'Editor', TRUE, '2025-09-15 09:10:00'),
('Laura', 'Torres Gil', '1983-11-25', '$2y$12$uKdImOJ7Ln8iAmQDF.e7LupR4PQdh0KzfKGdaOdQ4aevtvHin4AOy', '25789456Q', 'laura.torres@example.com', '600333444', 'Cliente', TRUE, '2026-02-08 12:30:00'),
('Pedro', 'Ramírez Ortiz', '1995-07-15', '$2y$12$MmnToYTEhXWKlQQDUr4p3unzZJ6HWfyxVwpsJu1gkyE.yd06pIEw6', '77123987L', 'pedro.ramirez@example.com', '600444555', 'Cliente', TRUE, '2026-03-15 19:45:00'),
('Sofía', 'López Díaz', '1987-09-05', '$2y$12$sZZsGOc5WDHJp03svQwiLO0mBspLBSw8FPi129yZePCLZPsQbW1Ge', '28654321R', 'sofia.lopez@example.com', '600555666', 'Cliente', TRUE, '2026-04-02 16:20:00'),
('Javier', 'García Luna', '1991-04-18', '$2y$12$UjbQzwcCNOSjho30nq4CFOPNRvYWHZ04gbR3XJpkkG2ymJaVwdbqm', '30987654F', 'javier.garcia@example.com', '600666777', 'Cliente', TRUE, '2026-05-28 11:15:00'),
('Carmen', 'Ruiz Pardo', '1979-01-22', '$2y$12$ZuYLeMUQ2thx6.msUn497uqnWVGcbGy3SGTMDYEUriQbuYBme.OLu', '44321987K', 'carmen.ruiz@example.com', '611234567', 'Cliente', TRUE, '2026-01-09 13:00:00'),
('Antonio', 'Navarro Cano', '1968-10-03', '$2y$12$hL1xQ5F5jb1VmA.KtnYcX.Rzdm/AcS3i6eOwqoeRCTEzTY91wwmEO', '24876543L', 'antonio.navarro@example.com', '612345678', 'Cliente', TRUE, '2026-02-21 09:45:00'),
('Isabel', 'Romero Prieto', '1994-06-11', '$2y$12$DktMqQTmkblsrlhXMyb5CejgiUc8NI4PfQMTkU6lDkS4BTuiWbwjq', '76543210S', 'isabel.romero@example.com', '613456789', 'Cliente', TRUE, '2026-03-02 22:10:00'),
('Francisco', 'Molina Reyes', '1972-03-29', '$2y$12$qou/gzACM2ASCPOHlxUHEenXhfHijiN.xOPc0DPWsXlSPwlUXajpW', '25432109C', 'francisco.molina@example.com', '614567890', 'Cliente', TRUE, '2026-03-30 17:35:00'),
('Lucía', 'Ortega Peña', '1999-12-08', '$2y$12$Oo6qTWpGmOQ9ldBSWg3gce6PYfw3npaaAckrye0F1RTm1JVlpMuve', '79876123K', 'lucia.ortega@example.com', '615678901', 'Cliente', TRUE, '2026-04-18 20:05:00'),
('Manuel', 'Delgado Ríos', '1983-07-19', '$2y$12$8Q7b3lYOhOqTS2ETXNLH0.HpqVeIrMMcrEn0VFalczCmbwKbp62FG', '31234567S', 'manuel.delgado@example.com', '616789012', 'Cliente', TRUE, '2026-05-06 08:50:00'),
('Elena', 'Castro Marín', '1990-02-27', '$2y$12$aQ4rEPte4zv8QZbj5Pz0FOdLESXwewtHLnd/m4CsHZB/a4CUYLQbO', '75987321J', 'elena.castro@example.com', '617890123', 'Cliente', TRUE, '2026-06-14 12:40:00'),
('David', 'Rubio Santos', '1986-09-14', '$2y$12$LPq95L4UCY2OX3CLhxCr3erY7NGH8STTjDdYL502X//Nh4vaRZYLm', '44987123C', 'david.rubio@example.com', '618901234', 'Cliente', TRUE, '2026-07-01 18:25:00'),
('Marta', 'Iglesias Vidal', '1993-05-02', '$2y$12$dgRDv.QjkAN/0pgbWX1.KuFRIiNF6dkuRam/e7Und6JLSh1A/w0k6', '74123456E', 'marta.iglesias@pagodejotron.com', '619012345', 'Editor', TRUE, '2026-03-01 09:00:00'),
('José', 'Herrera León', '1977-11-30', '$2y$12$vF4yl/X4W2eTImfP/vM7RuSAvFQBgIOgTuN4BZS00kRpNWe.tABHK', '28123789X', 'jose.herrera@example.com', '620123456', 'Cliente', FALSE, '2026-01-27 10:30:00');


-- Direcciones de envío y facturación de los clientes
INSERT INTO Address (UserID, Phone, StreetType, StreetName, Number, Floor, PostalCode, City, Province, Country, AddressType, IsActive) VALUES
(1, '600123456', 'Calle', 'Feria', '42', NULL, '41003', 'Sevilla', 'Sevilla', 'España', 'Envío', TRUE),
(2, '600654321', 'Calle', 'Carretería', '15', '3º B', '29008', 'Málaga', 'Málaga', 'España', 'Envío', TRUE),
(4, '600321987', 'Avenida', 'República Argentina', '24', '5º A', '41011', 'Sevilla', 'Sevilla', 'España', 'Envío', TRUE),
(7, '600333444', 'Paseo', 'de Reding', '8', NULL, '29016', 'Málaga', 'Málaga', 'España', 'Envío', TRUE),
(8, '600444555', 'Calle', 'Victoria', '31', NULL, '29012', 'Málaga', 'Málaga', 'España', 'Envío', TRUE),
(9, '600555666', 'Calle', 'Asunción', '50', NULL, '41011', 'Sevilla', 'Sevilla', 'España', 'Envío', TRUE),
(10, '600666777', 'Avenida', 'Gran Capitán', '12', NULL, '14008', 'Córdoba', 'Córdoba', 'España', 'Envío', TRUE),
(1, '954220145', 'Calle', 'Rioja', '5', NULL, '41001', 'Sevilla', 'Sevilla', 'España', 'Facturación', TRUE),
(7, '952608731', 'Calle', 'Marqués de Larios', '3', NULL, '29005', 'Málaga', 'Málaga', 'España', 'Facturación', TRUE),
(9, '600555666', 'Paseo', 'Marítimo', '18', NULL, '07014', 'Palma', 'Illes Balears', 'España', 'Envío', TRUE),
(11, '611234567', 'Calle', 'Mesones', '9', NULL, '18001', 'Granada', 'Granada', 'España', 'Envío', TRUE),
(12, '612345678', 'Avenida', 'de Andalucía', '27', NULL, '23006', 'Jaén', 'Jaén', 'España', 'Envío', TRUE),
(13, '613456789', 'Calle', 'Ancha', '33', NULL, '11001', 'Cádiz', 'Cádiz', 'España', 'Envío', TRUE),
(14, '614567890', 'Calle', 'Concepción', '14', NULL, '21001', 'Huelva', 'Huelva', 'España', 'Envío', TRUE),
(14, '959281133', 'Avenida', 'Martín Alonso Pinzón', '2', NULL, '21003', 'Huelva', 'Huelva', 'España', 'Facturación', TRUE),
(15, '615678901', 'Calle', 'Serrano', '61', NULL, '28006', 'Madrid', 'Madrid', 'España', 'Envío', TRUE),
(16, '616789012', 'Plaza', 'Mayor', '4', NULL, '04700', 'El Ejido', 'Almería', 'España', 'Envío', TRUE),
(17, '617890123', 'Calle', 'Colón', '20', NULL, '46004', 'Valencia', 'Valencia', 'España', 'Envío', TRUE),
(18, '618901234', 'Avenida', 'Diagonal', '410', NULL, '08037', 'Barcelona', 'Barcelona', 'España', 'Envío', TRUE),
(20, '620123456', 'Calle', 'Real', '7', NULL, '11100', 'San Fernando', 'Cádiz', 'España', 'Envío', TRUE),
(8, '600444555', 'Calle', 'Granada', '19', NULL, '29015', 'Málaga', 'Málaga', 'España', 'Envío', FALSE);


-- Denominaciones de origen de Andalucía
INSERT INTO GuaranteeOfOrigin (Name, Classification, Region, RegulatoryCouncil, FoundedYear, Website, Description, IsBlocked) VALUES
('Jerez-Xérès-Sherry', 'DO', 'Marco de Jerez (Cádiz)', 'Consejo Regulador de Jerez-Xérès-Sherry y Manzanilla-Sanlúcar', 1933, 'https://www.sherry.wine', 'Vinos generosos criados en el Marco de Jerez por el sistema de criaderas y soleras.', FALSE),
('Manzanilla-Sanlúcar de Barrameda', 'DO', 'Sanlúcar de Barrameda (Cádiz)', 'Consejo Regulador de Jerez-Xérès-Sherry y Manzanilla-Sanlúcar', NULL, 'https://www.sherry.wine', 'Manzanilla criada bajo velo de flor en Sanlúcar de Barrameda.', FALSE),
('Montilla-Moriles', 'DO', 'Sur de Córdoba', 'Consejo Regulador de Montilla-Moriles', NULL, NULL, 'Finos, amontillados y dulces de pedro ximénez del sur de Córdoba, casi siempre sin encabezar.', FALSE),
('Condado de Huelva', 'DO', 'Huelva', 'Consejo Regulador del Condado de Huelva', NULL, NULL, NULL, FALSE),
('Málaga', 'DO', 'Málaga', 'Consejo Regulador de Málaga, Sierras de Málaga y Pasas de Málaga', 1933, NULL, 'Vinos dulces y licorosos de moscatel y pedro ximénez.', FALSE),
('Sierras de Málaga', 'DO', 'Málaga', 'Consejo Regulador de Málaga, Sierras de Málaga y Pasas de Málaga', NULL, NULL, 'Vinos tranquilos (blancos, rosados y tintos) de la provincia de Málaga.', FALSE),
('Pasas de Málaga', 'DOP', 'Axarquía y Manilva (Málaga)', 'Consejo Regulador de Málaga, Sierras de Málaga y Pasas de Málaga', NULL, NULL, 'Pasas de moscatel de Alejandría secadas al sol en paseros.', FALSE),
('Granada', 'DO', 'Granada', 'Consejo Regulador de Granada', NULL, NULL, NULL, FALSE),
('Lebrija', 'DO', 'Sevilla', 'Consejo Regulador de Lebrija', NULL, NULL, NULL, FALSE),
('Cádiz', 'VT', 'Cádiz', NULL, NULL, NULL, NULL, FALSE),
('Laujar-Alpujarra', 'VT', 'Almería', NULL, NULL, NULL, NULL, FALSE),
('Córdoba', 'VT', 'Córdoba', NULL, NULL, NULL, NULL, FALSE),
('Sierra Norte de Sevilla', 'VT', 'Sevilla', NULL, NULL, NULL, NULL, FALSE),
('Altiplano de Sierra Nevada', 'VT', 'Granada y Almería', NULL, NULL, NULL, NULL, FALSE),
('Desierto de Almería', 'VT', 'Almería', NULL, NULL, NULL, NULL, FALSE),
('Villaviciosa de Córdoba', 'VT', 'Córdoba', NULL, NULL, NULL, NULL, FALSE),
('Sierra Sur de Jaén', 'VT', 'Jaén', NULL, NULL, NULL, NULL, FALSE),
('Bailén', 'VT', 'Jaén', NULL, NULL, NULL, NULL, FALSE),
('Ribera del Andarax', 'VT', 'Almería', NULL, NULL, NULL, NULL, FALSE),
('Norte de Almería', 'VT', 'Almería', NULL, NULL, NULL, NULL, FALSE);


-- Bodegas andaluzas (Toro Albalá está bloqueada)
INSERT INTO Winery (Name, Description, Address, City, Province, Country, Phone, Email, Website, IsBlocked) VALUES
('Bodega Pago de Jotrón', 'Bodega familiar de la Axarquía. Elabora tintos, moscatel y pasas de Málaga en su propia finca.', 'Camino de los Paseros, s/n, 29000 Málaga', 'Málaga', 'Málaga', 'España', '952000000', 'info@pagodejotron.com', 'https://www.pagodejotron.com', FALSE),
('González Byass', 'Bodega de Jerez fundada en 1835, conocida por el fino Tío Pepe.', NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Barbadillo', 'Bodega de Sanlúcar de Barrameda especializada en manzanilla.', NULL, 'Sanlúcar de Barrameda', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Emilio Lustau', 'Bodega de Jerez con una amplia gama de generosos y dulces.', NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Hidalgo-La Gitana', 'Bodega familiar de Sanlúcar, elabora la manzanilla La Gitana.', NULL, 'Sanlúcar de Barrameda', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Alvear', 'Bodega de Montilla dedicada a los vinos de pedro ximénez.', NULL, 'Montilla', 'Córdoba', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Toro Albalá', NULL, NULL, 'Aguilar de la Frontera', 'Córdoba', 'España', NULL, NULL, NULL, TRUE),
('Cortijo Los Aguilares', 'Finca de la serranía de Ronda con tintos de altura.', NULL, 'Ronda', 'Málaga', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Jorge Ordóñez', NULL, NULL, 'Vélez-Málaga', 'Málaga', 'España', NULL, NULL, NULL, FALSE),
('Huerta de Albalá', NULL, NULL, 'Arcos de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Osborne', NULL, NULL, 'El Puerto de Santa María', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Valdespino', NULL, NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Williams & Humbert', NULL, NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Tradición', NULL, NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Emilio Hidalgo', NULL, NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Fernando de Castilla', NULL, NULL, 'Jerez de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Yuste', NULL, NULL, 'Sanlúcar de Barrameda', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Delgado Zuleta', NULL, NULL, 'Sanlúcar de Barrameda', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Juan Piñero', NULL, NULL, 'Sanlúcar de Barrameda', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas César Florido', NULL, NULL, 'Chipiona', 'Cádiz', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Pérez Barquero', NULL, NULL, 'Montilla', 'Córdoba', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Robles', NULL, NULL, 'Montilla', 'Córdoba', 'España', NULL, NULL, NULL, FALSE),
('Finca La Melonera', NULL, NULL, 'Ronda', 'Málaga', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Málaga Virgen', NULL, NULL, 'Fuente de Piedra', 'Málaga', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Dimobe', NULL, NULL, 'Moclinejo', 'Málaga', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Almijara', NULL, NULL, 'Cómpeta', 'Málaga', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Privilegio del Condado', NULL, NULL, 'Bollullos Par del Condado', 'Huelva', 'España', NULL, NULL, NULL, FALSE),
('Bodegas Iglesias', NULL, NULL, 'Bollullos Par del Condado', 'Huelva', 'España', NULL, NULL, NULL, FALSE),
('González Palacios', NULL, NULL, 'Lebrija', 'Sevilla', 'España', NULL, NULL, NULL, FALSE),
('Barranco Oscuro', NULL, NULL, 'Cádiar', 'Granada', 'España', NULL, NULL, NULL, FALSE),
('Señorío de Nevada', NULL, NULL, 'Villamena', 'Granada', 'España', NULL, NULL, NULL, FALSE);


-- Categorías de vino (estilo concreto; la familia va en Typology)
INSERT INTO Category (Name) VALUES
('Tinto roble'),
('Tinto crianza'),
('Blanco seco'),
('Rosado'),
('Fino'),
('Manzanilla'),
('Amontillado'),
('Oloroso'),
('Pedro Ximénez'),
('Moscatel dulce'),
('Palo cortado'),
('Cream'),
('Medium'),
('Tinto reserva'),
('Blanco con crianza'),
('Espumoso'),
('Vino naranja'),
('Mistela');


-- [Ampliación] Tipologías: familia del producto que usan los filtros de la tienda
INSERT INTO Typology (Name, ProductType, FilterOrder, TaxRate) VALUES
('Tinto', 'Vino', 1, 21.00),
('Blanco', 'Vino', 2, 21.00),
('Rosado', 'Vino', 3, 21.00),
('Generoso', 'Vino', 4, 21.00),
('Dulce', 'Vino', 5, 21.00),
('Espumoso', 'Vino', 6, 21.00),
('Pasa moscatel', 'Pasas', 7, 10.00);


-- Variedades de uva
INSERT INTO Grape (Name, Color) VALUES
('Tempranillo', 'Tinta'),
('Syrah', 'Tinta'),
('Moscatel de Alejandría', 'Blanca'),
('Palomino Fino', 'Blanca'),
('Pedro Ximénez', 'Blanca'),
('Pinot Noir', 'Tinta'),
('Petit Verdot', 'Tinta'),
('Merlot', 'Tinta'),
('Cabernet Sauvignon', 'Tinta'),
('Zalema', 'Blanca'),
('Garnacha', 'Tinta'),
('Tintilla de Rota', 'Tinta'),
('Romé', 'Tinta'),
('Moscatel Morisco', 'Blanca'),
('Doradilla', 'Blanca'),
('Lairén', 'Blanca'),
('Vigiriego', 'Blanca'),
('Jaén Blanco', 'Blanca'),
('Perruno', 'Blanca'),
('Cabernet Franc', 'Tinta'),
('Chardonnay', 'Blanca'),
('Sauvignon Blanc', 'Blanca'),
('Viognier', 'Blanca'),
('Verdejo', 'Blanca'),
('Macabeo', 'Blanca'),
('Monastrell', 'Tinta'),
('Graciano', 'Tinta'),
('Tinta Velasco', 'Tinta'),
('Moscatel Negro', 'Tinta'),
('Garnacha Tintorera', 'Tinta');


-- Productos: vinos andaluces y pasas de Málaga (las presentaciones van en ProductVariant)
INSERT INTO Product (Name, WineryID, GuaranteeOfOriginID, TypologyID, Vintage, Image, Description, VisualNote, AromaNote, PalateNote, MinTemperature, MaxTemperature, AlcoholContent, FoodPairing, IsBlocked, CreatedAt, AgingTime, AgingMethod, Production, VineyardAltitude, SoilType, Yield) VALUES
('Jotrón Tinto Roble', 1, 6, 1, 2023, 'jotron-tinto-roble.jpg', 'Tinto con cuatro meses en barrica de roble francés, elaborado con tempranillo y syrah de nuestros viñedos.', 'Rojo picota con ribete violáceo.', 'Fruta negra madura, regaliz y un fondo tostado suave.', 'Sabroso, de taninos redondos y final largo.', 14.00, 16.00, 14.00, 'Carnes a la brasa, guisos y quesos curados.', FALSE, '2026-01-12 10:00:00', '4 meses en barrica de roble francés', 'Crianza corta en barricas de roble francés de segundo uso, con trasiegas cada dos meses para afinar el tanino sin tapar la fruta.', '18.000 botellas', 850, 'Pizarra y arcilla', 4500),
('Jotrón Moscatel Dulce', 1, 5, 5, 2022, 'jotron-moscatel-dulce.jpg', 'Vino dulce natural de moscatel de Alejandría, con la uva asoleada en los paseros de la finca.', 'Oro viejo, limpio y brillante.', 'Pasa, miel de azahar y piel de naranja.', 'Untuoso y fresco, sin llegar a empalagar.', 8.00, 10.00, 15.00, 'Postres de hojaldre, foie y quesos azules.', FALSE, '2026-01-12 10:10:00', 'Sin crianza en madera', 'Uva asoleada en paseros y fermentación parcial; reposa en depósito de acero inoxidable para conservar el aroma de la moscatel.', '6.000 botellas', 700, 'Pizarra', 3000),
('Pasas de Málaga Jotrón', 1, 7, 7, 2025, 'pasas-jotron-500g.jpg', 'Pasas de moscatel secadas al sol en los paseros de la finca y despalilladas a mano.', NULL, NULL, NULL, NULL, NULL, NULL, 'Solas, con queso fresco o en ensaladas.', FALSE, '2026-01-12 10:20:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Tío Pepe Fino', 2, 1, 4, NULL, 'tio-pepe-fino.jpg', 'Fino muy seco de palomino, criado bajo velo de flor en el sistema de criaderas y soleras.', 'Amarillo pajizo pálido.', 'Almendra, masa de pan y notas salinas.', 'Seco, ligero y punzante.', 6.00, 8.00, 15.00, 'Jamón ibérico, aceitunas y pescaíto frito.', FALSE, '2026-02-03 09:30:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Solear Manzanilla', 3, 2, 4, NULL, 'solear-manzanilla.jpg', 'Manzanilla criada bajo velo de flor en las bodegas de Sanlúcar de Barrameda.', 'Amarillo pálido con reflejos verdosos.', 'Manzanilla de campo, levadura y brisa marina.', 'Fresca, seca y con un final ligeramente amargo.', 6.00, 8.00, 15.00, 'Langostinos, marisco y pescado frito.', FALSE, '2026-02-03 09:40:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Lustau San Emilio Pedro Ximénez', 4, 1, 5, NULL, 'lustau-san-emilio-px.jpg', 'Dulce natural de pedro ximénez con envejecimiento oxidativo en solera.', 'Caoba muy oscuro, casi opaco.', 'Higo, dátil, café y cacao.', 'Denso, muy dulce y largo.', 12.00, 14.00, 17.00, 'Helado de vainilla, chocolate negro y quesos azules.', FALSE, '2026-02-03 09:50:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Alvear Fino C.B.', 6, 3, 4, NULL, 'alvear-fino-cb.jpg', 'Fino de pedro ximénez de la Sierra de Montilla, criado bajo velo de flor sin encabezar.', 'Oro pálido.', 'Almendra tostada y hierbas secas.', 'Seco, suave y con buena persistencia.', 6.00, 8.00, 15.00, 'Salmorejo, flamenquín y tapas fritas.', FALSE, '2026-02-10 11:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Cortijo Los Aguilares Pinot Noir', 8, 6, 1, 2022, 'aguilares-pinot-noir.jpg', 'Tinto de pinot noir de la serranía de Ronda, con crianza en barrica de roble francés.', 'Rojo cereza de capa media.', 'Frutos rojos, sotobosque y especias dulces.', 'Elegante, fresco y de tanino fino.', 14.00, 16.00, 14.00, 'Atún rojo, setas y carnes de caza.', FALSE, '2026-03-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Jotrón Moscatel Seco', 1, 6, 2, 2025, 'jotron-moscatel-seco.jpg', 'Blanco seco de moscatel de Alejandría, fermentado en depósito a baja temperatura.', 'Amarillo limón con reflejos verdosos.', 'Flor de azahar, uva fresca y lima.', 'Seco, aromático y muy fresco.', 6.00, 8.00, 12.50, 'Ajoblanco, pescado a la plancha y cocina asiática.', FALSE, '2026-04-14 10:20:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Viña AB Amontillado', 2, 1, 4, NULL, 'vina-ab-amontillado.jpg', 'Amontillado seco que empieza su crianza bajo velo de flor y la termina en crianza oxidativa.', 'Ámbar brillante.', 'Avellana, madera noble y notas salinas.', 'Seco, sabroso y largo.', 12.00, 14.00, 16.50, 'Consomé, alcachofas y carnes blancas.', FALSE, '2026-04-20 09:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Leonor Palo Cortado', 2, 1, 4, NULL, 'leonor-palo-cortado.jpg', 'Palo cortado con doce años de crianza media en solera.', 'Caoba claro.', 'Nuez, cuero y piel de naranja confitada.', 'Seco, complejo y de final muy largo.', 12.00, 14.00, 20.00, 'Guisos de caza y quesos muy curados.', FALSE, '2026-04-20 09:10:00', NULL, NULL, NULL, NULL, NULL, NULL),
('La Gitana Manzanilla', 5, 2, 4, NULL, 'la-gitana-manzanilla.jpg', 'Manzanilla clásica de Sanlúcar, criada bajo velo de flor.', 'Amarillo pálido.', 'Levadura, camomila y salinidad.', 'Ligera, seca y fresca.', 6.00, 8.00, 15.00, 'Gambas, tortillitas de camarones y frituras.', FALSE, '2026-04-20 09:20:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Napoleón Amontillado', 5, 2, 4, NULL, 'napoleon-amontillado.jpg', 'Amontillado de Sanlúcar con crianza biológica y oxidativa.', 'Ámbar dorado.', 'Avellana tostada y yodo.', 'Seco, envolvente y salino.', 12.00, 14.00, 17.50, 'Atún encebollado y setas.', FALSE, '2026-04-20 09:30:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Lustau Don Nuño Oloroso', 4, 1, 4, NULL, 'lustau-don-nuno-oloroso.jpg', 'Oloroso seco de crianza oxidativa en solera.', 'Caoba con reflejos ámbar.', 'Nuez, especias y madera noble.', 'Seco, potente y redondo.', 13.00, 15.00, 20.00, 'Rabo de toro y carnes rojas guisadas.', FALSE, '2026-04-20 09:40:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Alvear Pedro Ximénez Solera 1927', 6, 3, 5, NULL, 'alvear-px-1927.jpg', 'Pedro Ximénez dulce de una solera fundada en 1927.', 'Ébano con ribete yodado.', 'Pasa, regaliz y tostados.', 'Muy dulce, sedoso y largo.', 12.00, 14.00, 16.00, 'Postres de chocolate y helados.', FALSE, '2026-05-04 10:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Toro Albalá Don PX', 7, 3, 5, 2019, 'toro-albala-don-px.jpg', 'Pedro Ximénez de añada con la uva pasificada al sol en la campiña cordobesa.', 'Caoba oscuro.', 'Higo seco, dátil y miel.', 'Dulce, denso y fresco a la vez.', 12.00, 14.00, 17.00, 'Quesos azules y postres de frutos secos.', FALSE, '2026-05-04 10:10:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Botani Moscatel Seco', 9, 6, 2, 2024, 'botani-moscatel-seco.jpg', 'Blanco seco de moscatel de Alejandría de viñas viejas de la Axarquía.', 'Amarillo pajizo brillante.', 'Azahar, lichi y cítricos.', 'Seco, fresco y muy aromático.', 6.00, 8.00, 13.00, 'Ensaladas, sushi y quesos de cabra.', FALSE, '2026-05-04 10:20:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Taberner', 10, 10, 1, 2021, 'taberner.jpg', 'Tinto de syrah, merlot y cabernet sauvignon con doce meses en barrica.', 'Rojo picota de capa alta.', 'Fruta negra, cacao y especias.', 'Potente, carnoso y equilibrado.', 15.00, 17.00, 14.50, 'Retinto a la brasa y quesos payoyos.', FALSE, '2026-05-04 10:30:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Valdespino Fino Inocente', 12, 1, 4, NULL, 'valdespino-inocente.jpg', 'Fino de pago Macharnudo con larga crianza bajo velo de flor.', 'Oro pálido.', 'Almendra, flor y tiza.', 'Seco, profundo y salino.', 6.00, 8.00, 15.00, 'Mariscos, jamón y almendras fritas.', FALSE, '2026-05-18 09:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Dry Sack Medium', 13, 1, 4, NULL, 'dry-sack-medium.jpg', 'Medium de amontillado y oloroso suavizado con un toque de pedro ximénez.', 'Ámbar.', 'Frutos secos y caramelo.', 'Abocado, suave y fácil de beber.', 10.00, 12.00, 19.00, 'Patés, foie y aperitivos.', FALSE, '2026-05-18 09:10:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Osborne Fino Quinta', 11, 1, 4, NULL, 'osborne-fino-quinta.jpg', 'Fino de El Puerto de Santa María, criado bajo velo de flor.', 'Amarillo pajizo.', 'Almendra y levadura.', 'Seco, ligero y fresco.', 6.00, 8.00, 15.00, 'Pescaíto frito y aceitunas.', FALSE, '2026-05-18 09:20:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Mioro', 27, 4, 2, 2025, 'mioro.jpg', 'Blanco joven de zalema del Condado de Huelva.', 'Amarillo pálido.', 'Manzana verde y flores blancas.', 'Ligero, fresco y fácil.', 6.00, 8.00, 12.00, 'Gambas de Huelva y pescado blanco.', FALSE, '2026-05-18 09:30:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Melonera Payoya Negra', 23, 6, 1, 2021, 'melonera-payoya-negra.jpg', 'Tinto de la serranía de Ronda con variedades recuperadas y syrah.', 'Rojo granate.', 'Fruta roja, monte bajo y pimienta.', 'Fresco, especiado y de tanino fino.', 14.00, 16.00, 14.00, 'Chivo lechal y quesos de cabra payoya.', FALSE, '2026-06-01 10:00:00', NULL, NULL, NULL, NULL, NULL, NULL);


-- [Ampliación] Presentaciones: cada formato tiene su precio y su stock.
-- VariantID coincide con el ProductID de la versión original.
INSERT INTO ProductVariant (ProductID, Format, Capacity, CapacityUnit, Price, Stock, IsBlocked) VALUES
(1, 'Botella', 750, 'ml', 9.50, 120, FALSE),
(2, 'Botella', 500, 'ml', 14.00, 60, FALSE),
(3, 'Caja', 500, 'g', 7.50, 200, FALSE),
(3, 'Caja', 1000, 'g', 13.50, 150, FALSE),
(4, 'Botella', 750, 'ml', 11.95, 48, FALSE),
(5, 'Botella', 750, 'ml', 9.90, 60, FALSE),
(6, 'Botella', 750, 'ml', 22.50, 24, FALSE),
(7, 'Botella', 750, 'ml', 9.20, 36, FALSE),
(8, 'Botella', 750, 'ml', 24.00, 18, FALSE),
(1, 'Media botella', 375, 'ml', 5.90, 80, FALSE),
(3, 'Racimo', 250, 'g', 4.20, 300, FALSE),
(9, 'Botella', 750, 'ml', 8.90, 90, FALSE),
(10, 'Botella', 750, 'ml', 13.50, 30, FALSE),
(11, 'Botella', 750, 'ml', 19.90, 18, FALSE),
(12, 'Botella', 750, 'ml', 8.50, 72, FALSE),
(13, 'Botella', 750, 'ml', 14.50, 20, FALSE),
(14, 'Botella', 750, 'ml', 18.00, 22, FALSE),
(15, 'Media botella', 375, 'ml', 24.50, 15, FALSE),
(16, 'Media botella', 375, 'ml', 29.00, 12, FALSE),
(17, 'Botella', 750, 'ml', 13.90, 40, FALSE),
(18, 'Botella', 750, 'ml', 19.00, 24, FALSE),
(19, 'Botella', 750, 'ml', 16.50, 24, FALSE),
(20, 'Botella', 750, 'ml', 10.90, 36, FALSE),
(21, 'Botella', 750, 'ml', 9.50, 48, FALSE),
(22, 'Botella', 750, 'ml', 6.50, 60, FALSE),
(23, 'Botella', 750, 'ml', 21.00, 18, FALSE);


-- [Ampliación] Pasos de elaboración (solo los productos de Pago de Jotrón)
INSERT INTO ProductStep (ProductID, Position, Title, Description) VALUES
(1, 1, 'Vendimia', 'Vendimia a mano en cajas de 15 kg a primera hora de la mañana.'),
(1, 2, 'Fermentación', 'Despalillado y fermentación en depósitos de acero con control de temperatura.'),
(1, 3, 'Crianza', 'Cuatro meses en barrica de roble francés.'),
(1, 4, 'Embotellado', 'Reposo en botella antes de salir a la venta.'),
(2, 1, 'Vendimia', 'Moscatel de Alejandría recogido muy maduro.'),
(2, 2, 'Asoleo', 'La uva se seca al sol en los paseros para concentrar el azúcar.'),
(2, 3, 'Prensado', 'Prensado suave del racimo asoleado.'),
(2, 4, 'Fermentación', 'Fermentación parcial; se detiene para conservar el dulzor natural.'),
(3, 1, 'Vendimia', 'Recogida a mano del moscatel en agosto.'),
(3, 2, 'Asoleo', 'Unas tres semanas en los paseros, dando la vuelta a los racimos.'),
(3, 3, 'Despalillado', 'Se separa la pasa del racimo a mano, con tijera.'),
(3, 4, 'Envasado', 'Selección de la pasa y envasado en la propia finca.'),
(9, 1, 'Vendimia', 'Vendimia temprana para conservar la acidez.'),
(9, 2, 'Maceración', 'Maceración en frío de la piel para extraer los aromas.'),
(9, 3, 'Fermentación', 'Fermentación lenta en depósitos de acero.'),
(9, 4, 'Embotellado', 'Embotellado en primavera, sin paso por madera.');


-- [Ampliación] Etiquetas de cata
INSERT INTO TastingTag (Name) VALUES
('Afrutado'),
('Floral'),
('Tostado'),
('Especiado'),
('Salino'),
('Seco'),
('Dulce'),
('Untuoso'),
('Fresco'),
('Mineral');


-- Tipos de evento
INSERT INTO EventType (Name) VALUES
('Visita guiada'),
('Cata guiada'),
('Cata maridada'),
('Vendimia'),
('Taller'),
('Curso de cata');


-- Eventos organizados por Pago de Jotrón (Location toma su valor por defecto)
INSERT INTO Event (Title, Description, EventTypeID, StartsAt, EndsAt, Price, TaxRate, MaxParticipants, AvailableSeats, IsOpen, ImageUrl) VALUES
('Vendimia en Pago de Jotrón 2026', 'Vendimiamos a mano una parcela de moscatel, llevamos la uva a los paseros y terminamos con un almuerzo en la bodega.', 4, '2026-09-05 09:00:00', '2026-09-05 13:00:00', 30.00, 21.00, 25, 0, FALSE, 'vendimia-en-pago-de-jotron-2026.jpg'),
('Visita guiada a la bodega y los viñedos', 'Recorremos el viñedo, los paseros y la sala de barricas, y terminamos con una copa de nuestro tinto roble.', 1, '2026-10-24 11:00:00', '2026-10-24 13:00:00', 15.00, 21.00, 20, 12, TRUE, 'visita-guiada-a-la-bodega-y-los-vinedos.jpg'),
('Cata guiada de los vinos de Pago de Jotrón', 'Nuestro enólogo presenta el tinto roble y el moscatel dulce, y explica cómo se elaboran.', 2, '2026-11-07 18:00:00', '2026-11-07 19:30:00', 25.00, 21.00, 15, 9, TRUE, 'cata-guiada-de-los-vinos-de-pago-de-jotron.jpg'),
('Cata maridada: vinos dulces y quesos malagueños', 'Cinco vinos dulces de Málaga acompañados de quesos de cabra de la provincia.', 3, '2026-11-21 13:00:00', '2026-11-21 15:30:00', 45.00, 21.00, 12, 6, TRUE, 'cata-maridada-vinos-dulces-y-quesos-malaguenos.jpg'),
('Taller de pasas: del pasero a la mesa', 'Aprendemos cómo se asolea la uva en los paseros y preparamos tres recetas con pasas de Málaga.', 5, '2026-12-12 10:30:00', '2026-12-12 12:30:00', 20.00, 21.00, 15, 11, TRUE, 'taller-de-pasas-del-pasero-a-la-mesa.jpg'),
('Visita guiada de verano', 'Visita al atardecer por el viñedo con degustación de nuestro moscatel seco.', 1, '2026-07-18 20:00:00', '2026-07-18 22:00:00', 15.00, 21.00, 20, 0, FALSE, 'visita-guiada-de-verano.jpg'),
('Cata vertical de moscatel dulce', 'Probamos cuatro añadas de nuestro moscatel dulce para ver cómo evoluciona en botella.', 2, '2027-01-16 18:00:00', '2027-01-16 19:30:00', 35.00, 21.00, 12, 10, TRUE, 'cata-vertical-de-moscatel-dulce.jpg'),
('Visita y desayuno en la finca', 'Visita corta a la bodega seguida de un desayuno con pan de pueblo, aceite y pasas.', 1, '2027-02-13 10:00:00', '2027-02-13 12:00:00', 18.00, 21.00, 20, 18, TRUE, 'visita-y-desayuno-en-la-finca.jpg'),
('Curso de iniciación a la cata', 'Dos sesiones para aprender a catar: vista, nariz y boca, con seis vinos andaluces.', 6, '2027-03-06 17:00:00', '2027-03-06 20:00:00', 60.00, 21.00, 14, 13, TRUE, 'curso-de-iniciacion-a-la-cata.jpg');


-- [Ampliación] Qué esperar de cada evento
INSERT INTO EventHighlight (EventID, Position, Text) VALUES
(1, 1, 'Vendimia a mano de una parcela de moscatel'),
(1, 2, 'Visita a los paseros'),
(1, 3, 'Almuerzo en la bodega'),
(2, 1, 'Paseo por el viñedo'),
(2, 2, 'Sala de barricas'),
(2, 3, 'Copa de tinto roble al final'),
(3, 1, 'Dos vinos de la casa'),
(3, 2, 'Explicación del enólogo'),
(3, 3, 'Aperitivo malagueño'),
(4, 1, 'Cinco vinos dulces de Málaga'),
(4, 2, 'Quesos de cabra de la provincia'),
(5, 1, 'Asoleo de la uva en los paseros'),
(5, 2, 'Tres recetas con pasas'),
(5, 3, 'Bolsa de pasas para llevar');


-- [Ampliación] Programa de cada evento
INSERT INTO EventScheduleItem (EventID, StartTime, Description) VALUES
(1, '09:00:00', 'Bienvenida y reparto de tijeras'),
(1, '09:30:00', 'Vendimia en la parcela'),
(1, '11:30:00', 'Uva a los paseros'),
(1, '12:15:00', 'Almuerzo en la bodega'),
(2, '11:00:00', 'Paseo por el viñedo'),
(2, '11:45:00', 'Paseros y sala de barricas'),
(2, '12:30:00', 'Copa de tinto roble'),
(3, '18:00:00', 'Bienvenida'),
(3, '18:15:00', 'Cata del tinto roble'),
(3, '18:50:00', 'Cata del moscatel dulce'),
(4, '13:00:00', 'Bienvenida'),
(4, '13:15:00', 'Cata maridada'),
(4, '15:00:00', 'Preguntas y despedida'),
(5, '10:30:00', 'Visita a los paseros'),
(5, '11:15:00', 'Taller de cocina'),
(5, '12:15:00', 'Degustación');


-- Estados del pedido (RF8)
INSERT INTO OrderStatus (Name) VALUES
('Pendiente de pago'),
('Confirmado'),
('En proceso'),
('Preparado'),
('Enviado'),
('Entregado'),
('Anulado'),
('Bloqueado');


-- Motivos de anulación
INSERT INTO CancellationType (Description) VALUES
('El cliente decidió cancelar el pedido antes de que se enviara.'),
('Pedido duplicado por error.'),
('El cliente se arrepintió de la compra.'),
('Error en la dirección de envío proporcionada.'),
('No se recibió la transferencia en el plazo indicado.');


-- Tipos de envío
INSERT INTO ShippingType (Name, Cost, MinDeliveryDays, MaxDeliveryDays, IsBlocked) VALUES
('Envío estándar', 4.95, 3, 5, FALSE),
('Envío exprés 24 h', 9.95, 1, 1, FALSE),
('Recogida en bodega', 0.00, NULL, NULL, FALSE),
('Envío a Baleares', 14.95, 4, 7, TRUE),
('Sin envío (solo eventos)', 0.00, NULL, NULL, FALSE);


-- Pedidos (Total = líneas + coste del envío)
INSERT INTO Orders (UserID, ShippingAddressID, BillingAddressID, PaymentMethod, ShippingTypeID, ShippingCost, Total, StatusID, StatusUpdatedAt, CancelledBy, CancellationTypeID, CreatedAt, ShippingDate) VALUES
(11, 11, NULL, 'Tarjeta', 1, 4.95, 47.45, 6, '2026-05-08 13:00:00', NULL, NULL, '2026-05-05 20:15:00', '2026-05-06'),
(12, 12, NULL, 'PayPal', 1, 4.95, 55.85, 6, '2026-05-22 12:10:00', NULL, NULL, '2026-05-19 10:30:00', '2026-05-20'),
(13, 13, NULL, 'Tarjeta', 2, 9.95, 60.95, 6, '2026-06-04 10:40:00', NULL, NULL, '2026-06-02 22:05:00', '2026-06-03'),
(14, 14, 15, 'Transferencia', 1, 4.95, 83.35, 6, '2026-06-19 11:00:00', NULL, NULL, '2026-06-12 09:00:00', '2026-06-16'),
(15, 16, NULL, 'Tarjeta', 1, 4.95, 73.35, 6, '2026-06-30 16:20:00', NULL, NULL, '2026-06-26 18:50:00', '2026-06-27'),
(16, 17, NULL, 'PayPal', 1, 4.95, 42.95, 7, '2026-07-02 09:30:00', 'Administrador', 4, '2026-07-01 23:10:00', NULL),
(17, NULL, NULL, 'Tarjeta', 5, 0.00, 30.00, 6, '2026-07-18 22:00:00', NULL, NULL, '2026-07-03 17:00:00', NULL),
(1, 1, 8, 'Tarjeta', 1, 4.95, 61.95, 6, '2026-07-16 12:00:00', NULL, NULL, '2026-07-14 10:12:00', '2026-07-15'),
(18, 19, NULL, 'Tarjeta', 2, 9.95, 88.75, 6, '2026-07-24 12:00:00', NULL, NULL, '2026-07-22 11:45:00', '2026-07-23'),
(11, 11, NULL, 'Tarjeta', 1, 4.95, 36.75, 6, '2026-08-07 13:15:00', NULL, NULL, '2026-08-04 09:30:00', '2026-08-05'),
(12, NULL, NULL, 'PayPal', 5, 0.00, 90.00, 6, '2026-09-05 14:00:00', NULL, NULL, '2026-08-10 20:00:00', NULL),
(13, 13, NULL, 'Transferencia', 1, 4.95, 46.95, 7, '2026-09-07 10:00:00', 'Administrador', 5, '2026-08-18 12:00:00', NULL),
(2, NULL, NULL, 'PayPal', 5, 0.00, 60.00, 6, '2026-09-05 14:00:00', NULL, NULL, '2026-08-20 21:30:00', NULL),
(4, 3, NULL, 'Tarjeta', 2, 9.95, 47.45, 6, '2026-08-30 11:30:00', NULL, NULL, '2026-08-28 17:45:00', '2026-08-29'),
(9, 10, NULL, 'Tarjeta', 4, 14.95, 56.45, 6, '2026-09-04 10:00:00', NULL, NULL, '2026-09-01 09:20:00', '2026-09-02'),
(8, 5, NULL, 'Tarjeta', 1, 4.95, 40.80, 7, '2026-09-10 21:05:00', 'Cliente', 3, '2026-09-10 08:40:00', NULL),
(7, NULL, 9, 'PayPal', 3, 0.00, 48.00, 6, '2026-09-13 12:30:00', NULL, NULL, '2026-09-11 19:05:00', NULL),
(2, 2, NULL, 'Transferencia', 2, 9.95, 65.15, 8, '2026-09-30 00:00:00', NULL, NULL, '2026-09-15 13:10:00', NULL),
(11, NULL, NULL, 'Tarjeta', 5, 0.00, 66.00, 2, '2026-10-01 18:00:00', NULL, NULL, '2026-10-01 18:00:00', NULL),
(15, 16, NULL, 'Tarjeta', 2, 9.95, 71.95, 5, '2026-10-03 09:00:00', NULL, NULL, '2026-10-02 10:20:00', '2026-10-03'),
(18, 19, NULL, 'PayPal', 1, 4.95, 48.75, 5, '2026-10-05 10:00:00', NULL, NULL, '2026-10-03 16:35:00', '2026-10-05'),
(16, 17, NULL, 'Tarjeta', 1, 4.95, 92.95, 4, '2026-10-05 12:30:00', NULL, NULL, '2026-10-04 21:50:00', NULL),
(1, 1, 8, 'Transferencia', 1, 4.95, 91.95, 1, '2026-10-05 11:00:00', NULL, NULL, '2026-10-05 11:00:00', NULL),
(10, 7, NULL, 'Tarjeta', 1, 4.95, 74.75, 3, '2026-10-05 19:30:00', NULL, NULL, '2026-10-05 18:40:00', NULL),
(17, 18, NULL, 'Tarjeta', 2, 9.95, 98.95, 3, '2026-10-06 08:00:00', NULL, NULL, '2026-10-05 23:30:00', NULL),
(9, NULL, NULL, 'Tarjeta', 5, 0.00, 110.00, 2, '2026-10-06 09:15:00', NULL, NULL, '2026-10-06 09:15:00', NULL),
(14, 14, 15, 'Tarjeta', 1, 4.95, 104.95, 2, '2026-10-06 10:40:00', NULL, NULL, '2026-10-06 10:40:00', NULL);


-- Facturas de los pedidos entregados (base = suma de cada línea sin IVA, según su tipo)
INSERT INTO Invoice (OrderID, Number, IssueDate, TaxBase, TaxAmount, Total) VALUES
(1, 'FAC-2026-0001', '2026-05-08 13:00:00', 39.21, 8.24, 47.45),
(2, 'FAC-2026-0002', '2026-05-22 12:10:00', 46.15, 9.70, 55.85),
(3, 'FAC-2026-0003', '2026-06-04 10:40:00', 50.37, 10.58, 60.95),
(4, 'FAC-2026-0004', '2026-06-19 11:00:00', 68.89, 14.46, 83.35),
(5, 'FAC-2026-0005', '2026-06-30 16:20:00', 60.62, 12.73, 73.35),
(8, 'FAC-2026-0006', '2026-07-16 12:00:00', 51.20, 10.75, 61.95),
(7, 'FAC-2026-0007', '2026-07-18 22:00:00', 24.79, 5.21, 30.00),
(9, 'FAC-2026-0008', '2026-07-24 12:00:00', 73.35, 15.40, 88.75),
(10, 'FAC-2026-0009', '2026-08-07 13:15:00', 33.00, 3.75, 36.75),
(14, 'FAC-2026-0010', '2026-08-30 11:30:00', 40.46, 6.99, 47.45),
(15, 'FAC-2026-0011', '2026-09-04 10:00:00', 47.77, 8.68, 56.45),
(11, 'FAC-2026-0012', '2026-09-05 14:00:00', 74.38, 15.62, 90.00),
(13, 'FAC-2026-0013', '2026-09-05 14:00:00', 49.59, 10.41, 60.00),
(17, 'FAC-2026-0014', '2026-09-13 12:30:00', 39.67, 8.33, 48.00);


-- Entradas del blog
INSERT INTO Post (Title, Slug, Excerpt, Content, ImageUrl, PublishedAt, UpdatedAt, IsPublished, UserID) VALUES
('Cómo elegimos las bodegas que vendemos', 'como-elegimos-las-bodegas-que-vendemos', 'Además de nuestros vinos, vendemos los de otras bodegas andaluzas que conocemos bien.', 'Además de nuestros vinos, vendemos los de otras bodegas andaluzas que conocemos bien. Te contamos qué miramos antes de incluir una bodega en el catálogo.', 'bodegas-seleccion.jpg', '2025-10-15 10:00:00', '2025-10-20 12:00:00', TRUE, 3),
('Guía rápida de los vinos de Jerez', 'guia-rapida-de-los-vinos-de-jerez', 'Fino, amontillado, oloroso o pedro ximénez: si te pierdes entre los tipos de vino de Jerez, aquí tienes una guía práctica para acertar.', 'Fino, amontillado, oloroso o pedro ximénez: si te pierdes entre los tipos de vino de Jerez, aquí tienes una guía práctica para acertar.', 'jerez-guia.jpg', '2025-11-10 09:30:00', '2025-11-12 11:00:00', TRUE, 6),
('Manzanilla: el vino de Sanlúcar', 'manzanilla-el-vino-de-sanlucar', 'La manzanilla solo se cría en Sanlúcar de Barrameda.', 'La manzanilla solo se cría en Sanlúcar de Barrameda. Explicamos qué tiene de especial el clima de la desembocadura del Guadalquivir.', 'manzanilla-sanlucar.jpg', '2025-12-05 14:00:00', '2025-12-06 15:00:00', TRUE, 3),
('El moscatel, nuestra seña de identidad', 'el-moscatel-nuestra-sena-de-identidad', 'En Pago de Jotrón trabajamos el moscatel de Alejandría desde hace generaciones.', 'En Pago de Jotrón trabajamos el moscatel de Alejandría desde hace generaciones. Te contamos cómo hacemos nuestro vino dulce.', 'moscatel-jotron.jpg', '2026-01-20 08:00:00', '2026-01-21 09:00:00', TRUE, 6),
('Así se hacen las pasas de Málaga', 'asi-se-hacen-las-pasas-de-malaga', 'Del racimo al pasero: el asoleo de la uva moscatel en la Axarquía es Patrimonio Agrícola Mundial.', 'Del racimo al pasero: el asoleo de la uva moscatel en la Axarquía es Patrimonio Agrícola Mundial. Lo vemos paso a paso en nuestra finca.', 'pasas-paseros.jpg', '2026-02-18 16:00:00', '2026-02-19 17:00:00', TRUE, 3),
('Qué esperar de una cata en Pago de Jotrón', 'que-esperar-de-una-cata-en-pago-de-jotron', 'Si nunca has ido a una cata, te contamos cómo funcionan las nuestras: cuánto duran, qué se prueba y qué no hace falta saber.', 'Si nunca has ido a una cata, te contamos cómo funcionan las nuestras: cuánto duran, qué se prueba y qué no hace falta saber.', 'cata-jotron.jpg', '2026-03-12 13:00:00', '2026-03-13 14:00:00', TRUE, 6),
('Vendimia 2026: así fue el día', 'vendimia-2026-asi-fue-el-dia', 'Veinticinco personas vendimiaron con nosotros una parcela de moscatel.', 'Veinticinco personas vendimiaron con nosotros una parcela de moscatel. Repasamos el día en fotos.', 'vendimia-2026.jpg', '2026-09-08 11:00:00', '2026-09-08 12:00:00', TRUE, 6),
('Fino de Montilla frente a fino de Jerez', 'fino-de-montilla-frente-a-fino-de-jerez', 'Los dos se crían bajo velo de flor, pero uno es de pedro ximénez y no se encabeza.', 'Los dos se crían bajo velo de flor, pero uno es de pedro ximénez y no se encabeza. Comparamos dos finos de nuestro catálogo.', 'fino-montilla-jerez.jpg', '2026-04-22 18:00:00', '2026-04-23 19:00:00', TRUE, 3),
('Qué comer con cada vino de nuestro catálogo', 'que-comer-con-cada-vino-de-nuestro-catalogo', 'Del tinto roble al pedro ximénez, te proponemos un maridaje distinto para cada vino que tenemos a la venta.', 'Del tinto roble al pedro ximénez, te proponemos un maridaje distinto para cada vino que tenemos a la venta.', 'maridaje-catalogo.jpg', '2026-05-30 18:00:00', '2026-06-01 19:00:00', TRUE, 6),
('Pinot noir en la serranía de Ronda', 'pinot-noir-en-la-serrania-de-ronda', 'Una uva de clima frío a 800 metros de altitud.', 'Una uva de clima frío a 800 metros de altitud. Hablamos con Cortijo Los Aguilares sobre cómo se adapta a la sierra.', 'pinot-ronda.jpg', NULL, '2026-10-01 10:00:00', FALSE, 3),
('Condado de Huelva, la denominación olvidada', 'condado-de-huelva-la-denominacion-olvidada', 'La zalema y los vinos generosos del Condado merecen más atención.', 'La zalema y los vinos generosos del Condado merecen más atención. Te contamos por qué.', 'condado-huelva.jpg', '2026-06-10 10:00:00', '2026-06-10 10:00:00', TRUE, 19),
('Breve historia del vino de Málaga', 'breve-historia-del-vino-de-malaga', 'Del Mountain que se bebía en Inglaterra a los dulces naturales de hoy: un repaso a tres siglos de vino malagueño.', 'Del Mountain que se bebía en Inglaterra a los dulces naturales de hoy: un repaso a tres siglos de vino malagueño.', 'historia-malaga.jpg', '2026-07-08 09:00:00', '2026-07-08 09:00:00', TRUE, 19),
('Amontillado: el vino de las dos crianzas', 'amontillado-el-vino-de-las-dos-crianzas', 'Empieza como un fino y termina como un oloroso.', 'Empieza como un fino y termina como un oloroso. Explicamos cómo se hace un amontillado con dos ejemplos.', 'amontillado.jpg', '2026-08-12 12:00:00', '2026-08-12 12:00:00', TRUE, 3),
('Ideas de regalo para Navidad', 'ideas-de-regalo-para-navidad', 'Lotes de vino y pasas para regalar, desde 15 euros.', 'Lotes de vino y pasas para regalar, desde 15 euros.', 'navidad.jpg', NULL, '2026-10-02 18:00:00', FALSE, 19);


-- Categorías del blog
INSERT INTO BlogCategory (Name) VALUES
('Bodegas'),
('Vinos de Jerez'),
('Vinos de Málaga'),
('Montilla-Moriles'),
('Pasas de Málaga'),
('Cata de vinos'),
('Enoturismo'),
('Maridaje'),
('Historia del vino'),
('Cultura del vino');


-- Log de acciones (UserID NULL = tarea automática del sistema)
INSERT INTO AuditLog (UserID, Action, LoggedAt, Details) VALUES
(5, 'Cambio de rol', '2026-03-01 09:05:00', 'Asignó el rol Editor a Marta Iglesias Vidal.'),
(3, 'Alta de producto', '2026-06-02 10:00:00', 'Dio de alta Pasas de Málaga Jotrón en formato de 1 kg.'),
(6, 'Alta de evento', '2026-07-01 09:30:00', 'Creó el evento Vendimia en Pago de Jotrón 2026.'),
(5, 'Anulación de pedido', '2026-07-02 09:30:00', 'Anuló el pedido #6 por un error en la dirección de envío.'),
(5, 'Cambio de estado de pedido', '2026-07-16 12:00:00', 'Cambió el pedido #8 a Entregado.'),
(5, 'Desactivación de usuario', '2026-08-01 10:00:00', 'Desactivó la cuenta de José Herrera León a petición suya.'),
(NULL, 'Bloqueo automático de pedido', '2026-09-02 12:00:00', 'El pedido #12 lleva 15 días en Pendiente de pago y pasa a Bloqueado.'),
(5, 'Cambio de estado de pedido', '2026-09-05 14:00:00', 'Pasó el pedido #13 a Entregado tras celebrarse la vendimia.'),
(3, 'Cierre de evento', '2026-09-06 08:30:00', 'Cerró las inscripciones de Vendimia en Pago de Jotrón 2026.'),
(5, 'Anulación de pedido', '2026-09-07 10:00:00', 'Anuló el pedido #12: no se ha recibido la transferencia.'),
(19, 'Alta de evento', '2026-09-15 10:00:00', 'Creó el evento Curso de iniciación a la cata.'),
(5, 'Bloqueo de venta', '2026-09-20 09:00:00', 'Bloqueó la venta de Bodegas Toro Albalá hasta renovar el acuerdo de distribución.'),
(3, 'Actualización de stock', '2026-09-22 08:45:00', 'Repuso 60 unidades de Solear Manzanilla.'),
(NULL, 'Bloqueo automático de pedido', '2026-09-30 00:00:00', 'El pedido #18 lleva 15 días en Pendiente de pago y pasa a Bloqueado.'),
(6, 'Modificación de artículo', '2026-10-02 11:15:00', 'Actualizó el artículo Guía rápida de los vinos de Jerez.'),
(5, 'Cambio de estado de pedido', '2026-10-03 09:00:00', 'Cambió el pedido #20 a Enviado.');


-- Categoría de cada vino
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES
(1, 1),
(2, 10),
(4, 5),
(5, 6),
(6, 9),
(7, 5),
(8, 2),
(9, 3),
(10, 7),
(11, 11),
(12, 6),
(13, 7),
(14, 8),
(15, 9),
(16, 9),
(17, 3),
(18, 2),
(19, 5),
(20, 13),
(21, 5),
(22, 3),
(23, 2);


-- Uvas de cada producto
INSERT INTO ProductGrape (ProductID, GrapeID, Percentage) VALUES
(1, 1, 70),
(1, 2, 30),
(2, 3, 100),
(3, 3, 100),
(4, 4, 100),
(5, 4, 100),
(6, 5, 100),
(7, 5, 100),
(8, 6, 100),
(9, 3, 100),
(10, 4, 100),
(11, 4, 100),
(12, 4, 100),
(13, 4, 100),
(14, 4, 100),
(15, 5, 100),
(16, 5, 100),
(17, 3, 100),
(18, 2, 50),
(18, 8, 30),
(18, 9, 20),
(19, 4, 100),
(20, 4, 85),
(20, 5, 15),
(21, 4, 100),
(22, 10, 100),
(23, 12, 60),
(23, 2, 40);


-- [Ampliación] Etiquetas de cata de cada producto
INSERT INTO ProductTastingTag (ProductID, TastingTagID) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 7),
(3, 7),
(4, 5),
(4, 6),
(5, 5),
(5, 6),
(5, 9),
(6, 7),
(6, 8),
(7, 5),
(7, 6),
(8, 3),
(8, 4),
(8, 10),
(9, 1),
(9, 2),
(9, 9),
(10, 3),
(10, 6),
(11, 4),
(11, 6),
(12, 5),
(12, 6),
(12, 9),
(13, 3),
(13, 6),
(14, 4),
(14, 6),
(15, 7),
(15, 8),
(16, 7),
(16, 8),
(17, 1),
(17, 2),
(17, 9),
(18, 3),
(18, 4),
(19, 5),
(19, 6),
(20, 1),
(20, 3),
(21, 5),
(21, 6),
(22, 1),
(22, 2),
(22, 9),
(23, 3),
(23, 4);


-- [Ampliación] Variedades autorizadas en cada D.O. (las que usan los productos del catálogo)
INSERT INTO GuaranteeOfOriginGrape (GuaranteeOfOriginID, GrapeID) VALUES
(1, 4),
(1, 5),
(2, 4),
(3, 5),
(4, 10),
(5, 3),
(5, 5),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 12),
(7, 3),
(10, 2),
(10, 8),
(10, 9);


-- Líneas de producto de cada pedido (apuntan a la presentación comprada)
INSERT INTO OrderProduct (OrderID, VariantID, Quantity, UnitPrice, TaxRate) VALUES
(1, 1, 3, 9.50, 21.00),
(1, 2, 1, 14.00, 21.00),
(2, 13, 2, 13.50, 21.00),
(2, 5, 2, 11.95, 21.00),
(3, 15, 6, 8.50, 21.00),
(4, 17, 2, 18.00, 21.00),
(4, 14, 1, 19.90, 21.00),
(4, 7, 1, 22.50, 21.00),
(5, 20, 3, 13.90, 21.00),
(5, 12, 3, 8.90, 21.00),
(6, 21, 2, 19.00, 21.00),
(8, 1, 6, 9.50, 21.00),
(9, 24, 6, 9.50, 21.00),
(9, 23, 2, 10.90, 21.00),
(10, 11, 4, 4.20, 10.00),
(10, 3, 2, 7.50, 10.00),
(12, 26, 2, 21.00, 21.00),
(14, 7, 1, 22.50, 21.00),
(14, 3, 2, 7.50, 10.00),
(15, 2, 2, 14.00, 21.00),
(15, 4, 1, 13.50, 10.00),
(16, 5, 3, 11.95, 21.00),
(17, 9, 2, 24.00, 21.00),
(18, 8, 6, 9.20, 21.00),
(20, 16, 2, 14.50, 21.00),
(20, 22, 2, 16.50, 21.00),
(21, 10, 6, 5.90, 21.00),
(21, 11, 2, 4.20, 10.00),
(22, 18, 2, 24.50, 21.00),
(22, 25, 6, 6.50, 21.00),
(23, 4, 2, 13.50, 10.00),
(24, 6, 2, 9.90, 21.00),
(25, 1, 2, 9.50, 21.00),
(27, 26, 1, 21.00, 21.00),
(27, 21, 1, 19.00, 21.00);


-- Entradas de eventos de cada pedido
INSERT INTO OrderEvent (OrderID, EventID, Quantity, UnitPrice, TaxRate) VALUES
(7, 6, 2, 15.00, 21.00),
(11, 1, 3, 30.00, 21.00),
(13, 1, 2, 30.00, 21.00),
(19, 2, 2, 15.00, 21.00),
(19, 8, 2, 18.00, 21.00),
(23, 2, 4, 15.00, 21.00),
(24, 3, 2, 25.00, 21.00),
(25, 7, 2, 35.00, 21.00),
(26, 4, 2, 45.00, 21.00),
(26, 5, 1, 20.00, 21.00),
(27, 9, 1, 60.00, 21.00);


-- Carritos guardados: presentaciones
INSERT INTO CartProduct (UserID, VariantID, Quantity, AddedAt) VALUES
(1, 2, 1, '2026-10-05 22:10:00'),
(2, 1, 3, '2026-10-03 20:45:00'),
(2, 3, 2, '2026-10-03 20:47:00'),
(4, 5, 2, '2026-10-04 12:30:00'),
(4, 6, 2, '2026-10-04 12:32:00'),
(7, 7, 1, '2026-10-01 18:15:00'),
(8, 4, 1, '2026-10-06 08:05:00'),
(8, 8, 2, '2026-10-06 08:07:00'),
(10, 9, 1, '2026-10-06 09:40:00'),
(11, 10, 2, '2026-10-02 19:00:00'),
(15, 20, 1, '2026-10-04 17:25:00'),
(17, 26, 1, '2026-10-06 07:50:00'),
(18, 14, 1, '2026-10-05 21:15:00');


-- Carritos guardados: entradas de eventos
INSERT INTO CartEvent (UserID, EventID, Quantity, AddedAt) VALUES
(1, 5, 1, '2026-10-05 22:12:00'),
(2, 2, 2, '2026-10-03 20:50:00'),
(4, 3, 2, '2026-10-04 12:35:00'),
(7, 5, 2, '2026-10-01 18:20:00'),
(8, 4, 2, '2026-10-06 08:10:00'),
(12, 7, 2, '2026-10-04 11:00:00'),
(13, 8, 2, '2026-10-05 10:30:00'),
(15, 9, 1, '2026-10-04 17:30:00');


-- Categorías de cada entrada
INSERT INTO PostBlogCategory (PostID, BlogCategoryID) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 5),
(6, 6),
(7, 7),
(8, 4),
(9, 8),
(10, 1),
(11, 10),
(12, 9),
(12, 3),
(13, 2),
(14, 5);


-- Productos citados en cada entrada
INSERT INTO PostProduct (PostID, ProductID) VALUES
(2, 4),
(2, 6),
(3, 5),
(4, 2),
(5, 3),
(8, 4),
(8, 7),
(9, 1),
(9, 6),
(10, 8),
(11, 22),
(12, 2),
(13, 10),
(13, 13),
(14, 3),
(14, 2);


-- Bodegas citadas en cada entrada
INSERT INTO PostWinery (PostID, WineryID) VALUES
(1, 2),
(1, 3),
(1, 4),
(3, 3),
(8, 6),
(10, 8),
(11, 27),
(13, 2),
(13, 5),
(14, 1);


-- Denominaciones citadas en cada entrada
INSERT INTO PostGuaranteeOfOrigin (PostID, GuaranteeOfOriginID) VALUES
(2, 1),
(3, 2),
(4, 5),
(5, 7),
(8, 3),
(10, 6),
(11, 4),
(12, 5),
(13, 1),
(13, 2);


-- Categorías de vino citadas en cada entrada
INSERT INTO PostCategory (PostID, CategoryID) VALUES
(2, 5),
(2, 7),
(2, 8),
(3, 6),
(4, 10),
(8, 5),
(9, 1),
(9, 9),
(12, 10),
(13, 7);


-- =====================================================================
-- Usuarios, roles y privilegios de la base de datos
-- Cada usuario de MariaDB tiene solo los permisos que necesita.
-- Las contraseñas son de ejemplo: en producción se cambian y se guardan
-- en variables de entorno, nunca en el repositorio.
-- =====================================================================

-- Roles
CREATE ROLE IF NOT EXISTS rol_tienda;
CREATE ROLE IF NOT EXISTS rol_informes;
CREATE ROLE IF NOT EXISTS rol_copias;
CREATE ROLE IF NOT EXISTS rol_admin_bd;

-- rol_tienda: lo usa la aplicación web. Lee y escribe, pero no puede borrar
-- pedidos, facturas, productos, usuarios ni el log. Para retirar algo se usa
-- IsBlocked o IsActive. Sí puede vaciar el carrito, las tablas de relación
-- y las tablas hijas (pasos, qué esperar y programa).
GRANT SELECT, INSERT, UPDATE ON Jotron.* TO rol_tienda;
GRANT DELETE ON Jotron.Address TO rol_tienda;
GRANT DELETE ON Jotron.ProductCategory TO rol_tienda;
GRANT DELETE ON Jotron.ProductGrape TO rol_tienda;
GRANT DELETE ON Jotron.ProductTastingTag TO rol_tienda;   -- [Ampliación]
GRANT DELETE ON Jotron.GuaranteeOfOriginGrape TO rol_tienda; -- [Ampliación]
GRANT DELETE ON Jotron.ProductStep TO rol_tienda;         -- [Ampliación]
GRANT DELETE ON Jotron.EventHighlight TO rol_tienda;      -- [Ampliación]
GRANT DELETE ON Jotron.EventScheduleItem TO rol_tienda;   -- [Ampliación]
GRANT DELETE ON Jotron.PostBlogCategory TO rol_tienda;
GRANT DELETE ON Jotron.PostProduct TO rol_tienda;
GRANT DELETE ON Jotron.PostWinery TO rol_tienda;
GRANT DELETE ON Jotron.PostGuaranteeOfOrigin TO rol_tienda;
GRANT DELETE ON Jotron.PostCategory TO rol_tienda;
GRANT DELETE ON Jotron.CartProduct TO rol_tienda;
GRANT DELETE ON Jotron.CartEvent TO rol_tienda;

-- rol_informes: solo consulta, para informes de ventas y estadísticas.
GRANT SELECT ON Jotron.* TO rol_informes;

-- rol_copias: lo justo para hacer copias de seguridad con mariadb-dump.
GRANT SELECT, LOCK TABLES, SHOW VIEW, EVENT, TRIGGER ON Jotron.* TO rol_copias;

-- rol_admin_bd: administración completa de la base de datos Jotron.
GRANT ALL PRIVILEGES ON Jotron.* TO rol_admin_bd;

-- Usuarios
CREATE USER IF NOT EXISTS 'jotron_app'@'localhost' IDENTIFIED BY 'App_Jotron_2026!';
CREATE USER IF NOT EXISTS 'jotron_informes'@'localhost' IDENTIFIED BY 'Informes_Jotron_2026!';
CREATE USER IF NOT EXISTS 'jotron_copias'@'localhost' IDENTIFIED BY 'Copias_Jotron_2026!';
CREATE USER IF NOT EXISTS 'jotron_admin'@'localhost' IDENTIFIED BY 'Admin_Jotron_2026!';

-- Asignación de roles y rol activo por defecto al conectar
GRANT rol_tienda TO 'jotron_app'@'localhost';
GRANT rol_informes TO 'jotron_informes'@'localhost';
GRANT rol_copias TO 'jotron_copias'@'localhost';
GRANT rol_admin_bd TO 'jotron_admin'@'localhost';

-- MariaDB usa "SET DEFAULT ROLE ... FOR" y MySQL 8, "SET DEFAULT ROLE ... TO".
-- Con los comentarios ejecutables, cada gestor lanza solo su versión: /*M! solo
-- lo ejecuta MariaDB y /*!80000 solo MySQL 8 o superior.
/*M!100101 SET DEFAULT ROLE rol_tienda FOR 'jotron_app'@'localhost' */;
/*M!100101 SET DEFAULT ROLE rol_informes FOR 'jotron_informes'@'localhost' */;
/*M!100101 SET DEFAULT ROLE rol_copias FOR 'jotron_copias'@'localhost' */;
/*M!100101 SET DEFAULT ROLE rol_admin_bd FOR 'jotron_admin'@'localhost' */;
/*!80000 SET DEFAULT ROLE rol_tienda TO 'jotron_app'@'localhost' */;
/*!80000 SET DEFAULT ROLE rol_informes TO 'jotron_informes'@'localhost' */;
/*!80000 SET DEFAULT ROLE rol_copias TO 'jotron_copias'@'localhost' */;
/*!80000 SET DEFAULT ROLE rol_admin_bd TO 'jotron_admin'@'localhost' */;

FLUSH PRIVILEGES;
