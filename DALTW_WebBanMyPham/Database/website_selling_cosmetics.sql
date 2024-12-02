create database website_selling_cosmetics;
use website_selling_cosmetics;

-- Tạo bảng tài khoản người dùng
CREATE TABLE Users(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    username NVARCHAR(50) NOT NULL UNIQUE,	-- tên đăng nhập
    password_user NVARCHAR(50) NOT NULL,
    email NVARCHAR(150) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,	-- tên đầy đủ người dùng
    sign_up_date DATE NOT NULL,
    birth_date DATE NOT NULL,
    role_user NVARCHAR(20) NOT NULL,
    image NVARCHAR(500),
    CONSTRAINT CHK_role CHECK (role_user in ('Admin', 'Salesman', 'User'))
);

-- Cửa hàng
CREATE TABLE Shops (
    id_shop INT PRIMARY KEY AUTO_INCREMENT,
    id_salesman INT NOT NULL, -- Mã người bán hàng
    name_shop NVARCHAR(100) NOT NULL,
    information TEXT CHARACTER SET utf8mb4,
    CONSTRAINT FK_Salesman FOREIGN KEY (id_salesman) REFERENCES Users(id_user)
);

-- Tạo bảng sản phẩm
CREATE TABLE Products(
	id_product INT PRIMARY KEY AUTO_INCREMENT,
    name_product NVARCHAR(100) NOT NULL,
    id_shop INT NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    quantitymo_batch INT NOT NULL,
    CONSTRAINT FK_Salesman FOREIGN KEY (id_shop) REFERENCES Shops(id_shop),
    CONSTRAINT CHK_Product CHECK (price > 0 and quantity >= 0)
);

-- danh sách hình ảnh của sản phẩm
CREATE TABLE ProductColor(
	id_product_color INT PRIMARY KEY AUTO_INCREMENT,
	id_product INT NOT NULL,
    color NVARCHAR(100) null,	-- Màu sắc của sản phẩm
    image_product NVARCHAR(500) NOT NULL, -- Hình ảnh của sản phẩm
    CONSTRAINT FK_idProduct FOREIGN KEY (id_product) REFERENCES Products(id_product)
);

-- hóa đơn người dùng
CREATE TABLE Bills(
	id_bill INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_product INT NOT NULL,
    id_product_color INT NOT NULL, 
    quantity INT NOT NULL, -- số lượng sản phẩm người dùng đã mua
    creation_date DATE NOT NULL,
    total DECIMAL(18,2) NOT NULL, -- giá trị hóa đơn
    CONSTRAINT FK_user FOREIGN KEY (id_user) REFERENCES Users(id_user),
    CONSTRAINT FK_Product FOREIGN KEY (id_product) REFERENCES Products(id_product),
    CONSTRAINT FK_Image_Product FOREIGN KEY (id_product_color) REFERENCES ProductColor(id_product_color),
    CONSTRAINT CHK_UserBill CHECK (quantity > 0 and total > 0)
);


