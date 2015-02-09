using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Finalidades : System.Web.UI.Page
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
                sFinalidades.DataSource = FinalidadBusiness.ObtenerFinalidades();
                sFinalidades.DataBind();
                rmFinalidades.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que lee el store de Datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sFinalidades(object sender, StoreReadDataEventArgs e)
        {
            sFinalidades.DataSource = FinalidadBusiness.ObtenerFinalidades();
            sFinalidades.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public bool InsertarFinalidad(string strID)
        {
            if (FinalidadBusiness.ObtenerFinalidadPorID(strID) == null)
            {
                Finalidad iFinalidad = new Finalidad();
                iFinalidad.ID = strID;
                iFinalidad.Descripcion = string.Empty;
                FinalidadBusiness.Insertar(iFinalidad);
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
        public void EliminarFinalidad(string strID)
        {
            FinalidadBusiness.Borrar(strID);
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarFinalidad(string strID, string strDescripcion)
        {
            Finalidad uFinalidad = new Finalidad();
            uFinalidad.ID = strID;
            uFinalidad.Descripcion = strDescripcion;
            FinalidadBusiness.Actualizar(uFinalidad);
        }
    }
}