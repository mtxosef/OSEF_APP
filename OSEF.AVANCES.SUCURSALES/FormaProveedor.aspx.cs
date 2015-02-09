using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaProveedor : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Llenar los combos de Estados y Municipios
            if (!X.IsAjaxRequest)
            {
                sEstados.DataSource = EstadoBusiness.ObtenerEstados();
                sEstados.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sProveedor_Load()
        {
            string strcookieEditarProveedor = Cookies.GetCookie("cookieEditarProveedor").Value;
            if (!strcookieEditarProveedor.Equals("Nuevo"))
            {
                Proveedor oProveedor = ProveedorBusiness.ObtenerProveedorPorID(strcookieEditarProveedor);
                sProveedor.Add(new
                {
                    ID = oProveedor.ID,
                    Nombre = oProveedor.Nombre,
                    RFC = oProveedor.RFC,
                    ContactoNombre = oProveedor.ContactoNombre,
                    ContactoAPaterno = oProveedor.ContactoAPaterno,
                    ContactoAMaterno = oProveedor.ContactoAMaterno,
                    Correo = oProveedor.Correo,
                    Calle = oProveedor.Calle,
                    EntreCalles = oProveedor.EntreCalles,
                    NoExterior = oProveedor.NoExterior,
                    NoInterior = oProveedor.NoInterior,
                    CodigoPostal = oProveedor.CodigoPostal,
                    Colonia = oProveedor.Colonia,
                    Estado = oProveedor.Estado,
                    Municipio = oProveedor.Municipio
                });
            }
        }

        /// <summary>
        /// Evento que se lanza al seleccionar un estado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbEstado_Select(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener los municipios
            string strEstado = e.ExtraParams["valor"];
            sMunicipios.DataSource = MunicipioBusiness.ObtenerMunicipiosPorEstado(strEstado);
            sMunicipios.DataBind();
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];
            string strcookieEditarProveedor = Cookies.GetCookie("cookieEditarProveedor").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Proveedor oProveedor = new Proveedor();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del proveedor
                    case "txtfNombre":
                        oProveedor.Nombre = sd.Value;
                        break;
                    case "txtfRFC":
                        oProveedor.RFC = sd.Value;
                        break;
                    case "txtfContactoNombre":
                        oProveedor.ContactoNombre = sd.Value;
                        break;
                    case "txtfContactoAPaterno":
                        oProveedor.ContactoAPaterno = sd.Value;
                        break;
                    case "txtfContactoAMaterno":
                        oProveedor.ContactoAMaterno = sd.Value;
                        break;
                    case "txtfCorreo":
                        oProveedor.Correo = sd.Value;
                        break;
                    case "txtfCalle":
                        oProveedor.Calle = sd.Value;
                        break;
                    case "txtfEntreCalles":
                        oProveedor.EntreCalles = sd.Value;
                        break;
                    case "txtfNoExterior":
                        oProveedor.NoExterior = sd.Value;
                        break;
                    case "txtfNoInterior":
                        oProveedor.NoInterior = sd.Value;
                        break;
                    case "txtfCodigoPostal":
                        oProveedor.CodigoPostal = Convert.ToInt32(sd.Value);
                        break;
                    case "txtColonia":
                        oProveedor.Colonia = sd.Value;
                        break;
                    case "cmbEstado":
                        oProveedor.Estado = sd.Value;
                        break;
                    case "cmbMunicipio":
                        oProveedor.Municipio = sd.Value;
                        break;
                }
            }

            //4. Validar si es nuevo o es uno existente
            if (strcookieEditarProveedor.Equals("Nuevo"))
            {
                //5. Insertar en la base de datos
                oProveedor.ID = ProveedorBusiness.Insertar(oProveedor);
                //6. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Registro completo", "<p align='center'>Proveedor registrado con ID: <br/>" + oProveedor.ID + ".</p>", success).Show();
            }
            else
            {
                oProveedor.ID = strcookieEditarProveedor;
                //7. Actualizar los datos del proveedor
                ProveedorBusiness.Actualizar(oProveedor);
                //8. Mandar mensaje con el código del proveedor
                var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del proveedor <br/>" + oProveedor.ID + ".</p>", success).Show();
            }
        }
    }
}