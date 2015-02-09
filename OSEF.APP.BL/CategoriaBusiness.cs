using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.DL;
using OSEF.APP.EL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Categorias
    /// </summary>
    public class CategoriaBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Categorias
        /// </summary>
        /// <param name="iCategoria"></param>
        public static string Insertar(Categoria iCategoria)
        {
            return CategoriaDataAccess.Insertar(iCategoria);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Categorias
        /// </summary>
        /// <param name="uCategoria"></param>
        /// <returns></returns>
        public static int Actualizar(Categoria uCategoria)
        {
            return CategoriaDataAccess.Actualizar(uCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Categoria por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return CategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Categorias
        /// </summary>
        /// <returns></returns>
        public static List<Categoria> ObtenerCategorias()
        {
            return CategoriaDataAccess.ObtenerCategorias();
        }

        /// <summary>
        /// Obtener un registro de Categoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Categoria ObtenerCategoriaPorID(string strID)
        {
            return CategoriaDataAccess.ObtenerCategoriaPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de Categoria por su Orden
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static Categoria ObtenerCategoriaPorOrden(byte bOrden)
        {
            return CategoriaDataAccess.ObtenerCategoriaPorOrden(bOrden);
        }

        #endregion
    }
}
