-- =====================================================================
-- Pago de Jotrón · Script de creación de la base de datos (MariaDB)
-- VERSIÓN AMPLIADA: modelo con las mejoras que salen de los formularios
-- del panel de administración (Figma). Crea la base de datos Jotron y sus
-- 36 tablas con claves y restricciones.
-- Después se ejecuta datos-bbdd.sql (o datos-bbdd-ampliado.sql) de esta carpeta.
-- Las líneas y tablas nuevas o cambiadas llevan la marca [Ampliación].
-- =====================================================================

-- Fuerzo UTF-8 en la conexión para que las tildes y la ñ se guarden bien.
SET NAMES utf8mb4;

-- Borro la base de datos si ya existe para poder lanzar el script varias veces.
DROP DATABASE IF EXISTS Jotron;
CREATE DATABASE Jotron CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE Jotron;


-- ---------------------------------------------------------------------
-- Usuarios y direcciones
-- ---------------------------------------------------------------------

CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    -- [Ampliación] Nombre, apellidos y NIF son NULL: el registro solo pide correo,
    -- contraseña y fecha de nacimiento. Se completan en la cuenta o en el checkout.
    Name VARCHAR(100),
    LastName VARCHAR(100),
    BirthDate DATE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    IDCard VARCHAR(20) UNIQUE, -- [Ampliación] Solo obligatorio si el cliente pide factura completa
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Role ENUM ('Cliente', 'Editor', 'Administrador') NOT NULL DEFAULT 'Cliente',
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    RegistrationDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Address (
    AddressID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    Phone VARCHAR(20),
    StreetType ENUM ('Calle', 'Avenida', 'Plaza', 'Paseo', 'Camino', 'Carretera', 'Ronda', 'Travesía', 'Glorieta', 'Urbanización') NOT NULL DEFAULT 'Calle',
    StreetName VARCHAR(100) NOT NULL,
    Number VARCHAR(10),
    Floor VARCHAR(20),                  -- [Ampliación] piso y puerta ("3º B")
    PostalCode VARCHAR(10) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Province VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL DEFAULT 'España',
    AddressType ENUM ('Envío', 'Facturación') NOT NULL DEFAULT 'Envío',
    IsActive BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- ---------------------------------------------------------------------
-- Catálogo
-- ---------------------------------------------------------------------

-- [Ampliación] Campos de ficha de la D.O. Son opcionales y no entran en el MVP1.
CREATE TABLE GuaranteeOfOrigin (
    GuaranteeOfOriginID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    Classification ENUM ('DO', 'DOP', 'DOCa', 'IGP', 'VT') NOT NULL DEFAULT 'DO', -- [Ampliación]
    Region VARCHAR(100),                                                          -- [Ampliación]
    RegulatoryCouncil VARCHAR(150),                                               -- [Ampliación]
    FoundedYear INT,                                                              -- [Ampliación]
    Website VARCHAR(255),                                                         -- [Ampliación]
    Description TEXT,                                                             -- [Ampliación]
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT chk_do_founded CHECK (FoundedYear IS NULL OR FoundedYear BETWEEN 1900 AND 2100)
);


CREATE TABLE Winery (
    WineryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    Description TEXT,             -- [Ampliación]
    Address VARCHAR(255),         -- [Ampliación] dirección postal en una línea
    City VARCHAR(100),
    Province VARCHAR(100),
    Country VARCHAR(100) NOT NULL DEFAULT 'España',
    Phone VARCHAR(20),            -- [Ampliación] prefijo y número juntos ("+34 952 000 000")
    Email VARCHAR(100),           -- [Ampliación]
    Website VARCHAR(255),         -- [Ampliación]
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE
);


-- [Ampliación] Tipología: familia del producto que se usa en los filtros de la
-- tienda (Tinto, Blanco, Generoso, Dulce, Pasas...). Un producto tiene una sola.
CREATE TABLE Typology (
    TypologyID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE NOT NULL,
    ProductType ENUM ('Vino', 'Pasas') NOT NULL DEFAULT 'Vino',
    FilterOrder INT NOT NULL DEFAULT 0,
    TaxRate DECIMAL(5, 2) NOT NULL DEFAULT 21.00, -- IVA en %: 21 vino, 10 pasas. Lo heredan sus productos
    CONSTRAINT chk_typology_tax CHECK (TaxRate IN (4.00, 10.00, 21.00))
);


CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,                     -- [Ampliación] Vino o pasas lo indica Typology.ProductType
    WineryID INT NOT NULL,
    GuaranteeOfOriginID INT NOT NULL,
    TypologyID INT NOT NULL,                        -- [Ampliación] También fija el IVA del producto
    Vintage INT,
    Image VARCHAR(255),
    Description TEXT,
    VisualNote TEXT,
    AromaNote TEXT,
    PalateNote TEXT,
    MinTemperature DECIMAL(5, 2),
    MaxTemperature DECIMAL(5, 2),
    AlcoholContent DECIMAL(5, 2),
    AgingTime VARCHAR(100),                         -- [Ampliación] Ficha técnica: tiempo de crianza ("24 meses en barrica")
    AgingMethod TEXT,                               -- [Ampliación] Datos clave: cómo se cría el vino
    Production VARCHAR(50),                         -- [Ampliación] Ficha técnica: tirada de la añada ("18.000 botellas")
    VineyardAltitude INT,                           -- [Ampliación] Datos clave: metros sobre el nivel del mar
    SoilType VARCHAR(100),                          -- [Ampliación] Datos clave: tipo de suelo
    Yield INT,                                      -- [Ampliación] Datos clave: rendimiento en kg/ha
    FoodPairing TEXT,
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_product_temperature CHECK (MinTemperature IS NULL OR MaxTemperature IS NULL OR MinTemperature <= MaxTemperature),
    CONSTRAINT chk_product_vineyard CHECK ((VineyardAltitude IS NULL OR VineyardAltitude >= 0) AND (Yield IS NULL OR Yield > 0)),
    FOREIGN KEY (WineryID) REFERENCES Winery(WineryID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (GuaranteeOfOriginID) REFERENCES GuaranteeOfOrigin(GuaranteeOfOriginID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (TypologyID) REFERENCES Typology(TypologyID) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- [Ampliación] Presentaciones: cada formato (75 cl, 150 cl, 500 g, 1 kg) es una
-- fila con su precio y su stock. Price, Stock y la capacidad salen de Product.
CREATE TABLE ProductVariant (
    VariantID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    Format VARCHAR(50) NOT NULL,                    -- Botella, Media botella, Mágnum, Caja, Racimo
    Capacity INT NOT NULL,                          -- En mililitros o gramos según CapacityUnit
    CapacityUnit ENUM ('ml', 'g') NOT NULL DEFAULT 'ml',
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT uq_variant_format UNIQUE (ProductID, Format, Capacity),
    CONSTRAINT chk_variant_capacity CHECK (Capacity > 0),
    CONSTRAINT chk_variant_stock CHECK (Stock >= 0),
    CONSTRAINT chk_variant_price CHECK (Price >= 0),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- [Ampliación] Pasos de elaboración del vino (vendimia, fermentación, crianza...).
CREATE TABLE ProductStep (
    StepID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    Position INT NOT NULL,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    CONSTRAINT uq_step_position UNIQUE (ProductID, Position),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- [Ampliación] Etiquetas de cata (Afrutado, Especiado, Tostado...).
CREATE TABLE TastingTag (
    TastingTagID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Grape (
    GrapeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    Color ENUM ('Tinta', 'Blanca', 'Rosada') NOT NULL -- [Ampliación] color de la piel; filtro del admin
);


-- ---------------------------------------------------------------------
-- Eventos (visitas y catas de Pago de Jotrón)
-- ---------------------------------------------------------------------

CREATE TABLE EventType (
    EventTypeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Event (
    EventID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) UNIQUE NOT NULL,
    Description TEXT,
    EventTypeID INT NOT NULL,
    Location VARCHAR(150) NOT NULL DEFAULT 'Bodega Pago de Jotrón',
    StartsAt DATETIME NOT NULL,
    EndsAt DATETIME NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    TaxRate DECIMAL(5, 2) NOT NULL DEFAULT 21.00, -- IVA en %: 21 vino y eventos, 10 pasas
    MaxParticipants INT NOT NULL,
    AvailableSeats INT NOT NULL,
    IsOpen BOOLEAN NOT NULL DEFAULT TRUE,
    ImageUrl VARCHAR(255), -- [Ampliación] imagen destacada del evento
    CONSTRAINT chk_event_dates CHECK (EndsAt > StartsAt),
    CONSTRAINT chk_event_seats CHECK (AvailableSeats BETWEEN 0 AND MaxParticipants),
    CONSTRAINT chk_event_price CHECK (Price >= 0),
    CONSTRAINT chk_event_tax CHECK (TaxRate IN (4.00, 10.00, 21.00)),
    FOREIGN KEY (EventTypeID) REFERENCES EventType(EventTypeID) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- [Ampliación] "Qué esperar": puntos destacados del evento, en orden.
CREATE TABLE EventHighlight (
    HighlightID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT NOT NULL,
    Position INT NOT NULL,
    Text VARCHAR(255) NOT NULL,
    CONSTRAINT uq_highlight_position UNIQUE (EventID, Position),
    FOREIGN KEY (EventID) REFERENCES Event(EventID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- [Ampliación] Programa del evento: hora y actividad.
CREATE TABLE EventScheduleItem (
    ScheduleItemID INT AUTO_INCREMENT PRIMARY KEY,
    EventID INT NOT NULL,
    StartTime TIME NOT NULL,
    Description VARCHAR(255) NOT NULL,
    CONSTRAINT uq_schedule_time UNIQUE (EventID, StartTime),
    FOREIGN KEY (EventID) REFERENCES Event(EventID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- ---------------------------------------------------------------------
-- Pedidos y facturas
-- ---------------------------------------------------------------------

CREATE TABLE OrderStatus (
    StatusID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE CancellationType (
    CancellationTypeID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT NOT NULL
);


CREATE TABLE ShippingType (
    ShippingTypeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    -- [Ampliación] Plazo de entrega en días laborables. NULL si no hay envío (recogida o solo eventos).
    MinDeliveryDays TINYINT UNSIGNED NULL,
    MaxDeliveryDays TINYINT UNSIGNED NULL,
    -- [Ampliación] Un tipo bloqueado no se ofrece en el checkout.
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT chk_shipping_cost CHECK (Cost >= 0),
    CONSTRAINT chk_shipping_days CHECK (MinDeliveryDays IS NULL OR MaxDeliveryDays IS NULL OR MinDeliveryDays <= MaxDeliveryDays)
);


CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    ShippingAddressID INT,
    BillingAddressID INT,
    PaymentMethod ENUM ('Tarjeta', 'PayPal', 'Transferencia') NOT NULL,
    ShippingTypeID INT NOT NULL,
    ShippingCost DECIMAL(10, 2) NOT NULL DEFAULT 0,
    Total DECIMAL(10, 2) NOT NULL,
    StatusID INT NOT NULL,
    StatusUpdatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CancelledBy ENUM ('Cliente', 'Administrador'),
    CancellationTypeID INT,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ShippingDate DATE,
    CONSTRAINT chk_orders_total CHECK (Total >= 0 AND ShippingCost >= 0),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ShippingAddressID) REFERENCES Address(AddressID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (BillingAddressID) REFERENCES Address(AddressID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (ShippingTypeID) REFERENCES ShippingType(ShippingTypeID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (StatusID) REFERENCES OrderStatus(StatusID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (CancellationTypeID) REFERENCES CancellationType(CancellationTypeID) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE Invoice (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL UNIQUE,
    Number VARCHAR(50) UNIQUE NOT NULL,
    IssueDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TaxBase DECIMAL(10, 2) NOT NULL,
    TaxAmount DECIMAL(10, 2) NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT chk_invoice_total CHECK (Total = TaxBase + TaxAmount),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- ---------------------------------------------------------------------
-- Blog y log de acciones
-- ---------------------------------------------------------------------

CREATE TABLE Post (
    PostID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) UNIQUE NOT NULL,
    Slug VARCHAR(120) UNIQUE NOT NULL, -- [Ampliación] identificador de la URL
    Excerpt TEXT,                      -- [Ampliación] resumen para el listado
    Content TEXT,
    ImageUrl VARCHAR(255),
    PublishedAt DATETIME,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    IsPublished BOOLEAN NOT NULL DEFAULT FALSE,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE BlogCategory (
    BlogCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE AuditLog (
    AuditLogID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    Action TEXT NOT NULL,
    LoggedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Details TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE SET NULL ON UPDATE CASCADE
);


-- ---------------------------------------------------------------------
-- Tablas de relación (N:M)
-- ---------------------------------------------------------------------

CREATE TABLE ProductCategory (
    ProductID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE ProductGrape (
    ProductID INT NOT NULL,
    GrapeID INT NOT NULL,
    Percentage DECIMAL(5, 2),
    PRIMARY KEY (ProductID, GrapeID),
    CONSTRAINT chk_grape_percentage CHECK (Percentage > 0 AND Percentage <= 100),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GrapeID) REFERENCES Grape(GrapeID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- [Ampliación] Etiquetas de cata de cada producto.
CREATE TABLE ProductTastingTag (
    ProductID INT NOT NULL,
    TastingTagID INT NOT NULL,
    PRIMARY KEY (ProductID, TastingTagID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (TastingTagID) REFERENCES TastingTag(TastingTagID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- [Ampliación] Variedades de uva que autoriza cada D.O. (fuera del MVP1).
CREATE TABLE GuaranteeOfOriginGrape (
    GuaranteeOfOriginID INT NOT NULL,
    GrapeID INT NOT NULL,
    PRIMARY KEY (GuaranteeOfOriginID, GrapeID),
    FOREIGN KEY (GuaranteeOfOriginID) REFERENCES GuaranteeOfOrigin(GuaranteeOfOriginID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GrapeID) REFERENCES Grape(GrapeID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- [Ampliación] La línea apunta a la presentación (VariantID), no al producto.
CREATE TABLE OrderProduct (
    OrderID INT NOT NULL,
    VariantID INT NOT NULL,
    Quantity INT UNSIGNED NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TaxRate DECIMAL(5, 2) NOT NULL, -- IVA aplicado en el momento de la compra
    PRIMARY KEY (OrderID, VariantID),
    CONSTRAINT chk_orderproduct_quantity CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (VariantID) REFERENCES ProductVariant(VariantID) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE OrderEvent (
    OrderID INT NOT NULL,
    EventID INT NOT NULL,
    Quantity INT UNSIGNED NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TaxRate DECIMAL(5, 2) NOT NULL, -- IVA aplicado en el momento de la compra
    PRIMARY KEY (OrderID, EventID),
    CONSTRAINT chk_orderevent_quantity CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EventID) REFERENCES Event(EventID) ON DELETE RESTRICT ON UPDATE CASCADE
);


-- Carrito guardado en BD: el cliente lo recupera en cualquier dispositivo.
-- El carrito de un visitante sin sesión vive en el navegador y se fusiona al iniciar sesión.
CREATE TABLE CartProduct (
    UserID INT NOT NULL,
    VariantID INT NOT NULL, -- [Ampliación] presentación guardada en el carrito
    Quantity INT UNSIGNED NOT NULL DEFAULT 1,
    AddedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, VariantID),
    CONSTRAINT chk_cartproduct_quantity CHECK (Quantity > 0),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (VariantID) REFERENCES ProductVariant(VariantID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE CartEvent (
    UserID INT NOT NULL,
    EventID INT NOT NULL,
    Quantity INT UNSIGNED NOT NULL DEFAULT 1,
    AddedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, EventID),
    CONSTRAINT chk_cartevent_quantity CHECK (Quantity > 0),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EventID) REFERENCES Event(EventID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE PostBlogCategory (
    PostID INT NOT NULL,
    BlogCategoryID INT NOT NULL,
    PRIMARY KEY (PostID, BlogCategoryID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BlogCategoryID) REFERENCES BlogCategory(BlogCategoryID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE PostProduct (
    PostID INT NOT NULL,
    ProductID INT NOT NULL,
    PRIMARY KEY (PostID, ProductID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE PostWinery (
    PostID INT NOT NULL,
    WineryID INT NOT NULL,
    PRIMARY KEY (PostID, WineryID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (WineryID) REFERENCES Winery(WineryID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE PostGuaranteeOfOrigin (
    PostID INT NOT NULL,
    GuaranteeOfOriginID INT NOT NULL,
    PRIMARY KEY (PostID, GuaranteeOfOriginID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (GuaranteeOfOriginID) REFERENCES GuaranteeOfOrigin(GuaranteeOfOriginID) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE PostCategory (
    PostID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (PostID, CategoryID),
    FOREIGN KEY (PostID) REFERENCES Post(PostID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE CASCADE ON UPDATE CASCADE
);
