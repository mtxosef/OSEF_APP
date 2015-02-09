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
			WHERE  name = 'web_spS_ObtenerClientes' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerClientes
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Obtener todos los registros de Clientes
-- =============================================
CREATE PROCEDURE web_spS_ObtenerClientes
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		ID,
		Nombre,
		APaterno,
		AMaterno,
		RFC,
		CURP,
		FechaNacimiento,
		Edad,
		Sexo,
		EstadoCivil,
		Profesion,
		Correo,
		Telefono,
		TelefonoMovil,
		Calle,
		NoExterior,
		NoInterior,
		Colonia,
		CodigoPostal,
		EntreCalles,
		Estado,
		Municipio,
		Empresa,
		EmpresaCalle,
		EmpresaNoExterior,
		EmpresaNoInterior,
		EmpresaColonia,
		EmpresaCodigoPostal,
		EmpresaEntreCalles
		EmpresaTelefono,
		Puesto,
		FechaAlta,
		Estatus,
		Usuario
	FROM
		Clientes
END
GO