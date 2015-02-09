using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.INTELISIS.EL;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using OSEF.LIBRARY.COMMON.Generics;

namespace OSEF.INTELISIS.DL
{
    /// <summary>
    /// Clase que administra los datos de la tabla de Agente
    /// </summary>
    public class AgenteDataAccess
    {
        #region Consultar

        /// <summary>
        /// Obtener todos los registros de Agente
        /// </summary>
        /// <returns></returns>
        public static List<Agente> ObtenerAgentes()
        {
            try
            {
                //1. Configurar la conexión y el tipo de comando
                SqlConnection sqlcConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartSystems"].ConnectionString);
                SqlCommand sqlcComando = new SqlCommand();
                sqlcComando.Connection = sqlcConectar;
                sqlcComando.CommandType = CommandType.StoredProcedure;
                sqlcComando.CommandText = "web_spS_ObtenerTodosAgentes";

                //2. Declarar los parametros

                //3. Agregar los parametros al comando

                //4. Abrir la conexión
                sqlcComando.Connection.Open();

                //5. Ejecutar la instrucción SELECT que regresa filas
                SqlDataReader reader = sqlcComando.ExecuteReader();

                //6. Asignar la lista de Clientes
                List<Agente> result = LibraryGenerics<Agente>.ConvertDataSetToList(reader);

                //7. Cerrar la conexión
                sqlcComando.Connection.Close();

                //8. Regresar el resultado
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error capa de datos (public static List<Agente> ObtenerAgentes()): " + ex.Message);
            }
        }

        #endregion
    }
}
