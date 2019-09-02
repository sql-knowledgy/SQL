USE [SolidPowerDev]
GO

/****** Object:  StoredProcedure [dbo].[spCycleStatistics]    Script Date: 9/2/2019 14:29:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCycleStatistics]
	@cellname varchar(500) = 'ALL'
AS
-- spCycleStatistics '2015_0018_PC_A'
BEGIN
	SET NOCOUNT ON;

    select CellName, Cycle_Index, Data_Point, 'Cycle_Index' as Measurement, Cycle_Index as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'Mass' as Measurement, Mass as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'SpecificMaxChargeCapacity' as Measurement, SpecificMaxChargeCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'SpecificMaxDischargeCapacity' as Measurement, SpecificMaxDischargeCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'SpecificMaxEnergyCapacity' as Measurement, SpecificMaxEnergyCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'SpecificMinEnergyCapacity' as Measurement, SpecificMinEnergyCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'AvgChargeCapacity' as Measurement, AvgChargeCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'MaxChargeCapacity' as Measurement, MaxChargeCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'MaxDischargeCapacity' as Measurement, MaxDischargeCapacity as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'Efficiency' as Measurement, Efficiency as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'InverseEfficiency' as Measurement, InverseEfficiency as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'MaxChargeVoltage' as Measurement, MaxChargeVoltage as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'MinChargeVoltage' as Measurement, MinChargeVoltage as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'AvgChargeVoltage' as Measurement, AvgChargeVoltage as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'MaxChargeEnergy' as Measurement, MaxChargeEnergy as Value
	from vuBatteryStatistics
	where cellname = @cellname
	union all
	select CellName, Cycle_Index, Data_Point, 'MaxDischargeEnergy' as Measurement, MaxDischargeEnergy as Value
	from vuBatteryStatistics
	where cellname = @cellname
END
GO


