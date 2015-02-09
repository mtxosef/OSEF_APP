using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.IO;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Menus2 : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que es lanzado al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sMenus.DataSource = MenuBusiness.ObtenerMenus();
                sMenus.DataBind();
                sGruposMenu.DataSource = GrupoMenuBusiness.ObtenerGruposMenu();
                sGruposMenu.DataBind();
                rmMenus.RegisterIcon(Icon.Delete);
            }
        }

        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sMenus(object sender, StoreReadDataEventArgs e)
        {
            sMenus.DataSource = MenuBusiness.ObtenerMenus();
            sMenus.DataBind();
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarMenu(string strID)
        {
            //1. Borrar el directorio
            Directory.Delete(Server.MapPath(" ") + "\\images\\menu\\" + strID);
            MenuBusiness.Borrar(strID);
        }
    }
}