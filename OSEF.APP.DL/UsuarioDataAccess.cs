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
    /// Clase que administra los datos de la tabla de Usuarios
    /// </summary>
    public class UsuarioDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Usuarios
        /// </summary>
        /// <param name="iUsuario"></param>
        public static int Insertar(Usuario iUsuario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarUsuario";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = iUsuario.ID;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = iUsuario.Correo;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iUsuario.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = iUsuario.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = iUsuario.AMaterno;

                SqlParameter sqlpContrasena = new SqlParameter();
                sqlpContrasena.ParameterName = "@Contrasena";
                sqlpContrasena.SqlDbType = SqlDbType.VarChar;
                sqlpContrasena.Value = iUsuario.Contrasena;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iUsuario.Estatus;

                SqlParameter sqlpBloqueado = new SqlParameter();
                sqlpBloqueado.ParameterName = "@Bloqueado";
                sqlpBloqueado.SqlDbType = SqlDbType.Bit;
                sqlpBloqueado.Value = iUsuario.Bloqueado;

                SqlParameter sqlpEnLinea = new SqlParameter();
                sqlpEnLinea.ParameterName = "@EnLinea";
                sqlpEnLinea.SqlDbType = SqlDbType.Bit;
                sqlpEnLinea.Value = iUsuario.EnLinea;

                SqlParameter sqlpFechaAlta = new SqlParameter();
                sqlpFechaAlta.ParameterName = "@FechaAlta";
                sqlpFechaAlta.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaAlta.Value = iUsuario.FechaAlta;

                SqlParameter sqlpFechaBloqueo = new SqlParameter();
                sqlpFechaBloqueo.ParameterName = "@FechaBloqueo";
                sqlpFechaBloqueo.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaBloqueo.Value = DBNull.Value;

                SqlParameter sqlpUltimoAcceso = new SqlParameter();
                sqlpUltimoAcceso.ParameterName = "@UltimoAcceso";
                sqlpUltimoAcceso.SqlDbType = SqlDbType.SmallDateTime;
                sqlpUltimoAcceso.Value = DBNull.Value;

                SqlParameter sqlpCambioContrasena = new SqlParameter();
                sqlpCambioContrasena.ParameterName = "@CambioContrasena";
                sqlpCambioContrasena.SqlDbType = SqlDbType.SmallDateTime;
                sqlpCambioContrasena.Value = DBNull.Value;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpContrasena);
                sqlcComando.Parameters.Add(sqlpEstatus);
                sqlcComando.Parameters.Add(sqlpBloqueado);
                sqlcComando.Parameters.Add(sqlpEnLinea);
                sqlcComando.Parameters.Add(sqlpFechaAlta);
                sqlcComando.Parameters.Add(sqlpFechaBloqueo);
                sqlcComando.Parameters.Add(sqlpUltimoAcceso);
                sqlcComando.Parameters.Add(sqlpCambioContrasena);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Usuario " + iUsuario.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Usuarios
        /// </summary>
        /// <param name="uUsuario"></param>
        public static int Actualizar(Usuario uUsuario)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarUsuario";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = uUsuario.ID;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = uUsuario.Correo;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uUsuario.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = uUsuario.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = uUsuario.AMaterno;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uUsuario.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
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
                throw new Exception("Error capa de datos (public static int Actualizar(Usuario " + uUsuario.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        public static int Borrar(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarUsuario";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = strID;

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
                throw new Exception("Error capa de datos (public static int Borrar(Usuario " + strID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Usuarios
        /// </summary>
        /// <returns></returns>
        public static List<Usuario> ObtenerUsuarios()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerUsuarios";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Usuario> result = LibraryGenerics<Usuario>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Usuario> ObtenerUsuarios()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Usuario por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerUsuarioPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.VarChar;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Usuario result = LibraryGenerics<Usuario>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Usuario ObtenerUsuarioPorID(string " + strID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Usuario por su Correo
        /// </summary>
        /// <param name="strCorreo"></param>
        /// <returns></returns>
        public static Usuario ObtenerUsuarioPorCorreo(string strCorreo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerUsuarioPorCorreo";

                //2. Declarar los parametros
                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = strCorreo;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCorreo);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Usuario result = LibraryGenerics<Usuario>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Usuario ObtenerUsuarioPorOrden(string " + strCorreo + ")): " + ex.Message);
            }
        }

        #endregion

        #region Acción

        /// <summary>
        /// Método que valida el usuario y la contraseña para hacer login
        /// </summary>
        /// <param name="strUsuario"></param>
        /// <param name="strContrasena"></param>
        /// <returns></returns>
        public static bool ValidarUsuarioContrasena(string strUsuario, string strContrasena)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcClienteComando = new SqlCommand();
                sqlcClienteComando.Connection = sqlcConectar;
                sqlcClienteComando.CommandType = CommandType.StoredProcedure;
                sqlcClienteComando.CommandText = "web_spS_ValidarUsuarioContrasena";

                //2. Declarar los parametros
                SqlParameter sqlpUsuario = new SqlParameter();
                sqlpUsuario.ParameterName = "@Usuario";
                sqlpUsuario.SqlDbType = SqlDbType.VarChar;
                sqlpUsuario.Value = strUsuario;

                SqlParameter sqlpContrasena = new SqlParameter();
                sqlpContrasena.ParameterName = "@Contrasena";
                sqlpContrasena.SqlDbType = SqlDbType.VarChar;
                sqlpContrasena.Value = strContrasena;

                //3. Agregar los parametros al comando
                sqlcClienteComando.Parameters.Add(sqlpUsuario);
                sqlcClienteComando.Parameters.Add(sqlpContrasena);

                //4. Abrir la conexión
                sqlcClienteComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa un dato
                bool result = Convert.ToBoolean(sqlcClienteComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcClienteComando.Connection.Close();

                //7. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (ValidarUsuarioContrasena(string " + strUsuario + ", string " + strContrasena + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
