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
			WHERE  name = 'web_spU_ActualizarCliente' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarCliente
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Miercoles 07 de Enero de 2015
-- Description:	Actualizar un registro de Clientes por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarCliente
	-- Add the parameters for the stored procedure here
	@ID						CHAR(8),
	@Nombre					VARCHAR(50),
	@APaterno				VARCHAR(50),
	@AMaterno				VARCHAR(50),
	@RFC					VARCHAR(15),
	@CURP					VARCHAR(18),
	@FechaNacimiento		DATE,
	@Edad					TINYINT,
	@Sexo					VARCHAR(9),
	@EstadoCivil			VARCHAR(10),
	@Profesion				CHAR(7),
	@Correo					VARCHAR(100),
	@Telefono				VARCHAR(15),
	@TelefonoMovil			VARCHAR(15),
	@Calle					VARCHAR(100),
	@NoExterior				VARCHAR(10),
	@NoInterior				VARCHAR(10),
	@Colonia				VARCHAR(50),
	@CodigoPostal			INT,
	@EntreCalles			VARCHAR(100),
	@Estado					CHAR(2),
	@Municipio				CHAR(4),
	@Empresa				VARCHAR(50),
	@EmpresaCalle			VARCHAR(100),
	@EmpresaNoExterior		VARCHAR(10),
	@EmpresaNoInterior		VARCHAR(10),
	@EmpresaColonia			VARCHAR(50),
	@EmpresaCodigoPostal	INT,
	@EmpresaEntreCalles		VARCHAR(100),
	@EmpresaTelefono		VARCHAR(15),
	@Puesto					VARCHAR(50),
	@FechaAlta				SMALLDATETIME,
	@Estatus				VARCHAR(20),
	@Usuario				VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Clientes
	SET
		Nombre = @Nombre,
		APaterno = @APaterno,
		AMaterno = @AMaterno,
		RFC = @RFC,
		CURP = @CURP,
		FechaNacimiento = @FechaNacimiento,
		Edad = @Edad,
		Sexo = @Sexo,
		EstadoCivil = @EstadoCivil,
		Profesion = @Profesion,
		Correo = @Correo,
		Telefono = @Telefono,
		TelefonoMovil = @TelefonoMovil,
		Calle = @Calle,
		NoExterior = @NoExterior,
		NoInterior = @NoInterior,
		Colonia = @Colonia,
		CodigoPostal = @CodigoPostal,
		EntreCalles = @EntreCalles,
		Estado = @Estado,
		Municipio = @Municipio,
		Empresa = @Empresa,
		EmpresaCalle = @EmpresaCalle,
		EmpresaNoExterior = @EmpresaNoExterior,
		EmpresaNoInterior = @EmpresaNoInterior,
		EmpresaColonia = @EmpresaColonia,
		EmpresaCodigoPostal = @EmpresaCodigoPostal,
		EmpresaEntreCalles = @EmpresaEntreCalles,
		EmpresaTelefono = @EmpresaTelefono,
		Puesto = @Puesto,
		FechaAlta = @FechaAlta,
		Estatus = @Estatus,
		Usuario = @Usuario
	WHERE
		ID = @ID
END
GO