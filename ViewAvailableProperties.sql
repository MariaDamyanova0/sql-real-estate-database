CREATE VIEW vw_AvailableProperties AS
SELECT
    p.PropertyID,
    p.Address,
    p.City,
    pt.TypeName AS PropertyType,
    a.FirstName + ' ' + a.LastName AS Agent,
    p.Price
FROM Properties p
JOIN PropertyTypes pt ON p.PropertyTypeID = pt.PropertyTypeID
JOIN Agents a ON p.AgentID = a.AgentID
WHERE p.IsAvailable = 1;
