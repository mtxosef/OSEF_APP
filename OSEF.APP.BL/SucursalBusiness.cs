using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Sucursal
    /// </summary>
    public class SucursalBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Sucursales
        /// </summary>
        /// <param name="iSucursal"></param>
        public static string Insertar(Sucursal iSucursal)
        {
            return SucursalDataAccess.Insertar(iSucursal);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Sucursales
        /// </summary>
        /// <param name="uSucursal"></param>
        /// <returns></returns>
        public static int Actualizar(Sucursal uSucursal)
        {
            return SucursalDataAccess.Actualizar(uSucursal);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Sucursal por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return SucursalDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Sucursales
        /// </summary>
        /// <returns></returns>
        public static List<Sucursal> ObtenerSucursales()
        {
            return SucursalDataAccess.ObtenerSucursales();
        }

        /// <summary>
        /// Obtener un registro de Sucursal por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Sucursal ObtenerSucursalPorID(string strID)
        {
            return SucursalDataAccess.ObtenerSucursalPorID(strID);
        }

        /// <summary>
        /// Revisar si existen registros de Sucursales en las revisiones por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static bool ObtenerSucursalesEnRevisionesPorID(string strID)
        {
            return SucursalDataAccess.ObtenerSucursalesEnRevisionesPorID(strID);
        }

        #endregion
    }
}
