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
			WHERE  name = 'web_spI_InsertarProveedor' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarProveedor
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 18 de Noviembre de 2014
-- Description:	Insertar un registro de Proveedor
-- =============================================
CREATE PROCEDURE web_spI_InsertarProveedor
	-- Add the parameters for the stored procedure here
	@ID					CHAR(7) OUTPUT,
	@Nombre				VARCHAR(50),
	@RFC				VARCHAR(15),
	@ContactoNombre		VARCHAR(50),
	@ContactoAPaterno	VARCHAR(50),
	@ContactoAMaterno	VARCHAR(50),
	@Correo				VARCHAR(100),
	@Calle				VARCHAR(100),
	@EntreCalles		VARCHAR(100),
	@NoExterior			VARCHAR(10),
	@NoInterior			VARCHAR(10),
	@CodigoPostal		INT,
	@Colonia			VARCHAR(50),
	@Estado				CHAR(2),
	@Municipio			CHAR(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(7)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 4, LEN(ID)) AS INT)) FROM Proveedores WHERE ID LIKE 'PRO%'
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
			SET @VALOR = 'PRO000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'PRO00' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'PRO0' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE
		BEGIN
			SET @VALOR = 'PRO' + CAST(@ID_TEMP AS CHAR(4))
		END
		
		SELECT @ID = @VALOR

		-- Insert statements for procedure here
		INSERT INTO
			Proveedores
			(
				ID,
				Nombre,
				RFC,
				ContactoNombre,
				ContactoAPaterno,
				ContactoAMaterno,
				Correo,
				Calle,
				EntreCalles,
				NoExterior,
				NoInterior,
				CodigoPostal,
				Colonia,
				Estado,
				Municipio)
		VALUES (
				@ID,
				@Nombre,
				@RFC,
				@ContactoNombre,
				@ContactoAPaterno,
				@ContactoAMaterno,
				@Correo,
				@Calle,
				@EntreCalles,
				@NoExterior,
				@NoInterior,
				@CodigoPostal,
				@Colonia,
				@Estado,
				@Municipio
				)
END
GO