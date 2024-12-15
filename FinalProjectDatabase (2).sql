-- Abdelrahman Zahra N01486820

create schema finalGUIProject;
use finalGUIProject;
create table users(
id integer not null unique auto_increment,
username varchar(255) not null unique,
pass varchar(255) not null,
userRole integer not null,
primary key (id)
);
create table product(
id integer not null unique auto_increment,
prodName varchar(255) not null,
price decimal(10,2) not null,
primary key (id)
);
create table sale(
saleID integer not null unique auto_increment,
prodID integer not null,
userID integer not null,
qty integer not null,
total decimal(10,2) not null,
primary key (saleID),
foreign key (prodID) references product(id),
foreign key (userID) references users(id)
);
insert into users (username, pass, userRole) VALUES ("Admin", "Admin", 1);

-- RegisterNewUser()
Delimiter @@
create procedure RegisterNewUser(
	IN username VARCHAR(255),
    IN pass VARCHAR(255),
    IN userRole INT
)
begin
	INSERT INTO users (username, pass, userRole)
	values (username, pass, userRole);
end@@

-- LoginWithCreds()
Delimiter @@
create procedure LoginWithCreds(
    IN p_username varchar(255),
    IN p_pass varchar(255)
)
begin
    SELECT id, username, pass, userRole
    FROM users
    WHERE username = p_username AND pass = p_pass;
END @@

-- GetAllProducts() 
Delimiter @@
create procedure GetAllProducts()
begin
    SELECT id, prodName, price
    FROM product;
end @@

-- GetSalesTotal()
Delimiter @@
create procedure GetSalesTotal()
begin
    SELECT SUM(total) AS totalSales
    FROM sale;
end @@


-- SubmitOrder()
Delimiter @@
create procedure SubmitOrder(
    IN prodID INT,
    IN userID INT,
    IN qty INT,
    IN total DECIMAL(10,2)
)
begin
    INSERT INTO sale (prodID, userID, qty, total)
    VALUES (prodID, userID, qty, total);
end @@

-- SubmitNewProduct()
Delimiter @@
create procedure SubmitNewProduct(
    IN productName VARCHAR(255),
    IN productPrice DECIMAL(10,2)
)
begin
    INSERT INTO product (prodName, price)
    VALUES (productName, productPrice);
end @@


insert into product (prodName, price)
values ('Item 1', 10.99),
       ('Item 2', 15.99),
       ('Item 3', 20.49);