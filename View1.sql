CREATE VIEW vw_PropertySalesInfo AS
SELECT 
    s.SaleID,
    p.Address,
    p.City,
    pt.TypeName AS PropertyType,
    s.SaleDate,
    s.SalePrice,
    s.Commission,
    a.FirstName + ' ' + a.LastName AS Agent,
    c.FirstName + ' ' + c.LastName AS Client
FROM Sales s
JOIN Properties p ON s.PropertyID = p.PropertyID
JOIN PropertyTypes pt ON p.PropertyTypeID = pt.PropertyTypeID
JOIN Agents a ON s.AgentID = a.AgentID
JOIN Clients c ON s.ClientID = c.ClientID;
