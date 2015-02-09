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
    public partial class Categorias : System.Web.UI.Page
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
                List<Categoria> lCategoria = CategoriaBusiness.ObtenerCategorias();
                sCategorias.DataSource = lCategoria;
                sCategorias.DataBind();
                rmCategorias.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sCategorias(object sender, StoreReadDataEventArgs e)
        {
            List<Categoria> lCategoria = CategoriaBusiness.ObtenerCategorias();
            sCategorias.DataSource = lCategoria;
            sCategorias.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="bOrden"></param>
        [DirectMethod]
        public string InsertarCategoria(byte bOrden)
        {
            string strResultado;
            if (CategoriaBusiness.ObtenerCategoriaPorOrden(bOrden) == null)
            {
                Categoria iCategoria = new Categoria();
                iCategoria.Orden = bOrden;
                iCategoria.Descripcion = string.Empty;
                iCategoria.ID = CategoriaBusiness.Insertar(iCategoria);
                strResultado = "false|" + iCategoria.ID;
                return strResultado;
            }
            else
                return "true";
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarCategoria(string strID, byte bOrden, string strDescripcion)
        {
            Categoria uCategoria = new Categoria();
            uCategoria.ID = strID;
            uCategoria.Orden = bOrden;
            uCategoria.Descripcion = strDescripcion;
            CategoriaBusiness.Actualizar(uCategoria);
        }

        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarCategoria(string strID)
        {
            CategoriaBusiness.Borrar(strID);
        }
    }
}