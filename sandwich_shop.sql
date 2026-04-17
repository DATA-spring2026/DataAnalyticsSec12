DROP DATABASE IF EXISTS sandwich_shop;

CREATE DATABASE sandwich_shop;

USE sandwich_shop;

-- DROP TABLE menu;

CREATE TABLE menu (
	MenuID INT PRIMARY KEY AUTO_INCREMENT
    , Item VARCHAR(30) NOT NULL
    , Price DECIMAL(6,2) NOT NULL
    );

-- DROP TABLE orders;

CREATE TABLE orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT
    , Date DATETIME
    , Delivered DATETIME
    , CustID INT NOT NULL DEFAULT 0
);

-- DROP TABLE order_detail;

CREATE TABLE order_detail (
	OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderNumber INT,
    MenuID INT,
    CONSTRAINT peanut_butter FOREIGN KEY (OrderNumber) REFERENCES orders(OrderID),
    CONSTRAINT jelly FOREIGN KEY (MenuID) REFERENCES menu(MenuID) 
);

INSERT INTO orders (Date, Delivered)
VALUES
	("2026-04-16 14:20:35", "2026-04-16 14:50:20"),
    ("2026-04-17", NULL)
    ;
    
INSERT INTO menu (Item, Price)
VALUES
    ("Turkey sandwich", 7.99),
    ("Roast beef sandwich", 8.99),
    ("Falafel wrap", 8.99),
    ("Bean burrito", 7.99),
    ("Fries, small", 2.99),
    ("Fries, med", 3.99),
    ("Fries, large", 4.50)
    ;

INSERT INTO menu (Item, Price)
VALUES
    ("Drink, small", 2.49),
    ("Drink, med", 3.49),
    ("Drink, large", 3.99);
    
INSERT INTO order_detail (OrderNumber, MenuID)
VALUES
	-- Order 1: Turkey sandwich, small fries, large drink
    (1, 1),
    (1, 5),
    (1, 10),
    -- Order 2: Two roast beef sandwiches, two medium drinks
    (2, 2),
    (2, 2),
    (2, 9),
    (2, 9);
    
SELECT * FROM menu
WHERE Item = "turkey sandwich";

UPDATE menu
SET price = 12.99
WHERE Item = "turkey sandwich";

DELETE FROM menu
WHERE item = "Turkey sandwich";

-- UPDATE menu
-- set price = 12.99
-- WHERE menuid <= 4;