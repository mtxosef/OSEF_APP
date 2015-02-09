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
    /// Clase que administra los datos de la tabla de CuentasContables
    /// </summary>
    public class CuentaContableDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CuentasContables
        /// </summary>
        /// <param name="iCuentaContable"></param>
        public static int Insertar(CuentaContable iCuentaContable)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCuentaContable";

                //2. Declarar los parametros
                SqlParameter sqlpCuenta = new SqlParameter();
                sqlpCuenta.ParameterName = "@Cuenta";
                sqlpCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpCuenta.Value = iCuentaContable.Cuenta;

                SqlParameter sqlpRama = new SqlParameter();
                sqlpRama.ParameterName = "@Rama";
                sqlpRama.SqlDbType = SqlDbType.VarChar;
                sqlpRama.Value = iCuentaContable.Rama;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iCuentaContable.Descripcion;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = iCuentaContable.Tipo;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iCuentaContable.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCuenta);
                sqlcComando.Parameters.Add(sqlpRama);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpTipo);
                sqlcComando.Parameters.Add(sqlpEstatus);

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
                throw new Exception("Error capa de datos (public static int Insertar(CuentaContable " + iCuentaContable.Cuenta + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Cuentas contables
        /// </summary>
        /// <param name="uCuentaContable"></param>
        public static int Actualizar(CuentaContable uCuentaContable)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarCuentaContable";

                //2. Declarar los parametros
                SqlParameter sqlpCuenta = new SqlParameter();
                sqlpCuenta.ParameterName = "@Cuenta";
                sqlpCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpCuenta.Value = uCuentaContable.Cuenta;

                SqlParameter sqlpRama = new SqlParameter();
                sqlpRama.ParameterName = "@Rama";
                sqlpRama.SqlDbType = SqlDbType.VarChar;
                sqlpRama.Value = uCuentaContable.Rama;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uCuentaContable.Descripcion;

                SqlParameter sqlpTipo = new SqlParameter();
                sqlpTipo.ParameterName = "@Tipo";
                sqlpTipo.SqlDbType = SqlDbType.VarChar;
                sqlpTipo.Value = uCuentaContable.Tipo;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = uCuentaContable.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCuenta);
                sqlcComando.Parameters.Add(sqlpRama);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpTipo);
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
                throw new Exception("Error capa de datos (public static int Actualizar(CuentaContable " + uCuentaContable.Cuenta + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Cuenta contable por su Cuenta
        /// </summary>
        /// <param name="dCuenta"></param>
        public static int Borrar(string dCuenta)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarCuentaContable";

                //2. Declarar los parametros
                SqlParameter sqlpCuenta = new SqlParameter();
                sqlpCuenta.ParameterName = "@Cuenta";
                sqlpCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpCuenta.Value = dCuenta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCuenta);

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
                throw new Exception("Error capa de datos (public static int Borrar(CuentaContable " + dCuenta + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de CuentasContables
        /// </summary>
        /// <returns></returns>
        public static List<CuentaContable> ObtenerCuentasContables()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCuentasContables";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<CuentaContable> result = LibraryGenerics<CuentaContable>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<CuentaContable> ObtenerCuentasContables()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Cuenta Contable por su Cuenta
        /// </summary>
        /// <param name="strCuenta"></param>
        /// <returns></returns>
        public static CuentaContable ObtenerCuentaContablePorCuenta(string strCuenta)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCuentaContablePorCuenta";

                //2. Declarar los parametros
                SqlParameter sqlpCuenta = new SqlParameter();
                sqlpCuenta.ParameterName = "@Cuenta";
                sqlpCuenta.SqlDbType = SqlDbType.VarChar;
                sqlpCuenta.Value = strCuenta;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpCuenta);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                CuentaContable result = LibraryGenerics<CuentaContable>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static CuentaContable ObtenerCuentaContablePorCuenta(string " + strCuenta + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Cuenta Contable por su Rama
        /// </summary>
        /// <param name="strRama"></param>
        /// <returns></returns>
        public static List<CuentaContable> ObtenerCuentaContablePorRama(string strRama)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerCuentaContablePorRama";

                //2. Declarar los parametros
                SqlParameter sqlpRama = new SqlParameter();
                sqlpRama.ParameterName = "@Rama";
                sqlpRama.SqlDbType = SqlDbType.VarChar;
                sqlpRama.Value = strRama;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRama);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<CuentaContable> result = LibraryGenerics<CuentaContable>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<CuentaContable> ObtenerCuentaContablePorCuenta(string " + strRama + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
