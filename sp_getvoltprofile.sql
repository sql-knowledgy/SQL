USE [SolidPowerDev]
GO

/****** Object:  StoredProcedure [dbo].[sp_getvoltprofile]    Script Date: 9/2/2019 14:29:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_getvoltprofile]
	@CellName varchar(100) = 'All', 
	@CycleIndex int = 0		-- Passing 0 will return all Cell Cycles
	-- , @orderby = 'Test_Time'
AS
-- ===========================================================================================
-- TEST EXAMPLES:
-- exec sp_getvoltprofile
-- exec sp_getvoltprofile '190228_a'
-- exec sp_getvoltprofile '190228_a', 2
-- exec sp_getvoltprofile 'All', 2
-- ===========================================================================================
-- EXAMPLE OF EXPORTING DATA TO A .csv FILE USING BCP:
-- declare @sql varchar(8000)
-- select @sql = 'bcp "select * from EmailVarification..tblTransaction" queryout c:\bcp\Tom.xls -c -t, -T -S' + @@servername
-- exec master..xp_cmdshell @sql
-- https://www.red-gate.com/simple-talk/sql/database-administration/working-with-the-bcp-command-line-utility/
-- https://www.red-gate.com/simple-talk/sql/database-administration/creating-csv-files-using-bcp-and-stored-procedures/
-- https://www.codeproject.com/Questions/546777/HowplusToplusExportplusDataplusToplustheplus-csvpl
-- ===========================================================================================
BEGIN
	SET NOCOUNT ON;

	-- load All Cells, All Cycles
	if @CellName = 'All' and @CycleIndex = 0
		BEGIN
		SELECT	
			CellName, Data_Point, Test_Time, Step_Time, Date_Time, Step_Index, Cycle_Index, [Current], Voltage, Charge_Capacity, Discharge_Capacity, 
			Charge_Energy, Discharge_Energy, Internal_Resistance
		FROM 
			ChannelNormal
		END
	
	-- load specific Cell, All Cycles
	if @CellName != 'All' and @CycleIndex = 0
		BEGIN
		SELECT	
			CellName, Data_Point, Test_Time, Step_Time, Date_Time, Step_Index, Cycle_Index, [Current], Voltage, Charge_Capacity, Discharge_Capacity, 
			Charge_Energy, Discharge_Energy, Internal_Resistance
		FROM 
			ChannelNormal
		WHERE 
			CellName = @CellName
		ORDER BY 
			data_point
		END

	-- load specific Cell with specific cycle
	IF @CellName != 'All' and @CycleIndex > 0
		BEGIN
		SELECT	
			CellName, Data_Point, Test_Time, Step_Time, Date_Time, Step_Index, Cycle_Index, [Current], Voltage, Charge_Capacity, Discharge_Capacity, 
			Charge_Energy, Discharge_Energy, Internal_Resistance
		FROM 
			ChannelNormal
		WHERE 
			CellName = @CellName
		AND
			Cycle_Index = @CycleIndex
		ORDER BY 
			data_point
		END

		--load all cells for a specific cycle
	IF @CellName = 'All' and @CycleIndex > 0
		BEGIN
		SELECT	
			CellName, Data_Point, Test_Time, Step_Time, Date_Time, Step_Index, Cycle_Index, [Current], Voltage, Charge_Capacity, Discharge_Capacity, 
			Charge_Energy, Discharge_Energy, Internal_Resistance
		FROM 
			ChannelNormal
		WHERE 
			Cycle_Index = @CycleIndex
		ORDER BY 
			CellName, data_point
		END
END
GO


