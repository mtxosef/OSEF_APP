using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de GrupoMenu
    /// </summary>
    public class GrupoMenuBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de GruposMenu
        /// </summary>
        /// <param name="iGrupoMenu"></param>
        public static int Insertar(GrupoMenu iGrupoMenu)
        {
            return GrupoMenuDataAccess.Insertar(iGrupoMenu);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de GruposMenu
        /// </summary>
        /// <param name="uGrupoMenu"></param>
        /// <returns></returns>
        public static int Actualizar(GrupoMenu uGrupoMenu)
        {
            return GrupoMenuDataAccess.Actualizar(uGrupoMenu);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun GrupoMenu por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return GrupoMenuDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de GruposMenu
        /// </summary>
        /// <returns></returns>
        public static List<GrupoMenu> ObtenerGruposMenu()
        {
            return GrupoMenuDataAccess.ObtenerGruposMenu();
        }

        /// <summary>
        /// Obtener un registro de GruposMenu por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static GrupoMenu ObtenerGrupoMenuPorID(string strID)
        {
            return GrupoMenuDataAccess.ObtenerGrupoMenuPorID(strID);
        }

        #endregion
    }
}
