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
			WHERE  name = 'web_spS_ObtenerMenuPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerMenuPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Sabado 29 de Noviembre de 2014
-- Description:	Obtener un registro de Menu por su ID
-- =============================================
CREATE PROCEDURE web_spS_ObtenerMenuPorID
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
		GrupoMenu,
		ImagenNormal,
		ImagenSobre,
		ImagenSeleccionar,
		ImagenDeshabilitar
	FROM
		Menus
	WHERE
		ID = @ID
END
GO