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
			WHERE  name = 'web_spI_InsertarCertificadoInversion' AND
			TYPE = 'P')
	DROP PROCEDURE web_spI_InsertarCertificadoInversion
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Viernes 02 de Enero de 2015
-- Description:	Insertar un registro de Certificado de Inversión
-- =============================================
CREATE PROCEDURE web_spI_InsertarCertificadoInversion
	-- Add the parameters for the stored procedure here
	@ID						CHAR(8) OUTPUT,
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
	
	--Formar el ID
	DECLARE
		@ID_TEMP INT,
		@VALOR CHAR(8)
		
		SELECT @ID_TEMP = MAX(CAST(SUBSTRING(ID, 3, LEN(ID)) AS INT)) FROM CertificadosInversiones WHERE ID LIKE 'CI%'
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
			SET @VALOR = 'CI00000' + CAST(@ID_TEMP AS CHAR(1))
		END
		ELSE IF ((@ID_TEMP / 100) < 1)
		BEGIN
			SET @VALOR = 'CI0000' + CAST(@ID_TEMP AS CHAR(2))
		END
		ELSE IF ((@ID_TEMP / 1000) < 1)
		BEGIN
			SET @VALOR = 'CI000' + CAST(@ID_TEMP AS CHAR(3))
		END
		ELSE IF ((@ID_TEMP / 10000) < 1)
		BEGIN
			SET @VALOR = 'CI00' + CAST(@ID_TEMP AS CHAR(4))
		END
		ELSE IF ((@ID_TEMP / 100000) < 1)
		BEGIN
			SET @VALOR = 'CI0' + CAST(@ID_TEMP AS CHAR(5))
		END
		ELSE
		BEGIN
			SET @VALOR = 'CI' + CAST(@ID_TEMP AS CHAR(6))
		END
		
		SELECT @ID = @VALOR

		-- Insert statements for procedure here
		INSERT INTO
			CertificadosInversiones
			(
				ID,
				Cliente,
				TipoInversion,
				UnidadCalculo,
				TasaInteres,
				FechaVencimiento,
				ValorInversion,
				InstruccionesCapital,
				InstruccionesInteres,
				Usuario,
				FechaAlta,
				Estatus
			)
		VALUES
			(
				@ID,
				@Cliente,
				@TipoInversion,
				@UnidadCalculo,
				@TasaInteres,
				@FechaVencimiento,
				@ValorInversion,
				@InstruccionesCapital,
				@InstruccionesInteres,
				@Usuario,
				@FechaAlta,
				@Estatus
			)
END
GO