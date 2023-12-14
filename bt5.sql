use quanlisanpham;
create table products(
id bigint primary key auto_increment,
productcode varchar(50),
productname varchar(100),
productprice double,
productamount int not null,
productdescription text,
productstatus bit
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
    ('P001', 'giay tay', 19.99, 100, 'xau', 'Active'),
    ('P002', 'sneaker', 29.99, 50, 'dep', 'Inactive'),
    ('P003', 'airforce1', 39.99, 50, 'dep', 'Inactive'),
    ('P004', 'blenceciaga', 49.99, 50, 'dep', 'Inactive'),
    ('P005', 'nike', 59.99, 50, 'dep', 'Inactive');
    -- Tạo Unique Index trên cột productCode
CREATE UNIQUE INDEX idx_productCode ON Products(productCode);

-- Tạo Composite Index trên cột productName và productPrice
CREATE INDEX idx_productName_price ON Products(productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productCode = 'P001';
EXPLAIN SELECT * FROM Products WHERE productName = 'giay tay' AND productPrice = 19.99;
 -- Tạo view
CREATE VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

-- Sửa đổi view (ví dụ: thêm cột mới)
ALTER VIEW ProductInfo AS
SELECT productCode, productName, productPrice, productStatus, productAmount
FROM Products;

-- Xoá view
DROP VIEW IF EXISTS ProductInfo;
-- Tạo store procedure lấy tất cả thông tin sản phẩm
DELIMITER //
CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //
DELIMITER ;

-- Tạo store procedure thêm sản phẩm mới
DELIMITER //
CREATE PROCEDURE AddNewProduct(IN pCode VARCHAR(255), IN pName VARCHAR(255), IN pPrice DECIMAL(10, 2), IN pAmount INT, IN pDesc TEXT, IN pStatus VARCHAR(20))
BEGIN
    INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
    VALUES (pCode, pName, pPrice, pAmount, pDesc, pStatus);
END //
DELIMITER ;

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE UpdateProductById(IN pId INT, IN pPrice DECIMAL(10, 2), IN pAmount INT)
BEGIN
    UPDATE Products SET productPrice = pPrice, productAmount = pAmount WHERE Id = pId;
END //
DELIMITER ;

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE DeleteProductById(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END //
DELIMITER ;


