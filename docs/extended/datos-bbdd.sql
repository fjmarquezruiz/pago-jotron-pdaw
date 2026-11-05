-- =====================================================================
-- Pago de Jotrón · Datos de prueba (versión entregable) · modelo ampliado (36 tablas)
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
('Javier', 'García Luna', '1991-04-18', '$2y$12$UjbQzwcCNOSjho30nq4CFOPNRvYWHZ04gbR3XJpkkG2ymJaVwdbqm', '30987654F', 'javier.garcia@example.com', '600666777', 'Cliente', TRUE, '2026-05-28 11:15:00');


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
(9, '600555666', 'Paseo', 'Marítimo', '18', NULL, '07014', 'Palma', 'Illes Balears', 'España', 'Envío', TRUE);


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
('Cádiz', 'VT', 'Cádiz', NULL, NULL, NULL, NULL, FALSE);


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
('Huerta de Albalá', NULL, NULL, 'Arcos de la Frontera', 'Cádiz', 'España', NULL, NULL, NULL, FALSE);


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
('Moscatel dulce');


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
('Zalema', 'Blanca');


-- Productos: vinos andaluces y pasas de Málaga (las presentaciones van en ProductVariant)
INSERT INTO Product (Name, WineryID, GuaranteeOfOriginID, TypologyID, Vintage, Image, Description, VisualNote, AromaNote, PalateNote, MinTemperature, MaxTemperature, AlcoholContent, FoodPairing, IsBlocked, CreatedAt, AgingTime, AgingMethod, Production, VineyardAltitude, SoilType, Yield) VALUES
('Jotrón Tinto Roble', 1, 6, 1, 2023, 'jotron-tinto-roble.jpg', 'Tinto con cuatro meses en barrica de roble francés, elaborado con tempranillo y syrah de nuestros viñedos.', 'Rojo picota con ribete violáceo.', 'Fruta negra madura, regaliz y un fondo tostado suave.', 'Sabroso, de taninos redondos y final largo.', 14.00, 16.00, 14.00, 'Carnes a la brasa, guisos y quesos curados.', FALSE, '2026-01-12 10:00:00', '4 meses en barrica de roble francés', 'Crianza corta en barricas de roble francés de segundo uso, con trasiegas cada dos meses para afinar el tanino sin tapar la fruta.', '18.000 botellas', 850, 'Pizarra y arcilla', 4500),
('Jotrón Moscatel Dulce', 1, 5, 5, 2022, 'jotron-moscatel-dulce.jpg', 'Vino dulce natural de moscatel de Alejandría, con la uva asoleada en los paseros de la finca.', 'Oro viejo, limpio y brillante.', 'Pasa, miel de azahar y piel de naranja.', 'Untuoso y fresco, sin llegar a empalagar.', 8.00, 10.00, 15.00, 'Postres de hojaldre, foie y quesos azules.', FALSE, '2026-01-12 10:10:00', 'Sin crianza en madera', 'Uva asoleada en paseros y fermentación parcial; reposa en depósito de acero inoxidable para conservar el aroma de la moscatel.', '6.000 botellas', 700, 'Pizarra', 3000),
('Pasas de Málaga Jotrón', 1, 7, 7, 2025, 'pasas-jotron-500g.jpg', 'Pasas de moscatel secadas al sol en los paseros de la finca y despalilladas a mano.', NULL, NULL, NULL, NULL, NULL, NULL, 'Solas, con queso fresco o en ensaladas.', FALSE, '2026-01-12 10:20:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Tío Pepe Fino', 2, 1, 4, NULL, 'tio-pepe-fino.jpg', 'Fino muy seco de palomino, criado bajo velo de flor en el sistema de criaderas y soleras.', 'Amarillo pajizo pálido.', 'Almendra, masa de pan y notas salinas.', 'Seco, ligero y punzante.', 6.00, 8.00, 15.00, 'Jamón ibérico, aceitunas y pescaíto frito.', FALSE, '2026-02-03 09:30:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Solear Manzanilla', 3, 2, 4, NULL, 'solear-manzanilla.jpg', 'Manzanilla criada bajo velo de flor en las bodegas de Sanlúcar de Barrameda.', 'Amarillo pálido con reflejos verdosos.', 'Manzanilla de campo, levadura y brisa marina.', 'Fresca, seca y con un final ligeramente amargo.', 6.00, 8.00, 15.00, 'Langostinos, marisco y pescado frito.', FALSE, '2026-02-03 09:40:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Lustau San Emilio Pedro Ximénez', 4, 1, 5, NULL, 'lustau-san-emilio-px.jpg', 'Dulce natural de pedro ximénez con envejecimiento oxidativo en solera.', 'Caoba muy oscuro, casi opaco.', 'Higo, dátil, café y cacao.', 'Denso, muy dulce y largo.', 12.00, 14.00, 17.00, 'Helado de vainilla, chocolate negro y quesos azules.', FALSE, '2026-02-03 09:50:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Alvear Fino C.B.', 6, 3, 4, NULL, 'alvear-fino-cb.jpg', 'Fino de pedro ximénez de la Sierra de Montilla, criado bajo velo de flor sin encabezar.', 'Oro pálido.', 'Almendra tostada y hierbas secas.', 'Seco, suave y con buena persistencia.', 6.00, 8.00, 15.00, 'Salmorejo, flamenquín y tapas fritas.', FALSE, '2026-02-10 11:00:00', NULL, NULL, NULL, NULL, NULL, NULL),
('Cortijo Los Aguilares Pinot Noir', 8, 6, 1, 2022, 'aguilares-pinot-noir.jpg', 'Tinto de pinot noir de la serranía de Ronda, con crianza en barrica de roble francés.', 'Rojo cereza de capa media.', 'Frutos rojos, sotobosque y especias dulces.', 'Elegante, fresco y de tanino fino.', 14.00, 16.00, 14.00, 'Atún rojo, setas y carnes de caza.', FALSE, '2026-03-05 12:00:00', NULL, NULL, NULL, NULL, NULL, NULL);


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
(8, 'Botella', 750, 'ml', 24.00, 18, FALSE);


