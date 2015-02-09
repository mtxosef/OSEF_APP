using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.INTELISIS.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class tVtasUnidadesVsTiempo : System.Web.UI.Page
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
                sAgentes.DataSource = AgenteBusiness.ObtenerAgentes();
                sAgentes.DataBind();
            }
        }

        /// <summary>
        /// Método para actualizar los registros
        /// </summary>
        [DirectMethod]
        public void Actualizar()
        {
            sAgentes.DataSource = AgenteBusiness.ObtenerAgentes();
            sAgentes.DataBind();
        }
    }
}