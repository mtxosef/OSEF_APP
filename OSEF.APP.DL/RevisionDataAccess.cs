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
    /// Clase que administra los datos de la tabla de Revision
    /// </summary>
    public class RevisionDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Revisiones
        /// </summary>
        /// <param name="iRevision"></param>
        public static int Insertar(Revision iRevision)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarRevision";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = iRevision.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (iRevision.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = iRevision.MovID;

                SqlParameter sqlpSemana = new SqlParameter();
                sqlpSemana.ParameterName = "@Semana";
                sqlpSemana.SqlDbType = SqlDbType.TinyInt;
                sqlpSemana.Value = iRevision.Semana;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.Char;
                sqlpSucursal.Size = 10;
                sqlpSucursal.Value = iRevision.Sucursal;

                SqlParameter sqlpFechaEmision = new SqlParameter();
                sqlpFechaEmision.ParameterName = "@FechaEmision";
                sqlpFechaEmision.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaEmision.Value = iRevision.FechaEmision;

                SqlParameter sqlpFechaRevision = new SqlParameter();
                sqlpFechaRevision.ParameterName = "@FechaRevision";
                sqlpFechaRevision.SqlDbType = SqlDbType.Date;
                if (iRevision.FechaRevision == null)
                    sqlpFechaRevision.Value = DBNull.Value;
                else
                    sqlpFechaRevision.Value = iRevision.FechaRevision;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = iRevision.Observaciones;

                SqlParameter sqlpComentarios = new SqlParameter();
                sqlpComentarios.ParameterName = "@Comentarios";
                sqlpComentarios.SqlDbType = SqlDbType.VarChar;
                sqlpComentarios.Value = iRevision.Comentarios;

                SqlParameter sqlpEstatus = new SqlParameter();
                sqlpEstatus.ParameterName = "@Estatus";
                sqlpEstatus.SqlDbType = SqlDbType.VarChar;
                sqlpEstatus.Value = iRevision.Estatus;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpMovID);
                sqlcComando.Parameters.Add(sqlpSemana);
                sqlcComando.Parameters.Add(sqlpSucursal);
                sqlcComando.Parameters.Add(sqlpFechaEmision);
                sqlcComando.Parameters.Add(sqlpFechaRevision);
                sqlcComando.Parameters.Add(sqlpObservaciones);
                sqlcComando.Parameters.Add(sqlpComentarios);
                sqlcComando.Parameters.Add(sqlpEstatus);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción INSERT que regresa un dato que es el ID
                int result = Convert.ToInt32(sqlcComando.ExecuteScalar());

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt32(sqlcComando.Parameters["@ID"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int Insertar(Revision " + iRevision.Mov + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Revisiones
        /// </summary>
        /// <param name="uRevision"></param>
        public static int Actualizar(Revision uRevision)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarRevision";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = uRevision.ID;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = uRevision.Mov;

                SqlParameter sqlpMovID = new SqlParameter();
                sqlpMovID.ParameterName = "@MovID";
                sqlpMovID.SqlDbType = SqlDbType.VarChar;
                if (uRevision.MovID == null)
                    sqlpMovID.Value = DBNull.Value;
                else
                    sqlpMovID.Value = uRevision.MovID;

                SqlParameter sqlpSemana = new SqlParameter();
                sqlpSemana.ParameterName = "@Semana";
                sqlpSemana.SqlDbType = SqlDbType.TinyInt;
                sqlpSemana.Value = uRevision.Semana;

                SqlParameter sqlpSucursal = new SqlParameter();
                sqlpSucursal.ParameterName = "@Sucursal";
                sqlpSucursal.SqlDbType = SqlDbType.VarChar;
                sqlpSucursal.Value = uRevision.Sucursal;

                SqlParameter sqlpFechaEmision = new SqlParameter();
                sqlpFechaEmision.ParameterName = "@FechaEmision";
                sqlpFechaEmision.SqlDbType = SqlDbType.SmallDateTime;
                sqlpFechaEmision.Value = uRevision.FechaEmision;

                SqlParameter sqlpFechaRevision = new SqlParameter();
                sqlpFechaRevision.ParameterName = "@FechaRevision";
                sqlpFechaRevision.SqlDbType = SqlDbType.Date;
                if (uRevision.FechaRevision == null)
                    sqlpFechaRevision.Value = DBNull.Value;
                else
                    sqlpFechaRevision.Value = uRevision.FechaRevision;

                SqlParameter sqlpObservaciones = new SqlParameter();
                sqlpObservaciones.ParameterName = "@Observaciones";
                sqlpObservaciones.SqlDbType = SqlDbType.VarChar;
                sqlpObservaciones.Value = uRevision.Observaciones;

                SqlParameter sqlpComentarios = new SqlParameter();
                sqlpComentarios.ParameterName = "@Comentarios";
                sqlpComentarios.SqlDbType = SqlDbType.VarChar;
                sqlpComentarios.Value = uRevision.Comentarios;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpMovID);
                sqlcComando.Parameters.Add(sqlpSemana);
                sqlcComando.Parameters.Add(sqlpSucursal);
                sqlcComando.Parameters.Add(sqlpFechaEmision);
                sqlcComando.Parameters.Add(sqlpFechaRevision);
                sqlcComando.Parameters.Add(sqlpObservaciones);
                sqlcComando.Parameters.Add(sqlpComentarios);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Revision " + uRevision.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Revision por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(int dID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarRevision";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
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
                throw new Exception("Error capa de datos (public static int Borrar(Revision " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Revisiones
        /// </summary>
        /// <returns></returns>
        public static List<Revision> ObtenerRevisiones()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerRevisiones";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Revision> result = LibraryGenerics<Revision>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Revision> ObtenerRevisiones()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener todos los registros de Revisiones
        /// </summary>
        /// <returns></returns>
        public static List<Revision> ObtenerRevisionesUltimaRevision()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerRevisionesUltimaRevision";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Revision> result = LibraryGenerics<Revision>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Revision> ObtenerRevisionesUltimaRevision()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Revisiones por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static Revision ObtenerRevisionPorID(int iID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerRevisionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Revision result = LibraryGenerics<Revision>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Revision ObtenerRevisionPorID(int " + iID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Acciones

        /// <summary>
        /// Método que Afecta un registro de Revisiones
        /// </summary>
        /// <param name="aRevision"></param>
        public static int AfectarRevisionPorID(Revision aRevision)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AfectarRevisionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = aRevision.ID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

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
                throw new Exception("Error capa de datos (public static int AfectarRevisionPorID(Revision " + aRevision + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que avanza un movimiento de Revisiones
        /// </summary>
        /// <param name="iID"></param>
        /// <param name="strMov"></param>
        /// <returns></returns>
        public static int AvanzarRevisionPorID(int iID, string strMov)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_AvanzarRevisionPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Int;
                sqlpID.Value = iID;

                SqlParameter sqlpMov = new SqlParameter();
                sqlpMov.ParameterName = "@Mov";
                sqlpMov.SqlDbType = SqlDbType.VarChar;
                sqlpMov.Value = strMov;

                SqlParameter sqlpIDNuevo = new SqlParameter();
                sqlpIDNuevo.ParameterName = "@IDNuevo";
                sqlpIDNuevo.SqlDbType = SqlDbType.Int;
                sqlpIDNuevo.Direction = ParameterDirection.Output;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpMov);
                sqlcComando.Parameters.Add(sqlpIDNuevo);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SCALAR que regresa un valor
                int result = sqlcComando.ExecuteNonQuery();

                //6. Cerrar la conexión
                sqlcComando.Connection.Close();

                //7. Regresar el resultado
                return Convert.ToInt32(sqlcComando.Parameters["@IDNuevo"].Value);
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static int AvanzarRevisionPorID(int " + iID + ", string " + strMov + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
