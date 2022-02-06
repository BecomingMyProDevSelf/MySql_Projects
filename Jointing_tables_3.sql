USE MultiLease9300;
GO



SELECT Vehicles.vehicleVIN, Vehicles.Model, Vehicles.vehicletype, Vehicles.vehicleColour, Vehicles.airConditioning, Vehicles.powerLocks
FROM Vehicles
FULL OUTER JOIN VehicleTypes ON VehicleTypes.vehicleVIN = Vehicles.vehicleVIN
GROUP BY Vehicles.vehicleVIN, Vehicles.Model, Vehicles.vehicletype, Vehicles.vehicleColour, Vehicles.airConditioning, Vehicles.powerLocks;






----------------This table holds all the conditions

--------------Please use the first and second line of code so the view may work