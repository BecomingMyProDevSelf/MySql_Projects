USE MultiLease9300;
GO

SELECT Vehicles.vehicleVIN, Vehicles.Model, Vehicles.vehicletype, Vehicles.vehicleColour
FROM Vehicles
FULL OUTER JOIN VehicleTypes ON VehicleTypes.vehicleVIN = Vehicles.vehicleVIN
GROUP BY Vehicles.vehicleVIN, Vehicles.Model, Vehicles.vehicletype, Vehicles.vehicleColour;

WHERE NOT EXISTS (Write Subquery to Check)