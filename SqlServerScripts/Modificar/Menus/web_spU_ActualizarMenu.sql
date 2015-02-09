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
			WHERE  name = 'web_spU_ActualizarMenu' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarMenu
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Sabado 29 de Noviembre de 2014
-- Description:	Actualizar un registro de Menu por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarMenu
	-- Add the parameters for the stored procedure here
	@ID					CHAR(4),
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

    -- Insert statements for procedure here
    UPDATE
		Menus
	SET
		Descripcion = @Descripcion,
		GrupoMenu = @GrupoMenu,
		ImagenNormal = @ImagenNormal,
		ImagenSobre = @ImagenSobre,
		ImagenSeleccionar = @ImagenSeleccionar,
		ImagenDeshabilitar = @ImagenDeshabilitar
	WHERE
		ID = @ID
END
GO