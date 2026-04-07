-- Horticulture Department Database --

DROP TABLE IF EXISTS Order_request;
DROP TABLE IF EXISTS guest;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Product;

-- CREATE TABLES  --
CREATE TABLE Product (
    productId       VARCHAR(10) PRIMARY KEY,
    productName     VARCHAR(70) NOT NULL,
    description     TEXT,                    -- fixed spelling
    productCategory VARCHAR(20)
);

CREATE TABLE User (
    userId          VARCHAR(10) PRIMARY KEY,
    userName        VARCHAR(50) NOT NULL,
    email           VARCHAR(255) UNIQUE,
    password        VARCHAR(10) NOT NULL,
    registrationDate DATE NOT NULL           -- fixed: removed invalid (20)
);

CREATE TABLE guest (
    guestId   VARCHAR(10) PRIMARY KEY,
    email     VARCHAR(255) NOT NULL,
    visitDate DATE NOT NULL                  -- fixed: removed invalid (20)
);

-- 2. Dependent table last (has foreign keys)
CREATE TABLE Order_request (
    orderId     VARCHAR(10) PRIMARY KEY,
    userId      VARCHAR(10) NOT NULL,
    productId   VARCHAR(10),
    
    -- Fixed: correct column names + correct referenced table/column
    FOREIGN KEY (userId) REFERENCES User(userId)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    FOREIGN KEY (productId) REFERENCES Product(productId)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Optional: useful indexes for performance
CREATE INDEX idx_order_user    ON Order_request(userId);
CREATE INDEX idx_order_product ON Order_request(productId);