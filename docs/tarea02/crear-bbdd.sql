-- =====================================================================
-- Pago de Jotrón · Script de creación de la base de datos (MariaDB)
-- Crea la base de datos Jotron y sus 28 tablas con claves y restricciones.
-- Después se ejecuta datos-bbdd.sql (o datos-bbdd-ampliado.sql).
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
    Name VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    IDCard VARCHAR(20) UNIQUE,
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

CREATE TABLE GuaranteeOfOrigin (
    GuaranteeOfOriginID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE
);


CREATE TABLE Winery (
    WineryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    City VARCHAR(100),
    Province VARCHAR(100),
    Country VARCHAR(100) NOT NULL DEFAULT 'España',
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE
);


CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductType ENUM ('Vino', 'Pasas') NOT NULL DEFAULT 'Vino',
    Name VARCHAR(100) NOT NULL,
    WineryID INT NOT NULL,
    GuaranteeOfOriginID INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    TaxRate DECIMAL(5, 2) NOT NULL DEFAULT 21.00, -- IVA en %: 21 vino y eventos, 10 pasas
    Stock INT NOT NULL DEFAULT 0,
    Vintage INT,
    Image VARCHAR(255),
    Description TEXT,
    VisualNote TEXT,
    AromaNote TEXT,
    PalateNote TEXT,
    Capacity INT,
    Size VARCHAR(50) NOT NULL,
    MinTemperature DECIMAL(5, 2),
    MaxTemperature DECIMAL(5, 2),
    AlcoholContent DECIMAL(5, 2),
    FoodPairing TEXT,
    IsBlocked BOOLEAN NOT NULL DEFAULT FALSE,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_product_stock CHECK (Stock >= 0),
    CONSTRAINT chk_product_price CHECK (Price >= 0),
    CONSTRAINT chk_product_tax CHECK (TaxRate IN (4.00, 10.00, 21.00)),
    FOREIGN KEY (WineryID) REFERENCES Winery(WineryID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (GuaranteeOfOriginID) REFERENCES GuaranteeOfOrigin(GuaranteeOfOriginID) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Grape (
    GrapeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL
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
    CONSTRAINT chk_event_dates CHECK (EndsAt > StartsAt),
    CONSTRAINT chk_event_seats CHECK (AvailableSeats BETWEEN 0 AND MaxParticipants),
    CONSTRAINT chk_event_price CHECK (Price >= 0),
    CONSTRAINT chk_event_tax CHECK (TaxRate IN (4.00, 10.00, 21.00)),
    FOREIGN KEY (EventTypeID) REFERENCES EventType(EventTypeID) ON DELETE RESTRICT ON UPDATE CASCADE
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
    CONSTRAINT chk_shipping_cost CHECK (Cost >= 0)
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


CREATE TABLE OrderProduct (
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT UNSIGNED NOT NULL DEFAULT 1,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TaxRate DECIMAL(5, 2) NOT NULL, -- IVA aplicado en el momento de la compra
    PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT chk_orderproduct_quantity CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE RESTRICT ON UPDATE CASCADE
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
    ProductID INT NOT NULL,
    Quantity INT UNSIGNED NOT NULL DEFAULT 1,
    AddedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UserID, ProductID),
    CONSTRAINT chk_cartproduct_quantity CHECK (Quantity > 0),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
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
