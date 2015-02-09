using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Finalidades
    /// </summary>
    public class FinalidadBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Finalidad
        /// </summary>
        /// <param name="iFinalidad"></param>
        public static int Insertar(Finalidad iFinalidad)
        {
            return FinalidadDataAccess.Insertar(iFinalidad);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Finalidades
        /// </summary>
        /// <param name="uFinalidad"></param>
        /// <returns></returns>
        public static int Actualizar(Finalidad uFinalidad)
        {
            return FinalidadDataAccess.Actualizar(uFinalidad);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Finalidad por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return FinalidadDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Finalidad
        /// </summary>
        /// <returns></returns>
        public static List<Finalidad> ObtenerFinalidades()
        {
            return FinalidadDataAccess.ObtenerFinalidades();
        }

        /// <summary>
        /// Obtener un registro de Finalidad por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Finalidad ObtenerFinalidadPorID(string strID)
        {
            return FinalidadDataAccess.ObtenerFinalidadPorID(strID);
        }

        #endregion
    }
}
