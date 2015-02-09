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
			WHERE  name = 'web_spS_ObtenerRevisionesUltimaRevision' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerRevisionesUltimaRevision
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Sábado 13 de Diciembre de 2014
-- Description:	Obtener todos los registros de Revisiones con las últimas visitas
-- =============================================
CREATE PROCEDURE web_spS_ObtenerRevisionesUltimaRevision
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		A.ID,
		A.Mov,
		A.MovID,
		A.Semana,
		A.Sucursal,
		A.FechaEmision,
		A.FechaRevision,
		A.Observaciones,
		A.Comentarios,
		A.Estatus,
		B.Programado,
		B.Real
	FROM
		Revisiones A
	LEFT OUTER JOIN
		RevisionesD B
	ON
		A.ID = B.Revision AND B.Renglon = 0
	WHERE
		A.Estatus = 'BORRADOR'
	ORDER BY
		B.Renglon DESC
END
GO