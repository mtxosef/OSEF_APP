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
			WHERE  name = 'web_spS_ObtenerConceptoPorOrden' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerConceptoPorOrden
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Domingo 23 de Noviembre de 2014
-- Description:	Obtener un registro de Categorias por su Orden
-- =============================================
CREATE PROCEDURE web_spS_ObtenerConceptoPorOrden
	-- Add the parameters for the stored procedure here
	@Orden	SMALLINT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Modulo,
		Orden,
		Descripcion,
		Categoria,
		SubCategoria,
		FechaAlta,
		Estatus
	FROM
		Conceptos
	WHERE
		Orden = @Orden
END
GO