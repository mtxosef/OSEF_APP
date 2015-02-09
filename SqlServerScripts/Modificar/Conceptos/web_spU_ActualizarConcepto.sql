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
			WHERE  name = 'web_spU_ActualizarConcepto' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarConcepto
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Lunes 24 de Noviembre de 2014
-- Description:	Actualizar un registro de Concepto por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarConcepto
	-- Add the parameters for the stored procedure here
	@ID				CHAR(7),
	@Modulo			VARCHAR(20),
	@Orden			SMALLINT,
	@Descripcion	VARCHAR(50),
	@Categoria		CHAR(5),
	@SubCategoria	CHAR(6),
	@FechaAlta		SMALLDATETIME,
	@Estatus		VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Conceptos
	SET
		Modulo = @Modulo,
		Orden = @Orden,
		Descripcion = @Descripcion,
		Categoria = @Categoria,
		SubCategoria = @SubCategoria,
		FechaAlta = @FechaAlta,
		Estatus = @Estatus
	WHERE
		ID = @ID
END
GO