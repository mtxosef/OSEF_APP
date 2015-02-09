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
    public partial class Municipios : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza cuando se carga la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {
                sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipios();
                sMunicipios.DataBind();
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
            }
        }

        /// <summary>
        /// Método para actualizar los registros
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sMunicipios(object sender, StoreReadDataEventArgs e)
        {
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipios();
            sMunicipios.DataBind();
            sEstados.DataSource = EstadoBusiness.ObtenerEstados();
            sEstados.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strID"></param>
        /// <returns></returns>
        [DirectMethod]
        public bool ObtenerMunicipio(string strID)
        {
            return MunicipioBusiness.ObtenerMunicipioPorID(strID) == null ? false : true;
        }

        /// <summary>
        /// Método para agregar un registro nuevo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public bool InsertarMunicipio(string strID, string strDescripcion, string strEstado)
        {
            if (MunicipioBusiness.ObtenerMunicipioPorID(strID) == null)
            {
                Municipio iMunicipio = new Municipio();
                iMunicipio.ID = strID;
                iMunicipio.Descripcion = strDescripcion;
                iMunicipio.Estado = strEstado;
                MunicipioBusiness.Insertar(iMunicipio);
                return false;
            }
            else
                return true;
        }

        /// <summary>
        /// Método para eliminar un registro
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void EliminarMunicipio(string strID)
        {
            MunicipioBusiness.Borrar(strID);
        }

        /// <summary>
        /// Método para actualizar los datos de la tabla
        /// </summary>
        /// <param name="strID"></param>
        /// <param name="strDescripcion"></param>
        /// <param name="strEstado"></param>
        [DirectMethod]
        public void ActualizarMunicipio(string strID, string strDescripcion, string strEstado)
        {
            Municipio uMunicipio = new Municipio();
            uMunicipio.ID = strID;
            uMunicipio.Descripcion = strDescripcion;
            uMunicipio.Estado = strEstado;
            MunicipioBusiness.Actualizar(uMunicipio);
        }
    }
}