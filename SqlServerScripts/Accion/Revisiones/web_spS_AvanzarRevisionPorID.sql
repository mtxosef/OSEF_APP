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
			WHERE  name = 'web_spS_AvanzarRevisionPorID' AND
			TYPE = 'P')
	DROP PROCEDURE web_spS_AvanzarRevisionPorID
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 03 de Febrero de 2015
-- Description:	Avanzar un registro de Revisiones por su ID
-- =============================================
CREATE PROCEDURE web_spS_AvanzarRevisionPorID
	-- Add the parameters for the stored procedure here
	@ID			INT,
	@Mov		VARCHAR(50),
	@IDNuevo	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE
		@MovA			VARCHAR(50),
		@MovID			VARCHAR(10),
		@Origen			VARCHAR(50),
		@OrigenID		VARCHAR(10),
		@Semana			TINYINT,
		@Sucursal		CHAR(10),
		@FechaEmision	SMALLDATETIME,
		@FechaRevision	SMALLDATETIME,
		@Observaciones	VARCHAR(200),
		@Comentarios	VARCHAR(5000),
		@Estatus		VARCHAR(20)
		
	SELECT
		@MovA = Mov,
		@MovID = MovID,
		@Origen = Origen,
		@OrigenID = OrigenID,
		@Semana = Semana,
		@Sucursal = Sucursal,
		@FechaEmision = FechaEmision,
		@FechaRevision = FechaRevision,
		@Observaciones = Observaciones,
		@Comentarios = Comentarios,
		@Estatus = Estatus
	FROM
		Revisiones
	WHERE
		ID = @ID
		
	INSERT INTO
		Revisiones
		(
			Mov,
			MovID,
			Origen,
			OrigenID,
			Semana,
			Sucursal,
			FechaEmision,
			FechaRevision,
			Observaciones,
			Comentarios,
			Estatus
		)
	VALUES
		(
			@Mov,
			NULL,
			@MovA,
			@MovID,
			@Semana + 1,
			@Sucursal,
			GETDATE(),
			NULL,
			NULL,
			NULL,
			'BORRADOR'
		)
	
	SELECT @IDNuevo = SCOPE_IDENTITY()
    
END
GO