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
			WHERE  name = 'web_spU_ActualizarProveedor' AND
			TYPE = 'P')
	DROP PROCEDURE web_spU_ActualizarProveedor
GO
-- =============================================
-- Author:		Orlando Esparza
-- Create date: Martes 18 de Noviembre de 2014
-- Description:	Actualizar un registro de Proveedor por su ID
-- =============================================
CREATE PROCEDURE web_spU_ActualizarProveedor
	-- Add the parameters for the stored procedure here
	@ID					CHAR(7),
	@Nombre				VARCHAR(50),
	@RFC				VARCHAR(15),
	@ContactoNombre		VARCHAR(50),
	@ContactoAPaterno	VARCHAR(50),
	@ContactoAMaterno	VARCHAR(50),
	@Correo				VARCHAR(100),
	@Calle				VARCHAR(100),
	@EntreCalles		VARCHAR(100),
	@NoExterior			VARCHAR(10),
	@NoInterior			VARCHAR(10),
	@CodigoPostal		INT,
	@Colonia			VARCHAR(50),
	@Estado				CHAR(2),
	@Municipio			CHAR(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    UPDATE
		Proveedores
	SET
		Nombre = @Nombre,
		RFC = @RFC,
		ContactoNombre = @ContactoNombre,
		ContactoAPaterno = @ContactoAPaterno,
		ContactoAMaterno = @ContactoAMaterno,
		Correo = @Correo,
		Calle = @Calle,
		EntreCalles = @EntreCalles,
		NoExterior = @NoExterior,
		NoInterior = @NoInterior,
		CodigoPostal = @CodigoPostal,
		Colonia = @Colonia,
		Estado = @Estado,
		Municipio = @Municipio
	WHERE
		ID = @ID
END
GO