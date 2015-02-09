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
			WHERE  name = 'web_spI_InsertarPreciarioConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarPreciarioConcepto
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 16 de Diciembre de 2014
-- Description:	Insertar un registro de Articulo
-- =============================================
CREATE PROCEDURE web_spI_InsertarPreciarioConcepto
	-- Add the parameters for the stored procedure here
	@ID				CHAR(10) OUTPUT,
	@CLAVE			CHAR(7),
	@Preciario		VARCHAR(7),
	@Descripcion	VARCHAR(2000),
	@Categoria		CHAR(10),
	@SubCategoria	CHAR(10),
	@SubSubCategoria CHAR(10),
	@Unidad			VARCHAR(30),
	@Costo			DECIMAL(20,2),
	@Cantidad		DECIMAL(10,2),
	@Importe		DECIMAL(20,2),
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
		@VALOR CHAR(10)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 2, LEN(ID)) AS INT)) FROM PreciarioConceptos WHERE ID LIKE 'C%'
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
			SET @VALOR = 'C00000000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'C0000000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'C000000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'C00000' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'C0000' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'C000' + CAST(@ID_TEMP AS CHAR(6))
		END
		ELSE IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'C00' + CAST(@ID_TEMP AS CHAR(7))
		END
		ELSE IF ((@ID_TEMP / 1000000) < 1)
		BEGIN
			SET @VALOR = 'C0' + CAST(@ID_TEMP AS CHAR(8))
		END
		ELSE
		BEGIN
			SET @VALOR = 'C' + CAST(@ID_TEMP AS CHAR(9))
		END
		
		SELECT @ID = @VALOR

    -- Insert statements for procedure here
    INSERT INTO
		PreciarioConceptos
		(
			ID,
			CLAVE,
			Preciario,
			Descripcion,
			Categoria,
			SubCategoria,
			SubSubCategoria,
			Unidad,
			Costo,
			Cantidad,
			Importe,
			Estatus,
			FechaAlta
		)
	VALUES
		(
			@ID,
			@CLAVE,
			@Preciario,
			@Descripcion,
			@Categoria,
			@SubCategoria,
			@SubSubCategoria,
			@Unidad,
			@Costo,
			@Cantidad,
			@Importe,
			@Estatus,
			@FechaAlta
		)
END
GO