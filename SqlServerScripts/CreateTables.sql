CREATE TABLE GruposMenu(
	ID			CHAR(3) NOT NULL PRIMARY KEY,
	Descripcion VARCHAR(50) NULL
)

CREATE TABLE Menus(
	ID					CHAR(4) NOT NULL PRIMARY KEY,
	Descripcion			VARCHAR(50) NULL,
	GrupoMenu			CHAR(3) NOT NULL FOREIGN KEY REFERENCES GruposMenu(ID),
	ImagenNormal		VARCHAR(100) NULL,
	ImagenSobre			VARCHAR(100) NULL,
	ImagenSeleccionar	VARCHAR(100) NULL,
	ImagenDeshabilitar	VARCHAR(100) NULL
)

CREATE TABLE Estados(
	ID			CHAR(2) NOT NULL PRIMARY KEY,
	Abreviatura VARCHAR(6) NULL,
	Descripcion VARCHAR(50) NULL
)

CREATE TABLE Municipios(
	ID			CHAR(4)			NOT NULL PRIMARY KEY,
	Descripcion VARCHAR(100)	NULL,
	Estado		CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID)
)

CREATE TABLE Colonias(
	ID			CHAR(12)			NOT NULL PRIMARY KEY,
	Descripcion VARCHAR(100)	NULL,
	Estado		CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio	CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID)
)

CREATE TABLE CodigosPostales(
	ID			CHAR(7)			NOT NULL PRIMARY KEY,
	Estado		CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio	CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID),
	Colonia		CHAR(12)			NOT NULL FOREIGN KEY REFERENCES Colonias(ID),
	Numero		INT				NULL
)

CREATE TABLE Categorias(
	ID			CHAR(5)		NOT NULL PRIMARY KEY,
	Orden		TINYINT		NOT NULL,
	Descripcion VARCHAR(50) NULL
)

CREATE TABLE SubCategorias(
	ID			CHAR(6)		NOT NULL PRIMARY KEY,
	Orden		TINYINT		NOT NULL,
	Descripcion VARCHAR(50) NULL,
	Categoria	CHAR(5)		NOT NULL FOREIGN KEY REFERENCES Categorias(ID)
)

CREATE TABLE Conceptos(
	ID				CHAR(7)			NOT NULL PRIMARY KEY,
	Modulo			VARCHAR(20)		NOT NULL,
	Orden			SMALLINT		NOT NULL,
	Descripcion		VARCHAR(50)		NULL,
	Categoria		CHAR(5)			NULL FOREIGN KEY REFERENCES Categorias(ID),
	SubCategoria	CHAR(6)			NULL FOREIGN KEY REFERENCES SubCategorias(ID),
	TipoMovimiento	VARCHAR(50)		NULL,
	FechaAlta		SMALLDATETIME	NOT NULL,
	Estatus			VARCHAR(50)		NOT NULL
)

CREATE TABLE Usuarios(
	ID					VARCHAR(50) NOT NULL PRIMARY KEY,
	Correo				VARCHAR(50) NOT NULL,
	Nombre				VARCHAR(50) NULL,
	APaterno			VARCHAR(50) NULL,
	AMaterno			VARCHAR(50) NULL,
	Contrasena			VARCHAR(200) NULL,
	Estatus				VARCHAR(50) NOT NULL,
	Bloqueado			BIT NOT NULL,
	EnLinea				BIT NOT NULL,
	FechaAlta			SMALLDATETIME NOT NULL,
	FechaBloqueo		SMALLDATETIME NULL,
	UltimoAcceso		SMALLDATETIME NULL,
	CambioContrasena	SMALLDATETIME NULL
)

