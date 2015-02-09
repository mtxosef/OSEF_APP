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
    public partial class CuentasContables : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Petición Ajax
            if (!X.IsAjaxRequest)
            {
                //2. Contruir nodo raiz
                Node nRoot = new Node();
                nRoot.Text = "Cuentas Contables";
                nRoot.NodeID = "CC";
                nRoot.Expanded = true;
                tpCuentasContables.Root.Add(nRoot);

                //3. Obtener Las ramas vacias y las ramas en "A"
                List<CuentaContable> lCuentasContables = CuentaContableBusiness.ObtenerCuentaContablePorRama(string.Empty);
                List<CuentaContable> lContabilidad = CuentaContableBusiness.ObtenerCuentaContablePorRama("A");

                //4. Contruir el primer nuvel y segundo nivel de cuentas contables
                foreach (CuentaContable sd in lCuentasContables)
                {
                    Node nPrimerNivel = new Node();
                    nPrimerNivel.Text = sd.Descripcion;
                    nPrimerNivel.NodeID = sd.Cuenta;
                    nRoot.Children.Add(nPrimerNivel);

                    //5. Si la rama es "A" = Contabilidad ingresar los nodos hijos y dejarlo expandido
                    if (sd.Cuenta.Equals("A"))
                    {
                        foreach (CuentaContable sd2 in lContabilidad)
                        {
                            Node nContabilidad = new Node();
                            nContabilidad.Text = sd2.Descripcion;
                            nContabilidad.NodeID = sd2.Cuenta;
                            nPrimerNivel.Children.Add(nContabilidad);
                        }
                        nPrimerNivel.Expanded = true;
                    }
                }

                //6. Llenar el store de Rama
                sRama.DataSource = CuentaContableBusiness.ObtenerCuentasContables();
                sRama.DataBind();
            }
        }

        /// <summary>
        /// Método que genera nodos en el TreePanel
        /// </summary>
        /// <param name="strNodoID"></param>
        /// <returns></returns>
        [DirectMethod]
        public string GenerarNodo(string strNodoID)
        {
            //1. Obtener las cuentas contables del siguiente nivel
            List<CuentaContable> lCuentasContables = CuentaContableBusiness.ObtenerCuentaContablePorRama(strNodoID);
            NodeCollection ncNivel = new NodeCollection();

            //2. Armar el arbol de hijos
            foreach (CuentaContable sd in lCuentasContables)
            {
                Node nNivel = new Node();
                nNivel.Text = sd.Descripcion;
                nNivel.NodeID = sd.Cuenta;
                ncNivel.Add(nNivel);
            }

            //3. Regresar los nodos
            return ncNivel.ToJson();
        }

        /// <summary>
        /// Método que presenta los elementos hijos al seleccionar un nodo
        /// </summary>
        /// <param name="strNodoID"></param>
        [DirectMethod]
        public void NodoHijos(string strNodoID)
        {
            //1. Obtener las cuentas hijas
            sCuentasContables.DataSource = CuentaContableBusiness.ObtenerCuentaContablePorRama(strNodoID);
            sCuentasContables.DataBind();
        }

        /// <summary>
        /// Método para agregar un nuevo registro
        /// </summary>
        /// <param name="strCuenta"></param>
        /// <param name="strDescripcion"></param>
        /// <param name="strTipo"></param>
        /// <param name="strRama"></param>
        /// <param name="strEstatus"></param>
        [DirectMethod]
        public string NuevoRegistro(string strCuenta, string strDescripcion, string strTipo, string strRama, string strEstatus)
        {
            //1. Armar objeto para insertarlo
            CuentaContable oCuentaContable = new CuentaContable();
            oCuentaContable.Cuenta = strCuenta;
            oCuentaContable.Descripcion = strDescripcion;
            oCuentaContable.Tipo = strTipo;
            oCuentaContable.Rama = strRama;
            oCuentaContable.Estatus = strEstatus;

            //2. Insertar Cuenta
            CuentaContableBusiness.Insertar(oCuentaContable);

            return oCuentaContable.Cuenta;
        }

        /// <summary>
        /// Método para actualizar un registro
        /// </summary>
        /// <param name="strCuenta"></param>
        /// <param name="strDescripcion"></param>
        /// <param name="strTipo"></param>
        /// <param name="strRama"></param>
        /// <param name="strEstatus"></param>
        /// <returns></returns>
        [DirectMethod]
        public string EditarRegistro(string strCuenta, string strDescripcion, string strTipo, string strRama, string strEstatus)
        {
            //1. Armar objeto para actualizarlo
            CuentaContable oCuentaContable = new CuentaContable();
            oCuentaContable.Cuenta = strCuenta;
            oCuentaContable.Descripcion = strDescripcion;
            oCuentaContable.Tipo = strTipo;
            oCuentaContable.Rama = strRama;
            oCuentaContable.Estatus = strEstatus;

            //2. Actualizar Cuenta
            CuentaContableBusiness.Actualizar(oCuentaContable);

            return oCuentaContable.Cuenta;
        }

        /// <summary>
        /// Método para eliminar una cuenta contable
        /// </summary>
        /// <param name="strCuenta"></param>
        [DirectMethod]
        public void EliminarRegistro(string strCuenta)
        {
            CuentaContableBusiness.Borrar(strCuenta);
        }

        /// <summary>
        /// Método que valida si la cuenta esta repetida
        /// </summary>
        /// <param name="strCuenta"></param>
        /// <returns></returns>
        [DirectMethod]
        public bool CuentaRepetida(string strCuenta)
        {
            if (CuentaContableBusiness.ObtenerCuentaContablePorCuenta(strCuenta) != null)
                return true;
            else
                return false;
        }
    }
}