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
			WHERE  name = 'web_spS_ValidarUsuarioContrasena' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ValidarUsuarioContrasena
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Domingo 08 de Febrero de 2015
-- Description:	Validar que el usuario y la contraseña sean correctos
-- =============================================
CREATE PROCEDURE web_spS_ValidarUsuarioContrasena
	-- Add the parameters for the stored procedure here
	@Usuario	VARCHAR(50),
	@Contrasena	VARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF EXISTS (SELECT ID FROM Usuarios WHERE (ID = @Usuario OR Correo = @Usuario) AND Contrasena = @Contrasena)
    BEGIN
		SELECT 1
    END
    ELSE
    BEGIN
		SELECT 0
    END
END
GO