CREATE TABLE Proveedores(
	ID					CHAR(7)			NOT NULL PRIMARY KEY,
	Nombre				VARCHAR(50)		NOT NULL,
	RFC					VARCHAR(15)		NULL,
	ContactoNombre		VARCHAR(50)		NULL,
	ContactoAPaterno	VARCHAR(50)		NULL,
	ContactoAMaterno	VARCHAR(50)		NULL,
	Correo				VARCHAR(100)	NULL,
	Calle				VARCHAR(100)	NULL,
	EntreCalles			VARCHAR(100)	NULL,
	NoExterior			VARCHAR(10)		NULL,
	NoInterior			VARCHAR(10)		NULL,
	CodigoPostal		INT				NULL,
	Colonia				VARCHAR(50)		NULL,
	Estado				CHAR(2)			NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio			CHAR(4)			NULL FOREIGN KEY REFERENCES Municipios(ID)
)

CREATE TABLE Sucursales(
	ID						CHAR(10)		NOT NULL PRIMARY KEY,
	CR						SMALLINT		NOT NULL,
	Nombre					VARCHAR(100)	NOT NULL,
	GerenteBBVANombre		VARCHAR(50)		NULL,
	GerenteBBVAAPaterno		VARCHAR(50)		NULL,
	GerenteBBVAAMaterno		VARCHAR(50)		NULL,
	SupervisorNombre		VARCHAR(50)		NULL,
	SupervisorAPaterno		VARCHAR(50)		NULL,
	SupervisorAMaterno		VARCHAR(50)		NULL,
	ProveedorEnergia		VARCHAR(100)	NULL,
	Superficie				INT				NULL,
	CoordinadorNombre		VARCHAR(50)		NULL,
	CoordinadorAPaterno		VARCHAR(50)		NULL,
	CoordinadorAMaterno		VARCHAR(50)		NULL,
	Calle					VARCHAR(100)	NULL,
	EntreCalles				VARCHAR(100)	NULL,
	NoExterior				VARCHAR(10)		NULL,
	NoInterior				VARCHAR(10)		NULL,
	CodigoPostal			INT				NULL,
	Colonia					VARCHAR(50)		NULL,
	Estado					CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio				CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID),
	Contratista				VARCHAR(100)	NULL,
	TerminoContrato			DATE			NULL,
	InicioObra				DATE			NULL,
	FinObra					DATE			NULL,
	SemanasObra				SMALLINT		NULL,
	FechaAlta				SMALLDATETIME	NULL,
	Estatus					VARCHAR(50)		NULL
)

CREATE TABLE Revisiones(
	ID				INT				IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Mov				VARCHAR(50)		NOT NULL,
	MovID			VARCHAR(10)		NULL,
	Origen			VARCHAR(50)		NULL,
	OrigenID		VARCHAR(10)		NULL,
	Semana			TINYINT			NULL,
	Sucursal		CHAR(10)		NOT NULL FOREIGN KEY REFERENCES Sucursales(ID),
	FechaEmision	SMALLDATETIME	NULL,
	FechaRevision	DATE			NULL,
	Observaciones	VARCHAR(200)	NULL,
	Comentarios		VARCHAR(5000)	NULL,
	Estatus			VARCHAR(20)		NOT NULL
)

CREATE TABLE RevisionesD(
	Revision	INT				NOT NULL FOREIGN KEY REFERENCES Revisiones(ID),
	Renglon		SMALLINT		NOT NULL,
	Concepto	char(7)			NOT NULL FOREIGN KEY REFERENCES Conceptos(ID),
	Proveedor	char(7)			NULL FOREIGN KEY REFERENCES Proveedores(ID),
	Programado	decimal(5, 2)	NULL,
	Real		decimal(5, 2)	NULL
)

CREATE TABLE CuentasContables(
	Cuenta		VARCHAR(20)		NOT NULL PRIMARY KEY,
	Descripcion	VARCHAR(100)	NULL,
	Rama		VARCHAR(20)		NULL,
	Tipo		VARCHAR(15)		NULL,
	Estatus		VARCHAR(15)		NULL
)

