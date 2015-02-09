using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.EL;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class GruposMenu : System.Web.UI.Page
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
                sGruposMenu.DataSource = GrupoMenuBusiness.ObtenerGruposMenu();
                sGruposMenu.DataBind();
                rmGruposMenu.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sGruposMenu(object sender, StoreReadDataEventArgs e)
        {
            sGruposMenu.DataSource = GrupoMenuBusiness.ObtenerGruposMenu();
            sGruposMenu.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public bool InsertarGrupoMenu(string strID)
        {
            if (GrupoMenuBusiness.ObtenerGrupoMenuPorID(strID) == null)
            {
                GrupoMenu iGrupoMenu = new GrupoMenu();
                iGrupoMenu.ID = strID;
                iGrupoMenu.Descripcion = string.Empty;
                GrupoMenuBusiness.Insertar(iGrupoMenu);
                return false;
            }
            else
                return true;
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarGrupoMenu(string strID)
        {
            GrupoMenuBusiness.Borrar(strID);
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarGrupoMenu(string strID, string strDescripcion)
        {
            GrupoMenu uGrupoMenu = new GrupoMenu();
            uGrupoMenu.ID = strID;
            uGrupoMenu.Descripcion = strDescripcion;
            GrupoMenuBusiness.Actualizar(uGrupoMenu);
        }
    }
}