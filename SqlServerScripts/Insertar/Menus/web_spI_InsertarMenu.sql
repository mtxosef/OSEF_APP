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
			WHERE  name = 'web_spI_InsertarMenu' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarMenu
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Sabado 29 de Noviembre de 2014
-- Description:	Insertar un registro de Menu
-- =============================================
CREATE PROCEDURE web_spI_InsertarMenu
	-- Add the parameters for the stored procedure here
	@ID					CHAR(4) OUTPUT,
	@Descripcion		VARCHAR(50),
	@GrupoMenu			CHAR(3),
	@ImagenNormal		VARCHAR(100),
	@ImagenSobre		VARCHAR(100),
	@ImagenSeleccionar	VARCHAR(100),
	@ImagenDeshabilitar	VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(5)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 2, LEN(ID)) AS INT)) FROM Menus WHERE ID LIKE 'M%'
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
			SET @VALOR = 'M00' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'M0' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE
		BEGIN
			SET @VALOR = 'M' + CAST(@ID_TEMP AS CHAR(3))
		END
		
		SELECT @ID = @VALOR

	-- Insert statements for procedure here
	INSERT INTO
		Menus
		(
			ID,
			Descripcion,
			GrupoMenu,
			ImagenNormal,
			ImagenSobre,
			ImagenSeleccionar,
			ImagenDeshabilitar
		)
	VALUES (
			@ID,
			@Descripcion,
			@GrupoMenu,
			@ImagenNormal,
			@ImagenSobre,
			@ImagenSeleccionar,
			@ImagenDeshabilitar
			)
END
GO