CREATE TABLE Profesiones(
	ID			CHAR(7)			NOT NULL PRIMARY KEY,
	Descripcion	VARCHAR(100)	NULL
)

CREATE TABLE Finalidades(
	ID			CHAR(6)			NOT NULL PRIMARY KEY,
	Descripcion	VARCHAR(100)	NULL
)

CREATE TABLE Articulos(
	ID			CHAR(2)			NOT NULL PRIMARY KEY,
	Corta		VARCHAR(50)		NULL,
	Descripcion	VARCHAR(100)	NULL
)

CREATE TABLE Clientes(
	ID					CHAR(8)			NOT NULL PRIMARY KEY,
	Nombre				VARCHAR(50)		NULL,
	APaterno			VARCHAR(50)		NULL,
	AMaterno			VARCHAR(50)		NULL,
	RFC					VARCHAR(15)		NULL,
	CURP				VARCHAR(18)		NULL,
	FechaNacimiento		DATE			NULL,
	Edad				TINYINT			NULL,
	Sexo				VARCHAR(9)		NULL,
	EstadoCivil			VARCHAR(10)		NULL,
	Profesion			CHAR(7)			NOT NULL FOREIGN KEY REFERENCES Profesiones(ID),
	Correo				VARCHAR(100)	NULL,
	Telefono			VARCHAR(15)		NULL,
	TelefonoMovil		VARCHAR(15)		NULL,
	Calle				VARCHAR(100)	NULL,
	NoExterior			VARCHAR(10)		NULL,
	NoInterior			VARCHAR(10)		NULL,
	Colonia				VARCHAR(50)		NULL,
	CodigoPostal		INT				NULL,
	EntreCalles			VARCHAR(100)	NULL,
	Estado				CHAR(2)			NOT NULL FOREIGN KEY REFERENCES Estados(ID),
	Municipio			CHAR(4)			NOT NULL FOREIGN KEY REFERENCES Municipios(ID),
	Empresa				VARCHAR(50)		NULL,
	EmpresaCalle		VARCHAR(100)	NULL,
	EmpresaNoExterior	VARCHAR(10)		NULL,
	EmpresaNoInterior	VARCHAR(10)		NULL,
	EmpresaColonia		VARCHAR(50)		NULL,
	EmpresaCodigoPostal INT				NULL,
	EmpresaEntreCalles	VARCHAR(100)	NULL,
	EmpresaTelefono		VARCHAR(15)		NULL,
	Puesto				VARCHAR(50)		NULL,
	FechaAlta			SMALLDATETIME	NULL,
	Estatus				VARCHAR(20)		NULL,
	Usuario				VARCHAR(50)		NOT NULL FOREIGN KEY REFERENCES Usuarios(ID)
)

