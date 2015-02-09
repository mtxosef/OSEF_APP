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
    /// Clase que administra los datos de la tabla de Proveedores
    /// </summary>
    public class ProveedorDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de GruposMenu
        /// </summary>
        /// <param name="iProveedor"></param>
        public static string Insertar(Proveedor iProveedor)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarProveedor";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = iProveedor.Nombre;

                SqlParameter sqlpRFC = new SqlParameter();
                sqlpRFC.ParameterName = "@RFC";
                sqlpRFC.SqlDbType = SqlDbType.VarChar;
                sqlpRFC.Value = iProveedor.RFC;

                SqlParameter sqlpContactoNombre = new SqlParameter();
                sqlpContactoNombre.ParameterName = "@ContactoNombre";
                sqlpContactoNombre.SqlDbType = SqlDbType.VarChar;
                sqlpContactoNombre.Value = iProveedor.ContactoNombre;

                SqlParameter sqlpContactoAPaterno = new SqlParameter();
                sqlpContactoAPaterno.ParameterName = "@ContactoAPaterno";
                sqlpContactoAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpContactoAPaterno.Value = iProveedor.ContactoAPaterno;

                SqlParameter sqlpContactoAMaterno = new SqlParameter();
                sqlpContactoAMaterno.ParameterName = "@ContactoAMaterno";
                sqlpContactoAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpContactoAMaterno.Value = iProveedor.ContactoAMaterno;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = iProveedor.Correo;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = iProveedor.Calle;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = iProveedor.EntreCalles;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = iProveedor.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = iProveedor.NoInterior;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = iProveedor.CodigoPostal;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = iProveedor.Colonia;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Size = 2;
                sqlpEstado.Value = iProveedor.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = iProveedor.Municipio;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpRFC);
                sqlcComando.Parameters.Add(sqlpContactoNombre);
                sqlcComando.Parameters.Add(sqlpContactoAPaterno);
                sqlcComando.Parameters.Add(sqlpContactoAMaterno);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);

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
                throw new Exception("Error capa de datos (public static string Insertar(Proveedor " + iProveedor.Nombre + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Proveedores
        /// </summary>
        /// <param name="iProveedor"></param>
        public static int Actualizar(Proveedor uProveedor)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarProveedor";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 7;
                sqlpID.Value = uProveedor.ID;

                SqlParameter sqlpNombre = new SqlParameter();
                sqlpNombre.ParameterName = "@Nombre";
                sqlpNombre.SqlDbType = SqlDbType.VarChar;
                sqlpNombre.Value = uProveedor.Nombre;

                SqlParameter sqlpRFC = new SqlParameter();
                sqlpRFC.ParameterName = "@RFC";
                sqlpRFC.SqlDbType = SqlDbType.VarChar;
                sqlpRFC.Value = uProveedor.RFC;

                SqlParameter sqlpContactoNombre = new SqlParameter();
                sqlpContactoNombre.ParameterName = "@ContactoNombre";
                sqlpContactoNombre.SqlDbType = SqlDbType.VarChar;
                sqlpContactoNombre.Value = uProveedor.ContactoNombre;

                SqlParameter sqlpContactoAPaterno = new SqlParameter();
                sqlpContactoAPaterno.ParameterName = "@ContactoAPaterno";
                sqlpContactoAPaterno.SqlDbType = SqlDbType.VarChar;
                sqlpContactoAPaterno.Value = uProveedor.ContactoAPaterno;

                SqlParameter sqlpContactoAMaterno = new SqlParameter();
                sqlpContactoAMaterno.ParameterName = "@ContactoAMaterno";
                sqlpContactoAMaterno.SqlDbType = SqlDbType.VarChar;
                sqlpContactoAMaterno.Value = uProveedor.ContactoAMaterno;

                SqlParameter sqlpCorreo = new SqlParameter();
                sqlpCorreo.ParameterName = "@Correo";
                sqlpCorreo.SqlDbType = SqlDbType.VarChar;
                sqlpCorreo.Value = uProveedor.Correo;

                SqlParameter sqlpCalle = new SqlParameter();
                sqlpCalle.ParameterName = "@Calle";
                sqlpCalle.SqlDbType = SqlDbType.VarChar;
                sqlpCalle.Value = uProveedor.Calle;

                SqlParameter sqlpEntreCalles = new SqlParameter();
                sqlpEntreCalles.ParameterName = "@EntreCalles";
                sqlpEntreCalles.SqlDbType = SqlDbType.VarChar;
                sqlpEntreCalles.Value = uProveedor.EntreCalles;

                SqlParameter sqlpNoExterior = new SqlParameter();
                sqlpNoExterior.ParameterName = "@NoExterior";
                sqlpNoExterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoExterior.Value = uProveedor.NoExterior;

                SqlParameter sqlpNoInterior = new SqlParameter();
                sqlpNoInterior.ParameterName = "@NoInterior";
                sqlpNoInterior.SqlDbType = SqlDbType.VarChar;
                sqlpNoInterior.Value = uProveedor.NoInterior;

                SqlParameter sqlpCodigoPostal = new SqlParameter();
                sqlpCodigoPostal.ParameterName = "@CodigoPostal";
                sqlpCodigoPostal.SqlDbType = SqlDbType.Int;
                sqlpCodigoPostal.Value = uProveedor.CodigoPostal;

                SqlParameter sqlpColonia = new SqlParameter();
                sqlpColonia.ParameterName = "@Colonia";
                sqlpColonia.SqlDbType = SqlDbType.VarChar;
                sqlpColonia.Value = uProveedor.Colonia;

                SqlParameter sqlpEstado = new SqlParameter();
                sqlpEstado.ParameterName = "@Estado";
                sqlpEstado.SqlDbType = SqlDbType.Char;
                sqlpEstado.Size = 2;
                sqlpEstado.Value = uProveedor.Estado;

                SqlParameter sqlpMunicipio = new SqlParameter();
                sqlpMunicipio.ParameterName = "@Municipio";
                sqlpMunicipio.SqlDbType = SqlDbType.Char;
                sqlpMunicipio.Size = 4;
                sqlpMunicipio.Value = uProveedor.Municipio;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpNombre);
                sqlcComando.Parameters.Add(sqlpRFC);
                sqlcComando.Parameters.Add(sqlpContactoNombre);
                sqlcComando.Parameters.Add(sqlpContactoAPaterno);
                sqlcComando.Parameters.Add(sqlpContactoAMaterno);
                sqlcComando.Parameters.Add(sqlpCorreo);
                sqlcComando.Parameters.Add(sqlpCalle);
                sqlcComando.Parameters.Add(sqlpEntreCalles);
                sqlcComando.Parameters.Add(sqlpNoExterior);
                sqlcComando.Parameters.Add(sqlpNoInterior);
                sqlcComando.Parameters.Add(sqlpCodigoPostal);
                sqlcComando.Parameters.Add(sqlpColonia);
                sqlcComando.Parameters.Add(sqlpEstado);
                sqlcComando.Parameters.Add(sqlpMunicipio);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Proveedor " + uProveedor.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun GrupoMenu por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarProveedor";

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
                throw new Exception("Error capa de datos (public static int Borrar(Proveedor " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Proveedores
        /// </summary>
        /// <returns></returns>
        public static List<Proveedor> ObtenerProveedores()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerProveedores";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Proveedor> result = LibraryGenerics<Proveedor>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Proveedor> ObtenerProveedores()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Proveedores por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Proveedor ObtenerProveedorPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerProveedorPorID";

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
                Proveedor result = LibraryGenerics<Proveedor>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Proveedor ObtenerProveedorPorID(string " + strID + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
