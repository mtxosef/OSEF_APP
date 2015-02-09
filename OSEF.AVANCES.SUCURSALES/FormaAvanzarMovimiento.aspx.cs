using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaEfectuandoAvance : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        /// <summary>
        /// Eveno de clic al boton aceptar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAceptar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener ID y el movimiento seleccionado
            int iID = Convert.ToInt32(e.ExtraParams["ID"]);
            bool strRevision = Convert.ToBoolean(e.ExtraParams["Revision"]);
            bool strFinalizar = Convert.ToBoolean(e.ExtraParams["Finalizar"]);

            //2. Avanzar una revisión
            if (strRevision)
            {
                int iIDNuevo = RevisionBusiness.AvanzarRevisionPorID(iID, rRevision.InputValue);
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("revision", iIDNuevo.ToString(), ParameterMode.Auto));
            }
        }

        /// <summary>
        /// Obtener el objeto de la Revisión
        /// </summary>
        /// <param name="iID"></param>
        [DirectMethod]
        public static Revision ObtenerRevision(int iID)
        {
            return RevisionBusiness.ObtenerRevisionPorID(iID);
        }
    }
}