CREATE TABLE SolicitudesPrestamos(
	ID							CHAR(8)			NOT NULL PRIMARY KEY,--P0000001
	Cliente						CHAR(8)			NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	Nacionalidad				VARCHAR(20)		NULL,
	RegistroMatrimonial			VARCHAR(50)		NULL,
	NumeroDependientes			TINYINT			NULL,
	Edades						VARCHAR(10)		NULL,
	TipoCasa					VARCHAR(50)		NULL,
	AniosDomicilio				TINYINT			NULL,
	CalleAnterior				VARCHAR(100)	NULL,
	NoExteriorAnterior			VARCHAR(10)		NULL,
	NoInteriorAnterior			VARCHAR(10)		NULL,
	ColoniaAnterior				VARCHAR(50)		NULL,
	CodigoPostalAnterior		INT				NULL,
	EntreCallesAnterior			VARCHAR(100)	NULL,
	------------ Ocupación Actual del solicitante ------------
	Antiguedad					TINYINT			NULL,
	Ingresos					SMALLINT		NULL,
	OtrosIngresos				SMALLINT		NULL,
	Concepto					VARCHAR(100)	NULL,
	JefeNombre					VARCHAR(50)		NULL,
	JefeAPAterno				VARCHAR(50)		NULL,
	JefeAMaterno				VARCHAR(50)		NULL,
	EmpresaAnterior				VARCHAR(50)		NULL,
	----------- Datos y Ocupación Actual del conyuge -----------
	ConyugeNombre				VARCHAR(50)		NULL,
	ConyugeAPaterno				VARCHAR(50)		NULL,
	ConyugeAMaterno				VARCHAR(50)		NULL,
	ConyugeFechaNacimiento		DATE			NULL,
	ConyugeRFC					VARCHAR(15)		NULL,
	ConyugeCalle				VARCHAR(100)	NULL,
	ConyugeNoExterior			VARCHAR(10)		NULL,
	ConyugeNoInterior			VARCHAR(10)		NULL,
	ConyugeColonia				VARCHAR(50)		NULL,
	ConyugeCodigoPostal			INT				NULL,
	ConyugeEntreCalles			VARCHAR(100)	NULL,
	ConyugeIngresos				SMALLINT		NULL,
	ConyugeAntiguedad			TINYINT			NULL,
	ConyugeTelefono				VARCHAR(15)		NULL,
	ConyugeTelefonoMovil		VARCHAR(15)		NULL,
	ConyugeEmpresa				VARCHAR(50)		NULL,
	ConyugePuesto				VARCHAR(50)		NULL,
	ConyugeEmpresaCalle			VARCHAR(100)	NULL,
	ConyugeEmpresaNoExterior	VARCHAR(10)		NULL,
	ConyugeEmpresaNoInterior	VARCHAR(10)		NULL,
	ConyugeEmpresaColonia		VARCHAR(50)		NULL,
	ConyugeEmpresaCodigoPostal	INT				NULL,
	ConyugeEmpresaEntreCalles	VARCHAR(100)	NULL,
	ConyugeEmpresaJefeNombre	VARCHAR(50)		NULL,
	ConyugeEmpresaJefeAPAterno	VARCHAR(50)		NULL,
	ConyugeEmpresaJefeAMAterno	VARCHAR(50)		NULL,
	----------- Información del Aval -----------
	AvalNombre					VARCHAR(50)		NULL,
	AvalAPaterno				VARCHAR(50)		NULL,
	AvalAMaterno				VARCHAR(50)		NULL,
	AvalSocio					BIT				NULL,
	AvalEstadoCivil				VARCHAR(10)		NULL,
	AvalRegistroMatrimonial		VARCHAR(50)		NULL,
	AvalCalle					VARCHAR(100)	NULL,
	AvalNoExterior				VARCHAR(10)		NULL,
	AvalNoInterior				VARCHAR(10)		NULL,
	AvalColonia					VARCHAR(50)		NULL,
	AvalCodigoPostal			INT				NULL,
	AvalEntreCalles				VARCHAR(100)	NULL,
	AvalTelefono				VARCHAR(15)		NULL,
	AvalTelefonoMovil			VARCHAR(15)		NULL,
	AvalAntiguedad				TINYINT			NULL,
	AvalCasaPropia				BIT				NULL,
	AvalTipoCasa				VARCHAR(20)		NULL,
	AvalCalleAnterior			VARCHAR(100)	NULL,
	AvalNoExteriorAnterior		VARCHAR(10)		NULL,
	AvalNoInteriorAnterior		VARCHAR(10)		NULL,
	AvalColoniaAnterior			VARCHAR(50)		NULL,
	AvalCodigoPostalAnterior	INT				NULL,
	AvalEntreCallesAnterior		VARCHAR(100)	NULL,
	----------- Ocupación del Aval -----------
	AvalEmpresa					VARCHAR(50)		NULL,
	AvalEmpresaJefeNombre		VARCHAR(50)		NULL,
	AvalEmpresaJefeAPAterno		VARCHAR(50)		NULL,
	AvalEmpresaJefeAMAterno		VARCHAR(50)		NULL,
	AvalEmpresaPuesto			VARCHAR(50)		NULL,
	AvalEmpresaAntiguedad		TINYINT			NULL,
	AvalEmpresaIngresos			INT				NULL,
	AvalEmpresaOtrosIngresos	INT				NULL,
	AvalEmpresaConcepto			VARCHAR(50)		NULL,
	AvalEmpresaTelefono			VARCHAR(15)		NULL,
	AvalEmpresaPropietario		BIT				NULL,
	AvalEmpresaTipo				VARCHAR(20)		NULL,
	AvalEmpresaAnterior			VARCHAR(50)		NULL,
	------------- Datos de la operación -------------
	Cantidad					INT				NULL,
	Plazo						SMALLINT		NULL,
	FormaPago					VARCHAR(20)		NULL,
	Tipo						VARCHAR(20)		NULL,
	TablaAmortizacion			VARCHAR(200)	NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	Estatus						VARCHAR(20)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL
)