-- [Ampliación] Pasos de elaboración (solo los productos de Pago de Jotrón)
INSERT INTO ProductStep (ProductID, Position, Title, Description) VALUES
(1, 1, 'Vendimia', 'Vendimia a mano en cajas de 15 kg a primera hora de la mañana.'),
(1, 2, 'Fermentación', 'Despalillado y fermentación en depósitos de acero con control de temperatura.'),
(1, 3, 'Crianza', 'Cuatro meses en barrica de roble francés.'),
(1, 4, 'Embotellado', 'Reposo en botella antes de salir a la venta.'),
(3, 1, 'Vendimia', 'Recogida a mano del moscatel en agosto.'),
(3, 2, 'Asoleo', 'Unas tres semanas en los paseros, dando la vuelta a los racimos.'),
(3, 3, 'Despalillado', 'Se separa la pasa del racimo a mano, con tijera.'),
(3, 4, 'Envasado', 'Selección de la pasa y envasado en la propia finca.');


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
('Taller');


-- Eventos organizados por Pago de Jotrón (Location toma su valor por defecto)
INSERT INTO Event (Title, Description, EventTypeID, StartsAt, EndsAt, Price, TaxRate, MaxParticipants, AvailableSeats, IsOpen, ImageUrl) VALUES
('Vendimia en Pago de Jotrón 2026', 'Vendimiamos a mano una parcela de moscatel, llevamos la uva a los paseros y terminamos con un almuerzo en la bodega.', 4, '2026-09-05 09:00:00', '2026-09-05 13:00:00', 30.00, 21.00, 25, 0, FALSE, 'vendimia-en-pago-de-jotron-2026.jpg'),
('Visita guiada a la bodega y los viñedos', 'Recorremos el viñedo, los paseros y la sala de barricas, y terminamos con una copa de nuestro tinto roble.', 1, '2026-10-24 11:00:00', '2026-10-24 13:00:00', 15.00, 21.00, 20, 12, TRUE, 'visita-guiada-a-la-bodega-y-los-vinedos.jpg'),
('Cata guiada de los vinos de Pago de Jotrón', 'Nuestro enólogo presenta el tinto roble y el moscatel dulce, y explica cómo se elaboran.', 2, '2026-11-07 18:00:00', '2026-11-07 19:30:00', 25.00, 21.00, 15, 9, TRUE, 'cata-guiada-de-los-vinos-de-pago-de-jotron.jpg'),
('Cata maridada: vinos dulces y quesos malagueños', 'Cinco vinos dulces de Málaga acompañados de quesos de cabra de la provincia.', 3, '2026-11-21 13:00:00', '2026-11-21 15:30:00', 45.00, 21.00, 12, 6, TRUE, 'cata-maridada-vinos-dulces-y-quesos-malaguenos.jpg'),
('Taller de pasas: del pasero a la mesa', 'Aprendemos cómo se asolea la uva en los paseros y preparamos tres recetas con pasas de Málaga.', 5, '2026-12-12 10:30:00', '2026-12-12 12:30:00', 20.00, 21.00, 15, 11, TRUE, 'taller-de-pasas-del-pasero-a-la-mesa.jpg');


