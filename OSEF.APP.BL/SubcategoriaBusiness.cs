using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de SubCategorias
    /// </summary>
    public class SubcategoriaBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de SubCategorias
        /// </summary>
        /// <param name="iSubcategoria"></param>
        public static string Insertar(Subcategoria iSubcategoria)
        {
            return SubcategoriaDataAccess.Insertar(iSubcategoria);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de SubCategorias
        /// </summary>
        /// <param name="uSubCategoria"></param>
        /// <returns></returns>
        public static int Actualizar(Subcategoria uSubCategoria)
        {
            return SubcategoriaDataAccess.Actualizar(uSubCategoria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna SubCategoria por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return SubcategoriaDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de SubCategorias
        /// </summary>
        /// <returns></returns>
        public static List<Subcategoria> ObtenerSubCategorias()
        {
            return SubcategoriaDataAccess.ObtenerSubCategorias();
        }

        /// <summary>
        /// Obtener un registro de SubCategoria por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Subcategoria ObtenerSubCategoriaPorID(string strID)
        {
            return SubcategoriaDataAccess.ObtenerSubCategoriaPorID(strID);
        }

        /// <summary>
        /// Obtener un registro de Categoria por su Orden
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static Subcategoria ObtenerSubCategoriaPorOrden(byte bOrden)
        {
            return SubcategoriaDataAccess.ObtenerSubCategoriaPorOrden(bOrden);
        }

        /// <summary>
        /// Obtener los registro de SubCategoria por su Categoria
        /// </summary>
        /// <param name="bOrden"></param>
        /// <returns></returns>
        public static List<Subcategoria> ObtenerSubCategoriaPorCategoria(string strCategoria)
        {
            return SubcategoriaDataAccess.ObtenerSubCategoriaPorCategoria(strCategoria);
        }

        #endregion
    }
}