CREATE TABLE ReferenciasBancarias(
	ID					CHAR(7)		NOT NULL PRIMARY KEY,
	SolicitudPrestamo	CHAR(8)		NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	Nombre				VARCHAR(50)	NULL,
	TipoCuenta			VARCHAR(50)	NULL,
	NoCuenta			VARCHAR(50)	NULL
)

CREATE TABLE BienesInmuebles(
	ID					CHAR(7)		NOT NULL PRIMARY KEY,
	SolicitudPrestamo	CHAR(8)		NOT NULL FOREIGN KEY REFERENCES SolicitudesPrestamos(ID),
	TipoPersona			VARCHAR(20)	NOT NULL,
	Ubicacion			VARCHAR(50)	NULL,
	Inscripcion			VARCHAR(50)	NULL,
	Tipo				VARCHAR(50) NULL,
	Valor				INT			NULL
)

CREATE TABLE CertificadosInversiones(
	ID							CHAR(8)			NOT NULL PRIMARY KEY,--I0000001
	Cliente						CHAR(8)			NOT NULL FOREIGN KEY REFERENCES Clientes(ID),
	TipoInversion				VARCHAR(20)		NULL,
	UnidadCalculo				TINYINT			NULL,
	TasaInteres					DECIMAL(3,2)	NULL,
	FechaVencimiento			DATE			NULL,
	ValorInversion				DECIMAL(9,2)	NULL,
	InstruccionesCapital		VARCHAR(50)		NULL,
	InstruccionesInteres		VARCHAR(50)		NULL,
	Usuario						VARCHAR(50)		NOT NULL,
	FechaAlta					SMALLDATETIME	NOT NULL,
	Estatus						VARCHAR(20)		NOT NULL,
)

CREATE TABLE Beneficiarios(
	ID						CHAR(7)			NOT NULL PRIMARY KEY,
	Cliente					CHAR(8)			NULL FOREIGN KEY REFERENCES Clientes(ID),
	CertificadoInversion	CHAR(8)			NULL FOREIGN KEY REFERENCES CertificadosInversiones(ID),
	Nombre					VARCHAR(50)		NULL,
	APaterno				VARCHAR(50)		NULL,
	AMaterno				VARCHAR(50)		NULL,
	Telefono				VARCHAR(15)		NULL,
	TelefonoMovil			VARCHAR(15)		NULL,
	Parentesco				VARCHAR(20)		NULL
)

CREATE TABLE Preciarios(
 ID    CHAR(7)   NOT NULL PRIMARY KEY,
 Descripcion  VARCHAR(50)  NOT NULL,
 Sucursal  CHAR(10)  NOT NULL FOREIGN KEY REFERENCES Sucursales(ID),
 Archivo   VARCHAR(200) NOT NULL,
 Estatus   VARCHAR(20)  NOT NULL,
 FechaAlta  SMALLDATETIME NOT NULL
)