-- [Ampliación] Qué esperar de cada evento
INSERT INTO EventHighlight (EventID, Position, Text) VALUES
(1, 1, 'Vendimia a mano de una parcela de moscatel'),
(1, 2, 'Visita a los paseros'),
(2, 1, 'Paseo por el viñedo'),
(2, 2, 'Sala de barricas'),
(3, 1, 'Dos vinos de la casa'),
(3, 2, 'Explicación del enólogo'),
(4, 1, 'Cinco vinos dulces de Málaga'),
(4, 2, 'Quesos de cabra de la provincia'),
(5, 1, 'Asoleo de la uva en los paseros'),
(5, 2, 'Tres recetas con pasas');


-- [Ampliación] Programa de cada evento
INSERT INTO EventScheduleItem (EventID, StartTime, Description) VALUES
(1, '09:00:00', 'Bienvenida y reparto de tijeras'),
(1, '09:30:00', 'Vendimia en la parcela'),
(2, '11:00:00', 'Paseo por el viñedo'),
(2, '11:45:00', 'Paseros y sala de barricas'),
(3, '18:00:00', 'Bienvenida'),
(3, '18:15:00', 'Cata del tinto roble'),
(4, '13:00:00', 'Bienvenida'),
(4, '13:15:00', 'Cata maridada'),
(5, '10:30:00', 'Visita a los paseros'),
(5, '11:15:00', 'Taller de cocina');


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
(1, 1, 8, 'Tarjeta', 1, 4.95, 61.95, 6, '2026-07-16 12:00:00', NULL, NULL, '2026-07-14 10:12:00', '2026-07-15'),
(2, NULL, NULL, 'PayPal', 5, 0.00, 60.00, 6, '2026-09-05 14:00:00', NULL, NULL, '2026-08-20 21:30:00', NULL),
(4, 3, NULL, 'Tarjeta', 2, 9.95, 47.45, 6, '2026-08-30 11:30:00', NULL, NULL, '2026-08-28 17:45:00', '2026-08-29'),
(9, 10, NULL, 'Tarjeta', 4, 14.95, 56.45, 6, '2026-09-04 10:00:00', NULL, NULL, '2026-09-01 09:20:00', '2026-09-02'),
(8, 5, NULL, 'Tarjeta', 1, 4.95, 40.80, 7, '2026-09-10 21:05:00', 'Cliente', 3, '2026-09-10 08:40:00', NULL),
(7, NULL, 9, 'PayPal', 3, 0.00, 48.00, 6, '2026-09-13 12:30:00', NULL, NULL, '2026-09-11 19:05:00', NULL),
(2, 2, NULL, 'Transferencia', 2, 9.95, 65.15, 8, '2026-09-30 00:00:00', NULL, NULL, '2026-09-15 13:10:00', NULL),
(1, 1, 8, 'Transferencia', 1, 4.95, 91.95, 1, '2026-10-05 11:00:00', NULL, NULL, '2026-10-05 11:00:00', NULL),
(10, 7, NULL, 'Tarjeta', 1, 4.95, 74.75, 3, '2026-10-05 19:30:00', NULL, NULL, '2026-10-05 18:40:00', NULL),
(9, NULL, NULL, 'Tarjeta', 5, 0.00, 110.00, 2, '2026-10-06 09:15:00', NULL, NULL, '2026-10-06 09:15:00', NULL),
(4, 3, NULL, 'Tarjeta', 1, 4.95, 46.95, 5, '2026-10-02 09:00:00', NULL, NULL, '2026-10-01 10:30:00', '2026-10-02'),
(8, 5, NULL, 'PayPal', 2, 9.95, 54.95, 4, '2026-10-05 12:00:00', NULL, NULL, '2026-10-04 20:10:00', NULL);


