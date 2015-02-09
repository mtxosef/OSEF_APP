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
			WHERE  name = 'web_spU_ActualizarCertificadoInversion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarCertificadoInversion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 02 de Enero de 2015
-- Description:	Actualizar un registro de Certificados de inversión por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarCertificadoInversion
	-- Add the parameters for the stored procedure here
	@ID						CHAR(8),
	@Cliente				CHAR(8),
	@TipoInversion			VARCHAR(20),
	@UnidadCalculo			TINYINT,
	@TasaInteres			DECIMAL(3,2),
	@FechaVencimiento		DATE,
	@ValorInversion			DECIMAL(9,2),
	@InstruccionesCapital	VARCHAR(50),
	@InstruccionesInteres	VARCHAR(50),
	@Usuario				VARCHAR(50),
	@FechaAlta				SMALLDATETIME,
	@Estatus				VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		CertificadosInversiones
	SET
		Cliente = @Cliente,
		TipoInversion = @TipoInversion,
		UnidadCalculo = @UnidadCalculo,
		TasaInteres = @TasaInteres,
		FechaVencimiento = @FechaVencimiento,
		ValorInversion = @ValorInversion,
		InstruccionesCapital = @InstruccionesCapital,
		InstruccionesInteres = @InstruccionesInteres,
		Usuario = @Usuario,
		FechaAlta = @FechaAlta,
		Estatus = @Estatus
	WHERE
		ID = @ID
END
GO