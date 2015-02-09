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
			WHERE  name = 'web_spU_ActualizarRevisionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarRevisionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Actualizar un registro de RevisionesD por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarRevisionD
	-- Add the parameters for the stored procedure here
	@Revision	INT,
	@Renglon	SMALLINT,
	@Concepto	CHAR(7),
	@Proveedor	CHAR(7),
	@Programado	DECIMAL(5,2),
	@Real		DECIMAL(5,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		RevisionesD
	SET
		Concepto = @Concepto,
		Proveedor = @Proveedor,
		Programado = @Programado,
		Real = @Real
	WHERE
		Revision = @Revision AND
		Renglon = @Renglon
END
GO