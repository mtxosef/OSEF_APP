using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de CuentasContables
    /// </summary>
    public class CuentaContable
    {
        #region Campos

        string cuenta;
        string descripcion;
        string rama;
        string tipo;
        string estatus;
        string descripcionrama;

        #endregion

        #region Propiedades

        public string Cuenta
        {
            get { return cuenta; }
            set { cuenta = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Rama
        {
            get { return rama; }
            set { rama = value; }
        }

        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public string DescripcionRama
        {
            get { return descripcionrama; }
            set { descripcionrama = value; }
        }

        #endregion
    }
}
