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
			WHERE  name = 'web_spI_InsertarCuentaContable' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCuentaContable
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 25 de Diciembre de 2014
-- Description:	Insertar un registro de Cuenta contable
-- =============================================
CREATE PROCEDURE web_spI_InsertarCuentaContable
	-- Add the parameters for the stored procedure here
	@Cuenta			VARCHAR(20),
	@Rama			VARCHAR(20),
	@Descripcion	VARCHAR(100),
	@Tipo			VARCHAR(15),
	@Estatus		VARCHAR(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	INSERT INTO
		CuentasContables
		(
			Cuenta,
			Rama,
			Descripcion,
			Tipo,
			Estatus
		)
	VALUES
		(
			@Cuenta,
			@Rama,
			@Descripcion,
			@Tipo,
			@Estatus
		)
END
GO