using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.EL;
using OSEF.APP.BL;
using Ext.Net;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class Estados2 : System.Web.UI.Page
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
                List<Estado> lEstado = EstadoBusiness.ObtenerEstados();
                sEstados.DataSource = lEstado;
                sEstados.DataBind();

                rmEstados.RegisterIcon(Icon.Delete);
            }
        }

        protected void OnReadData_sEstados(object sender, StoreReadDataEventArgs e)
        {
            List<Estado> lEstado = EstadoBusiness.ObtenerEstados();
            sEstados.DataSource = lEstado;
            sEstados.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public bool InsertarEstado(string strID)
        {
            if (EstadoBusiness.ObtenerEstadoPorID(strID) == null)
            {
                Estado iEstado = new Estado();
                iEstado.ID = strID;
                iEstado.Abreviatura = string.Empty;
                iEstado.Descripcion = string.Empty;
                EstadoBusiness.Insertar(iEstado);
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
        public void EliminarEstado(string strID)
        {
            EstadoBusiness.Borrar(strID);
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarEstado(string strID, string strAbreviatura, string strDescripcion)
        {
            Estado uEstado = new Estado();
            uEstado.ID = strID;
            uEstado.Abreviatura = strAbreviatura;
            uEstado.Descripcion = strDescripcion;
            EstadoBusiness.Actualizar(uEstado);
        }
    }
}