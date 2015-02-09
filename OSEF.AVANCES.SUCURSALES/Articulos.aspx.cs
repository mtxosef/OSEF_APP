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
    public partial class Articulos : System.Web.UI.Page
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
                sArticulos.DataSource = ArticuloBusiness.ObtenerArticulos();
                sArticulos.DataBind();
                rmArticulos.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que lee el store de Datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sArticulos(object sender, StoreReadDataEventArgs e)
        {
            sArticulos.DataSource = ArticuloBusiness.ObtenerArticulos();
            sArticulos.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public bool InsertarArticulo(string strID)
        {
            if (ArticuloBusiness.ObtenerArticuloPorID(strID) == null)
            {
                Articulo iArticulo = new Articulo();
                iArticulo.ID = strID;
                iArticulo.Corta = string.Empty;
                iArticulo.Descripcion = string.Empty;
                ArticuloBusiness.Insertar(iArticulo);
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
        public void EliminarArticulo(string strID)
        {
            ArticuloBusiness.Borrar(strID);
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strCorta"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarArticulo(string strID, string strCorta, string strDescripcion)
        {
            Articulo uArticulo = new Articulo();
            uArticulo.ID = strID;
            uArticulo.Corta = strCorta;
            uArticulo.Descripcion = strDescripcion;
            ArticuloBusiness.Actualizar(uArticulo);
        }
    }
}