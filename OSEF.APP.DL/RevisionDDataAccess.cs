using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using System.Data.SqlClient;
using OSEF.LIBRARY.COMMON.Generics;
using System.Data;
using System.Configuration;

namespace OSEF.APP.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de RevisionD
    /// </summary>
    public class RevisionDDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de RevisionesD
        /// </summary>
        /// <param name="iRevisionD"></param>
        public static int Insertar(RevisionD iRevisionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarRevisionD";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevisionD.Revision;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = iRevisionD.Renglon;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 7;
                sqlpConcepto.Value = iRevisionD.Concepto;

                SqlParameter sqlpProveedor = new SqlParameter();
                sqlpProveedor.ParameterName = "@Proveedor";
                sqlpProveedor.SqlDbType = SqlDbType.Char;
                sqlpProveedor.Size = 7;
                sqlpProveedor.Value = iRevisionD.Proveedor;

                SqlParameter sqlpProgramado = new SqlParameter();
                sqlpProgramado.ParameterName = "@Programado";
                sqlpProgramado.SqlDbType = SqlDbType.Decimal;
                sqlpProgramado.Precision = 5;
                sqlpProgramado.Scale = 2;
                sqlpProgramado.Value = iRevisionD.Programado;

                SqlParameter sqlpReal = new SqlParameter();
                sqlpReal.ParameterName = "@Real";
                sqlpReal.SqlDbType = SqlDbType.Decimal;
                sqlpReal.Precision = 5;
                sqlpReal.Scale = 2;
                sqlpReal.Value = iRevisionD.Real;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpConcepto);
                sqlcComando.Parameters.Add(sqlpProveedor);
                sqlcComando.Parameters.Add(sqlpProgramado);
                sqlcComando.Parameters.Add(sqlpReal);

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
                throw new Exception("Error capa de datos (public static int Insertar(RevisionD " + iRevisionD.Concepto + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de RevisionesD
        /// </summary>
        /// <param name="uRevisionD"></param>
        public static int Actualizar(RevisionD uRevisionD)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarRevisionD";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = uRevisionD.Revision;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = uRevisionD.Renglon;

                SqlParameter sqlpConcepto = new SqlParameter();
                sqlpConcepto.ParameterName = "@Concepto";
                sqlpConcepto.SqlDbType = SqlDbType.Char;
                sqlpConcepto.Size = 7;
                sqlpConcepto.Value = uRevisionD.Concepto;

                SqlParameter sqlpProveedor = new SqlParameter();
                sqlpProveedor.ParameterName = "@Proveedor";
                sqlpProveedor.SqlDbType = SqlDbType.Char;
                sqlpProveedor.Size = 7;
                sqlpProveedor.Value = uRevisionD.Proveedor;

                SqlParameter sqlpProgramado = new SqlParameter();
                sqlpProgramado.ParameterName = "@Programado";
                sqlpProgramado.SqlDbType = SqlDbType.Decimal;
                sqlpProgramado.Precision = 5;
                sqlpProgramado.Scale = 2;
                sqlpProgramado.Value = uRevisionD.Programado;

                SqlParameter sqlpReal = new SqlParameter();
                sqlpReal.ParameterName = "@Real";
                sqlpReal.SqlDbType = SqlDbType.Decimal;
                sqlpReal.Precision = 5;
                sqlpReal.Scale = 2;
                sqlpReal.Value = uRevisionD.Real;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpRenglon);
                sqlcComando.Parameters.Add(sqlpConcepto);
                sqlcComando.Parameters.Add(sqlpProveedor);
                sqlcComando.Parameters.Add(sqlpProgramado);
                sqlcComando.Parameters.Add(sqlpReal);

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
                throw new Exception("Error capa de datos (public static int Actualizar(RevisionD " + uRevisionD.Concepto + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar RevisionD por su Revision
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static int BorrarPorRevision(int iRevision)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarRevisionDPorRevision";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevision;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);

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
                throw new Exception("Error capa de datos (public static int Borrar(int " + iRevision + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Método que borrar alguna RevisionD por su Revision y Renglon
        /// </summary>
        /// <param name="iRevision"></param>
        /// <param name="sRenglon"></param>
        /// <returns></returns>
        public static int Borrar(int iRevision, short sRenglon)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spD_BorrarRevisionD";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevision;

                SqlParameter sqlpRenglon = new SqlParameter();
                sqlpRenglon.ParameterName = "@Renglon";
                sqlpRenglon.SqlDbType = SqlDbType.SmallInt;
                sqlpRenglon.Value = sRenglon;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);
                sqlcComando.Parameters.Add(sqlpRenglon);

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
                throw new Exception("Error capa de datos (public static int Borrar(int " + iRevision + ", short " + sRenglon + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de RevisionesD
        /// </summary>
        /// <returns></returns>
        public static List<RevisionD> ObtenerRevisionesD()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerRevisionesD";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<RevisionD> result = LibraryGenerics<RevisionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<RevisionD> ObtenerRevisionesD()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener los registros de RevisionesD por su Revision
        /// </summary>
        /// <param name="iRevision"></param>
        /// <returns></returns>
        public static List<RevisionD> ObtenerRevisionesDPorRevision(int iRevision)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerRevisionesDPorRevision";

                //2. Declarar los parametros
                SqlParameter sqlpRevision = new SqlParameter();
                sqlpRevision.ParameterName = "@Revision";
                sqlpRevision.SqlDbType = SqlDbType.Int;
                sqlpRevision.Value = iRevision;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpRevision);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<RevisionD> result = LibraryGenerics<RevisionD>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<RevisionD> ObtenerRevisionesDPorRevision(int " + iRevision + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de RevisionesD por su Revision y Renglon
        /// </summary>
        /// <param name="lID"></param>
        /// <returns></returns>
        public static RevisionD ObtenerRevisionDPorID(long lID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerRevisionDPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.BigInt;
                sqlpID.Value = lID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                RevisionD result = LibraryGenerics<RevisionD>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static RevisionD ObtenerRevisionDPorID(long " + lID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
