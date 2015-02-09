using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;
using System.IO;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Menus
    /// </summary>
    public class MenuBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Menus
        /// </summary>
        /// <param name="iMenu"></param>
        public static string Insertar(Menu iMenu)
        {
            return MenuDataAccess.Insertar(iMenu);
        }

        #endregion

        #region Modificar

        /// <summary>
        /// Método que actualiza un nuevo registro a la tabla de Menus
        /// </summary>
        /// <param name="uMenu"></param>
        /// <returns></returns>
        public static int Actualizar(Menu uMenu)
        {
            return MenuDataAccess.Actualizar(uMenu);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Menu por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return MenuDataAccess.Borrar(dID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Menus
        /// </summary>
        /// <returns></returns>
        public static List<Menu> ObtenerMenus()
        {
            //1. Obtener la lista de los grupo menu
            List<Menu> lMenu = MenuDataAccess.ObtenerMenus();

            //2. Por cada elemento de la lista complementar con un objeto GrupoMenu
            foreach (Menu sd in lMenu)
                sd.RGrupoMenu = GrupoMenuBusiness.ObtenerGrupoMenuPorID(sd.GrupoMenu);

            return lMenu;
        }

        /// <summary>
        /// Obtener un registro de Menu por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        public static Menu ObtenerMenuPorID(string strID)
        {
            //1. Obtener el objeto Menu y complementar el GrupoMenu
            Menu oMenu = MenuDataAccess.ObtenerMenuPorID(strID);
            oMenu.RGrupoMenu = GrupoMenuBusiness.ObtenerGrupoMenuPorID(oMenu.GrupoMenu);

            //2. Regresar el objeto
            return oMenu;
        }

        /// <summary>
        /// Obtener un registro de Menu por su GrupoMenu
        /// </summary>
        /// <param name="strGrupoMenu"></param>
        /// <returns></returns>
        public static List<Menu> ObtenerMenuPorGrupoMenu(string strGrupoMenu)
        {
            //1. Obtener los objetos Menu que corresponden al GrupoMenu
            List<Menu> lMenu = MenuDataAccess.ObtenerMenuPorGrupoMenu(strGrupoMenu);

            //2. Por cada elemento de la lista complementar con un objeto GrupoMenu
            foreach (Menu sd in lMenu)
                sd.RGrupoMenu = GrupoMenuBusiness.ObtenerGrupoMenuPorID(sd.GrupoMenu);

            return lMenu;
        }

        #endregion
    }
}
