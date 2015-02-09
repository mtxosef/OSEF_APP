using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de Sucursales
    /// </summary>
    public class SucursalDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Sucursales
        /// </summary>
        /// <param name="iSucursal"></param>
        public static string Insertar(Sucursal iSucursal)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarSucursal";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = iSucursal.ID;
                sqlpID.Size = 10;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpCR = new SqlParameter();
                sqlpCR.ParameterName = "@CR";
                sqlpCR.SqlDbType = SqlDbType.SmallInt;
                sqlpCR.Value = iSucursal.CR;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iSucursal.Nombre;

                SqlParameter sqlpGerenteBBVANombre = new SqlParameter();
                sqlpGerenteBBVANombre.ParameterName = "@GerenteBBVANombre";
                sqlpGerenteBBVANombre.SqlDbType = SqlDbType.VarChar;
                sqlpGerenteBBVANombre.Value = iSucursal.GerenteBBVANombre;

                SqlParameter sqlpGerenteBBVAAPaterno = new SqlParameter();
                sqlpGerenteBBVAAPaterno.ParameterName = "@GerenteBBVAAPaterno";
                sqlpGerenteBBVAAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpGerenteBBVAAPaterno.Value = iSucursal.GerenteBBVAAPaterno;

                SqlParameter sqlpGerenteBBVAAMaterno = new SqlParameter();
                sqlpGerenteBBVAAMaterno.ParameterName = "@GerenteBBVAAMaterno";
                sqlpGerenteBBVAAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpGerenteBBVAAMaterno.Value = iSucursal.GerenteBBVAAMaterno;

                SqlParameter sqlpSupervisorNombre = new SqlParameter();
                sqlpSupervisorNombre.ParameterName = "@SupervisorNombre";
                sqlpSupervisorNombre.SqlDbType = SqlDbType.VarChar;
                sqlpSupervisorNombre.Value = iSucursal.SupervisorNombre;

                SqlParameter sqlpSupervisorAPaterno = new SqlParameter();
                sqlpSupervisorAPaterno.ParameterName = "@SupervisorAPaterno";
                sqlpSupervisorAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpSupervisorAPaterno.Value = iSucursal.SupervisorAPaterno;

                SqlParameter sqlpSupervisorAMaterno = new SqlParameter();
                sqlpSupervisorAMaterno.ParameterName = "@SupervisorAMaterno";
                sqlpSupervisorAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpSupervisorAMaterno.Value = iSucursal.SupervisorAMaterno;

                SqlParameter sqlpProveedorEnergia = new SqlParameter();
                sqlpProveedorEnergia.ParameterName = "@ProveedorEnergia";
                sqlpProveedorEnergia.SqlDbType = SqlDbType.VarChar;
                sqlpProveedorEnergia.Value = iSucursal.ProveedorEnergia;

                SqlParameter sqlpSuperficie = new SqlParameter();
                sqlpSuperficie.ParameterName = "@Superficie";
                sqlpSuperficie.SqlDbType = SqlDbType.Int;
                sqlpSuperficie.Value = iSucursal.Superficie;

                SqlParameter sqlpCoordinadorNombre = new SqlParameter();
                sqlpCoordinadorNombre.ParameterName = "@CoordinadorNombre";
                sqlpCoordinadorNombre.SqlDbType = SqlDbType.VarChar;
                sqlpCoordinadorNombre.Value = iSucursal.CoordinadorNombre;

                SqlParameter sqlpCoordinadorAPaterno = new SqlParameter();
                sqlpCoordinadorAPaterno.ParameterName = "@CoordinadorAPaterno";
                sqlpCoordinadorAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpCoordinadorAPaterno.Value = iSucursal.CoordinadorAPaterno;

                SqlParameter sqlpCoordinadorAMaterno = new SqlParameter();
                sqlpCoordinadorAMaterno.ParameterName = "@CoordinadorAMaterno";
                sqlpCoordinadorAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpCoordinadorAMaterno.Value = iSucursal.CoordinadorAMaterno;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = iSucursal.Calle;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = iSucursal.EntreCalles;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = iSucursal.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = iSucursal.NoInterior;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = iSucursal.CodigoPostal;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = iSucursal.Colonia;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Size = 2;
                sqlpEstado.Value = iSucursal.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = iSucursal.Municipio;

                SqlParameter sqlpContratista = new SqlParameter();
                sqlpContratista.ParameterName = "@Contratista";
                sqlpContratista.SqlDbType = SqlDbType.VarChar;
                sqlpContratista.Value = iSucursal.Contratista;

                SqlParameter sqlpTerminoContrato = new SqlParameter();
                sqlpTerminoContrato.ParameterName = "@TerminoContrato";
                sqlpTerminoContrato.SqlDbType = SqlDbType.Date;
                sqlpTerminoContrato.Value = iSucursal.TerminoContrato;

                SqlParameter sqlpInicioObra = new SqlParameter();
                sqlpInicioObra.ParameterName = "@InicioObra";
                sqlpInicioObra.SqlDbType = SqlDbType.Date;
                sqlpInicioObra.Value = iSucursal.InicioObra;

                SqlParameter sqlpFinObra = new SqlParameter();
                sqlpFinObra.ParameterName = "@FinObra";
                sqlpFinObra.SqlDbType = SqlDbType.Date;
                sqlpFinObra.Value = iSucursal.FinObra;

                SqlParameter sqlpSemanasObra = new SqlParameter();
                sqlpSemanasObra.ParameterName = "@SemanasObra";
                sqlpSemanasObra.SqlDbType = SqlDbType.SmallInt;
                sqlpSemanasObra.Value = iSucursal.SemanasObra;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iSucursal.FechaAlta;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iSucursal.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpCR);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpGerenteBBVANombre);
                sqlcComando.Parameters.Add(sqlpGerenteBBVAAPaterno);
                sqlcComando.Parameters.Add(sqlpGerenteBBVAAMaterno);
                sqlcComando.Parameters.Add(sqlpSupervisorNombre);
                sqlcComando.Parameters.Add(sqlpSupervisorAPaterno);
                sqlcComando.Parameters.Add(sqlpSupervisorAMaterno);
                sqlcComando.Parameters.Add(sqlpProveedorEnergia);
                sqlcComando.Parameters.Add(sqlpSuperficie);
                sqlcComando.Parameters.Add(sqlpCoordinadorNombre);
                sqlcComando.Parameters.Add(sqlpCoordinadorAPaterno);
                sqlcComando.Parameters.Add(sqlpCoordinadorAMaterno);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);
                sqlcComando.Parameters.Add(sqlpContratista);
                sqlcComando.Parameters.Add(sqlpTerminoContrato);
                sqlcComando.Parameters.Add(sqlpInicioObra);
                sqlcComando.Parameters.Add(sqlpFinObra);
                sqlcComando.Parameters.Add(sqlpSemanasObra);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpEstatus);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return sqlcComando.Parameters["@ID"].Value.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Sucursal " + iSucursal.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Sucursales
        /// </summary>
        /// <param name="uSucursal"></param>
        public static int Actualizar(Sucursal uSucursal)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarSucursal";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 10;
                sqlpID.Value = uSucursal.ID;

                SqlParameter sqlpCR = new SqlParameter();
                sqlpCR.ParameterName = "@CR";
                sqlpCR.SqlDbType = SqlDbType.SmallInt;
                sqlpCR.Value = uSucursal.CR;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uSucursal.Nombre;

                SqlParameter sqlpGerenteBBVANombre = new SqlParameter();
                sqlpGerenteBBVANombre.ParameterName = "@GerenteBBVANombre";
                sqlpGerenteBBVANombre.SqlDbType = SqlDbType.VarChar;
                sqlpGerenteBBVANombre.Value = uSucursal.GerenteBBVANombre;

                SqlParameter sqlpGerenteBBVAAPaterno = new SqlParameter();
                sqlpGerenteBBVAAPaterno.ParameterName = "@GerenteBBVAAPaterno";
                sqlpGerenteBBVAAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpGerenteBBVAAPaterno.Value = uSucursal.GerenteBBVAAPaterno;

                SqlParameter sqlpGerenteBBVAAMaterno = new SqlParameter();
                sqlpGerenteBBVAAMaterno.ParameterName = "@GerenteBBVAAMaterno";
                sqlpGerenteBBVAAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpGerenteBBVAAMaterno.Value = uSucursal.GerenteBBVAAMaterno;

                SqlParameter sqlpSupervisorNombre = new SqlParameter();
                sqlpSupervisorNombre.ParameterName = "@SupervisorNombre";
                sqlpSupervisorNombre.SqlDbType = SqlDbType.VarChar;
                sqlpSupervisorNombre.Value = uSucursal.SupervisorNombre;

                SqlParameter sqlpSupervisorAPaterno = new SqlParameter();
                sqlpSupervisorAPaterno.ParameterName = "@SupervisorAPaterno";
                sqlpSupervisorAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpSupervisorAPaterno.Value = uSucursal.SupervisorAPaterno;

                SqlParameter sqlpSupervisorAMaterno = new SqlParameter();
                sqlpSupervisorAMaterno.ParameterName = "@SupervisorAMaterno";
                sqlpSupervisorAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpSupervisorAMaterno.Value = uSucursal.SupervisorAMaterno;

                SqlParameter sqlpProveedorEnergia = new SqlParameter();
                sqlpProveedorEnergia.ParameterName = "@ProveedorEnergia";
                sqlpProveedorEnergia.SqlDbType = SqlDbType.VarChar;
                sqlpProveedorEnergia.Value = uSucursal.ProveedorEnergia;

                SqlParameter sqlpSuperficie = new SqlParameter();
                sqlpSuperficie.ParameterName = "@Superficie";
                sqlpSuperficie.SqlDbType = SqlDbType.Int;
                sqlpSuperficie.Value = uSucursal.Superficie;

                SqlParameter sqlpCoordinadorNombre = new SqlParameter();
                sqlpCoordinadorNombre.ParameterName = "@CoordinadorNombre";
                sqlpCoordinadorNombre.SqlDbType = SqlDbType.VarChar;
                sqlpCoordinadorNombre.Value = uSucursal.CoordinadorNombre;

                SqlParameter sqlpCoordinadorAPaterno = new SqlParameter();
                sqlpCoordinadorAPaterno.ParameterName = "@CoordinadorAPaterno";
                sqlpCoordinadorAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpCoordinadorAPaterno.Value = uSucursal.CoordinadorAPaterno;

                SqlParameter sqlpCoordinadorAMaterno = new SqlParameter();
                sqlpCoordinadorAMaterno.ParameterName = "@CoordinadorAMaterno";
                sqlpCoordinadorAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpCoordinadorAMaterno.Value = uSucursal.CoordinadorAMaterno;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = uSucursal.Calle;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = uSucursal.EntreCalles;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = uSucursal.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = uSucursal.NoInterior;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = uSucursal.CodigoPostal;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = uSucursal.Colonia;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Value = uSucursal.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Value = uSucursal.Municipio;

                SqlParameter sqlpContratista = new SqlParameter();
                sqlpContratista.ParameterName = "@Contratista";
                sqlpContratista.SqlDbType = SqlDbType.VarChar;
                sqlpContratista.Value = uSucursal.Contratista;

                SqlParameter sqlpTerminoContrato = new SqlParameter();
                sqlpTerminoContrato.ParameterName = "@TerminoContrato";
                sqlpTerminoContrato.SqlDbType = SqlDbType.Date;
                sqlpTerminoContrato.Value = uSucursal.TerminoContrato;

                SqlParameter sqlpInicioObra = new SqlParameter();
                sqlpInicioObra.ParameterName = "@InicioObra";
                sqlpInicioObra.SqlDbType = SqlDbType.Date;
                sqlpInicioObra.Value = uSucursal.InicioObra;

                SqlParameter sqlpFinObra = new SqlParameter();
                sqlpFinObra.ParameterName = "@FinObra";
                sqlpFinObra.SqlDbType = SqlDbType.Date;
                sqlpFinObra.Value = uSucursal.FinObra;

                SqlParameter sqlpSemanasObra = new SqlParameter();
                sqlpSemanasObra.ParameterName = "@SemanasObra";
                sqlpSemanasObra.SqlDbType = SqlDbType.SmallInt;
                sqlpSemanasObra.Value = uSucursal.SemanasObra;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = uSucursal.FechaAlta;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uSucursal.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpCR);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpGerenteBBVANombre);
                sqlcComando.Parameters.Add(sqlpGerenteBBVAAPaterno);
                sqlcComando.Parameters.Add(sqlpGerenteBBVAAMaterno);
                sqlcComando.Parameters.Add(sqlpSupervisorNombre);
                sqlcComando.Parameters.Add(sqlpSupervisorAPaterno);
                sqlcComando.Parameters.Add(sqlpSupervisorAMaterno);
                sqlcComando.Parameters.Add(sqlpProveedorEnergia);
                sqlcComando.Parameters.Add(sqlpSuperficie);
                sqlcComando.Parameters.Add(sqlpCoordinadorNombre);
                sqlcComando.Parameters.Add(sqlpCoordinadorAPaterno);
                sqlcComando.Parameters.Add(sqlpCoordinadorAMaterno);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);
                sqlcComando.Parameters.Add(sqlpContratista);
                sqlcComando.Parameters.Add(sqlpTerminoContrato);
                sqlcComando.Parameters.Add(sqlpInicioObra);
                sqlcComando.Parameters.Add(sqlpFinObra);
                sqlcComando.Parameters.Add(sqlpSemanasObra);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpEstatus);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción UPDATE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Actualizar(Sucursal " + uSucursal.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Sucursal por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarSucursal";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = dID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción DELETE que no regresa filas
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Borrar(Sucursal " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Sucursales
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursales()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerSucursales";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Sucursal> result = LibraryGenerics<Sucursal>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Sucursal> ObtenerSucursales()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Sucursales  por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Sucursal ObtenerSucursalPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerSucursalPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Sucursal result = LibraryGenerics<Sucursal>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Sucursal ObtenerSucursalPorID(string " + strID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Revisar si existen registros de Sucursales en las revisiones por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerSucursalesEnRevisionesPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerSucursalesEnRevisionesPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                bool result = Convert.ToBoolean(sqlcComando.ExecuteScalar());

                //6. Asignar la lista de objetos

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static bool ObtenerSucursalesEnRevisionesPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
