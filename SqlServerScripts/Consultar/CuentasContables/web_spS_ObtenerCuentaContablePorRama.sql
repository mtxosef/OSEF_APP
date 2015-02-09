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
			WHERE  name = 'web_spS_ObtenerCuentaContablePorRama' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_ObtenerCuentaContablePorRama
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Jueves 25 de Diciembre de 2014
-- Description:	Obtener un registro de Cuenta Contable por su Cuenta
-- =============================================
CREATE PROCEDURE web_spS_ObtenerCuentaContablePorRama
	-- Add the parameters for the stored procedure here
	@Rama	VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF (@Rama IS NULL OR @Rama = '')
    BEGIN
		SELECT
			A.Cuenta,
			A.Descripcion,
			A.Rama,
			A.Tipo,
			A.Estatus,
			B.Descripcion AS DescripcionRama
		FROM
			CuentasContables A
		LEFT JOIN
			CuentasContables B
		ON
			A.Rama = B.Cuenta
		WHERE
			A.Rama IS NULL OR LEN(A.Rama) = 0
	END
	ELSE
	BEGIN    
		SELECT
			A.Cuenta,
			A.Descripcion,
			A.Rama,
			A.Tipo,
			A.Estatus,
			B.Descripcion AS DescripcionRama
		FROM
			CuentasContables A
		LEFT JOIN
			CuentasContables B
		ON
			A.Rama = B.Cuenta
		WHERE
			A.Rama = @Rama
	END
END
GO