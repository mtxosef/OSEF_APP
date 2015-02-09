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
			WHERE  name = 'web_spI_InsertarUsuario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarUsuario
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 24 de Noviembre de 2014
-- Description:	Insertar un registro de Usuario
-- =============================================
CREATE PROCEDURE web_spI_InsertarUsuario
	-- Add the parameters for the stored procedure here
	@ID					VARCHAR(50),
	@Correo				VARCHAR(50),
	@Nombre				VARCHAR(50),
	@APaterno			VARCHAR(50),
	@AMaterno			VARCHAR(50),
	@Contrasena			VARCHAR(200),
	@Estatus			VARCHAR(50),
	@Bloqueado			BIT,
	@EnLinea			BIT,
	@FechaAlta			SMALLDATETIME,
	@FechaBloqueo		SMALLDATETIME,
	@UltimoAcceso		SMALLDATETIME,
	@CambioContrasena	SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	INSERT INTO
		Usuarios
		(
			ID,
			Correo,
			Nombre,
			APaterno,
			AMaterno,
			Contrasena,
			Estatus,
			Bloqueado,
			EnLinea,
			FechaAlta,
			FechaBloqueo,
			UltimoAcceso,
			CambioContrasena
		)
	VALUES 
		(
			@ID,
			@Correo,
			@Nombre,
			@APaterno,
			@AMaterno,
			@Contrasena,
			@Estatus,
			@Bloqueado,
			@EnLinea,
			@FechaAlta,
			@FechaBloqueo,
			@UltimoAcceso,
			@CambioContrasena
		)
END
GO