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
			WHERE  name = 'web_spD_BorrarRevisionDPorRevision' AND
			TYPE = 'P')
	DROP PROCEDURE web_spD_BorrarRevisionDPorRevision
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 05 de Diciembre de 2014
-- Description:	Borrar los registros de RevisionesD por su relaci�n con la Revision
-- =============================================
CREATE PROCEDURE web_spD_BorrarRevisionDPorRevision
	-- Add the parameters for the stored procedure here
	@Revision	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DELETE FROM
		RevisionesD
	WHERE
		Revision = @Revision
END
GO