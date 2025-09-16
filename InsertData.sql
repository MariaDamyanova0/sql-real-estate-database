USE RealEstateDB;

INSERT INTO PropertyTypes (TypeName) VALUES
(N'Апартамент'),
(N'Къща'),
(N'Гараж');

INSERT INTO Agents (FirstName, LastName, Phone, Email) VALUES
(N'Иван', N'Петров', '0888123456', 'ivan.petrov@example.com'),
(N'Мария', N'Димитрова', '0899123456', 'maria.dimitrova@example.com');

INSERT INTO Clients (FirstName, LastName, Phone, Email) VALUES
(N'Петър', N'Иванов', '0877123456', 'petar.ivanov@example.com'),
(N'Елена', N'Георгиева', '0887123456', 'elena.georgieva@example.com');

INSERT INTO Properties (Address, City, PropertyTypeID, Price, AgentID) VALUES
(N'ул. Витоша 15', N'София', 1, 120000.00, 1),
(N'ул. Гладстон 7', N'Пловдив', 2, 85000.00, 2);

INSERT INTO Sales (PropertyID, ClientID, AgentID, SaleDate, SalePrice) VALUES
(1, 1, 1, '2025-05-15', 118000.00),
(2, 2, 2, '2025-06-01', 83000.00);
