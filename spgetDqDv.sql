USE [SolidPowerDev]
GO

/****** Object:  StoredProcedure [dbo].[spgetDqDv]    Script Date: 9/2/2019 14:30:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spgetDqDv]
	@CellName varchar(250) = '190819_Albemarle-S2_C2F-6_Ian',
	@Cycle_index int = 1
AS
-- EXAMPLES
-- exec spgetDqDv '180403_Ilya_Indigo'
-- exec spgetDqDv '171111_graphite_a', 2
BEGIN
	with dqdv_cte(cCNTID, pCNTID, Cycle_Index, DeltaChargeCapacity, DeltaDischargeCapacity, DeltaVoltage, cCellName, cTest_ID, 
					cData_Point, cVoltage, cCharge_Capacity, pCellName, pTest_ID, pData_Point, pVoltage, pCharge_Capacity)
	as (
	select 
		cn.CNTID cCNTID, pr.CNTID pCNTID, cn.Cycle_Index, cn.Charge_Capacity - pr.Charge_Capacity DeltaChargeCapacity, 
		cn.Discharge_Capacity - pr.Charge_Capacity DeltaDischargeCapacity,
		cn.Voltage - pr.Voltage DeltaVoltage,
		cn.CellName cCellName, cn.Test_ID cTest_ID, cn.Data_Point cData_Point, cn.Voltage cVoltage, cn.Charge_Capacity cCharge_Capacity,
		pr.CellName pCellName, pr.Test_ID pTest_ID, pr.Data_Point pData_Point, pr.Voltage pVoltage, pr.Charge_Capacity pCharge_Capacity
	from ChannelNormal cn
	inner join ChannelNormal pr
	on pr.cntid = cn.cntid-1
	where pr.Charge_Capacity != 0
		and cn.Voltage - pr.Voltage  != 0
		-- FOR TESTING PURPOSES ONLY. REMOVE NEXT LINE FOR PROD
		and cn.CellName = @cellname
		and cn.Cycle_Index = @cycle_index
	)
	select cCNTID, pCNTID, cCellName CellName, Cycle_Index, cTest_ID Test_ID, cData_Point Data_Point, DeltaChargeCapacity/DeltaVoltage dqdvCharge,
		DeltaDischargeCapacity/DeltaVoltage dqdvDischarge,
		DeltaChargeCapacity, DeltaDischargeCapacity, DeltaVoltage
	from dqdv_cte
	order by cCNTID
END
GO


