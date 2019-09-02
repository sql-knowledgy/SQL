USE [SolidPowerDev]
GO

/****** Object:  View [dbo].[vuDqDv]    Script Date: 9/2/2019 14:25:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vuDqDv] as
with dqdv_cte(cCNTID, pCNTID, Cycle_Index, DeltaChargeCapacity, DeltaDischargeCapacity, DeltaVoltage, cCellName, cTest_ID, cData_Point, cVoltage, cCharge_Capacity,
				pCellName, pTest_ID, pData_Point, pVoltage, pCharge_Capacity)
as (
select 
	cn.CNTID cCNTID, pr.CNTID pCNTID, cn.Cycle_Index, 
	cn.Charge_Capacity - pr.Charge_Capacity DeltaChargeCapacity, 
	cn.Discharge_Capacity - pr.Charge_Capacity DeltaDischargeCapacity,
	cn.Voltage - pr.Voltage DeltaVoltage,
	cn.CellName cCellName, cn.Test_ID cTest_ID, cn.Data_Point cData_Point, cn.Voltage cVoltage, cn.Charge_Capacity cCharge_Capacity,
	pr.CellName pCellName, pr.Test_ID pTest_ID, pr.Data_Point pData_Point, pr.Voltage pVoltage, pr.Charge_Capacity pCharge_Capacity
from [ChannelNormal] cn
inner join [dbo].[ChannelNormal] pr
	on pr.CellName = cn.CellName
	and pr.Test_ID = cn.Test_ID
	and pr.Data_Point = cn.Data_Point-1
where pr.Charge_Capacity != 0
	and cn.Voltage - pr.Voltage  != 0
	-- FOR TESTING PURPOSES ONLY. REMOVE NEXT LINE FOR PROD
	--and cn.CellName = '180208_b'
	--and cn.Cycle_Index = @cycle_index
)
select -- top 100 percent 
	cCellName CellName, cTest_ID Test_ID, Cycle_Index, cData_Point Data_Point, DeltaChargeCapacity/DeltaVoltage dqdvCharge,
	DeltaDischargeCapacity/DeltaVoltage dqdvDischarge,
	DeltaChargeCapacity, DeltaDischargeCapacity, DeltaVoltage
from dqdv_cte
--order by ccellname, ctest_ID, cdata_point;
GO


