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
			WHERE  name = 'web_spS_ObtenerMunicipiosPorEstado' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerMunicipiosPorEstado
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Sabado 22 de Noviembre de 2014
-- Description:	Obtener todos los Municipios por Estado
-- =============================================
CREATE PROCEDURE web_spS_ObtenerMunicipiosPorEstado
	-- Add the parameters for the stored procedure here
	@Estado	CHAR(2)
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
		Estado = @Estado
END
GO