using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Usuarios2 : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();
                rmUsuarios.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Actualiza la lista de usuarios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sUsuarios(object sender, StoreReadDataEventArgs e)
        {
            sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
            sUsuarios.DataBind();
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarUsuario(string strID)
        {
            UsuarioBusiness.Borrar(strID);
        }
    }
}