using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Globalization;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES
{
    public partial class FormaAvance : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
                //2. Cargar sucursales
                sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
                sSucursales.DataBind();

                //3. Cargar Conceptos
                sConceptos.DataSource = ConceptoBusiness.ObtenerConceptos();
                sConceptos.DataBind();

                //4. Cargar Proveedores
                sProveedores.DataSource = ProveedorBusiness.ObtenerProveedores();
                sProveedores.DataBind();
            }
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRevisionForma = e.ExtraParams["RevisionForma"];
            string strRevision = e.ExtraParams["Revision"];
            string strRevisionDObraCivil = e.ExtraParams["RevisionDObraCivil"];
            string strcookieEditarRevision = Cookies.GetCookie("cookieEditarRevision").Value;

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRevisionForma);
            Revision oRevisionForma = ObtenerObjetoDesdeForma(dRegistro);
            Revision oRevision = JSON.Deserialize<List<Revision>>(strRevision).FirstOrDefault();
            List<RevisionD> lRevisionD = JSON.Deserialize<List<RevisionD>>(strRevisionDObraCivil);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oRevisionForma, oRevision, lRevisionD);

            //4. Validar que efecto realizará para Guardar o Afectar
            switch (strAccion)
            {
                case "insertar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "insertar", ParameterMode.Value));
                    break;
                case "modificar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "modificar", ParameterMode.Value));
                    break;
            }
        }

        /// <summary>
        /// Evento de clic del botón Afectar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnAfectar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRevisionForma = e.ExtraParams["RevisionForma"];
            string strRevision = e.ExtraParams["Revision"];
            string strRevisionDObraCivil = e.ExtraParams["RevisionDObraCivil"];
            string strcookieEditarRevision = Cookies.GetCookie("cookieEditarRevision").Value;

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRevisionForma);
            Revision oRevisionForma = ObtenerObjetoDesdeForma(dRegistro);
            Revision oRevision = JSON.Deserialize<List<Revision>>(strRevision).FirstOrDefault();
            List<RevisionD> lRevisionD = JSON.Deserialize<List<RevisionD>>(strRevisionDObraCivil);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oRevisionForma, oRevision, lRevisionD);

            //4. Validar que efecto realizará para Guardar o Afectar
            switch (strAccion)
            {
                case "insertar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "insertar", ParameterMode.Value));
                    break;
                case "modificar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "modificar", ParameterMode.Value));
                    break;
            }

            //4. Lanzar la afectación del Movimiento
            RevisionBusiness.AfectarRevisionPorID(oRevisionForma);

            oRevision = RevisionBusiness.ObtenerRevisionPorID(oRevisionForma.ID);
            //7. Actualizar store de Revision
            sRevision.GetAt(0).Set("MovID", oRevision.MovID);
            sRevision.GetAt(0).Set("Estatus", oRevision.Estatus);
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sRevision_Load()
        {
            //Obtener la cookie al cargar
            string strcookieEditarRevision = Cookies.GetCookie("cookieEditarRevision").Value;

            //Validar si es diferente de Nuevo
            if (!strcookieEditarRevision.Equals("Nuevo"))
            {
                //Cargar el encabezado del movimiento
                Revision oRevision = RevisionBusiness.ObtenerRevisionPorID(Convert.ToInt32(strcookieEditarRevision));
                
                //Cargar el detalle del movimiento
                sObraCivil.DataSource = RevisionDBusiness.ObtenerRevisionesDPorRevision(oRevision.ID);
                sObraCivil.DataBind();

                sRevision.Add(new
                {
                    ID = oRevision.ID,
                    Mov = oRevision.Mov,
                    MovID = oRevision.MovID,
                    Semana = oRevision.Semana,
                    Sucursal = oRevision.Sucursal,
                    FechaEmision = oRevision.FechaEmision,
                    FechaRevision = oRevision.FechaRevision,
                    Observaciones = oRevision.Observaciones,
                    Comentarios = oRevision.Comentarios,
                    Estatus = oRevision.Estatus,
                    RSucursal = oRevision.RSucursal
                });
            }
        }

        /// <summary>
        /// Evento que Guarda o actualiza un Movimiento
        /// </summary>
        /// <param name="oRevisionForma"></param>
        /// <param name="oRevision"></param>
        /// <param name="lRevisionD"></param>
        private string GuardarMovimiento(ref Revision oRevisionForma, Revision oRevision, List<RevisionD> lRevisionD)
        {
            //2. Lo que sucede cuando es nuevo y no se habia guardado
            if (oRevision == null)
            {
                oRevisionForma.Estatus = "BORRADOR";
                //3. Insertar en la base de datos
                oRevisionForma.ID = RevisionBusiness.Insertar(oRevisionForma);

                //4. Agregar el objeto al Store de Revisión
                sRevision.Add(new
                {
                    ID = oRevisionForma.ID,
                    Mov = oRevisionForma.Mov,
                    MovID = oRevisionForma.MovID,
                    Semana = oRevisionForma.Semana,
                    Sucursal = oRevisionForma.Sucursal,
                    FechaEmision = oRevisionForma.FechaEmision,
                    FechaRevision = oRevisionForma.FechaRevision,
                    Observaciones = oRevisionForma.Observaciones,
                    Comentarios = oRevisionForma.Comentarios,
                    Estatus = oRevisionForma.Estatus
                });

                //5. Guardar Detalle y regresar valor
                GuardarDetalleObraCivil(lRevisionD, oRevisionForma);
                return "insertar";
            }
            else
            {
                //6. Complementar datos y actualizar encabezado
                oRevisionForma.ID = oRevision.ID;
                RevisionBusiness.Actualizar(oRevisionForma);

                //7. Actualizar store de Revision
                sRevision.GetAt(0).Set("Mov", oRevisionForma.Mov);
                sRevision.GetAt(0).Set("Semana", oRevisionForma.Semana);
                sRevision.GetAt(0).Set("Sucursal", oRevisionForma.Sucursal);
                sRevision.GetAt(0).Set("FechaEmision", oRevisionForma.FechaEmision);
                sRevision.GetAt(0).Set("FechaRevision", oRevisionForma.FechaRevision);
                sRevision.GetAt(0).Set("Observaciones", oRevisionForma.Observaciones);
                sRevision.GetAt(0).Set("Comentarios", oRevisionForma.Comentarios);

                //8. Borrar todo el detalle e insertarlo de nuevo
                RevisionDBusiness.BorrarPorRevision(oRevisionForma.ID);
                GuardarDetalleObraCivil(lRevisionD, oRevisionForma);

                //9. Regresar valor
                return "modificar";
            }
        }

        /// <summary>
        /// Evento que Guarda el detalle de Obra Civil
        /// </summary>
        /// <param name="lRevisionD"></param>
        /// <param name="oRevisionForma"></param>
        private void GuardarDetalleObraCivil(List<RevisionD> lRevisionD, Revision oRevisionForma)
        {
            //1. Insertar los datos del detalle
            foreach (RevisionD sd in lRevisionD)
            {
                //2. Validar que el objeto no venga en blanco
                if (sd.Concepto.Equals(string.Empty) || sd.Proveedor.Equals(string.Empty) || sd.Programado == 0 || sd.Real == 0)
                    continue;
                else
                {
                    sd.Revision = oRevisionForma.ID;
                    RevisionDBusiness.Insertar(sd);
                }
            }
        }

        /// <summary>
        /// Método que transforma los datos Control-Valor a objeto Revision
        /// </summary>
        /// <param name="dRegistro"></param>
        /// <returns></returns>
        private Revision ObtenerObjetoDesdeForma(Dictionary<string, string> dRegistro)
        {
            //1. Declarar objeto Revision donde se guardarán los valores
            Revision oRevisionForma = new Revision();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos de la revisión
                    case "cmbMov":
                        oRevisionForma.Mov = sd.Value;
                        break;
                    case "nfSemana":
                        oRevisionForma.Semana = Convert.ToInt16(sd.Value);
                        break;
                    case "cmbSucursal":
                        oRevisionForma.Sucursal = sd.Value;
                        break;
                    case "dfFechaEmision":
                        oRevisionForma.FechaEmision = Convert.ToDateTime(sd.Value);
                        break;
                    case "dfFechaRevision":
                        if (sd.Value == null)
                            oRevisionForma.FechaRevision = null;
                        else
                            oRevisionForma.FechaRevision = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfObservaciones":
                        oRevisionForma.Observaciones = sd.Value;
                        break;
                    case "txtfComentarios":
                        oRevisionForma.Comentarios = sd.Value;
                        break;
                }
            }

            //3. Regresar la Revision
            return oRevisionForma;
        }
    }
}