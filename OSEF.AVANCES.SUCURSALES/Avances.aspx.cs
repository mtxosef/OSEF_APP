using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Avances : System.Web.UI.Page
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
                sAvances.DataSource = RevisionBusiness.ObtenerRevisionesUltimaRevision();
                sAvances.DataBind();
                rmAvances.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sAvances(object sender, StoreReadDataEventArgs e)
        {
            sAvances.DataSource = RevisionBusiness.ObtenerRevisionesUltimaRevision();
            sAvances.DataBind();
        }
    }
}