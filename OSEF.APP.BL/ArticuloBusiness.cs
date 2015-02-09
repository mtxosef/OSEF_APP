using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Articulos
    /// </summary>
    public class ArticuloBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Articulos
        /// </summary>
        /// <param name="iArticulo"></param>
        public static int Insertar(Articulo iArticulo)
        {
            return ArticuloDataAccess.Insertar(iArticulo);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Articulos
        /// </summary>
        /// <param name="uArticulo"></param>
        /// <returns></returns>
        public static int Actualizar(Articulo uArticulo)
        {
            return ArticuloDataAccess.Actualizar(uArticulo);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Articulo por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return ArticuloDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Articulos
        /// </summary>
        /// <returns></returns>
        public static List<Articulo> ObtenerArticulos()
        {
            return ArticuloDataAccess.ObtenerArticulos();
        }

        /// <summary>
        /// Obtener un registro de Articulo por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Articulo ObtenerArticuloPorID(string strID)
        {
            return ArticuloDataAccess.ObtenerArticuloPorID(strID);
        }

        #endregion
    }
}
