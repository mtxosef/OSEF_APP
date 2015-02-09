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
    public partial class FormaConcepto : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //Llenar los combos de Categorias
            if (!X.IsAjaxRequest)
            {
                sCategorias.DataSource = CategoriaBusiness.ObtenerCategorias();
                sCategorias.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al escoger un elemento de Categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbCategoria_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el valor seleccionado y obtener las subcategorias
            string strSubCategoria = e.ExtraParams["valor"];
            sSubCategorias.DataSource = SubcategoriaBusiness.ObtenerSubCategoriaPorCategoria(strSubCategoria);
            sSubCategorias.DataBind();
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
            string strcookieEditarConcepto = Cookies.GetCookie("cookieEditarConcepto").Value;
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            Concepto oConcepto = new Concepto();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos del concepto
                    case "cmbModulo":
                        oConcepto.Modulo = sd.Value;
                        break;
                    case "nfOrden":
                        oConcepto.Orden = Convert.ToInt16(sd.Value);
                        break;
                    case "txtfDescripcion":
                        oConcepto.Descripcion = sd.Value;
                        break;
                    case "cmbCategoria":
                        oConcepto.Categoria = sd.Value;
                        break;
                    case "cmbSubCategoria":
                        oConcepto.SubCategoria = sd.Value;
                        break;
                    case "cmbEstatus":
                        oConcepto.Estatus = sd.Value;
                        break;
                }
            }

            //4. Validar si es nuevo o es uno existente
            if (strcookieEditarConcepto.Equals("Nuevo"))
            {
                if (ConceptoBusiness.ObtenerConceptoPorOrden(oConcepto.Orden) == null)
                {
                    //5. Insertar en la base de datos
                    oConcepto.FechaAlta = DateTime.Now;
                    oConcepto.Estatus = "ALTA";
                    oConcepto.ID = ConceptoBusiness.Insertar(oConcepto);
                    //6. Mandar mensaje con el código del proveedor
                    var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                    X.Msg.Alert("Registro completo", "<p align='center'>Concepto registrado con ID: <br/>" + oConcepto.ID + ".</p>", success).Show();
                }
                else
                {
                    //MessageBoxButtonsConfig button = new MessageBoxButtonsConfig();
                    var sucess = new JFunction { Fn = "imgbtnGuardar_Click_Success_Repetido" };
                    X.Msg.Show(new MessageBoxConfig
                    {
                        Title = "Error",
                        Message = "El número de orden esta repetido",
                        Buttons = MessageBox.Button.OK,
                        Icon = MessageBox.Icon.WARNING,
                        Handler = "App.nfOrden.focus(true);",
                        HeaderIcon = Icon.Error
                    });
                }
            }
            else
            {
                oConcepto.ID = strcookieEditarConcepto;
                Concepto pConcepto = ConceptoBusiness.ObtenerConceptoPorID(oConcepto.ID);
                oConcepto.FechaAlta = pConcepto.FechaAlta;

                if (oConcepto.Orden == pConcepto.Orden)
                {
                    //7. Actualizar los datos del proveedor
                    ConceptoBusiness.Actualizar(oConcepto);
                    //8. Mandar mensaje con el código del proveedor
                    var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                    X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del concepto <br/>" + oConcepto.ID + ".</p>", success).Show();
                }
                else
                {
                    if (ConceptoBusiness.ObtenerConceptoPorOrden(oConcepto.Orden) == null)
                    {
                        //7. Actualizar los datos del proveedor
                        ConceptoBusiness.Actualizar(oConcepto);
                        //8. Mandar mensaje con el código del proveedor
                        var success = new JFunction { Fn = "imgbtnGuardar_Click_Success" };
                        X.Msg.Alert("Actualización completa", "<p align='center'>Se han actualizado los datos del concepto <br/>" + oConcepto.ID + ".</p>", success).Show();
                    }
                    else
                    {
                        //MessageBoxButtonsConfig button = new MessageBoxButtonsConfig();
                        var sucess = new JFunction { Fn = "imgbtnGuardar_Click_Success_Repetido" };
                        X.Msg.Show(new MessageBoxConfig
                        {
                            Title = "Error",
                            Message = "El número de orden esta repetido",
                            Buttons = MessageBox.Button.OK,
                            Icon = MessageBox.Icon.WARNING,
                            Handler = "App.nfOrden.focus(true);",
                            HeaderIcon = Icon.Error
                        });
                    }
                }
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sConcepto_Load()
        {
            string strcookieEditarConcepto = Cookies.GetCookie("cookieEditarConcepto").Value;
            if (!strcookieEditarConcepto.Equals("Nuevo"))
            {
                Concepto oConcepto = ConceptoBusiness.ObtenerConceptoPorID(strcookieEditarConcepto);
                sConcepto.Add(new
                {
                    ID = oConcepto.ID,
                    Modulo = oConcepto.Modulo,
                    Orden = oConcepto.Orden,
                    Descripcion = oConcepto.Descripcion,
                    Categoria = oConcepto.Categoria,
                    SubCategoria = oConcepto.SubCategoria,
                    FechaAlta = oConcepto.FechaAlta,
                    Estatus = oConcepto.Estatus
                });
            }
        }
    }
}