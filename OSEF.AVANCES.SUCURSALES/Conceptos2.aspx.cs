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
    public partial class Conceptos2 : System.Web.UI.Page
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
                sConceptos.DataSource = ConceptoBusiness.ObtenerConceptos();
                sConceptos.DataBind();
                rmConceptos.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sConceptos(object sender, StoreReadDataEventArgs e)
        {
            sConceptos.DataSource = ConceptoBusiness.ObtenerConceptos();
            sConceptos.DataBind();
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarConcepto(string strID)
        {
            ConceptoBusiness.Borrar(strID);
        }
    }
}