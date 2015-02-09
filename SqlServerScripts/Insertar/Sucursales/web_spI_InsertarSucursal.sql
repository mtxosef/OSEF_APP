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
			WHERE  name = 'web_spI_InsertarSucursal' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarSucursal
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 18 de Noviembre de 2014
-- Description:	Insertar un registro de Sucursal
-- =============================================
CREATE PROCEDURE web_spI_InsertarSucursal
	-- Add the parameters for the stored procedure here
	@ID						CHAR(10) OUTPUT,
	@CR						SMALLINT,
	@Nombre					VARCHAR(100),
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
	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 4, LEN(ID)) AS INT)) FROM Sucursales WHERE ID LIKE 'SUC%'
		IF (@ID_TEMP IS NOT NULL)
		BEGIN
			SET @ID_TEMP = @ID_TEMP + 1
		END
		ELSE
		BEGIN
			SET @ID_TEMP = 1
		END

		--DECIMAL
		IF ((@ID_TEMP / 10) < 1)
		BEGIN
			SET @VALOR = 'SUC000000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'SUC00000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'SUC0000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'SUC000' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'SUC00' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE  IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'SUC0' + CAST(@ID_TEMP AS CHAR(6))
		END
		ELSE
		BEGIN
			SET @VALOR = 'SUC' + CAST(@ID_TEMP AS CHAR(7))
		END
		
		SELECT @ID = @VALOR

		-- Insert statements for procedure here
		INSERT INTO
			Sucursales
			(
				ID,
				CR,
				Nombre,
				GerenteBBVANombre,
				GerenteBBVAAPaterno,
				GerenteBBVAAMaterno,
				SupervisorNombre,
				SupervisorAPaterno,
				SupervisorAMaterno,
				ProveedorEnergia,
				Superficie,
				CoordinadorNombre,
				CoordinadorAPaterno,
				CoordinadorAMaterno,
				Calle,
				EntreCalles,
				NoExterior,
				NoInterior,
				CodigoPostal,
				Colonia,
				Estado,
				Municipio,
				Contratista,
				TerminoContrato,
				InicioObra,
				FinObra,
				SemanasObra,
				FechaAlta,
				Estatus
			)
		VALUES (
				@ID,
				@CR,
				@Nombre,
				@GerenteBBVANombre,
				@GerenteBBVAAPaterno,
				@GerenteBBVAAMaterno,
				@SupervisorNombre,
				@SupervisorAPaterno,
				@SupervisorAMaterno,
				@ProveedorEnergia,
				@Superficie,
				@CoordinadorNombre,
				@CoordinadorAPaterno,
				@CoordinadorAMaterno,
				@Calle,
				@EntreCalles,
				@NoExterior,
				@NoInterior,
				@CodigoPostal,
				@Colonia,
				@Estado,
				@Municipio,
				@Contratista,
				@TerminoContrato,
				@InicioObra,
				@FinObra,
				@SemanasObra,
				@FechaAlta,
				@Estatus
				)
END
GO