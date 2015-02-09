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
    public partial class Profesiones : System.Web.UI.Page
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
                sProfesiones.DataSource = ProfesionBusiness.ObtenerProfesiones();
                sProfesiones.DataBind();
                rmProfesiones.RegisterIcon(Icon.Delete);
            }
        }

        /// <summary>
        /// Evento que lee el store de Datos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sProfesiones(object sender, StoreReadDataEventArgs e)
        {
            sProfesiones.DataSource = ProfesionBusiness.ObtenerProfesiones();
            sProfesiones.DataBind();
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public bool InsertarProfesion(string strID)
        {
            if (ProfesionBusiness.ObtenerProfesionPorID(strID) == null)
            {
                Profesion iProfesion = new Profesion();
                iProfesion.ID = strID;
                iProfesion.Descripcion = string.Empty;
                ProfesionBusiness.Insertar(iProfesion);
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
        public void EliminarProfesion(string strID)
        {
            ProfesionBusiness.Borrar(strID);
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strDescripcion"></param>
        [DirectMethod]
        public void ActualizarProfesion(string strID, string strDescripcion)
        {
            Profesion uProfesion = new Profesion();
            uProfesion.ID = strID;
            uProfesion.Descripcion = strDescripcion;
            ProfesionBusiness.Actualizar(uProfesion);
        }
    }
}