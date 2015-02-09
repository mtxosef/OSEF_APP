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
			WHERE  name = 'web_spI_InsertarPreciario' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarPreciario
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 16 de Diciembre de 2014
-- Description:	Insertar un registro de Articulo
-- =============================================
CREATE PROCEDURE web_spI_InsertarPreciario
	-- Add the parameters for the stored procedure here
	@ID				CHAR(7) OUTPUT,
	@Descripcion	VARCHAR(100),
	@Sucursal		VARCHAR(50),
	@Archivo		VARCHAR(50),
	@Estatus		VARCHAR(20),
	@FechaAlta		SMALLDATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(7)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 4, LEN(ID)) AS INT)) FROM Preciarios WHERE ID LIKE 'PRC%'
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
			SET @VALOR = 'PRC000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'PRC00' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'PRC0' + CAST(@ID_TEMP AS CHAR(3))
		END
	
		ELSE
		BEGIN
			SET @VALOR = 'PRC' + CAST(@ID_TEMP AS CHAR(4))
		END
		
		SELECT @ID = @VALOR
	
    -- Insert statements for procedure here
    INSERT INTO
		Preciarios
		(
			ID,
			Descripcion,
			Sucursal,
			Archivo,
			Estatus,
			FechaAlta
		)
	VALUES
		(
			@ID,
			@Descripcion,
			@Sucursal,
			@Archivo,
			@Estatus,
			@FechaAlta
		)
END
GO


