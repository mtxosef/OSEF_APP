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
			WHERE  name = 'web_spI_InsertarRevisionD' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarRevisionD
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Insertar un registro de RevisionesD
-- =============================================
CREATE PROCEDURE web_spI_InsertarRevisionD
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
		INSERT INTO
			RevisionesD
			(
				Revision,
				Renglon,
				Concepto,
				Proveedor,
				Programado,
				Real
			)
		VALUES
			(
				@Revision,
				@Renglon,
				@Concepto,
				@Proveedor,
				@Programado,
				@Real
			)
END
GO