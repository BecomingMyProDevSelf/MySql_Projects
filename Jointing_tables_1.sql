USE MultiLease9300;
GO




SELECT Customers.customerName, Customers.customerPhonenumber, 
		COUNT(Leases.leaseID) AS totalLeases
FROM Customers
FULL OUTER JOIN Leases ON Customers.customerName = Leases.customerName
GROUP BY Customers.customerName, Leases.customerName ,Customers.customerPhonenumber ;

