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
			WHERE  name = 'web_spU_ActualizarSucursal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarSucursal
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 18 de Noviembre de 2014
-- Description:	Actualizar un registro de Sucursales por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarSucursal
	-- Add the parameters for the stored procedure here
	@ID						CHAR(10),
	@CR						SMALLINT,
	@Nombre					VARCHAR(50),
	@GerenteBBVANombre		VARCHAR(50),
	@GerenteBBVAAPaterno	VARCHAR(50),
	@GerenteBBVAAMaterno	VARCHAR(50),
	@SupervisorNombre		VARCHAR(50),
	@SupervisorAPaterno		VARCHAR(50),
	@SupervisorAMaterno		VARCHAR(50),
	@ProveedorEnergia		VARCHAR(100),
	@Superficie				INT,
	@CoordinadorNombre		VARCHAR(50),
	@CoordinadorAPaterno	VARCHAR(50),
	@CoordinadorAMaterno	VARCHAR(50),
	@Calle					VARCHAR(100),
	@EntreCalles			VARCHAR(100),
	@NoExterior				VARCHAR(10),
	@NoInterior				VARCHAR(10),
	@CodigoPostal			INT,
	@Colonia				VARCHAR(50),
	@Estado					CHAR(2),
	@Municipio				CHAR(4),
	@Contratista			VARCHAR(100),
	@TerminoContrato		DATE,
	@InicioObra				DATE,
	@FinObra				DATE,
	@SemanasObra			SMALLINT,
	@FechaAlta				DATE,
	@Estatus				VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Sucursales
	SET
		CR = @CR,
		Nombre = @Nombre,
		GerenteBBVANombre = @GerenteBBVANombre,
		GerenteBBVAAPaterno = @GerenteBBVAAPaterno,
		GerenteBBVAAMaterno = @GerenteBBVAAMaterno,
		SupervisorNombre = @SupervisorNombre,
		SupervisorAPaterno = @SupervisorAPaterno,
		SupervisorAMaterno = @SupervisorAMaterno,
		ProveedorEnergia = @ProveedorEnergia,
		Superficie = @Superficie,
		CoordinadorNombre = @CoordinadorNombre,
		CoordinadorAPaterno = @CoordinadorAPaterno,
		CoordinadorAMaterno = @CoordinadorAMaterno,
		Calle = @Calle,
		EntreCalles = @EntreCalles,
		NoExterior = @NoExterior,
		NoInterior = @NoInterior,
		CodigoPostal = @CodigoPostal,
		Colonia = @Colonia,
		Estado = @Estado,
		Municipio = @Municipio,
		Contratista = @Contratista,
		TerminoContrato = @TerminoContrato,
		InicioObra = @InicioObra,
		FinObra = @FinObra,
		SemanasObra = @SemanasObra,
		FechaAlta = @FechaAlta,
		Estatus = @Estatus
	WHERE
		ID = @ID
END
GO