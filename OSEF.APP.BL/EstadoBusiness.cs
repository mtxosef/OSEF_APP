using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Estado
    /// </summary>
    public class EstadoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Estados
        /// </summary>
        /// <param name="iEstado"></param>
        public static int Insertar(Estado iEstado)
        {
            return EstadoDataAccess.Insertar(iEstado);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Estados
        /// </summary>
        /// <param name="uEstado"></param>
        /// <returns></returns>
        public static int Actualizar(Estado uEstado)
        {
            return EstadoDataAccess.Actualizar(uEstado);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Estado por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return EstadoDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Estados
        /// </summary>
        /// <returns></returns>
        public static List<Estado> ObtenerEstados()
        {
            return EstadoDataAccess.ObtenerEstados();
        }

        /// <summary>
        /// Obtener un registro de Estado por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Estado ObtenerEstadoPorID(string strID)
        {
            return EstadoDataAccess.ObtenerEstadoPorID(strID);
        }

        #endregion
    }
}
