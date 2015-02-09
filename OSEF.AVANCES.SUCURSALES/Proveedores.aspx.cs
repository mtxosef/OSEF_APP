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
    public partial class Proveedores : System.Web.UI.Page
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
                List<Proveedor> lProveedor = ProveedorBusiness.ObtenerProveedores();
                sProveedores.DataSource = lProveedor;
                sProveedores.DataBind();

                rmProveedores.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Actualiza la lista de proveedores
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sProveedores(object sender, StoreReadDataEventArgs e)
        {
            List<Proveedor> lProveedor = ProveedorBusiness.ObtenerProveedores();
            sProveedores.DataSource = lProveedor;
            sProveedores.DataBind();
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarProveedor(string strID)
        {
            ProveedorBusiness.Borrar(strID);
        }
    }
}