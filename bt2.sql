use quanlibanhang;
CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    cName VARCHAR(255),
    cAddress VARCHAR(255),
    cPhone VARCHAR(15)
);
CREATE TABLE `Order` (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATE,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(255),
    pPrice DECIMAL(10, 2)
);
CREATE TABLE OrderDetail (
    odID INT PRIMARY KEY,
    oID INT,
    pID INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);