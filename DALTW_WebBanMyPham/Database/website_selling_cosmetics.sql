create database website_selling_cosmetics;
use website_selling_cosmetics;

-- Tạo bảng tài khoản người dùng
CREATE TABLE Users(
	id_user INT PRIMARY KEY AUTO_INCREMENT,
    username NVARCHAR(50) NOT NULL UNIQUE,	-- tên đăng nhập
    password_user NVARCHAR(50) NOT NULL,
    email NVARCHAR(150) NOT NULL,
    phone NVARCHAR(10) NOT NULL,
    full_name NVARCHAR(100) NOT NULL,	-- tên đầy đủ người dùng
    sign_up_date DATE NOT NULL,
    birth_date DATE NOT NULL,
    address NVARCHAR(250),
    role_user NVARCHAR(20) NOT NULL,
    image NVARCHAR(500),
    CONSTRAINT CHK_role CHECK (role_user in ('Admin', 'Vendor', 'User'))
);

-- Cửa hàng
CREATE TABLE Shops (
    id_shop INT PRIMARY KEY AUTO_INCREMENT,
    id_salesman INT NOT NULL, -- Mã người bán hàng
    name_shop NVARCHAR(100) NOT NULL,
    sign_up_date DATE NOT NULL,
	address NVARCHAR(250) NOT NULL,
    introduce TEXT CHARACTER SET utf8mb4,
    image NVARCHAR(500),
    CONSTRAINT FK_Salesman FOREIGN KEY (id_salesman) REFERENCES Users(id_user)
);

-- Tạo bảng sản phẩm
CREATE TABLE Products(
	id_product INT PRIMARY KEY AUTO_INCREMENT,
    name_product NVARCHAR(100) NOT NULL,
    id_shop INT NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    quantity INT NOT NULL,
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

-- đánh giá từ sản phảm từ khách hàng
CREATE TABLE Review_User(
	id_review_user INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT NOT NULL,
    id_user INT NOT NULL,
    review_content TEXT CHARACTER SET utf8mb4,
    product_quality INT,
	creation_time DATETIME,
    CONSTRAINT FK_ReviewProduct FOREIGN KEY (id_product) REFERENCES Products(id_product),
    CONSTRAINT FK_ReviewUser FOREIGN KEY (id_user) REFERENCES Users(id_user)
);

-- Hình ảnh đánh giá sản phẩm
CREATE TABLE Review_Image(
	id_review_user INT NOT NULL,
    image NVARCHAR(500),
    CONSTRAINT FK_ReviewUser FOREIGN KEY(id_review_user) REFERENCES Review_User(id_review_user)
);

-- giỏ hàng
CREATE TABLE ShoppingCart(
	id_shopping_cart INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_product INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT FK_CartUser FOREIGN KEY (id_user) REFERENCES Users(id_user),
    CONSTRAINT FK_CartProduct FOREIGN KEY (id_product) REFERENCES Products(id_product)
);
-- Đơn hàng
CREATE TABLE Orders(
	id_order INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT NOT NULL,
    id_product INT NOT NULL,
    id_product_color INT NOT NULL, 
    quantity INT NOT NULL, -- số lượng sản phẩm người dùng đã mua
    creation_time DATETIME NOT NULL,
    status_order NVARCHAR(100),
    total DECIMAL(18,2) NULL, -- giá trị hóa đơn
    CONSTRAINT FK_user FOREIGN KEY (id_user) REFERENCES Users(id_user),
    CONSTRAINT FK_Product FOREIGN KEY (id_product) REFERENCES Products(id_product),
    CONSTRAINT FK_Image_Product FOREIGN KEY (id_product_color) REFERENCES ProductColor(id_product_color),
    CONSTRAINT CHK_Startus CHECK (status_order IN (N'Đã xác nhận', N'Chờ giao hàng', N'Đã nhận', N'Đã hủy')),
    CONSTRAINT CHK_UserBill CHECK (quantity > 0 and total > 0)
);


