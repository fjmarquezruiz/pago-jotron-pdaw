-- =====================================================================
-- Pago de Jotrón · Datos de prueba (versión ampliada)
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
INSERT INTO Address (UserID, Phone, StreetType, StreetName, Number, PostalCode, City, Province, Country, AddressType, IsActive) VALUES
(1, '600123456', 'Calle', 'Feria', '42', '41003', 'Sevilla', 'Sevilla', 'España', 'Envío', TRUE),
(2, '600654321', 'Calle', 'Carretería', '15', '29008', 'Málaga', 'Málaga', 'España', 'Envío', TRUE),
(4, '600321987', 'Avenida', 'República Argentina', '24', '41011', 'Sevilla', 'Sevilla', 'España', 'Envío', TRUE),
(7, '600333444', 'Paseo', 'de Reding', '8', '29016', 'Málaga', 'Málaga', 'España', 'Envío', TRUE),
(8, '600444555', 'Calle', 'Victoria', '31', '29012', 'Málaga', 'Málaga', 'España', 'Envío', TRUE),
(9, '600555666', 'Calle', 'Asunción', '50', '41011', 'Sevilla', 'Sevilla', 'España', 'Envío', TRUE),
(10, '600666777', 'Avenida', 'Gran Capitán', '12', '14008', 'Córdoba', 'Córdoba', 'España', 'Envío', TRUE),
(1, '954220145', 'Calle', 'Rioja', '5', '41001', 'Sevilla', 'Sevilla', 'España', 'Facturación', TRUE),
(7, '952608731', 'Calle', 'Marqués de Larios', '3', '29005', 'Málaga', 'Málaga', 'España', 'Facturación', TRUE),
(9, '600555666', 'Paseo', 'Marítimo', '18', '07014', 'Palma', 'Illes Balears', 'España', 'Envío', TRUE),
(11, '611234567', 'Calle', 'Mesones', '9', '18001', 'Granada', 'Granada', 'España', 'Envío', TRUE),
(12, '612345678', 'Avenida', 'de Andalucía', '27', '23006', 'Jaén', 'Jaén', 'España', 'Envío', TRUE),
(13, '613456789', 'Calle', 'Ancha', '33', '11001', 'Cádiz', 'Cádiz', 'España', 'Envío', TRUE),
(14, '614567890', 'Calle', 'Concepción', '14', '21001', 'Huelva', 'Huelva', 'España', 'Envío', TRUE),
(14, '959281133', 'Avenida', 'Martín Alonso Pinzón', '2', '21003', 'Huelva', 'Huelva', 'España', 'Facturación', TRUE),
(15, '615678901', 'Calle', 'Serrano', '61', '28006', 'Madrid', 'Madrid', 'España', 'Envío', TRUE),
(16, '616789012', 'Plaza', 'Mayor', '4', '04700', 'El Ejido', 'Almería', 'España', 'Envío', TRUE),
(17, '617890123', 'Calle', 'Colón', '20', '46004', 'Valencia', 'Valencia', 'España', 'Envío', TRUE),
(18, '618901234', 'Avenida', 'Diagonal', '410', '08037', 'Barcelona', 'Barcelona', 'España', 'Envío', TRUE),
(20, '620123456', 'Calle', 'Real', '7', '11100', 'San Fernando', 'Cádiz', 'España', 'Envío', TRUE),
(8, '600444555', 'Calle', 'Granada', '19', '29015', 'Málaga', 'Málaga', 'España', 'Envío', FALSE);


-- Denominaciones de origen de Andalucía
INSERT INTO GuaranteeOfOrigin (Name, IsBlocked) VALUES
('DO Jerez-Xérès-Sherry', FALSE),
('DO Manzanilla-Sanlúcar de Barrameda', FALSE),
('DO Montilla-Moriles', FALSE),
('DO Condado de Huelva', FALSE),
('DO Málaga', FALSE),
('DO Sierras de Málaga', FALSE),
('DOP Pasas de Málaga', FALSE),
('DO Granada', FALSE),
('DO Lebrija', FALSE),
('VT Cádiz', FALSE),
('VT Laujar-Alpujarra', FALSE),
('VT Córdoba', FALSE),
('VT Sierra Norte de Sevilla', FALSE),
('VT Altiplano de Sierra Nevada', FALSE),
('VT Desierto de Almería', FALSE),
('VT Villaviciosa de Córdoba', FALSE),
('VT Sierra Sur de Jaén', FALSE),
('VT Bailén', FALSE),
('VT Ribera del Andarax', FALSE),
('VT Norte de Almería', FALSE);