-- Facturas de los pedidos entregados (base = suma de cada línea sin IVA, según su tipo)
INSERT INTO Invoice (OrderID, Number, IssueDate, TaxBase, TaxAmount, Total) VALUES
(1, 'FAC-2026-0001', '2026-07-16 12:00:00', 51.20, 10.75, 61.95),
(3, 'FAC-2026-0002', '2026-08-30 11:30:00', 40.46, 6.99, 47.45),
(4, 'FAC-2026-0003', '2026-09-04 10:00:00', 47.77, 8.68, 56.45),
(2, 'FAC-2026-0004', '2026-09-05 14:00:00', 49.59, 10.41, 60.00),
(6, 'FAC-2026-0005', '2026-09-13 12:30:00', 39.67, 8.33, 48.00);


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
('Pinot noir en la serranía de Ronda', 'pinot-noir-en-la-serrania-de-ronda', 'Una uva de clima frío a 800 metros de altitud.', 'Una uva de clima frío a 800 metros de altitud. Hablamos con Cortijo Los Aguilares sobre cómo se adapta a la sierra.', 'pinot-ronda.jpg', NULL, '2026-10-01 10:00:00', FALSE, 3);


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
(3, 'Alta de producto', '2026-06-02 10:00:00', 'Dio de alta Pasas de Málaga Jotrón en formato de 1 kg.'),
(6, 'Alta de evento', '2026-07-01 09:30:00', 'Creó el evento Vendimia en Pago de Jotrón 2026.'),
(5, 'Cambio de estado de pedido', '2026-07-16 12:00:00', 'Cambió el pedido #1 a Entregado.'),
(5, 'Cambio de estado de pedido', '2026-09-05 14:00:00', 'Pasó el pedido #2 a Entregado tras celebrarse la vendimia.'),
(3, 'Cierre de evento', '2026-09-06 08:30:00', 'Cerró las inscripciones de Vendimia en Pago de Jotrón 2026.'),
(5, 'Bloqueo de venta', '2026-09-20 09:00:00', 'Bloqueó la venta de Bodegas Toro Albalá hasta renovar el acuerdo de distribución.'),
(NULL, 'Bloqueo automático de pedido', '2026-09-30 00:00:00', 'El pedido #7 lleva 15 días en Pendiente de pago y pasa a Bloqueado.'),
(6, 'Modificación de artículo', '2026-10-02 11:15:00', 'Actualizó el artículo Guía rápida de los vinos de Jerez.');


-- Categoría de cada vino
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES
(1, 1),
(2, 10),
(4, 5),
(5, 6),
(6, 9),
(7, 5),
(8, 2);


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
(8, 6, 100);


-- [Ampliación] Etiquetas de cata de cada producto
INSERT INTO ProductTastingTag (ProductID, TastingTagID) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 7),
(3, 7),
(4, 5),
(5, 5),
(6, 7),
(7, 5),
(8, 3);


-- [Ampliación] Variedades autorizadas en cada D.O. (las que usan los productos del catálogo)
INSERT INTO GuaranteeOfOriginGrape (GuaranteeOfOriginID, GrapeID) VALUES
(1, 4),
(1, 5),
(2, 4),
(3, 5),
(5, 3),
(5, 5),
(6, 1),
(6, 2),
(6, 6),
(7, 3);


-- Líneas de producto de cada pedido (apuntan a la presentación comprada)
INSERT INTO OrderProduct (OrderID, VariantID, Quantity, UnitPrice, TaxRate) VALUES
(1, 1, 6, 9.50, 21.00),
(3, 7, 1, 22.50, 21.00),
(3, 3, 2, 7.50, 10.00),
(4, 2, 2, 14.00, 21.00),
(4, 4, 1, 13.50, 10.00),
(5, 5, 3, 11.95, 21.00),
(6, 9, 2, 24.00, 21.00),
(7, 8, 6, 9.20, 21.00),
(8, 4, 2, 13.50, 10.00),
(9, 6, 2, 9.90, 21.00),
(11, 2, 3, 14.00, 21.00),
(12, 7, 2, 22.50, 21.00);


-- Entradas de eventos de cada pedido
INSERT INTO OrderEvent (OrderID, EventID, Quantity, UnitPrice, TaxRate) VALUES
(2, 1, 2, 30.00, 21.00),
(8, 2, 4, 15.00, 21.00),
(9, 3, 2, 25.00, 21.00),
(10, 4, 2, 45.00, 21.00),
(10, 5, 1, 20.00, 21.00);


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
(10, 9, 1, '2026-10-06 09:40:00');


-- Carritos guardados: entradas de eventos
INSERT INTO CartEvent (UserID, EventID, Quantity, AddedAt) VALUES
(1, 5, 1, '2026-10-05 22:12:00'),
(2, 2, 2, '2026-10-03 20:50:00'),
(4, 3, 2, '2026-10-04 12:35:00'),
(7, 5, 2, '2026-10-01 18:20:00'),
(8, 4, 2, '2026-10-06 08:10:00');


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
(10, 1);


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
(10, 8);


-- Bodegas citadas en cada entrada
INSERT INTO PostWinery (PostID, WineryID) VALUES
(1, 2),
(1, 3),
(1, 4),
(3, 3),
(8, 6),
(10, 8);


-- Denominaciones citadas en cada entrada
INSERT INTO PostGuaranteeOfOrigin (PostID, GuaranteeOfOriginID) VALUES
(2, 1),
(3, 2),
(4, 5),
(5, 7),
(8, 3),
(10, 6);


-- Categorías de vino citadas en cada entrada
INSERT INTO PostCategory (PostID, CategoryID) VALUES
(2, 5),
(2, 7),
(2, 8),
(3, 6),
(4, 10),
(8, 5),
(9, 1),
(9, 9);


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
