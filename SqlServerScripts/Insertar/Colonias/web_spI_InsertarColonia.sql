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
			WHERE  name = 'web_spI_InsertarColonia' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarColonia
GO
-- =============================================
-- Author:		Christian Medina
-- Create date: Martes 20 de Enero de 2015
-- Description:	Insertar un registro de Colonia
-- =============================================
CREATE PROCEDURE web_spI_InsertarColonia
	-- Add the parameters for the stored procedure here
	@ID				CHAR(12),
	@Descripcion	VARCHAR(50),
	@Estado			VARCHAR(4),
	@Municipio		VARCHAR(6)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO
		Colonias
		(
			ID,
			Descripcion,
			Estado,
			Municipio)
	VALUES (
			@ID,
			@Descripcion,
			@Estado,
			@Municipio
			)
END
GO