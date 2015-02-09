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
			WHERE  name = 'web_spS_ObtenerTodosAgentes' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerTodosAgentes
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 24 de Octubre de 2012
-- Description:	Obtener todos los registros de los agentes
-- =============================================
CREATE PROCEDURE web_spS_ObtenerTodosAgentes
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		Agente AS ID,
		Nombre,
		Tipo,
		Moneda,
		Telefonos,
		Extencion,
		Categoria,
		Familia,
		Zona,
		Grupo,
		Estatus,
		UltimoCambio,
		Clase,
		Alta,
		Baja
	FROM
		Agente
END
GO