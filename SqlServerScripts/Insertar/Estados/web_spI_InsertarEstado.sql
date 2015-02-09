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
			WHERE  name = 'web_spI_InsertarEstado' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarEstado
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 12 de Noviembre de 2014
-- Description:	Insertar un registro de Estado
-- =============================================
CREATE PROCEDURE web_spI_InsertarEstado
	-- Add the parameters for the stored procedure here
	@ID				CHAR(2),
	@Abreviatura	VARCHAR(4),
	@Descripcion	VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO
		Estados
		(
			ID,
			Abreviatura,
			Descripcion)
	VALUES (
			@ID,
			@Abreviatura,
			@Descripcion
			)
END
GO