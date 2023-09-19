CREATE DATABASE AZBank

USE AZBank
CREATE TABLE Customer (
	CustomerId INT Primary key NOT NULL,
	Name nvarchar(50) NULL,
	City nvarchar(50) NULL,
	Country nvarchar(50) NULL,
	Phone nvarchar(15) NULL,
	Email nvarchar(50) NULL
)

CREATE TABLE CustomerAccount (
	AccountNumber char(9) Primary key NOT NULL,
	CustomerId int NOT NULL,
	Balance money NOT NULL,
	MinAccount money NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
)

CREATE TABLE CustomerTransaction (
	TransactionId int Primary key NOT NULL,
	AccountNumber char(9) NULL,
	TransactionDate smalldatetime NULL,
	Amount money NULL,
	DepositorWithdraw bit NULL,
	FOREIGN KEY (AccountNumber) REFERENCES CustomerAccount(AccountNumber)
)

INSERT INTO Customer (CustomerId, Name, City, Country, Phone, Email)
VALUES
	(0001, 'Wusp', 'Ho Chi Minh', 'Viet Nam', '0912345678', 'chuwuspzuize@gmail.com'),
	(0002, 'Krem', 'Ha Noi', 'Viet Nam', '0909090123', 'fundthikrem@gmail.com'),
	(0003, 'Pit', 'Hai Phong', 'Viet Nam', '0912340981', 'picktus@gmail.com');

INSERT INTO CustomerAccount (AccountNumber, CustomerId, Balance, MinAccount)
VALUES
	('200001', 0001, 1000, 500),
	('200002', 0002, 99999993, 500),
	('200003', 0003, 421234, 500);

INSERT INTO CustomerTransaction (TransactionId, AccountNumber, TransactionDate, Amount, DepositorWithdraw)
VALUES
	(23190001, '200002', '2023-09-19', 200, 0),
	(23190002, '200001', '2023-09-19', 500, 1),
	(23190003, '200003', '2023-09-19', 300, 0);

SELECT * FROM Customer
SELECT * FROM CustomerAccount
SELECT * FROM CustomerTransaction

SELECT * FROM Customer WHERE City = 'Ha Noi'

SELECT Customer.Name, Customer.Phone, Customer.Email, CustomerAccount.AccountNumber, CustomerAccount.Balance
FROM Customer
LEFT JOIN CustomerAccount ON Customer.CustomerId = CustomerAccount.CustomerId

ALTER TABLE CustomerTransaction
ADD Constraint Check_Amount CHECK (Amount >= 0 AND Amount <= 1000000);

CREATE VIEW CustomerView
AS
SELECT Customer.Name, CustomerAccount.AccountNumber, CustomerTransaction.TransactionDate, CustomerTransaction.Amount, CustomerTransaction.DepositorWithdraw
FROM Customer
LEFT JOIN CustomerAccount ON Customer.CustomerId = CustomerAccount.CustomerId
LEFT JOIN CustomerTransaction ON CustomerAccount.AccountNumber = CustomerTransaction.AccountNumber