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
    /// Clase que administra los datos de la tabla de Menus
    /// </summary>
    public class MenuDataAccess
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Menus
        /// </summary>
        /// <param name="iMenu"></param>
        public static string Insertar(Menu iMenu)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spI_InsertarMenu";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 4;
                sqlpID.Direction = ParameterDirection.Output;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = iMenu.Descripcion;

                SqlParameter sqlpGrupoMenu = new SqlParameter();
                sqlpGrupoMenu.ParameterName = "@GrupoMenu";
                sqlpGrupoMenu.SqlDbType = SqlDbType.Char;
                sqlpGrupoMenu.Size = 3;
                sqlpGrupoMenu.Value = iMenu.GrupoMenu;

                SqlParameter sqlpImagenNormal = new SqlParameter();
                sqlpImagenNormal.ParameterName = "@ImagenNormal";
                sqlpImagenNormal.SqlDbType = SqlDbType.VarChar;
                sqlpImagenNormal.Value = iMenu.ImagenNormal;

                SqlParameter sqlpImagenSobre = new SqlParameter();
                sqlpImagenSobre.ParameterName = "@ImagenSobre";
                sqlpImagenSobre.SqlDbType = SqlDbType.VarChar;
                sqlpImagenSobre.Value = iMenu.ImagenNormal;

                SqlParameter sqlpImagenSeleccionar = new SqlParameter();
                sqlpImagenSeleccionar.ParameterName = "@ImagenSeleccionar";
                sqlpImagenSeleccionar.SqlDbType = SqlDbType.VarChar;
                sqlpImagenSeleccionar.Value = iMenu.ImagenNormal;

                SqlParameter sqlpImagenDeshabilitar = new SqlParameter();
                sqlpImagenDeshabilitar.ParameterName = "@ImagenDeshabilitar";
                sqlpImagenDeshabilitar.SqlDbType = SqlDbType.VarChar;
                sqlpImagenDeshabilitar.Value = iMenu.ImagenNormal;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpGrupoMenu);
                sqlcComando.Parameters.Add(sqlpImagenNormal);
                sqlcComando.Parameters.Add(sqlpImagenSobre);
                sqlcComando.Parameters.Add(sqlpImagenSeleccionar);
                sqlcComando.Parameters.Add(sqlpImagenDeshabilitar);

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
                throw new Exception("Error capa de datos (public static int Insertar(Menu " + iMenu.Descripcion + ")): " + ex.Message);
            }
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Menus
        /// </summary>
        /// <param name="uMenu"></param>
        public static int Actualizar(Menu uMenu)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spU_ActualizarMenu";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 4;
                sqlpID.Value = uMenu.ID;

                SqlParameter sqlpDescripcion = new SqlParameter();
                sqlpDescripcion.ParameterName = "@Descripcion";
                sqlpDescripcion.SqlDbType = SqlDbType.VarChar;
                sqlpDescripcion.Value = uMenu.Descripcion;

                SqlParameter sqlpGrupoMenu = new SqlParameter();
                sqlpGrupoMenu.ParameterName = "@GrupoMenu";
                sqlpGrupoMenu.SqlDbType = SqlDbType.Char;
                sqlpGrupoMenu.Size = 3;
                sqlpGrupoMenu.Value = uMenu.GrupoMenu;

                SqlParameter sqlpImagenNormal = new SqlParameter();
                sqlpImagenNormal.ParameterName = "@ImagenNormal";
                sqlpImagenNormal.SqlDbType = SqlDbType.VarChar;
                sqlpImagenNormal.Value = uMenu.ImagenNormal;

                SqlParameter sqlpImagenSobre = new SqlParameter();
                sqlpImagenSobre.ParameterName = "@ImagenSobre";
                sqlpImagenSobre.SqlDbType = SqlDbType.VarChar;
                sqlpImagenSobre.Value = uMenu.ImagenNormal;

                SqlParameter sqlpImagenSeleccionar = new SqlParameter();
                sqlpImagenSeleccionar.ParameterName = "@ImagenSeleccionar";
                sqlpImagenSeleccionar.SqlDbType = SqlDbType.VarChar;
                sqlpImagenSeleccionar.Value = uMenu.ImagenNormal;

                SqlParameter sqlpImagenDeshabilitar = new SqlParameter();
                sqlpImagenDeshabilitar.ParameterName = "@ImagenDeshabilitar";
                sqlpImagenDeshabilitar.SqlDbType = SqlDbType.VarChar;
                sqlpImagenDeshabilitar.Value = uMenu.ImagenNormal;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);
                sqlcComando.Parameters.Add(sqlpDescripcion);
                sqlcComando.Parameters.Add(sqlpGrupoMenu);
                sqlcComando.Parameters.Add(sqlpImagenNormal);
                sqlcComando.Parameters.Add(sqlpImagenSobre);
                sqlcComando.Parameters.Add(sqlpImagenSeleccionar);
                sqlcComando.Parameters.Add(sqlpImagenDeshabilitar);

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
                throw new Exception("Error capa de datos (public static int Actualizar(Menu " + uMenu.ID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Menu por su ID
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
                sqlcComando.CommandText = "web_spD_BorrarMenu";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 4;
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
                throw new Exception("Error capa de datos (public static int Borrar(Menu " + dID + ")): " + ex.Message);
            }
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Menus
        /// </summary>
        /// <returns></returns>
        public static List<Menu> ObtenerMenus()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMenus";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Menu> result = LibraryGenerics<Menu>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Menu> ObtenerMenus()): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Menu por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Menu ObtenerMenuPorID(string strID)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMenuPorID";

                //2. Declarar los parametros
                SqlParameter sqlpID = new SqlParameter();
                sqlpID.ParameterName = "@ID";
                sqlpID.SqlDbType = SqlDbType.Char;
                sqlpID.Size = 4;
                sqlpID.Value = strID;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpID);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                Menu result = LibraryGenerics<Menu>.ConvertDataSetToList(reader).FirstOrDefault();

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Menu ObtenerMenuPorID(string " + strID + ")): " + ex.Message);
            }
        }

        /// <summary>
        /// Obtener un registro de Menu por su GrupoMenu
        /// </summary>
        /// <param name="strGrupoMenu"></param>
        /// <returns></returns>
        public static List<Menu> ObtenerMenuPorGrupoMenu(string strGrupoMenu)
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerMenuPorGrupoMenu";

                //2. Declarar los parametros
                SqlParameter sqlpGrupoMenu = new SqlParameter();
                sqlpGrupoMenu.ParameterName = "@GrupoMenu";
                sqlpGrupoMenu.SqlDbType = SqlDbType.Char;
                sqlpGrupoMenu.Size = 3;
                sqlpGrupoMenu.Value = strGrupoMenu;

                //3. Agregar los parametros al comando
                sqlcComando.Parameters.Add(sqlpGrupoMenu);

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Menu> result = LibraryGenerics<Menu>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static Menu ObtenerMenuPorGrupoMenu(string " + strGrupoMenu + ")): " + ex.Message);
            }
        }

        #endregion
    }
}
