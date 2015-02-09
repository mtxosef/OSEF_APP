using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Proveedor
    /// </summary>
    public class ProveedorBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Proveedores
        /// </summary>
        /// <param name="iProveedor"></param>
        public static string Insertar(Proveedor iProveedor)
        {
            return ProveedorDataAccess.Insertar(iProveedor);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Proveedores
        /// </summary>
        /// <param name="uProveedor"></param>
        /// <returns></returns>
        public static int Actualizar(Proveedor uProveedor)
        {
            return ProveedorDataAccess.Actualizar(uProveedor);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Proveedor por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return ProveedorDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Proveedores
        /// </summary>
        /// <returns></returns>
        public static List<Proveedor> ObtenerProveedores()
        {
            return ProveedorDataAccess.ObtenerProveedores();
        }

        /// <summary>
        /// Obtener un registro de Proveedor por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Proveedor ObtenerProveedorPorID(string strID)
        {
            return ProveedorDataAccess.ObtenerProveedorPorID(strID);
        }

        #endregion
    }
}
