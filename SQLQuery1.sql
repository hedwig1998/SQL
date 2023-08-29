CREATE TABLE Customer (
	Customer_ID NVARCHAR(10) PRIMARY KEY,
	Customer_Name NVARCHAR(20),
	Customer_Address NVARCHAR(50) NOT NULL,
	Customer_Tel int
)

CREATE TABLE Product (
	Product_ID NVARCHAR(10) PRIMARY KEY,
	Product_Name NVARCHAR(50),
	Description NVARCHAR(50),
	Price Decimal(10,2),
	Quantity int
)

CREATE TABLE Order_List (
	Order_ID NVARCHAR(10) PRIMARY KEY,
	Customer_ID NVARCHAR(10),
	Customer_Address NVARCHAR(50),
	Order_Date Date,
	FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
)

CREATE TABLE Order_Detail (
	Order_ID NVARCHAR(10),
	Product_ID NVARCHAR(10),
	Quantity int,
	Total Decimal(10,2),
	FOREIGN KEY (Order_ID) REFERENCES Order_List(Order_ID),
	FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
)