CREATE TABLE PreciarioCategorias(
 ID CHAR(10) NOT NULL PRIMARY KEY,
 CLAVE   CHAR(7) NULL,
 Preciario CHAR(7)   NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
 Descripcion VARCHAR(500)  NOT NULL,
 Estatus  VARCHAR(20)  NOT NULL,
 FechaAlta SMALLDATETIME NOT NULL
)

CREATE TABLE PreciarioSubCategorias(
 ID CHAR(10) NOT NULL PRIMARY KEY,
 CLAVE   CHAR(7) NULL,
 Preciario CHAR(7)   NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
 Descripcion VARCHAR(500)  NOT NULL,
 Categoria CHAR(10)   NOT NULL FOREIGN KEY REFERENCES PreciarioCategorias(ID),
 Estatus  VARCHAR(20)  NOT NULL,
 FechaAlta SMALLDATETIME NOT NULL
)

CREATE TABLE PreciarioSubSubCategorias(
 ID CHAR(10) NOT NULL PRIMARY KEY,
 CLAVE   CHAR(7) NULL,
 Preciario  CHAR(7)   NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
 Descripcion  VARCHAR(500)  NOT NULL,
 Categoria  CHAR(10)   NOT NULL FOREIGN KEY REFERENCES PreciarioCategorias(ID),
 SubCategoria CHAR(10)   NOT NULL FOREIGN KEY REFERENCES PreciarioSubCategorias(ID),
 Estatus   VARCHAR(20)  NOT NULL,
 FechaAlta  SMALLDATETIME NOT NULL
)

CREATE TABLE PreciarioConceptos(
 ID CHAR(10) NOT NULL PRIMARY KEY,
 CLAVE   CHAR(7) NULL,
 Preciario  CHAR(7)   NOT NULL FOREIGN KEY REFERENCES Preciarios(ID),
 Descripcion  VARCHAR(2000)  NOT NULL,
 Categoria  CHAR(10)   NOT NULL FOREIGN KEY REFERENCES PreciarioCategorias(ID),
 SubCategoria CHAR(10)   NOT NULL FOREIGN KEY REFERENCES PreciarioSubCategorias(ID),
 SubSubCategoria CHAR(10)   NOT NULL FOREIGN KEY REFERENCES PreciarioSubSubCategorias(ID),
 Unidad   VARCHAR(30)  NULL,
 Costo    DECIMAL(20,2),
 Cantidad DECIMAL(10,2),
 Importe    DECIMAL(20,2),
 Estatus   VARCHAR(20)  NOT NULL,
 FechaAlta  SMALLDATETIME NOT NULL
)

--DROP TABLE Menus
--DROP TABLE GruposMenu
--DROP TABLE Beneficiarios
--DROP TABLE CertificadosInversiones
--DROP TABLE BienesInmuebles
--DROP TABLE ReferenciasBancarias
--DROP TABLE SolicitudesPrestamos
--DROP TABLE Articulos
--DROP TABLE Finalidades
--DROP TABLE CuentasContables
--DROP TABLE Socios
--DROP TABLE Profesiones
--DROP TABLE RevisionesD
--DROP TABLE Revisiones
--DROP TABLE Sucursales
--DROP TABLE Proveedores
--DROP TABLE Conceptos
--DROP TABLE SubCategorias
--DROP TABLE Categorias
--DROP TABLE CodigosPostales
--DROP TABLE Colonias
--DROP TABLE Municipios
--DROP TABLE Estados
--DROP TABLE Usuarios
--DROP TABLE Preciarios
--DROP TABLE PreciarioCategorias
--DROP TABLE PreciarioSubCategorias
--DROP TABLE PreciarioSubSubCategorias
--DROP TABLE PreciarioConceptos

-- CORREGIR
--ALTER TABLE Sucursales ADD CR SMALLINT NOT NULL