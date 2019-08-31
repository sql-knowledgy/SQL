USE [SolidPowerDev]
GO

/****** Object:  StoredProcedure [dbo].[getCellLog]    Script Date: 8/31/2019 16:01:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--exec getCellLog 'hasp_cp_190819_b'
CREATE PROCEDURE [dbo].[getCellLog]
	--@cellname varchar(250) = 'hasp_cp_190819_b'
	@cellname varchar(250) = 'ALL'
AS
BEGIN
	if @cellname != 'ALL'
		SELECT 
			[SCL_ID], [Cell #] as CellName, [# of cycles completed], [1st cycle CE (%)], [1st cycle charge], [1st cycle discharge], 
			[Anode], [Anode Mass (g)], [Arbin Notes], [Cage torque (in-lbs)], [Capacity (mAh)], [Cathode], [Cathode Pressure (tons)], [Channel], 
			[Current Collector], [Cycle # of stoppage], [Die Diameter (1#3 or 1#6 cm)], [Excel Time], [Initial Resistance (ohms)], [Last DateTime], 
			[Loading (mg/cm^2)], [Location], [Maximum Stack Pressure (tons)], [Notes], [Operator], [Purpose/Description], [Python Time], 
			[Reason for stoppage], [Separator], [Separator Mass (g)], [Total Cathode Mass (g)], [active cathode], 
			[active cathode date coated], [active material theoretical capacity (mAh/g)], [cathode particle coating], 
			[cell theoretical capacity (mAh/g)], [die], [electrolyte], [max voltage], [max voltage w/ outlier], [max voltage w/o outlier], 
			[maximum discharge capacity], [nominal percent active material], [ratio active material], [temperature], [wt% coating]
		from celllog 
		where [Cell #] = @cellname
	else
		select
		[SCL_ID], [Cell #] as CellName, [# of cycles completed], [1st cycle CE (%)], [1st cycle charge], [1st cycle discharge], 
		[Anode], [Anode Mass (g)], [Arbin Notes], [Cage torque (in-lbs)], [Capacity (mAh)], [Cathode], [Cathode Pressure (tons)], [Channel], 
		[Current Collector], [Cycle # of stoppage], [Die Diameter (1#3 or 1#6 cm)], [Excel Time], [Initial Resistance (ohms)], [Last DateTime], 
		[Loading (mg/cm^2)], [Location], [Maximum Stack Pressure (tons)], [Notes], [Operator], [Purpose/Description], [Python Time], 
		[Reason for stoppage], [Separator], [Separator Mass (g)], [Total Cathode Mass (g)], [active cathode], 
		[active cathode date coated], [active material theoretical capacity (mAh/g)], [cathode particle coating], 
		[cell theoretical capacity (mAh/g)], [die], [electrolyte], [max voltage], [max voltage w/ outlier], [max voltage w/o outlier], 
		[maximum discharge capacity], [nominal percent active material], [ratio active material], [temperature], [wt% coating]
		from celllog
END
GO


