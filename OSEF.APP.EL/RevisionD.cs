using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de RevisionD
    /// </summary>
    public class RevisionD
    {
        #region Campos

        int revision;
        short renglon;
        string concepto;
        string proveedor;
        decimal programado;
        decimal real;

        Concepto rconcepto;
        Proveedor rproveedor;

        #endregion

        #region Propiedades

        public int Revision
        {
            get { return revision; }
            set { revision = value; }
        }

        public short Renglon
        {
            get { return renglon; }
            set { renglon = value; }
        }

        public string Concepto
        {
            get { return concepto; }
            set { concepto = value; }
        }

        public string Proveedor
        {
            get { return proveedor; }
            set { proveedor = value; }
        }

        public decimal Programado
        {
            get { return programado; }
            set { programado = value; }
        }

        public decimal Real
        {
            get { return real; }
            set { real = value; }
        }

        public Concepto RConcepto
        {
            get { return rconcepto; }
            set { rconcepto = value; }
        }

        public Proveedor RProveedor
        {
            get { return rproveedor; }
            set { rproveedor = value; }
        }

        #endregion
    }
}