-- Bodegas andaluzas (Toro Albalá está bloqueada)
INSERT INTO Winery (Name, City, Province, Country, IsBlocked) VALUES
('Bodega Pago de Jotrón', 'Málaga', 'Málaga', 'España', FALSE),
('González Byass', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Bodegas Barbadillo', 'Sanlúcar de Barrameda', 'Cádiz', 'España', FALSE),
('Emilio Lustau', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Bodegas Hidalgo-La Gitana', 'Sanlúcar de Barrameda', 'Cádiz', 'España', FALSE),
('Bodegas Alvear', 'Montilla', 'Córdoba', 'España', FALSE),
('Bodegas Toro Albalá', 'Aguilar de la Frontera', 'Córdoba', 'España', TRUE),
('Cortijo Los Aguilares', 'Ronda', 'Málaga', 'España', FALSE),
('Bodegas Jorge Ordóñez', 'Vélez-Málaga', 'Málaga', 'España', FALSE),
('Huerta de Albalá', 'Arcos de la Frontera', 'Cádiz', 'España', FALSE),
('Bodegas Osborne', 'El Puerto de Santa María', 'Cádiz', 'España', FALSE),
('Bodegas Valdespino', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Williams & Humbert', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Bodegas Tradición', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Bodegas Emilio Hidalgo', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Fernando de Castilla', 'Jerez de la Frontera', 'Cádiz', 'España', FALSE),
('Bodegas Yuste', 'Sanlúcar de Barrameda', 'Cádiz', 'España', FALSE),
('Delgado Zuleta', 'Sanlúcar de Barrameda', 'Cádiz', 'España', FALSE),
('Bodegas Juan Piñero', 'Sanlúcar de Barrameda', 'Cádiz', 'España', FALSE),
('Bodegas César Florido', 'Chipiona', 'Cádiz', 'España', FALSE),
('Bodegas Pérez Barquero', 'Montilla', 'Córdoba', 'España', FALSE),
('Bodegas Robles', 'Montilla', 'Córdoba', 'España', FALSE),
('Finca La Melonera', 'Ronda', 'Málaga', 'España', FALSE),
('Bodegas Málaga Virgen', 'Fuente de Piedra', 'Málaga', 'España', FALSE),
('Bodegas Dimobe', 'Moclinejo', 'Málaga', 'España', FALSE),
('Bodegas Almijara', 'Cómpeta', 'Málaga', 'España', FALSE),
('Bodegas Privilegio del Condado', 'Bollullos Par del Condado', 'Huelva', 'España', FALSE),
('Bodegas Iglesias', 'Bollullos Par del Condado', 'Huelva', 'España', FALSE),
('González Palacios', 'Lebrija', 'Sevilla', 'España', FALSE),
('Barranco Oscuro', 'Cádiar', 'Granada', 'España', FALSE),
('Señorío de Nevada', 'Villamena', 'Granada', 'España', FALSE);


-- Tipologías de vino
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


-- Variedades de uva
INSERT INTO Grape (Name) VALUES
('Tempranillo'),
('Syrah'),
('Moscatel de Alejandría'),
('Palomino Fino'),
('Pedro Ximénez'),
('Pinot Noir'),
('Petit Verdot'),
('Merlot'),
('Cabernet Sauvignon'),
('Zalema'),
('Garnacha'),
('Tintilla de Rota'),
('Romé'),
('Moscatel Morisco'),
('Doradilla'),
('Lairén'),
('Vigiriego'),
('Jaén Blanco'),
('Perruno'),
('Cabernet Franc'),
('Chardonnay'),
('Sauvignon Blanc'),
('Viognier'),
('Verdejo'),
('Macabeo'),
('Monastrell'),
('Graciano'),
('Tinta Velasco'),
('Moscatel Negro'),
('Garnacha Tintorera');


-- Productos: vinos andaluces y pasas de Málaga (cada presentación es un producto)
INSERT INTO Product (ProductType, Name, WineryID, GuaranteeOfOriginID, Price, TaxRate, Stock, Vintage, Image, Description, VisualNote, AromaNote, PalateNote, Capacity, Size, MinTemperature, MaxTemperature, AlcoholContent, FoodPairing, IsBlocked, CreatedAt) VALUES
('Vino', 'Jotrón Tinto Roble', 1, 6, 9.50, 21.00, 120, 2023, 'jotron-tinto-roble.jpg', 'Tinto con cuatro meses en barrica de roble francés, elaborado con tempranillo y syrah de nuestros viñedos.', 'Rojo picota con ribete violáceo.', 'Fruta negra madura, regaliz y un fondo tostado suave.', 'Sabroso, de taninos redondos y final largo.', 750, '75 cl', 14.00, 16.00, 14.00, 'Carnes a la brasa, guisos y quesos curados.', FALSE, '2026-01-12 10:00:00'),
('Vino', 'Jotrón Moscatel Dulce', 1, 5, 14.00, 21.00, 60, 2022, 'jotron-moscatel-dulce.jpg', 'Vino dulce natural de moscatel de Alejandría, con la uva asoleada en los paseros de la finca.', 'Oro viejo, limpio y brillante.', 'Pasa, miel de azahar y piel de naranja.', 'Untuoso y fresco, sin llegar a empalagar.', 500, '50 cl', 8.00, 10.00, 15.00, 'Postres de hojaldre, foie y quesos azules.', FALSE, '2026-01-12 10:10:00'),
('Pasas', 'Pasas de Málaga Jotrón', 1, 7, 7.50, 10.00, 200, 2025, 'pasas-jotron-500g.jpg', 'Pasas de moscatel secadas al sol en los paseros de la finca y despalilladas a mano.', NULL, NULL, NULL, NULL, '500 g', NULL, NULL, NULL, 'Solas, con queso fresco o en ensaladas.', FALSE, '2026-01-12 10:20:00'),
('Pasas', 'Pasas de Málaga Jotrón', 1, 7, 13.50, 10.00, 150, 2025, 'pasas-jotron-1kg.jpg', 'Pasas de moscatel secadas al sol en los paseros de la finca y despalilladas a mano. Formato familiar.', NULL, NULL, NULL, NULL, '1 kg', NULL, NULL, NULL, 'Solas, con queso fresco o en ensaladas.', FALSE, '2026-06-02 10:00:00'),
('Vino', 'Tío Pepe Fino', 2, 1, 11.95, 21.00, 48, NULL, 'tio-pepe-fino.jpg', 'Fino muy seco de palomino, criado bajo velo de flor en el sistema de criaderas y soleras.', 'Amarillo pajizo pálido.', 'Almendra, masa de pan y notas salinas.', 'Seco, ligero y punzante.', 750, '75 cl', 6.00, 8.00, 15.00, 'Jamón ibérico, aceitunas y pescaíto frito.', FALSE, '2026-02-03 09:30:00'),
('Vino', 'Solear Manzanilla', 3, 2, 9.90, 21.00, 60, NULL, 'solear-manzanilla.jpg', 'Manzanilla criada bajo velo de flor en las bodegas de Sanlúcar de Barrameda.', 'Amarillo pálido con reflejos verdosos.', 'Manzanilla de campo, levadura y brisa marina.', 'Fresca, seca y con un final ligeramente amargo.', 750, '75 cl', 6.00, 8.00, 15.00, 'Langostinos, marisco y pescado frito.', FALSE, '2026-02-03 09:40:00'),
('Vino', 'Lustau San Emilio Pedro Ximénez', 4, 1, 22.50, 21.00, 24, NULL, 'lustau-san-emilio-px.jpg', 'Dulce natural de pedro ximénez con envejecimiento oxidativo en solera.', 'Caoba muy oscuro, casi opaco.', 'Higo, dátil, café y cacao.', 'Denso, muy dulce y largo.', 750, '75 cl', 12.00, 14.00, 17.00, 'Helado de vainilla, chocolate negro y quesos azules.', FALSE, '2026-02-03 09:50:00'),
('Vino', 'Alvear Fino C.B.', 6, 3, 9.20, 21.00, 36, NULL, 'alvear-fino-cb.jpg', 'Fino de pedro ximénez de la Sierra de Montilla, criado bajo velo de flor sin encabezar.', 'Oro pálido.', 'Almendra tostada y hierbas secas.', 'Seco, suave y con buena persistencia.', 750, '75 cl', 6.00, 8.00, 15.00, 'Salmorejo, flamenquín y tapas fritas.', FALSE, '2026-02-10 11:00:00'),
('Vino', 'Cortijo Los Aguilares Pinot Noir', 8, 6, 24.00, 21.00, 18, 2022, 'aguilares-pinot-noir.jpg', 'Tinto de pinot noir de la serranía de Ronda, con crianza en barrica de roble francés.', 'Rojo cereza de capa media.', 'Frutos rojos, sotobosque y especias dulces.', 'Elegante, fresco y de tanino fino.', 750, '75 cl', 14.00, 16.00, 14.00, 'Atún rojo, setas y carnes de caza.', FALSE, '2026-03-05 12:00:00'),
('Vino', 'Jotrón Tinto Roble', 1, 6, 5.90, 21.00, 80, 2023, 'jotron-tinto-roble-375.jpg', 'Tinto con cuatro meses en barrica de roble francés. Media botella.', 'Rojo picota con ribete violáceo.', 'Fruta negra madura, regaliz y un fondo tostado suave.', 'Sabroso, de taninos redondos y final largo.', 375, '37,5 cl', 14.00, 16.00, 14.00, 'Carnes a la brasa, guisos y quesos curados.', FALSE, '2026-04-14 10:00:00'),
('Pasas', 'Pasas de Málaga Jotrón', 1, 7, 4.20, 10.00, 300, 2025, 'pasas-jotron-250g.jpg', 'Pasas de moscatel secadas al sol en los paseros de la finca. Formato de regalo.', NULL, NULL, NULL, NULL, '250 g', NULL, NULL, NULL, 'Solas, con queso fresco o en ensaladas.', FALSE, '2026-04-14 10:10:00'),
('Vino', 'Jotrón Moscatel Seco', 1, 6, 8.90, 21.00, 90, 2025, 'jotron-moscatel-seco.jpg', 'Blanco seco de moscatel de Alejandría, fermentado en depósito a baja temperatura.', 'Amarillo limón con reflejos verdosos.', 'Flor de azahar, uva fresca y lima.', 'Seco, aromático y muy fresco.', 750, '75 cl', 6.00, 8.00, 12.50, 'Ajoblanco, pescado a la plancha y cocina asiática.', FALSE, '2026-04-14 10:20:00'),
('Vino', 'Viña AB Amontillado', 2, 1, 13.50, 21.00, 30, NULL, 'vina-ab-amontillado.jpg', 'Amontillado seco que empieza su crianza bajo velo de flor y la termina en crianza oxidativa.', 'Ámbar brillante.', 'Avellana, madera noble y notas salinas.', 'Seco, sabroso y largo.', 750, '75 cl', 12.00, 14.00, 16.50, 'Consomé, alcachofas y carnes blancas.', FALSE, '2026-04-20 09:00:00'),
('Vino', 'Leonor Palo Cortado', 2, 1, 19.90, 21.00, 18, NULL, 'leonor-palo-cortado.jpg', 'Palo cortado con doce años de crianza media en solera.', 'Caoba claro.', 'Nuez, cuero y piel de naranja confitada.', 'Seco, complejo y de final muy largo.', 750, '75 cl', 12.00, 14.00, 20.00, 'Guisos de caza y quesos muy curados.', FALSE, '2026-04-20 09:10:00'),
('Vino', 'La Gitana Manzanilla', 5, 2, 8.50, 21.00, 72, NULL, 'la-gitana-manzanilla.jpg', 'Manzanilla clásica de Sanlúcar, criada bajo velo de flor.', 'Amarillo pálido.', 'Levadura, camomila y salinidad.', 'Ligera, seca y fresca.', 750, '75 cl', 6.00, 8.00, 15.00, 'Gambas, tortillitas de camarones y frituras.', FALSE, '2026-04-20 09:20:00'),
('Vino', 'Napoleón Amontillado', 5, 2, 14.50, 21.00, 20, NULL, 'napoleon-amontillado.jpg', 'Amontillado de Sanlúcar con crianza biológica y oxidativa.', 'Ámbar dorado.', 'Avellana tostada y yodo.', 'Seco, envolvente y salino.', 750, '75 cl', 12.00, 14.00, 17.50, 'Atún encebollado y setas.', FALSE, '2026-04-20 09:30:00'),
('Vino', 'Lustau Don Nuño Oloroso', 4, 1, 18.00, 21.00, 22, NULL, 'lustau-don-nuno-oloroso.jpg', 'Oloroso seco de crianza oxidativa en solera.', 'Caoba con reflejos ámbar.', 'Nuez, especias y madera noble.', 'Seco, potente y redondo.', 750, '75 cl', 13.00, 15.00, 20.00, 'Rabo de toro y carnes rojas guisadas.', FALSE, '2026-04-20 09:40:00'),
('Vino', 'Alvear Pedro Ximénez Solera 1927', 6, 3, 24.50, 21.00, 15, NULL, 'alvear-px-1927.jpg', 'Pedro Ximénez dulce de una solera fundada en 1927.', 'Ébano con ribete yodado.', 'Pasa, regaliz y tostados.', 'Muy dulce, sedoso y largo.', 375, '37,5 cl', 12.00, 14.00, 16.00, 'Postres de chocolate y helados.', FALSE, '2026-05-04 10:00:00'),
('Vino', 'Toro Albalá Don PX', 7, 3, 29.00, 21.00, 12, 2019, 'toro-albala-don-px.jpg', 'Pedro Ximénez de añada con la uva pasificada al sol en la campiña cordobesa.', 'Caoba oscuro.', 'Higo seco, dátil y miel.', 'Dulce, denso y fresco a la vez.', 375, '37,5 cl', 12.00, 14.00, 17.00, 'Quesos azules y postres de frutos secos.', FALSE, '2026-05-04 10:10:00'),
('Vino', 'Botani Moscatel Seco', 9, 6, 13.90, 21.00, 40, 2024, 'botani-moscatel-seco.jpg', 'Blanco seco de moscatel de Alejandría de viñas viejas de la Axarquía.', 'Amarillo pajizo brillante.', 'Azahar, lichi y cítricos.', 'Seco, fresco y muy aromático.', 750, '75 cl', 6.00, 8.00, 13.00, 'Ensaladas, sushi y quesos de cabra.', FALSE, '2026-05-04 10:20:00'),
('Vino', 'Taberner', 10, 10, 19.00, 21.00, 24, 2021, 'taberner.jpg', 'Tinto de syrah, merlot y cabernet sauvignon con doce meses en barrica.', 'Rojo picota de capa alta.', 'Fruta negra, cacao y especias.', 'Potente, carnoso y equilibrado.', 750, '75 cl', 15.00, 17.00, 14.50, 'Retinto a la brasa y quesos payoyos.', FALSE, '2026-05-04 10:30:00'),
('Vino', 'Valdespino Fino Inocente', 12, 1, 16.50, 21.00, 24, NULL, 'valdespino-inocente.jpg', 'Fino de pago Macharnudo con larga crianza bajo velo de flor.', 'Oro pálido.', 'Almendra, flor y tiza.', 'Seco, profundo y salino.', 750, '75 cl', 6.00, 8.00, 15.00, 'Mariscos, jamón y almendras fritas.', FALSE, '2026-05-18 09:00:00'),
('Vino', 'Dry Sack Medium', 13, 1, 10.90, 21.00, 36, NULL, 'dry-sack-medium.jpg', 'Medium de amontillado y oloroso suavizado con un toque de pedro ximénez.', 'Ámbar.', 'Frutos secos y caramelo.', 'Abocado, suave y fácil de beber.', 750, '75 cl', 10.00, 12.00, 19.00, 'Patés, foie y aperitivos.', FALSE, '2026-05-18 09:10:00'),
('Vino', 'Osborne Fino Quinta', 11, 1, 9.50, 21.00, 48, NULL, 'osborne-fino-quinta.jpg', 'Fino de El Puerto de Santa María, criado bajo velo de flor.', 'Amarillo pajizo.', 'Almendra y levadura.', 'Seco, ligero y fresco.', 750, '75 cl', 6.00, 8.00, 15.00, 'Pescaíto frito y aceitunas.', FALSE, '2026-05-18 09:20:00'),
('Vino', 'Mioro', 27, 4, 6.50, 21.00, 60, 2025, 'mioro.jpg', 'Blanco joven de zalema del Condado de Huelva.', 'Amarillo pálido.', 'Manzana verde y flores blancas.', 'Ligero, fresco y fácil.', 750, '75 cl', 6.00, 8.00, 12.00, 'Gambas de Huelva y pescado blanco.', FALSE, '2026-05-18 09:30:00'),
('Vino', 'Melonera Payoya Negra', 23, 6, 21.00, 21.00, 18, 2021, 'melonera-payoya-negra.jpg', 'Tinto de la serranía de Ronda con variedades recuperadas y syrah.', 'Rojo granate.', 'Fruta roja, monte bajo y pimienta.', 'Fresco, especiado y de tanino fino.', 750, '75 cl', 14.00, 16.00, 14.00, 'Chivo lechal y quesos de cabra payoya.', FALSE, '2026-06-01 10:00:00');


-- Tipos de evento
INSERT INTO EventType (Name) VALUES
('Visita guiada'),
('Cata guiada'),
('Cata maridada'),
('Vendimia'),
('Taller'),
('Curso de cata');


-- Eventos organizados por Pago de Jotrón (Location toma su valor por defecto)
INSERT INTO Event (Title, Description, EventTypeID, StartsAt, EndsAt, Price, TaxRate, MaxParticipants, AvailableSeats, IsOpen) VALUES
('Vendimia en Pago de Jotrón 2026', 'Vendimiamos a mano una parcela de moscatel, llevamos la uva a los paseros y terminamos con un almuerzo en la bodega.', 4, '2026-09-05 09:00:00', '2026-09-05 13:00:00', 30.00, 21.00, 25, 0, FALSE),
('Visita guiada a la bodega y los viñedos', 'Recorremos el viñedo, los paseros y la sala de barricas, y terminamos con una copa de nuestro tinto roble.', 1, '2026-10-24 11:00:00', '2026-10-24 13:00:00', 15.00, 21.00, 20, 12, TRUE),
('Cata guiada de los vinos de Pago de Jotrón', 'Nuestro enólogo presenta el tinto roble y el moscatel dulce, y explica cómo se elaboran.', 2, '2026-11-07 18:00:00', '2026-11-07 19:30:00', 25.00, 21.00, 15, 9, TRUE),
('Cata maridada: vinos dulces y quesos malagueños', 'Cinco vinos dulces de Málaga acompañados de quesos de cabra de la provincia.', 3, '2026-11-21 13:00:00', '2026-11-21 15:30:00', 45.00, 21.00, 12, 6, TRUE),
('Taller de pasas: del pasero a la mesa', 'Aprendemos cómo se asolea la uva en los paseros y preparamos tres recetas con pasas de Málaga.', 5, '2026-12-12 10:30:00', '2026-12-12 12:30:00', 20.00, 21.00, 15, 11, TRUE),
('Visita guiada de verano', 'Visita al atardecer por el viñedo con degustación de nuestro moscatel seco.', 1, '2026-07-18 20:00:00', '2026-07-18 22:00:00', 15.00, 21.00, 20, 0, FALSE),
('Cata vertical de moscatel dulce', 'Probamos cuatro añadas de nuestro moscatel dulce para ver cómo evoluciona en botella.', 2, '2027-01-16 18:00:00', '2027-01-16 19:30:00', 35.00, 21.00, 12, 10, TRUE),
('Visita y desayuno en la finca', 'Visita corta a la bodega seguida de un desayuno con pan de pueblo, aceite y pasas.', 1, '2027-02-13 10:00:00', '2027-02-13 12:00:00', 18.00, 21.00, 20, 18, TRUE),
('Curso de iniciación a la cata', 'Dos sesiones para aprender a catar: vista, nariz y boca, con seis vinos andaluces.', 6, '2027-03-06 17:00:00', '2027-03-06 20:00:00', 60.00, 21.00, 14, 13, TRUE);


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
INSERT INTO ShippingType (Name, Cost) VALUES
('Envío estándar', 4.95),
('Envío exprés 24 h', 9.95),
('Recogida en bodega', 0.00),
('Envío a Baleares', 14.95),
('Sin envío (solo eventos)', 0.00);


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
INSERT INTO Post (Title, Content, ImageUrl, PublishedAt, UpdatedAt, IsPublished, UserID) VALUES
('Cómo elegimos las bodegas que vendemos', 'Además de nuestros vinos, vendemos los de otras bodegas andaluzas que conocemos bien. Te contamos qué miramos antes de incluir una bodega en el catálogo.', 'bodegas-seleccion.jpg', '2025-10-15 10:00:00', '2025-10-20 12:00:00', TRUE, 3),
('Guía rápida de los vinos de Jerez', 'Fino, amontillado, oloroso o pedro ximénez: si te pierdes entre los tipos de vino de Jerez, aquí tienes una guía práctica para acertar.', 'jerez-guia.jpg', '2025-11-10 09:30:00', '2025-11-12 11:00:00', TRUE, 6),
('Manzanilla: el vino de Sanlúcar', 'La manzanilla solo se cría en Sanlúcar de Barrameda. Explicamos qué tiene de especial el clima de la desembocadura del Guadalquivir.', 'manzanilla-sanlucar.jpg', '2025-12-05 14:00:00', '2025-12-06 15:00:00', TRUE, 3),
('El moscatel, nuestra seña de identidad', 'En Pago de Jotrón trabajamos el moscatel de Alejandría desde hace generaciones. Te contamos cómo hacemos nuestro vino dulce.', 'moscatel-jotron.jpg', '2026-01-20 08:00:00', '2026-01-21 09:00:00', TRUE, 6),
('Así se hacen las pasas de Málaga', 'Del racimo al pasero: el asoleo de la uva moscatel en la Axarquía es Patrimonio Agrícola Mundial. Lo vemos paso a paso en nuestra finca.', 'pasas-paseros.jpg', '2026-02-18 16:00:00', '2026-02-19 17:00:00', TRUE, 3),
('Qué esperar de una cata en Pago de Jotrón', 'Si nunca has ido a una cata, te contamos cómo funcionan las nuestras: cuánto duran, qué se prueba y qué no hace falta saber.', 'cata-jotron.jpg', '2026-03-12 13:00:00', '2026-03-13 14:00:00', TRUE, 6),
('Vendimia 2026: así fue el día', 'Veinticinco personas vendimiaron con nosotros una parcela de moscatel. Repasamos el día en fotos.', 'vendimia-2026.jpg', '2026-09-08 11:00:00', '2026-09-08 12:00:00', TRUE, 6),
('Fino de Montilla frente a fino de Jerez', 'Los dos se crían bajo velo de flor, pero uno es de pedro ximénez y no se encabeza. Comparamos dos finos de nuestro catálogo.', 'fino-montilla-jerez.jpg', '2026-04-22 18:00:00', '2026-04-23 19:00:00', TRUE, 3),
('Qué comer con cada vino de nuestro catálogo', 'Del tinto roble al pedro ximénez, te proponemos un maridaje distinto para cada vino que tenemos a la venta.', 'maridaje-catalogo.jpg', '2026-05-30 18:00:00', '2026-06-01 19:00:00', TRUE, 6),
('Pinot noir en la serranía de Ronda', 'Una uva de clima frío a 800 metros de altitud. Hablamos con Cortijo Los Aguilares sobre cómo se adapta a la sierra.', 'pinot-ronda.jpg', NULL, '2026-10-01 10:00:00', FALSE, 3),
('Condado de Huelva, la denominación olvidada', 'La zalema y los vinos generosos del Condado merecen más atención. Te contamos por qué.', 'condado-huelva.jpg', '2026-06-10 10:00:00', '2026-06-10 10:00:00', TRUE, 19),
('Breve historia del vino de Málaga', 'Del Mountain que se bebía en Inglaterra a los dulces naturales de hoy: un repaso a tres siglos de vino malagueño.', 'historia-malaga.jpg', '2026-07-08 09:00:00', '2026-07-08 09:00:00', TRUE, 19),
('Amontillado: el vino de las dos crianzas', 'Empieza como un fino y termina como un oloroso. Explicamos cómo se hace un amontillado con dos ejemplos.', 'amontillado.jpg', '2026-08-12 12:00:00', '2026-08-12 12:00:00', TRUE, 3),
('Ideas de regalo para Navidad', 'Lotes de vino y pasas para regalar, desde 15 euros.', 'navidad.jpg', NULL, '2026-10-02 18:00:00', FALSE, 19);


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


-- Tipología de cada vino
INSERT INTO ProductCategory (ProductID, CategoryID) VALUES
(1, 1),
(2, 10),
(5, 5),
(6, 6),
(7, 9),
(8, 5),
(9, 2),
(10, 1),
(12, 3),
(13, 7),
(14, 11),
(15, 6),
(16, 7),
(17, 8),
(18, 9),
(19, 9),
(20, 3),
(21, 2),
(22, 5),
(23, 13),
(24, 5),
(25, 3),
(26, 2);


-- Uvas de cada producto
INSERT INTO ProductGrape (ProductID, GrapeID, Percentage) VALUES
(1, 1, 70),
(1, 2, 30),
(2, 3, 100),
(3, 3, 100),
(4, 3, 100),
(5, 4, 100),
(6, 4, 100),
(7, 5, 100),
(8, 5, 100),
(9, 6, 100),
(10, 1, 70),
(10, 2, 30),
(11, 3, 100),
(12, 3, 100),
(13, 4, 100),
(14, 4, 100),
(15, 4, 100),
(16, 4, 100),
(17, 4, 100),
(18, 5, 100),
(19, 5, 100),
(20, 3, 100),
(21, 2, 50),
(21, 8, 30),
(21, 9, 20),
(22, 4, 100),
(23, 4, 85),
(23, 5, 15),
(24, 4, 100),
(25, 10, 100),
(26, 12, 60),
(26, 2, 40);


-- Líneas de producto de cada pedido
INSERT INTO OrderProduct (OrderID, ProductID, Quantity, UnitPrice, TaxRate) VALUES
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


-- Carritos guardados: productos
INSERT INTO CartProduct (UserID, ProductID, Quantity, AddedAt) VALUES
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
(2, 5),
(2, 7),
(3, 6),
(4, 2),
(5, 3),
(8, 5),
(8, 8),
(9, 1),
(9, 7),
(10, 9),
(11, 25),
(12, 2),
(13, 13),
(13, 16),
(14, 11),
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
-- IsBlocked o IsActive. Sí puede vaciar el carrito y las tablas de relación.
GRANT SELECT, INSERT, UPDATE ON Jotron.* TO rol_tienda;
GRANT DELETE ON Jotron.Address TO rol_tienda;
GRANT DELETE ON Jotron.ProductCategory TO rol_tienda;
GRANT DELETE ON Jotron.ProductGrape TO rol_tienda;
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
