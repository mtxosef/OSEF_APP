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
			WHERE  name = 'web_spD_BorrarProfesion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarProfesion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 17 de Diciembre de 2014
-- Description:	Borrar un registro de Profesiones por su ID
-- =============================================
CREATE PROCEDURE web_spD_BorrarProfesion
	-- Add the parameters for the stored procedure here
	@ID		CHAR(7)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DELETE FROM
		Profesiones
	WHERE
		ID = @ID
END
GO