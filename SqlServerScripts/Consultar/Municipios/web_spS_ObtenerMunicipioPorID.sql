-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create procedure basic template
-- =============================================
IF EXISTS (	SELECT name 
			FROM sysobjects
			WHERE  name = 'web_spS_ObtenerMunicipioPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerMunicipioPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Sabado 15 de Noviembre de 2014
-- Description:	Obtener un registro de Municipios por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerMunicipioPorID
	-- Add the parameters for the stored procedure here
	@ID	CHAR(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Descripcion,
		Estado
	FROM
		Municipios
	WHERE
		ID = @ID
END
GO