USE RealEstateDB;

//1.Имотите с техния тип и агент
SELECT 
    p.PropertyID,
    p.Address,
    p.City,
    pt.TypeName AS PropertyType,
    p.Price,
    a.FirstName + ' ' + a.LastName AS Agent
FROM Properties p
JOIN PropertyTypes pt ON p.PropertyTypeID = pt.PropertyTypeID
JOIN Agents a ON p.AgentID = a.AgentID;

 //2.Всички продажби + клиент и агент
SELECT 
    s.SaleID,
    s.SaleDate,
    s.SalePrice,
    s.Commission,
    c.FirstName + ' ' + c.LastName AS Client,
    a.FirstName + ' ' + a.LastName AS Agent,
    p.Address
FROM Sales s
JOIN Clients c ON s.ClientID = c.ClientID
JOIN Agents a ON s.AgentID = a.AgentID
JOIN Properties p ON s.PropertyID = p.PropertyID;

//3.Продадените имоти в град "София"
SELECT 
    p.Address,
    p.City,
    s.SaleDate,
    s.SalePrice
FROM Sales s
JOIN Properties p ON s.PropertyID = p.PropertyID
WHERE p.City = N'София';

//Обновяване на цена на имот
UPDATE Properties
SET Price = 125000
WHERE PropertyID = 1;

//Изтриване на клиент по ID
DELETE FROM Clients
WHERE ClientID = 2;

//Добавяне на нов агент
INSERT INTO Agents (FirstName, LastName, Phone, Email) VALUES
(N'Георги', N'Колев', '0888111222', 'georgi.kolev@example.com');
