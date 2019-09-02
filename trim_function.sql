/****** Object:  UserDefinedFunction [dbo].[trim_white_space]    Script Date: 5/19/2019 17:24:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[trim_white_space]
(
	@input varchar(1000)
)
RETURNS varchar(1000)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @return varchar(1000)

	-- Add the T-SQL statements to compute the return value here
	SELECT @return = rtrim(ltrim(@input))

	-- Return the result of the function
	RETURN @return

END
GO


