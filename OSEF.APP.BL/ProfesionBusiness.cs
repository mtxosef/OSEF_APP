using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Profesiones
    /// </summary>
    public class ProfesionBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Profesiones
        /// </summary>
        /// <param name="iProfesion"></param>
        public static string Insertar(Profesion iProfesion)
        {
            return ProfesionDataAccess.Insertar(iProfesion);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Profesiones
        /// </summary>
        /// <param name="uProfesion"></param>
        /// <returns></returns>
        public static int Actualizar(Profesion uProfesion)
        {
            return ProfesionDataAccess.Actualizar(uProfesion);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Profesion por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return ProfesionDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los registros de Profesiones
        /// </summary>
        /// <returns></returns>
        public static List<Profesion> ObtenerProfesiones()
        {
            return ProfesionDataAccess.ObtenerProfesiones();
        }

        /// <summary>
        /// Obtener un registro de Profesion por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Profesion ObtenerProfesionPorID(string strID)
        {
            return ProfesionDataAccess.ObtenerProfesionPorID(strID);
        }

        #endregion
    }
}
