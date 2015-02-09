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
			WHERE  name = 'web_spI_InsertarCategoria' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCategoria
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 13 de Noviembre de 2014
-- Description:	Insertar un registro de Estado
-- =============================================
CREATE PROCEDURE web_spI_InsertarCategoria
	-- Add the parameters for the stored procedure here
	@ID				CHAR(5) OUTPUT,
	@Orden			TINYINT,
	@Descripcion	VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(5)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 3, LEN(ID)) AS INT)) FROM Categorias WHERE ID LIKE 'CA%'
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
			SET @VALOR = 'CA00' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'CA0' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE
		BEGIN
			SET @VALOR = 'CA' + CAST(@ID_TEMP AS CHAR(3))
		END
		
		SELECT @ID = @VALOR

		-- Insert statements for procedure here
		INSERT INTO
			Categorias
			(
				ID,
				Orden,
				Descripcion)
		VALUES (
				@ID,
				@Orden,
				@Descripcion
				)
END
GO