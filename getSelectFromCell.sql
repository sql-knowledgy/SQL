USE [SolidPowerDev]
GO

/****** Object:  StoredProcedure [dbo].[getSelectFromCell]    Script Date: 9/2/2019 14:28:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[getSelectFromCell]
	@CellName varchar(100) = 'All'
AS
BEGIN

	SET NOCOUNT ON;
	if @Cellname != 'All'
		select * from Cell where CellName = @CellName
	else
		select * from Cell
    
END
GO


