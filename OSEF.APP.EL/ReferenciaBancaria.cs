using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de Referencias Bancarias
    /// </summary>
    public class ReferenciaBancaria
    {
        #region Campos

        string id;
        string solicitudprestamo;
        string nombre;
        string tipocuenta;
        string nocuenta;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string SolicitudPrestamo
        {
            get { return solicitudprestamo; }
            set { solicitudprestamo = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string TipoCuenta
        {
            get { return tipocuenta; }
            set { tipocuenta = value; }
        }

        public string NoCuenta
        {
            get { return nocuenta; }
            set { nocuenta = value; }
        }

        #endregion
    }
}
