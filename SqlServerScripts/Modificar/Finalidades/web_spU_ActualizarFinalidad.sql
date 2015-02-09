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
			WHERE  name = 'web_spU_ActualizarFinalidad' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarFinalidad
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 19 de Diciembre de 2014
-- Description:	Actualizar un registro de Finalidades por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarFinalidad
	-- Add the parameters for the stored procedure here
	@ID				CHAR(6),
	@Descripcion	VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Finalidades
	SET
		Descripcion = @Descripcion
	WHERE
		ID = @ID
END
GO