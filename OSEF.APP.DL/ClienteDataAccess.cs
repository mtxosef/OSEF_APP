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
    /// Clase que administra los datos de la tabla de Clientes
    /// </summary>
    public class ClienteDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Clientes
        /// </summary>
        /// <param name="iCliente"></param>
        public static string Insertar(Cliente iCliente)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarCliente";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 8;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iCliente.Nombre;

                SqlParameter sqlpAPaterno = new SqlParameter();
                sqlpAPaterno.ParameterName = "@APaterno";
                sqlpAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAPaterno.Value = iCliente.APaterno;

                SqlParameter sqlpAMaterno = new SqlParameter();
                sqlpAMaterno.ParameterName = "@AMaterno";
                sqlpAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpAMaterno.Value = iCliente.AMaterno;

                SqlParameter sqlpRFC = new SqlParameter();
                sqlpRFC.ParameterName = "@RFC";
                sqlpRFC.SqlDbType = SqlDbType.VarChar;
                sqlpRFC.Value = iCliente.RFC;

                SqlParameter sqlpCURP = new SqlParameter();
                sqlpCURP.ParameterName = "@CURP";
                sqlpCURP.SqlDbType = SqlDbType.VarChar;
                sqlpCURP.Value = iCliente.CURP;

                SqlParameter sqlpFechaNacimiento = new SqlParameter();
                sqlpCURP.ParameterName = "@FechaNacimiento";
                sqlpCURP.SqlDbType = SqlDbType.Date;
                sqlpCURP.Value = iCliente.FechaNacimiento;

                SqlParameter sqlpEdad = new SqlParameter();
                sqlpEdad.ParameterName = "@Edad";
                sqlpEdad.SqlDbType = SqlDbType.TinyInt;
                sqlpEdad.Value = iCliente.Edad;

                SqlParameter sqlpSexo = new SqlParameter();
                sqlpSexo.ParameterName = "@Sexo";
                sqlpSexo.SqlDbType = SqlDbType.VarChar;
                sqlpSexo.Value = iCliente.Sexo;

                SqlParameter sqlpEstadoCivil = new SqlParameter();
                sqlpEstadoCivil.ParameterName = "@EstadoCivil";
                sqlpEstadoCivil.SqlDbType = SqlDbType.VarChar;
                sqlpEstadoCivil.Value = iCliente.EstadoCivil;

                SqlParameter sqlpProfesion = new SqlParameter();
                sqlpProfesion.ParameterName = "@Profesion";
                sqlpProfesion.SqlDbType = SqlDbType.Char;
                sqlpProfesion.Size = 7;
                sqlpProfesion.Value = iCliente.Profesion;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpAPaterno);
                sqlcComando.Parameters.Add(sqlpAMaterno);
                sqlcComando.Parameters.Add(sqlpRFC);
                sqlcComando.Parameters.Add(sqlpCURP);
                sqlcComando.Parameters.Add(sqlpFechaNacimiento);
                sqlcComando.Parameters.Add(sqlpEdad);
                sqlcComando.Parameters.Add(sqlpSexo);

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
                throw new Exception("Error capa de datos (public static int Insertar(Cliente " + iCliente.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Articulos
        /// </summary>
        /// <param name="uArticulo"></param>
        public static int Actualizar(Articulo uArticulo)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarArticulo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 2;
                sqlpID.Value = uArticulo.ID;

                SqlParameter sqlpCorta = new SqlParameter();
                sqlpCorta.ParameterName = "@Corta";
                sqlpCorta.SqlDbType = SqlDbType.VarChar;
                sqlpCorta.Value = uArticulo.Corta;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uArticulo.Descripcion;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpCorta);
                sqlcComando.Parameters.Add(sqlpDescripcion);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Articulo " + uArticulo.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Articulo por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarArticulo";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 2;
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
                throw new Exception("Error capa de datos (public static int Borrar(Articulo " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Articulos
        /// </summary>
        /// <returns></returns>
        public static List<Articulo> ObtenerArticulos()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerArticulos";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Articulo> result = LibraryGenerics<Articulo>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Articulo> ObtenerArticulos()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Articulo por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Articulo ObtenerArticuloPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerArticuloPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 2;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Articulo result = LibraryGenerics<Articulo>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Articulo ObtenerArticuloPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
