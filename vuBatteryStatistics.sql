USE [SolidPowerDev]
GO

/****** Object:  View [dbo].[vuBatteryStatistics]    Script Date: 9/2/2019 14:24:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE view [dbo].[vuBatteryStatistics] as
-- select * from vuBatteryStatistics


SELECT
   cn.CellName,
   cn.Data_Point,
   --MAX(cn.ArbinDate) AS ArbinDate,
   --CAST(CAST(cn.ArbinTime AS VARCHAR(5)) AS TIME(0)) ArbinTimeMinute,
   --MAX(YEAR(cn.ArbinDate)) YearNr,
   --MAX(MONTH(cn.ArbinDate)) AS MonthNr,
   --MAX(DAY(cn.ArbinDate)) AS DayNr,
   --CAST(ArbinTime AS VARCHAR(2)) ArbinHour,
   --SUBSTRING(CAST( ArbinTime AS VARCHAR(5)), 4, 5) AS ArbinMin,

   cn.Cycle_Index,
   c.Mass,
   -- SPECIFIC CHARGE AND DISCHARGE CAPACITY
   MAX(cn.charge_capacity) / c.mass AS SpecificMaxChargeCapacity,
   MAX(cn.Discharge_capacity) / c.mass AS SpecificMaxDischargeCapacity,
   max(cn.Charge_Energy)/c.mass as SpecificMaxEnergyCapacity,
   max(cn.Discharge_Energy)/c.mass as SpecificMinEnergyCapacity,
   -- CHARGE CAPACITY
   AVG(cn.charge_capacity) AvgChargeCapacity,
   MAX(cn.charge_capacity) MaxChargeCapacity,
   -- DISCHARGE CAPACITY
   MAX(cn.discharge_capacity) MaxDischargeCapacity,
   --EFFICIENCY
   MAX(cn.Discharge_Capacity) / MAX(cn.Charge_Capacity) AS Efficiency,
   MAX(cn.Charge_Capacity) / MAX(cn.Discharge_Capacity) AS InverseEfficiency,
   -- VOLTAGE
   MAX(cn.Voltage) AS MaxChargeVoltage,
   MIN(cn.Voltage) AS MinChargeVoltage,
   AVG(Voltage) AvgChargeVoltage,
   --STDEV(Voltage) StdevVoltage, 	-- var(Voltage) VarVoltage
   -- CHARGE / DISCHARGE ENERGY
   max(charge_energy) as MaxChargeEnergy,
   max(discharge_energy) as MaxDischargeEnergy
   --, c.mass(
FROM
   ChannelNormal cn 
   INNER JOIN
      Cell c 
      ON c.CellName = cn.CellName 
WHERE
   c.mass > 0 
   AND cn.Charge_Capacity > 0 
   AND cn.Discharge_Capacity > 0
   --and cn.cellName ='190517_a'
GROUP BY
   cn.CellName,
   cn.Cycle_Index,
   cn.Data_Point,
   c.mass
   --, CAST(CAST(cn.ArbinTime AS VARCHAR(5)) AS TIME(0)),
   --CAST(ArbinTime AS VARCHAR(2)),
   --SUBSTRING(CAST( ArbinTime AS VARCHAR(5)), 4, 5) 
--ORDER BY
--   cn.CellName,
--   cn.Cycle_Index


-- ) a


GO
