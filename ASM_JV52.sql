use master
IF DB_ID('ASM_JV52') IS NOT NULL --KIỂM TRA CSDL CẦN TẠO ĐÃ TỒN TẠI CHƯA
	DROP DATABASE ASM_JV52 --XÓA CSDL
GO
create database ASM_JV52

use ASM_JV52
create table Accounts
(
	username	nvarchar(50)	primary key,
	password	nvarchar(50)	not null,
	fullname	nvarchar(50)	not null,
	email		nvarchar(50)	not null,
	photo		nvarchar(50)	null,
	activated	bit				not null default 1,
	admin		bit				not null default 0
)
create table Orders
(
	id			bigint			primary key identity(1,1),
	username	nvarchar(50)	foreign key references Accounts(username),
	create_date	datetime		not null,
	address		nvarchar(100)	not null,
	nguoinhan	nvarchar(50)	not null,
	tongtien	float			not null
)
create table Categories 
(
	id			char(4)			primary key,
	name		nvarchar(50)	not null
)
create table Products
(
	id			int				primary key identity(1,1),
	category_id	char(4)			foreign key references Categories(id),
	name		nvarchar(50)	not null,
	image		nvarchar(50)	not null,
	price		float			not null,
	size		int				not null,
	quantity	int				not null,
	available	bit				not null default 1	
)
create table OrderDetails
(
	id			bigint			primary key identity(1,1),
	order_id	bigint			foreign key references Orders(id),
	product_id	int				foreign key references Products(id),
	price		float			not null,
	quantity	int				not null
)

INSERT INTO Accounts(username, password, fullname, photo, email, activated, admin) VALUES
(N'NV01', N'123', N'Phạm Trung Hiếu', N'hieu.jpg', N'hieupt@fpt.edu.vn', 1, 1),
(N'NV02', N'123', N'Trần Minh Tâm', N'tam.jpg', N'tamtm@fpt.edu.vn', 1, 0),
(N'NV03', N'123', N'Trần Đình Nhã', N'nha.jpg', N'nhatd@fpt.edu.vn', 1, 1),
(N'NV04', N'123', N'Nguyễn Trọng Phú', N'phu.jpg', N'phunt@fpt.edu.vn', 1, 0),
(N'NV05', N'123', N'Bùi Nguyễn Duy Nguyên', N'nguyen.jpg', N'nguyenbnd@fpt.edu.vn', 1, 1)

INSERT INTO Categories(id, name) VALUES
('AD', 'Adidas'),
('NK', 'Nike'),
('M', 'MLB')

INSERT INTO Products( category_id, name, image, price, size, quantity, available) VALUES
( 'M', 'MLB Chunky Liner Mid Denim Boston Red', 'm1.webp', '90', 40, 10, 1),
( 'M', 'MLB BigBall Chunky A Gradient Classic', 'm2.webp', '90', 40, 10, 1),
( 'M', 'MLB Bigball Chunky A New York Yankees', 'm3.webp', '90', 40, 10, 1),
( 'M', 'MLB BigBall Chunky A LA Dodgers Off-White', 'm4.webp', '60', 40, 10, 1),
( 'M', 'MLB BigBall Chunky Cube Monogram New', 'm7.webp', '50', 40, 10, 1),
( 'M', 'MLB Chunky-Liner High Boston Red Sox Wine', 'm8.webp', '90', 40, 10, 1),
( 'M', 'MLB Mule Playball Origin New York Yankees', 'm9.webp', '60', 40, 10, 1),
( 'AD', 'Adidas Stan Smith', 'a1.webp', '90', 40, 10, 1),
( 'AD', 'Adidas Superstar', 'a2.webp', '100', 40, 10, 1),
( 'AD', 'Adidas Ultraboost', 'a3.webp', '80', 40, 10, 1),
( 'AD', 'Adidas NMD', 'a4.webp', '90', 40, 10, 1),
( 'AD', 'Adidas Gazelle', 'a5.webp', '100', 40, 10, 1),
( 'AD', 'Adidas Yeezy', 'a6.webp', '80', 40, 10, 1),
( 'AD', 'Adidas Continental 80', 'a7.webp', '30', 40, 10, 1),
( 'AD', 'Adidas Campus', 'a8.webp', '55', 40, 10, 1),
( 'NK', 'Nike Air Force 1', 'n1.webp', '35', 40, 10, 1),
( 'NK', 'Nike Air Max 90', 'n2.webp', '90', 40, 10, 1),
( 'NK', 'Nike Air Jordan 1', 'n3.webp', '90', 40, 10, 1),
( 'NK', 'Nike React Element 55', 'n4.webp', '60', 40, 10, 1),
( 'NK', 'Nike Dunk Low', 'n5.webp', '40', 40, 10, 1),
( 'NK', 'Nike Cortez', 'n6.webp', '80', 40, 10, 1),
( 'NK', 'Nike Air Max 270', 'n7.webp', '90', 40, 10, 1),
( 'NK', 'Nike Zoom Pegasus 37', 'n8.webp', '90', 40, 10, 1),
( 'NK', 'Nike Blazer Mid', 'n9.webp', '50', 40, 10, 1),
( 'NK', 'Nike SB Dunk High', 'n10.webp', '90', 40, 10, 1)

INSERT INTO Orders ( username, create_date, address, nguoinhan, tongtien) VALUES
(N'NV01', '2023-01-01', N'68 Phú Nhuận', N'Hiếu', 180),
(N'NV01', '2023-02-01', N'68 Phú Nhuận', N'Hiếu', 50),
(N'NV01', '2023-03-01', N'68 Phú Nhuận', N'Hiếu', 60),
(N'NV01', '2023-04-01', N'68 Phú Nhuận', N'Hiếu', 35),
(N'NV01', '2023-05-01', N'68 Phú Nhuận', N'Hiếu', 50),
(N'NV01', '2022-07-01', N'68 Phú Nhuận', N'Hiếu', 35),
(N'NV01', '2021-012-01', N'68 Phú Nhuận', N'Hiếu', 50)

INSERT INTO OrderDetails ( order_id, product_id, price, quantity) VALUES
	(1, 1, 90, 2),
	(2, 24, 50, 1),
	(3, 7, 60, 1),
	(4, 16, 35, 1),
	(5, 24, 50, 1),
	(6, 16, 35, 1),
	(7, 24, 50, 1)


select * from Accounts
select * from Categories
select * from Products
select * from OrderDetails
select * from Orders




select MONTH(o.create_date), SUM(o.tongtien)
from orders o
where YEAR(o.create_date) = 2023
group by MONTH(create_date)

select year(create_date)
from orders 
group by year(create_date)

select create_date
from orders 
group by create_date

CREATE PROCEDURE DOANH_THU_NAM @year int
AS
BEGIN
    select MONTH(o.create_date), SUM(o.tongtien)
	from orders o
	where YEAR(o.create_date) = @year
	group by MONTH(create_date)
END

EXECUTE DOANH_THU_NAM @year = 2023;